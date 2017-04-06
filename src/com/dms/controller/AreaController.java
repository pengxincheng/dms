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
import com.dms.entity.Area;
import com.dms.service.AreaService;

/**
 * Created by pxc on 2017年3月31日 下午5:20:15
 * 
 */
@Controller
public class AreaController {

	@Autowired
	private AreaService areaService;

	/**
	 * 查询所有宿舍区
	 * @param area
	 * @return
	 */
	@RequestMapping("findAllAreas")
	public @ResponseBody JSONArray findAllAreas(Area area) {

		List<Area> areas = areaService.findAllAreas(area);

		JsonConfig jsonConfig = new JsonConfig();
		//将list转为jsonArray, 不转换Date对象
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd"));
		JSONArray array = JSONArray.fromObject(areas, jsonConfig);
		return array;
	}
	/**
	 * 添加宿舍区
	 * @param area
	 * @return
	 */
	@RequestMapping("addArea")
	public String addArea(Area area){
		areaService.addArea(area);
		return "redirect:/goToListPage.do";
	}
	/**
	 * 更新宿舍区
	 * @param area
	 * @return
	 */
	@RequestMapping("editArea")
	public String editArea(Area area){
		areaService.updateArea(area);
		return "redirect:/goToListPage.do";
		
	}
	
	@RequestMapping("getAreaDetail")
	public String getAreaDetail(Integer id,Model model){
		
		Area area = areaService.getAreaById(id);
		model.addAttribute("area", area);
		
		return "admin/area/editArea";
	}
	@RequestMapping("delArea")
	public String delArea(Integer id){
		
		areaService.delAreaById(id);
		return "redirect:/goToListPage.do";		
	}
	/**
	 * 跳转到宿舍区列表页面
	 * @return
	 */
	@RequestMapping("goToListPage")
	public String goToListPage() {
		return "admin/area/areaList";

	}
	
	@RequestMapping("goToAddPage")
	public String goToAddPage(){
		return "admin/area/addArea";
	}

}
