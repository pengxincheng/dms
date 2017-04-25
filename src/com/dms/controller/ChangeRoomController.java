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
import com.dms.entity.ChangeRoom;
import com.dms.entity.Room;
import com.dms.entity.User;
import com.dms.service.ChangeRoomService;
import com.dms.service.RoomService;

/**
 *Created by pxc on 2017年4月24日 下午5:53:45
 * 
 */
@Controller
public class ChangeRoomController {

	@Autowired
	private ChangeRoomService changeRoomService;
	@Autowired
	private RoomService roomService;
	/**
	 * 申请调换宿舍列表
	 * @param changeRoom
	 * @return
	 */
	@RequestMapping("getAllChangeRooms")
	@ResponseBody
	public JSONArray getAllChangeRooms(ChangeRoom changeRoom){
		
		List<ChangeRoom> changeRooms = changeRoomService.findAllChangeRooms(changeRoom);
		JsonConfig jsonConfig = new JsonConfig();
		
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		
		JSONArray array = JSONArray.fromObject(changeRooms, jsonConfig);
		return array;
	}
	/**
	 * 跳转  学生列表
	 * @return
	 */
	@RequestMapping("goToChangeRoomList")
	public String goToChangeRoomList(){
		return "student/changeRoom/changeRoomList";
	}
	
	/**
	 * 跳转 学生新增申请
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("goToAddChangeRoom")
	public String goToAddChangeRoom(HttpServletRequest request,Model model){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		Room room = new Room();
		room.setBuildingId(Integer.parseInt(u.getBuildingId()));
		List<Room> rooms = roomService.findAllRooms(room);
		
		model.addAttribute("rooms", rooms);
		return "student/changeRoom/addChangeRoom";
	}
	/**
	 * 跳转  宿管员列表
	 * @return
	 */
	@RequestMapping("goToChangeRoomListForManager")
	public String goToChangeRoomListForManager(){
		return "dormManager/changeRoom/changeRoomList";
	}
	
	/**
	 * 新建申请
	 * @param changeRoom
	 * @param request
	 * @return
	 */
	@RequestMapping("addChangeRoom")
	public String addChangeRoom(ChangeRoom changeRoom,HttpServletRequest request){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		changeRoom.setStuId(u.getUserId());
		
		changeRoomService.addChangeRoom(changeRoom);
		
		return "redirect:/goToChangeRoomList";
	}
	/**
	 * 详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("getChangeRoomDetail")
	public String getChangeRoomDetail(Integer id,Model model,HttpServletRequest request){
		
		ChangeRoom changeRoom = changeRoomService.getChangeRoomById(id);
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		Room room = new Room();
		room.setBuildingId(Integer.parseInt(u.getBuildingId()));
		List<Room> rooms = roomService.findAllRooms(room);
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("changeRoom", changeRoom);
		return "student/changeRoom/editChangeRoom";
	}
	/**
	 * 修改
	 * @param changeRoom
	 * @return
	 */
	@RequestMapping("editChangeRoom")
	public String editChangeRoom(ChangeRoom changeRoom){
		
		changeRoomService.updateChangeRoom(changeRoom);
		
		return "redirect:/goToChangeRoomList";
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delChangeRoom")
	public String delChangeRoom(Integer id){
		
		changeRoomService.delChangeRoomById(id);
		return "redirect:/goToChangeRoomList.do";
	}
	
	@RequestMapping("submitChangeRoom")
	public String submitChangeRoom(Integer id,HttpServletRequest request){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		String auditMan = u.getRoom().getBuilding().getManagerName();
		
		changeRoomService.submitApply(id, auditMan);
		
		return "redirect:/goToChangeRoomList.do";
	}
	
	/**
	 * 审核
	 * @param id
	 * @param status
	 * @param auditOponion
	 * @return
	 */
	@RequestMapping("auditApply")
	public String auditApply(Integer id,String status,String auditOponion){
		
		changeRoomService.auditApply(id, status, auditOponion);
		return "redirect:/goToChangeRoomListForManager.do";
	}
	
}
