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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	/*学生相关方法开始*/
	/**
	 * 获取自己的维修任务列表
	 * 
	 * @param repairTask
	 * @return
	 */
	@RequestMapping("getAllRepairTasks")
	@ResponseBody
	public JSONArray getAllRepairTasks(RepairTask repairTask,HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("currentUser");
		if(u.getRoleId() == 2){
			repairTask.setDealMan(u.getName());
		}
		else{
			repairTask.setReporter(u.getName());
		}
		
		
		List<RepairTask> repairTasks = repairTaskService.findAllRepairTasks(repairTask);
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
	/**
	 * 提交
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("submitRepairTask")
	public String submitRepairTask(Integer id,HttpServletRequest request){
		
		User u = (User) request.getSession().getAttribute("currentUser");
		
		RepairTask repairTask = repairTaskService.getRepairTaskById(id);
		repairTask.setDealMan(u.getRoom().getBuilding().getManagerName());
		repairTask.setStatus("待修理");
		repairTask.setReportTime(new Date());
		repairTaskService.updateRepairTask(repairTask);
		return "redirect:/goToRepairTasksList.do";
		
	}
	
	/**
	 * 学生报修列表
	 * @return
	 */
	@RequestMapping("goToRepairTasksList")
	public String goToRepairTasksList() {
		return "student/repair/repairTaskList";
	}
	

	@RequestMapping("goToAddRepairTask")
	public String goToAddRepairTask() {
		return "student/repair/addRepairTask";
	}
	/*学生相关方法结束*/
	
	
	/*管理员相关方法开始*/
	
	/**
	 * 提交
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("repair")
	public String repair(Integer id){
		
		RepairTask repairTask = repairTaskService.getRepairTaskById(id);
		
		repairTask.setStatus("已修理");
		repairTask.setRepairTime(new Date());
		repairTaskService.updateRepairTask(repairTask);
		return "redirect:/goToRepairTasksListForManager.do";
		
	}
	
	/**
	 * 管理员修理列表
	 * @return
	 */
	@RequestMapping("goToRepairTasksListForManager")
	public String goToRepairTasksListForManager() {
		
		return "dormManager/repair/repairTaskList";
	}
	/*管理员相关方法结束*/
}
