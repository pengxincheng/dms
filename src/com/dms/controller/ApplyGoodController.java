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

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.ApplyGood;
import com.dms.entity.RepairTask;
import com.dms.entity.User;
import com.dms.service.ApplyGoodService;

/**
 * Created by pxc on 2017年4月14日 下午4:05:31
 * 
 */
@Controller
public class ApplyGoodController {

	@Autowired
	private ApplyGoodService applyGoodService;

	/**
	 * 申请列表
	 * 
	 * @param applyGood
	 * @param request
	 * @return
	 */
	@RequestMapping("getAllApplyGoods")
	@ResponseBody
	public JSONArray getAllApplyGoods(ApplyGood applyGood,
			HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");
		if (u.getRoleId() == 2) {
			applyGood.setAuditMan(u.getName());
		} else {
			applyGood.setApplyer(u.getName());
		}

		List<ApplyGood> applyGoods = applyGoodService
				.getAllApplyGoods(applyGood);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(applyGoods, jsonConfig);
		return jsonArray;

	}

	/**
	 * 学生提交申请
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("submitApplyGood")
	public String submitApplyGood(Integer id, HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");

		String auditMan = u.getRoom().getBuilding().getManagerName();

		applyGoodService.submitApplyGood(id, auditMan);
		return "student/applyGood/applyGoodList";
	}

	/**
	 * 管理员审核
	 * 
	 * @param id
	 * @param status
	 * @param auditOponion
	 * @return
	 */
	@RequestMapping("auditApplyGood")
	public String auditApplyGood(Integer id, String status, String auditOponion) {

		applyGoodService.auditApplyGood(id, status, auditOponion);
		return "dormManager/applyGood/applyGoodList";
	}

	/**
	 * 学生新建申请
	 * 
	 * @param applyGood
	 * @param request
	 * @return
	 */
	@RequestMapping("addApplyGood")
	public String addApplyGood(ApplyGood applyGood, HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");
		String applyer = u.getName();
		String room = u.getRoom().getRoomSn();
		
		applyGood.setApplyer(applyer);
		applyGood.setRoom(room);
		applyGood.setStatus("待提交");
		applyGoodService.addApplyGood(applyGood);
		return "redirect:/goToStuApplyGoodsList.do";
	}
	
	@RequestMapping("getApplyGoodDetail")
	public String getApplyGoodDetail(Integer id,Model model){
		
		ApplyGood applyGood = applyGoodService.getApplyGoodById(id);
		model.addAttribute("applyGood", applyGood);
		return "student/applyGood/editApplyGood";
	}
	/**
	 * 更新申请
	 * @param applyGood
	 * @return
	 */
	@RequestMapping("editApplyGood")
	public String editApplyGood(ApplyGood applyGood){
		
		applyGoodService.updateApplyGood(applyGood);
		return "redirect:/goToStuApplyGoodsList.do";
	}
	
	/*@RequestMapping("submitApply")
	public String submitApply(Integer id){
		
		ApplyGood applyGood = applyGoodService.getApplyGoodById(id);
		return "redirect:/goToStuApplyGoodsList.do";
	}*/
	
	@RequestMapping("delApplyGood")
	public String delApplyGood(Integer id){
		
		applyGoodService.delApplyGoodById(id);
		return "redirect:/goToStuApplyGoodsList.do";
	}

	@RequestMapping("goToAddApplyGood")
	public String goToAddApplyGood() {

		return "student/applyGood/addApplyGood";
	}

	@RequestMapping("goToStuApplyGoodsList")
	public String goToStuApplyGoodsList() {
		return "student/applyGood/applyGoodList";
	}

	/* 管理员 */
	@RequestMapping("goToStuApplyGoodsListForManager")
	public String goToStuApplyGoodsListForManager() {
		return "dormManager/applyGood/applyGoodList";
	}
}
