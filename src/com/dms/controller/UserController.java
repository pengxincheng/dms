package com.dms.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dms.Util.ExcellUtils;
import com.dms.Util.JsonDateValueProcessor;
import com.dms.Util.PasswordUtil;
import com.dms.entity.Area;
import com.dms.entity.Building;
import com.dms.entity.Room;
import com.dms.entity.User;
import com.dms.service.AreaService;
import com.dms.service.BuildingService;
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
	@Autowired
	private BuildingService buildingService;

	/**
	 * 登录验证
	 * 
	 * @param request
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public JSONObject login(HttpServletRequest request, String username,
			String password, Model model) {
		
		JSONObject jsonObject = new JSONObject();
		User currentUser = userService.checkLogin(username, password);
		if (null != currentUser) {
			request.getSession().setAttribute("currentUser", currentUser);
			jsonObject.put("result", true);
			jsonObject.put("msg", "登录成功！");
		}
		else{
			jsonObject.put("result", false);
			jsonObject.put("msg", "用户名或密码错误！");
		}
		
		return jsonObject;
		
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
	 * 
	 * @return
	 */
	@RequestMapping("addStu")
	public String addStu(User user) {
		user.setRoleId(3);
		userService.addStu(user);
		return "redirect:/goToStuList.do";
	}

	/**
	 * 删除学生
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping("delStu")
	public String delStu(Integer userId) {
		userService.delStu(userId);
		return "redirect:/goToStuList.do";
	}

	/**
	 * 获取学生详细
	 * 
	 * @return
	 */
	@RequestMapping("getStuDetail")
	public String getStuDetail(Integer userId, Model model) {
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		return "admin/stu/editStu";
	}

	@RequestMapping("checkStuIsExistByStuNo")
	@ResponseBody
	public JSONObject checkStuIsExistByStuNo(String stuNo) {
		JSONObject jsonObject = new JSONObject();
		User stu = userService.getStuByStuNo(stuNo);
		if (null == stu) {
			jsonObject.put("result", false);
			jsonObject.put("msg", "该学号不存在");
		} else {
			jsonObject.put("result", true);
			jsonObject.put("msg", "成功");
		}
		return jsonObject;
	}

	@RequestMapping("editStu")
	public String editStu(User user) {
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

	@RequestMapping("goToStuListForManager")
	public String goToStuListForManager() {
		return "dormManager/stu/stuList";
	}

	/**
	 * 宿管员获取学生
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("getAllStusForManager")
	@ResponseBody
	public JSONArray getAllStusForManager(User user, HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");
		user.setBuildingId(u.getBuildingId());

		List<User> users = userService.getAllUsers(user);

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(users, jsonConfig);

		return jsonArray;

	}

	@RequestMapping("importStu")
	public String testExcell(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		InputStream in = null;
		List<List<Object>> listob = null;
		MultipartFile file = multipartRequest.getFile("stuExcell");
		try {
			in = file.getInputStream();
			listob = new ExcellUtils().getListByExcel(in,
					file.getOriginalFilename());
			List<User> stus = new ArrayList<User>();
			for (List<Object> objects : listob) {
				User stu = new User();
				stu.setName(String.valueOf(objects.get(0)));
				stu.setStuNo(String.valueOf(objects.get(1)));
				stu.setGender(String.valueOf(objects.get(2)));
				stu.setAge(Integer.parseInt(String.valueOf(objects.get(3))));
				stu.setStuGrade(String.valueOf(objects.get(4)));
				stu.setStuClass(String.valueOf(objects.get(5)));

				stus.add(stu);
			}

			userService.batchAddStu(stus);

			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/goToStuList.do";
	}

	/**
	 * 退出
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/login.jsp";
	}

	/**
	 * 批量刪除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("batchDeleteStu")
	@ResponseBody
	public JSONObject batchDeleteStu(Integer[] ids) {
		JSONObject jsonObject = new JSONObject();
		userService.batchDelStu(ids);
		jsonObject.put("msg", "操作成功");
		return jsonObject;
	}

	/**
	 * 批量分配宿舍
	 * 
	 * @param ids
	 * @param areaId
	 * @return
	 */
	@RequestMapping("autoAllot")
	@ResponseBody
	public JSONObject autoAllot(Integer[] ids, Integer areaId) {
		JSONObject jsonObject = userService.autoAllot(ids, areaId);
		return jsonObject;

	}

	/**
	 * 管理员列表
	 * 
	 * @return
	 */
	@RequestMapping("goToManagerList")
	public String goToManagerList() {
		return "admin/manager/managerList";
	}

	/**
	 * 添加页
	 * 
	 * @return
	 */
	@RequestMapping("goToAddManager")
	public String goToAddManager() {
		return "admin/manager/addManager";
	}

	@RequestMapping("getManagerDetail")
	public String getManagerDetail(Integer userId, Model model) {
		User manager = userService.getUserById(userId);
		model.addAttribute("manager", manager);
		return "admin/manager/editManager";

	}

	/**
	 * 添加宿管员
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("addManager")
	public String addManager(User user) {
		user.setRoleId(2);
		userService.addManager(user);
		return "redirect:/goToManagerList.do";
	}

	@RequestMapping("getAllManager")
	@ResponseBody
	public List<User> getAllManager(User user) {

		List<User> users = userService.getAllManager(user);
		return users;
	}

	/**
	 * 编辑宿管员
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("editManager")
	public String editManager(User user) {
		Room room = new Room();
		room.setBuildingId(Integer.parseInt(user.getBuildingId()));
		room = roomService.findAllRooms(room).get(0);

		user.setRoomId(String.valueOf(room.getRoomId()));
		user.setAreaId(String.valueOf(room.getAreaId()));
		int result = userService.updateStu(user);
		if (result > 0) {
			Building building = buildingService.getBuildingById(Integer
					.parseInt(user.getBuildingId()));
			building.setManagerName(user.getName());
			buildingService.updateBuilding(building);

		}
		return "redirect:/goToManagerList.do";
	}

	/**
	 * 删除宿管员
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping("delManager")
	public String delManager(Integer userId) {
		userService.delStu(userId);
		return "redirect:/goToManagerList.do";
	}

	/**
	 * 修改密码
	 * 
	 * @param newPwd
	 * @param oldPwd
	 * @param request
	 * @return
	 */
	@RequestMapping("changePassword")
	@ResponseBody
	public JSONObject changePassword(String newPwd, String oldPwd,
			HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();

		newPwd = PasswordUtil.EncoderByMd5(newPwd);
		User u = (User) request.getSession().getAttribute("currentUser");
		if (u.getPassword().equals(PasswordUtil.EncoderByMd5(oldPwd))) {
			u.setPassword(newPwd);
			userService.updateStu(u);
			request.getSession().setAttribute("currentUser", u);
			jsonObject.put("result", true);
			jsonObject.put("msg", "修改成功");
			return jsonObject;
		} else {
			jsonObject.put("result", false);
			jsonObject.put("msg", "密码不正确");
			return jsonObject;
		}

	}

}
