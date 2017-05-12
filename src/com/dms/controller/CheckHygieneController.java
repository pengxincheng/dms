package com.dms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.CheckHygiene;
import com.dms.entity.Room;
import com.dms.entity.User;
import com.dms.service.CheckHygieneService;
import com.dms.service.RoomService;

/**
 * Created by pxc on 2017年4月25日 下午5:52:45
 * 
 */
@Controller
public class CheckHygieneController {

	@Autowired
	private CheckHygieneService checkHygieneService;
	@Autowired
	private RoomService roomService;

	/**
	 * 卫生检查列表
	 * 
	 * @param checkHygiene
	 * @return
	 */
	@RequestMapping("getAllCheckHygienes")
	@ResponseBody
	public JSONArray getAllCheckHygienes(CheckHygiene checkHygiene) {

		List<CheckHygiene> checkHygienes = checkHygieneService
				.findAllCheckHygienes(checkHygiene);
		JsonConfig jsonConfig = new JsonConfig();

		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd"));

		JSONArray array = JSONArray.fromObject(checkHygienes, jsonConfig);
		return array;

	}

	/**
	 * 跳转到卫生列表 宿管员
	 * 
	 * @return
	 */
	@RequestMapping("goToCheckHygieneList")
	public String goToCheckHygieneList() {
		return "dormManager/checkHygiene/checkHygieneList";
	}

	/**
	 * 跳转添加页
	 * 
	 * @return
	 */
	@RequestMapping("goToAddCheckHygiene")
	public String goToAddCheckHygiene(HttpServletRequest request, Model model) {

		User u = (User) request.getSession().getAttribute("currentUser");

		Room room = new Room();
		room.setBuildingId(Integer.parseInt(u.getBuildingId()));
		List<Room> rooms = roomService.findAllRooms(room);

		model.addAttribute("rooms", rooms);

		return "dormManager/checkHygiene/addCheckHygiene";
	}

	/**
	 * 添加
	 * 
	 * @param checkHygiene
	 * @return
	 */
	@RequestMapping("addCheckHygiene")
	public String addCheckHygiene(CheckHygiene checkHygiene,
			HttpServletRequest request) {

		User u = (User) request.getSession().getAttribute("currentUser");
		checkHygiene.setBuildingId(Integer.parseInt(u.getBuildingId()));
		checkHygiene.setChackTime(new Date());

		checkHygieneService.addCheckHygiene(checkHygiene);
		return "redirect:/goToCheckHygieneList.do";
	}

	/**
	 * 获取详情 为修改也准备数据
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("getCheckHygieneDetail")
	public String getCheckHygieneDetail(Integer id, Model model) {

		CheckHygiene checkHygiene = checkHygieneService.getCheckHygieneById(id);

		Room room = new Room();
		room.setBuildingId(checkHygiene.getBuildingId());
		List<Room> rooms = roomService.findAllRooms(room);

		model.addAttribute("rooms", rooms);
		model.addAttribute("checkHygiene", checkHygiene);

		return "dormManager/checkHygiene/editCheckHygiene";
	}

	/**
	 * 修改
	 * 
	 * @param checkHygiene
	 * @return
	 */
	@RequestMapping("editCheckHygiene")
	public String editCheckHygiene(CheckHygiene checkHygiene) {

		checkHygieneService.updateCheckHygiene(checkHygiene);

		return "redirect:/goToCheckHygieneList.do";
	}

	@RequestMapping("delCheckHygiene")
	public String delCheckHygiene(Integer id) {

		checkHygieneService.delCheckHygieneById(id);

		return "redirect:/goToCheckHygieneList.do";

	}

	@RequestMapping("goToCensusPage")
	public String goToCensusPage() {
		return "student/hygieneCensus";
	}

	/**
	 * 全校宿舍卫生统计 饼图
	 * 
	 * @return
	 */
	@RequestMapping("censusAll")
	@ResponseBody
	public JSONObject censusAll() {
		JSONObject jsonObject = new JSONObject();

		List<String> names = new ArrayList<String>();
		JSONArray jsonArray = new JSONArray();

		List<Map<String, Object>> maps = checkHygieneService.censusAll();

		for (Map<String, Object> map : maps) {
			Map<String, Object> nameValue = new HashMap<String, Object>();
			Integer mark = (Integer) map.get("mark");
			String name = null;
			if (mark == 5) {
				name = "A";
				names.add(name);
			} else if (mark == 4) {
				name = "B";
				names.add(name);
			} else if (mark == 3) {
				name = "C";
				names.add(name);
			} else if (mark == 2) {
				name = "D";
				names.add(name);
			} else {
				name = "E";
				names.add(name);
			}

			nameValue.put("value", map.get("count"));
			nameValue.put("name", name);
			jsonArray.add(nameValue);
		}

		jsonObject.put("names", names);
		jsonObject.put("nameValue", jsonArray);
		return jsonObject;
	}

	/**
	 * 单个宿舍折线图统计
	 * 
	 * @param checkHygiene
	 * @param request
	 * @return
	 */
	@RequestMapping("censusOne")
	@ResponseBody
	public JSONObject censusOne(CheckHygiene checkHygiene,
			HttpServletRequest request) {

		JSONObject jsonObject = new JSONObject();
		
		List<String> xAxis = new ArrayList<String>();
		List<Integer> marks = new ArrayList<Integer>();

		//JSONArray jsonArray = new JSONArray();

		User u = (User) request.getSession().getAttribute("currentUser");
		checkHygiene.setRoomId(Integer.parseInt(u.getRoomId()));

		List<CheckHygiene> list = checkHygieneService.findAllCheckHygienes(checkHygiene);
		int j = 1;
		for (int i = list.size() - 1; i >= 0; i--) {
			xAxis.add("第" + j + "周");
			marks.add(list.get(i).getMark());
			j++;
		}
		jsonObject.put("xAxis", xAxis);
		jsonObject.put("marks", marks);
		return jsonObject;

	}
}
