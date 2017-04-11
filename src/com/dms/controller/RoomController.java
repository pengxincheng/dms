package com.dms.controller;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.dao.RoomMapper;
import com.dms.entity.Area;
import com.dms.entity.Building;
import com.dms.entity.Room;
import com.dms.service.AreaService;
import com.dms.service.BuildingService;
import com.dms.service.RoomService;

/**
 *Created by pxc on 2017年4月10日 下午3:21:54
 * 
 */
@Controller
public class RoomController {

	@Autowired 
	private RoomService roomService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private BuildingService buildingService;
	
	/**
	 * 宿舍列表
	 * @param room
	 * @return
	 */
	@RequestMapping("getAllRooms")
	public @ResponseBody JSONArray getAllRooms(Room room){
		
		List<Room> rooms = roomService.findAllRooms(room);
		JsonConfig jsonConfig = new JsonConfig();
		//将list转为jsonArray, 不转换Date对象
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd"));
		JSONArray array = JSONArray.fromObject(rooms, jsonConfig);
		return array;
			
	}
	/**
	 * 添加宿舍
	 * @param room
	 * @return
	 */
	@RequestMapping("addRoom")
	public String addRoom(Room room){
		
		roomService.addRoom(room);
		return "redirect:/goToRoomList.do";
		
	}
	/**
	 * 查询宿舍详情，修改是使用
	 * @param roomId
	 * @param model
	 * @return
	 */
	@RequestMapping("getRoomDetail")
	public String getRoomDetail(Integer roomId,Model model){
		
		Room room = roomService.getRoomById(roomId);
		model.addAttribute("room", room);
		
		Area area = new Area();
		List<Area> areas = areaService.findAllAreas(area);
		
		model.addAttribute("areas", areas);
		return "admin/room/editRoom";
		
	}
	/**
	 * 更新宿舍
	 * @param room
	 * @return
	 */
	@RequestMapping("editRoom")
	public String editRoom(Room room){
		roomService.updateRoom(room);
		return "redirect:/goToRoomList.do";
	}
	
	@RequestMapping("delRoom")
	public String delRoom(Integer roomId){
		roomService.delRoomById(roomId);
		return "redirect:/goToRoomList.do";
	}
	
	/**
	 * 跳转到列表页
	 * @return
	 */
	@RequestMapping("goToRoomList")
	public String goToListPage(){
		return "admin/room/roomList";
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("goToAddRoom")
	public String goToAddRoom(Model model,Integer areaId){
		
		Area area = new Area();
		List<Area> areas = areaService.findAllAreas(area);
		
		model.addAttribute("areas", areas);
		return "admin/room/addRoom";
	}
	
	
	
}
