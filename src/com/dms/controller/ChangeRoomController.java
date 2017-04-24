package com.dms.controller;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.Building;
import com.dms.entity.ChangeRoom;
import com.dms.service.ChangeRoomService;

/**
 *Created by pxc on 2017年4月24日 下午5:53:45
 * 
 */
@Controller
public class ChangeRoomController {

	@Autowired
	private ChangeRoomService changeRoomService;
	
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
}
