package com.dms.controller;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
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
	public JSONArray getAllVisitEnregisters(VisitEnregister visitEnregister){
		
		List<VisitEnregister> visitEnregisters = visitEnregisterService.findAllVisitEnregisters(visitEnregister);
		
		JsonConfig jsonConfig = new JsonConfig();
		// 将list转为jsonArray, 不转换Date对象
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray array = JSONArray.fromObject(visitEnregisters, jsonConfig);
		return array;
	}
	
	@RequestMapping("goToVisitEnregisterList")
	public String goToVisitEnregisterList(){
		return "dormManager/visitEnregister/visitEnregisterList";
	}
	
}
