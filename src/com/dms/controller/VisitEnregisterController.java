package com.dms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.DateUtils;
import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.User;
import com.dms.entity.VisitEnregister;
import com.dms.service.VisitEnregisterService;

/**
 * Created by pxc on 2017年4月17日 下午6:05:19
 * 
 */
@Controller
public class VisitEnregisterController {

	@Autowired
	private VisitEnregisterService visitEnregisterService;

	/**
	 * 来访登记列表
	 * 
	 * @param visitEnregister
	 * @param request
	 * @param inTime
	 * @param outTime
	 * @return
	 */
	@RequestMapping("getAllVisitEnregisters")
	@ResponseBody
	public JSONArray getAllVisitEnregisters(VisitEnregister visitEnregister,
			HttpServletRequest request, String inTime, String outTime) {

		User u = (User) request.getSession().getAttribute("currentUser");

		visitEnregister.setBuildingId(Integer.parseInt(u.getBuildingId()));
		Date startDate = null;
		Date enDate = null;
		if ("" != inTime && "" != outTime) {
			startDate = DateUtils.formatStartTime(inTime);
			enDate = DateUtils.formatEndTime(outTime);
		}

		List<VisitEnregister> visitEnregisters = visitEnregisterService.findAllVisitEnregisters(visitEnregister,startDate, enDate);

		JsonConfig jsonConfig = new JsonConfig();
		// 将list转为jsonArray, 不转换Date对象
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray array = JSONArray.fromObject(visitEnregisters, jsonConfig);
		return array;
	}

	/**
	 * 新增
	 * 
	 * @param visitEnregister
	 * @param request
	 * @return
	 */
	@RequestMapping("addVisitEnregister")
	public String addVisitEnregister(VisitEnregister visitEnregister,
			HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");

		visitEnregister.setBuildingId(Integer.parseInt(u.getBuildingId()));
		visitEnregisterService.addVisitEnregister(visitEnregister);

		return "redirect:/goToVisitEnregisterList.do";
	}

	@RequestMapping("getVisitEnregisterDetail")
	public String getVisitEnregisterDetail(Integer id, Model model) {

		VisitEnregister visitEnregister = visitEnregisterService
				.getVisitEnregisterById(id);

		model.addAttribute("visitEnregister", visitEnregister);

		return "dormManager/visitEnregister/editVisitEnregister";
	}

	/**
	 * 更新
	 * 
	 * @param visitEnregister
	 * @return
	 */
	@RequestMapping("editVisitEnregister")
	public String editVisitEnregister(VisitEnregister visitEnregister) {

		visitEnregisterService.updateVisitEnregister(visitEnregister);

		return "redirect:/goToVisitEnregisterList.do";
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("delVisitEnregister")
	public String delVisitEnregister(Integer id) {

		visitEnregisterService.delVisitEnregisterById(id);

		return "redirect:/goToVisitEnregisterList.do";
	}

	@RequestMapping("visitorLeave")
	public String visitorLeave(Integer id) {

		VisitEnregister visitEnregister = visitEnregisterService
				.getVisitEnregisterById(id);

		visitEnregister.setEndTime(new Date());
		visitEnregister.setIsLeave("已离开");

		visitEnregisterService.updateVisitEnregister(visitEnregister);
		return "redirect:/goToVisitEnregisterList.do";
	}

	/**
	 * 列表页面
	 * 
	 * @return
	 */
	@RequestMapping("goToVisitEnregisterList")
	public String goToVisitEnregisterList() {
		return "dormManager/visitEnregister/visitEnregisterList";
	}

	/**
	 * 添加页面
	 * 
	 * @return
	 */
	@RequestMapping("goToAddVisitEnregister")
	public String goToAddVisitEnregister() {

		return "dormManager/visitEnregister/addVisitEnregister";
	}

	/**
	 * 编辑页
	 * 
	 * @return
	 */
	@RequestMapping("goToEditVisitEnregister")
	public String goToEditVisitEnregister() {

		return "dormManager/visitEnregister/editVisitEnregister";
	}

}
