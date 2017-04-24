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
			HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");

		register.setBuildingId(Integer.parseInt(u.getBuildingId()));

		List<Register> registers = registerService.findAllRegisters(register);
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


}
