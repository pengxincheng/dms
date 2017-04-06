package com.dms.controller;

import java.util.Date;
import java.util.List;

import javassist.compiler.ast.NewExpr;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.Area;
import com.dms.entity.Building;
import com.dms.entity.User;
import com.dms.service.AreaService;
import com.dms.service.BuildingService;
import com.dms.service.UserService;

/**
 *Created by pxc on 2017年4月5日 上午9:23:32
 * 
 */
@Controller
public class BuildingController {

	@Autowired
	private BuildingService buildingService;
	@Autowired
	private UserService userService;
	@Autowired
	private AreaService areaService;
	
	/**
	 * 获取楼栋列表
	 * @param building
	 * @return
	 */
	@RequestMapping("getBuildingList")
	public @ResponseBody JSONArray getBuildingList(Building building){
		
		List<Building> buildings = buildingService.findAllBuildings(building);
		JsonConfig jsonConfig = new JsonConfig();
		//将list转为jsonArray, 不转换Date对象
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd"));
		JSONArray array = JSONArray.fromObject(buildings, jsonConfig);
		return array;
	}
	/**
	 * 新增
	 * @param building
	 * @return
	 */
	@RequestMapping("addBuilding")
	public String addBuilding(Building building){
		buildingService.addBuilding(building);
		return "redirect:/goToBuildingList.do";
	}
	/**
	 * 修改
	 * @param building
	 * @return
	 */
	@RequestMapping("updateBuilding")
	public String updateBuilding(Building building){
		buildingService.updateBuilding(building);
		return "redirect:/goToBuildingList.do";
	} 
	/**
	 * 删除
	 * @param buildingId
	 * @return
	 */
	@RequestMapping("delBuilding")
	public String delBuilding(Integer buildingId){
		
		buildingService.delBuildingById(buildingId);
		return "redirect:/goToBuildingList.do";
	}
	
	/**
	 * 获取详细
	 * @param buildingId
	 * @return
	 */
	@RequestMapping("getBuildingDetail")
	public String getBuildingDetail(Integer buildingId,Model model){
		
		Building building = buildingService.getBuildingById(buildingId);
		
		Area area = new Area();
		List<Area> areas = areaService.findAllAreas(area);
		
		User user = new User();
		user.setRoleId(2);
		List<User> users = userService.getAllUsers(user);
		
		model.addAttribute("areas", areas);
		model.addAttribute("users", users);
		model.addAttribute("building", building);
		return "admin/building/editBuilding";
	}
	/**
	 * 跳转到列表页
	 * @return
	 */
	@RequestMapping("goToBuildingList")
	public String goToListPage(){
		return "admin/building/buildingList";
	}
	
	/**
	 * 跳转到添加页
	 * @return
	 */
	@RequestMapping("goToBuildingAddPage")
	public String goToBuildingAddPage(Model model){
		
		Area area = new Area();
		List<Area> areas = areaService.findAllAreas(area);
		
		User user = new User();
		user.setRoleId(2);
		List<User> users = userService.getAllUsers(user);
		
		model.addAttribute("areas", areas);
		model.addAttribute("users", users);
		
		
		return "admin/building/addBuilding";
	}
	
}
