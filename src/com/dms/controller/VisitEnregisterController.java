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
import com.dms.entity.User;
import com.dms.entity.VisitEnregister;
import com.dms.service.VisitEnregisterService;

/**
 *Created by pxc on 2017年4月17日 下午6:05:19
 * 
 */
@Controller
public class VisitEnregisterController {

	@Autowired
	private VisitEnregisterService visitEnregisterService;
	
	/**
	 * 来访登记列表
	 * @param visitEnregister
	 * @return
	 */
	@RequestMapping("getAllVisitEnregisters")
	@ResponseBody
	public JSONArray getAllVisitEnregisters(VisitEnregister visitEnregister,HttpServletRequest request){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		visitEnregister.setBuildingId(Integer.parseInt(u.getBuildingId()));
		
		List<VisitEnregister> visitEnregisters = visitEnregisterService.findAllVisitEnregisters(visitEnregister);
		
		JsonConfig jsonConfig = new JsonConfig();
		// 将list转为jsonArray, 不转换Date对象
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray array = JSONArray.fromObject(visitEnregisters, jsonConfig);
		return array;
	}
	/**
	 * 新增
	 * @param visitEnregister
	 * @param request
	 * @return
	 */
	@RequestMapping("addVisitEnregister")
	public String addVisitEnregister(VisitEnregister visitEnregister,HttpServletRequest request){
	
		User u = (User) request.getSession().getAttribute("currentUser");
		
		visitEnregister.setBuildingId(Integer.parseInt(u.getBuildingId()));	
		visitEnregisterService.addVisitEnregister(visitEnregister);
		
		return "redirect:/goToVisitEnregisterList.do";
	}
	
	@RequestMapping("getVisitEnregisterDetail")
	public String getVisitEnregisterDetail(Integer id,Model model){
		
		VisitEnregister visitEnregister = visitEnregisterService.getVisitEnregisterById(id);
		
		model.addAttribute("visitEnregister", visitEnregister);
		
		return "dormManager/visitEnregister/editVisitEnregister";
	}
	
	@RequestMapping("editVisitEnregister")
	public String editVisitEnregister(VisitEnregister visitEnregister){
		
		visitEnregisterService.updateVisitEnregister(visitEnregister);
		
		return "redirect:/goToVisitEnregisterList.do";
	}
	
	/**
	 * 列表页面
	 * @return
	 */
	@RequestMapping("goToVisitEnregisterList")
	public String goToVisitEnregisterList(){
		return "dormManager/visitEnregister/visitEnregisterList";
	}
	/**
	 * 添加页面
	 * @return
	 */
	@RequestMapping("goToAddVisitEnregister")
	public String goToAddVisitEnregister(){
		
		return "dormManager/visitEnregister/addVisitEnregister";
	}
	/**
	 * 编辑页
	 * @return
	 */
	@RequestMapping("goToEditVisitEnregister")
	public String goToEditVisitEnregister(){
		
		return "dormManager/visitEnregister/editVisitEnregister";
	}
	
	
}
