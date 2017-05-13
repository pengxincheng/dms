package com.dms.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.DateUtils;
import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.Register;
import com.dms.entity.User;
import com.dms.service.RegisterService;
import com.dms.service.UserService;

/**
 * Created by pxc on 2017年4月24日 上午10:57:20
 * 
 */
@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	@Autowired
	private UserService userService;

	/**
	 * 列表页
	 * 
	 * @param register
	 * @param request
	 * @return
	 */
	@RequestMapping("getAllRegisters")
	@ResponseBody
	public JSONArray getAllRegisters(Register register,
			HttpServletRequest request, String inTime, String outTime) {

		User u = (User) request.getSession().getAttribute("currentUser");

		register.setBuildingId(Integer.parseInt(u.getBuildingId()));
		Date startDate = null;
		Date enDate = null;
		if ("" != inTime && "" != outTime) {
			startDate = DateUtils.formatStartTime(inTime);
			enDate = DateUtils.formatEndTime(outTime);
		}

		List<Register> registers = registerService.findAllRegisters(register,startDate, enDate);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(registers, jsonConfig);
		return jsonArray;
	}
	/**
	 * 添加晚归记录
	 * @param register
	 * @param stuNo
	 * @param request
	 * @return
	 */
	@RequestMapping("addRegister")
	public String addRegister(Register register,String stuNo,HttpServletRequest request){
		User u = (User) request.getSession().getAttribute("currentUser");
		
		register.setBuildingId(Integer.parseInt(u.getBuildingId()));
		register.setStuId(userService.getStuByStuNo(stuNo).getUserId());
		register.setRegisterDate(new Date());
		register.setReturnTime(new Date());
		
		registerService.addRegister(register);
		return "redirect:/goToRegisterList.do";
	}
	/**
	 * 缺勤 添加
	 * @param register
	 * @param stuNo
	 * @param request
	 * @return
	 */
	@RequestMapping("addRegisterFroQueQin")
	public String addRegisterFroQueQin(Register register,String stuNo,HttpServletRequest request){
		User u = (User) request.getSession().getAttribute("currentUser");
		
		register.setBuildingId(Integer.parseInt(u.getBuildingId()));
		register.setStuId(userService.getStuByStuNo(stuNo).getUserId());
		register.setRegisterDate(new Date());
		register.setReturnTime(new Date());
		
		registerService.addRegister(register);
		return "redirect:/goToRegisterListFroQueQin.do";
	}
	/**
	 * 晚归  删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delRegister")
	public String delRegister(Integer id){
		
		registerService.delRegisterById(id);
		return "redirect:/goToRegisterList.do";
	}
	
	/**
	 * 缺勤  删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delRegisterForQueQin")
	public String delRegisterForQueQin(Integer id){
		
		registerService.delRegisterById(id);
		return "redirect:/goToRegisterListFroQueQin.do";
	}

	/**
	 * 跳转 晚归列表页面
	 * 
	 * @return
	 */
	@RequestMapping("goToRegisterList")
	public String goToRegisterList() {
		return "dormManager/register/registerList";
	}

	/**
	 * 跳转 晚归添加页面
	 * 
	 * @return
	 */
	@RequestMapping("goToAddRegister")
	public String goToAddRegister() {
		return "dormManager/register/addRegister";
	}
	
	/**
	 * 跳转 缺勤列表页面
	 * 
	 * @return
	 */
	@RequestMapping("goToRegisterListFroQueQin")
	public String goToRegisterListFroQueQin() {
		return "dormManager/register/queqin/registerList";
	}

	/**
	 * 跳转  缺勤添加页面
	 * 
	 * @return
	 */
	@RequestMapping("goToAddRegisterFroQueQin")
	public String goToAddRegisterFroQueQin() {
		return "dormManager/register/queqin/addRegister";
	}
	/**
	 *  考勤统计页面
	 * @return
	 */
	@RequestMapping("goToCensusRegister")
	public String goToCensusRegister() {
		return "censusRegister";
	}
	
	/**
	 * 按年级统计缺勤，晚归统计
	 * @param register
	 * @return
	 */
	@RequestMapping("censusRegisterByGrade")
	@ResponseBody
	public JSONObject censusRegisterByGrade(Register register){
	JSONObject jsonObject = new JSONObject();
	
	JSONArray jsonArray = new JSONArray();
	
	Date startDate = null;
	Date enDate = null;
	
	List<Register> registers = registerService.findAllRegisters(register,startDate,enDate);
	
	List<String> list = new ArrayList<String>();
	for (Register r : registers) {
		User stuUser = userService.getUserById(r.getStuId());
		list.add(stuUser.getStuGrade());			
	}
	
	Set<String> grades = new HashSet<String>(list);
	for(String grade:grades){
		Map<String, Object> nameValue = new HashMap<String, Object>();
		nameValue.put("value",Collections.frequency(list, grade));
		nameValue.put("name", grade);
		jsonArray.add(nameValue);
	}
	jsonObject.put("grades", grades);
	jsonObject.put("nameValue", jsonArray);
	return jsonObject;
	}
	

}
