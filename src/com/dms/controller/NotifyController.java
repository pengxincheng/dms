package com.dms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.dms.entity.Notify;
import com.dms.entity.User;
import com.dms.enums.NotifyType;
import com.dms.service.NotifyService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

/**
 * Created by pxc on 2017年3月6日 上午9:43:59
 * 
 */
@Controller
public class NotifyController {

	@Autowired
	private NotifyService notifyService;

	/**
	 * 查询所有通知公告
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("findAllNotifies")
	public String findAllNotifies(Model model) {

		List<Notify> notifies = notifyService.getTop10Swzl();
		notifies.addAll(notifyService.getTop6Tzgg());

		model.addAttribute("notifies", notifies);
		return "notifyList";

	}

	/**
	 * 查询当前用户所有通知公告
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("findAllNotifiesForUser")
	public String findAllNotifiesForUser(Model model,
			HttpServletRequest request, Notify notify, Integer startPage,
			Integer pageSize) {
		if (null == startPage) {
			startPage = 1;
		}
		if (null == pageSize) {
			pageSize = 2;
		}
		User user = (User) request.getSession().getAttribute("currentUser");
		if (null == notify) {
			notify = new Notify();
		}
		notify.setPublisherId(user.getUserId());
		Page<Notify> page = notifyService.findAllNotifiesForUser(notify,
				startPage, pageSize);
		List<Notify> result = page.getResult();
		model.addAttribute("notifies", result);
		model.addAttribute("currentPage", page.getPageNum());
		model.addAttribute("totalPages", page.getPages());
      
		return "dormManager/notifyTable";
	}

	/**
	 * 添加通知公告
	 * 
	 * @param notify
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("addNotify")
	public @ResponseBody Map<String, Object> addNotify(Notify notify,
			HttpSession httpSession) {

		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) httpSession.getAttribute("currentUser");
		notify.setPublisherId(user.getUserId());
		if (notifyService.addNotify(notify) > 0) {
			map.put("result", "true");
			map.put("msg", "添加成功");
		} else {
			map.put("result", "false");
			map.put("msg", "添加失败");
		}
		return map;
	}

	/**
	 * 跳转至添加页面
	 * 
	 * @return
	 */
	@RequestMapping("goToAddNotifyPage")
	public String goToAddNotifyPage() {
		return "dormManager/addNotify";
	}
	
	
	/**
	 * 通过id删除一个通知公告
	 * @param notifyId
	 * @return
	 */
	@RequestMapping("delNotify")
	public String delNotify(Integer notifyId){
		notifyService.delNotifyById(notifyId);
		return "redirect:/findAllNotifiesForUser.do";
		
	}
	
	@RequestMapping("batchDelNotify")
	public String batchDelNotify(Integer[] notifyId){
		return null;
		
	}
	
	/**
	 * 查看通知公告明细
	 * @param notifyId
	 * @param isForShow
	 * @return
	 */
	@RequestMapping("getNotifyDetail")
	public String getNotifyDetail(Integer notifyId,Boolean isForShow,Model model){
		//isForShow = false;
		if(null == isForShow){
			isForShow = false;
		}
		Notify notify = notifyService.getNotifyDetail(notifyId);
		model.addAttribute("notify", notify);
		if(isForShow){
			return "notifyDetail";
		}
		else{
			return "dormManager/editNotify";
		}	
	}
	
	/**
	 * 修改通知公告
	 * @param notify
	 * @return
	 */
	@RequestMapping("editNotify")
	public @ResponseBody JSONObject editNotify(Notify notify){
		
		JSONObject content = new JSONObject();
		
		if(notifyService.editNotify(notify) > 0){
			content.put("msg", "操作成功！");
			content.put("result", true);
		}
		else{
			content.put("msg", "操作失败！");
			content.put("result", false);
		}
		
		return content;
		
	}

}
