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
import com.dms.entity.CheckHygiene;
import com.dms.entity.Room;
import com.dms.entity.User;
import com.dms.service.CheckHygieneService;
import com.dms.service.RoomService;

/**
 *Created by pxc on 2017年4月25日 下午5:52:45
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
	 * @param checkHygiene
	 * @return
	 */
	@RequestMapping("getAllCheckHygienes")
	@ResponseBody
	public JSONArray getAllCheckHygienes(CheckHygiene checkHygiene){
		
		List<CheckHygiene> checkHygienes = checkHygieneService.findAllCheckHygienes(checkHygiene);
		JsonConfig jsonConfig = new JsonConfig();
		
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd"));
		
		JSONArray array = JSONArray.fromObject(checkHygienes, jsonConfig);
		return array;
		
	}
	
	/**
	 * 跳转到卫生列表 宿管员
	 * @return
	 */
	@RequestMapping("goToCheckHygieneList")
	public String goToCheckHygieneList(){
		return "dormManager/checkHygiene/checkHygieneList";
	}
	/**
	 * 跳转添加页
	 * @return
	 */
	@RequestMapping("goToAddCheckHygiene")
	public String goToAddCheckHygiene(HttpServletRequest request,Model model){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		Room room = new Room();
		room.setBuildingId(Integer.parseInt(u.getBuildingId()));
		List<Room> rooms = roomService.findAllRooms(room);
		
		model.addAttribute("rooms", rooms);
		
		return "dormManager/checkHygiene/addCheckHygiene";
	}
	/**
	 * 添加
	 * @param checkHygiene
	 * @return
	 */
	@RequestMapping("addCheckHygiene")
	public String addCheckHygiene(CheckHygiene checkHygiene,HttpServletRequest request){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		checkHygiene.setBuildingId(Integer.parseInt(u.getBuildingId()));
		checkHygiene.setChackTime(new Date());
		
		checkHygieneService.addCheckHygiene(checkHygiene);
		return "redirect:/goToCheckHygieneList.do";
	}
	/**
	 * 获取详情 为修改也准备数据
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("getCheckHygieneDetail")
	public String getCheckHygieneDetail(Integer id,Model model){
	
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
	 * @param checkHygiene
	 * @return
	 */
	@RequestMapping("editCheckHygiene")
	public String editCheckHygiene(CheckHygiene checkHygiene){
		
		checkHygieneService.updateCheckHygiene(checkHygiene);
		
		return "redirect:/goToCheckHygieneList.do";
	}
	
	@RequestMapping("delCheckHygiene")
	public String delCheckHygiene(Integer id){
		
		checkHygieneService.delCheckHygieneById(id);
		
		return "redirect:/goToCheckHygieneList.do";
		
	}
}
