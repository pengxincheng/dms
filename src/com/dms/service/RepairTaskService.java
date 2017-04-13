package com.dms.service;

import java.util.List;

import com.dms.entity.RepairTask;

/**
 *Created by pxc on 2017年4月13日 下午14:12:40
 * 
 */

public interface RepairTaskService {
	
	/**
	 * 维修任务列表
	 * @param repairTask
	 * @return
	 */
	List<RepairTask> findAllRepairTasks(RepairTask repairTask);
	/**
	 * 添加维修任务
	 * @param repairTask
	 * @return
	 */
	int addRepairTask(RepairTask repairTask);
	
	/**
	 * 更新维修任务
	 * @param repairTask
	 * @return
	 */
	int updateRepairTask(RepairTask repairTask);
	/**
	 * 维修任务详细
	 * @param id
	 * @return
	 */
	RepairTask getRepairTaskById(Integer id);
	
	/**
	 * 删除维修任务
	 * @param id
	 * @return
	 */
	int delRepairTaskById(Integer id);

}
