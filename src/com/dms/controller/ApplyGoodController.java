package com.dms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.ApplyGood;
import com.dms.entity.RepairTask;
import com.dms.entity.User;
import com.dms.service.ApplyGoodService;

/**
 *Created by pxc on 2017年4月14日 下午4:05:31
 * 
 */
@Controller
public class ApplyGoodController {
	
	@Autowired
	private ApplyGoodService applyGoodService;
	
	@RequestMapping("getAllApplyGoods")
	@ResponseBody
	public JSONArray getAllApplyGoods(ApplyGood applyGood,HttpServletRequest request){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		if(u.getRoleId() == 2){
			applyGood.setAuditMan(u.getName());
		}
		else{
			applyGood.setApplyer(u.getName());
		}
		
		
		List<ApplyGood> applyGoods = applyGoodService.getAllApplyGoods(applyGood);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(applyGoods, jsonConfig);
		return jsonArray;
		
	}
	
	@RequestMapping("goToStuApplyGoodsList")
	public String goToStuApplyGoodsList(){
		return "student/applyGood/applyGoodList";
	}
	
	/*管理员*/
	@RequestMapping("goToStuApplyGoodsListForManager")
	public String goToStuApplyGoodsListForManager(){
		return "dormManager/applyGood/applyGoodList";
	}
}
