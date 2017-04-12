package com.dms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.Area;
import com.dms.entity.Room;
import com.dms.entity.User;
import com.dms.service.AreaService;
import com.dms.service.RoomService;
import com.dms.service.UserService;

/**
 * @author pxc
 * @date ：2017年2月22日 下午11:18:33
 */

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private AreaService areaService;

	/**
	 * 登录验证
	 * 
	 * @param request
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, String username,
			String password, Model model) {

		User currentUser = userService.checkLogin(username, password);
		if (null != currentUser) {
			request.getSession().setAttribute("currentUser", currentUser);
		}
		return "redirect:/index.jsp";

	}

	/**
	 * 管理员获取学生 已分配宿舍的学生
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("getAllStus")
	@ResponseBody
	public JSONArray goToStuList(User user) {

		List<User> users = userService.getAllUsers(user);

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(users, jsonConfig);

		return jsonArray;

	}

	/**
	 * 查询所有未分配宿舍的学生
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("getAllStusNotAlloted")
	@ResponseBody
	public List<User> getAllStusNotAlloted(User user) {

		List<User> users = userService.getAllStusNotAlloted(user);
		return users;
	}
	
	/**
	 * 添加学生
	 * @return
	 */
	@RequestMapping("addStu")
	public String addStu(User user){
		userService.addStu(user);
		return "redirect:/goToStuList.do";
	}
	
	/**
	 * 删除学生
	 * @param userId
	 * @return
	 */
	@RequestMapping("delStu")
	public String delStu(Integer userId){
		userService.delStu(userId);
		return "redirect:/goToStuList.do";
	}

	/**
	 * 获取学生详细
	 * @return
	 */
	@RequestMapping("getStuDetail")
	public String getStuDetail(Integer userId,Model model){
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		return "admin/stu/editStu";
	}
	@RequestMapping("editStu")
	public String editStu(User user){
		userService.updateStu(user);
		return "redirect:/goToStuList.do";
	}
	
	
	@RequestMapping("goToStuList")
	public String goToStuList() {
		return "admin/stu/stuList";
	}

	@RequestMapping("goToAddStu")
	public String goToAddStu() {
		return "admin/stu/addStu";
	}

}
