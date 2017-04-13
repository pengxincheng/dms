package com.dms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dms.Util.JsonDateValueProcessor;
import com.dms.entity.RepairTask;
import com.dms.entity.User;
import com.dms.service.RepairTaskService;

/**
 * Created by pxc on 2017年4月13日 下午2:00:27
 * 
 */
@Controller
public class RepairTaskController {

	@Autowired
	private RepairTaskService repairTaskService;

	/**
	 * 获取自己的维修任务列表
	 * 
	 * @param repairTask
	 * @return
	 */
	@RequestMapping("getAllRepairTasks")
	@ResponseBody
	public JSONArray getAllRepairTasks(RepairTask repairTask) {
		repairTask.setReporter("彭新成");
		List<RepairTask> repairTasks = repairTaskService
				.findAllRepairTasks(repairTask);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(repairTasks, jsonConfig);
		return jsonArray;

	}
	/**
	 * 新建上报维修
	 * @param repairTask
	 * @param request
	 * @return
	 */
	@RequestMapping("addRepairTask")
	public String addRepairTask(RepairTask repairTask,HttpServletRequest request) {
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		
		String area = u.getRoom().getBuilding().getArea().getAreaName();
		String building = u.getRoom().getBuilding().getBuildingName();
		String room = u.getRoom().getRoomSn();
		String address = area + building.split("-")[1]+"座"+room;
		repairTask.setReporter(u.getName());
		repairTask.setAddress(address);
		repairTask.setStatus("待提交");
		repairTaskService.addRepairTask(repairTask);
		
		return "redirect:/goToRepairTasksList.do";
	}
	/**
	 * 详细
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("getRepairTaskDetail")
	public String getRepairTaskDetail(Integer id,Model model){
		
		RepairTask repairTask = repairTaskService.getRepairTaskById(id);
		model.addAttribute("repairTask", repairTask);
		return "student/repair/editRepairTask";
	}
	/**
	 * 修改
	 * @param repairTask
	 * @return
	 */
	@RequestMapping("editRepairTask")
	public String editRepairTask(RepairTask repairTask){
		
		repairTaskService.updateRepairTask(repairTask);
		return "redirect:/goToRepairTasksList.do";
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delRepairTask")
	public String delRepairTask(Integer id){
		
		repairTaskService.delRepairTaskById(id);
		return "redirect:/goToRepairTasksList.do";
	}
	
	

	@RequestMapping("goToRepairTasksList")
	public String goToRepairTasksList() {
		return "student/repair/repairTaskList";
	}

	@RequestMapping("goToAddRepairTask")
	public String goToAddRepairTask() {
		return "student/repair/addRepairTask";
	}
}
