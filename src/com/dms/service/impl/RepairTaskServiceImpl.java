package com.dms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.RepairTaskMapper;
import com.dms.entity.RepairTask;
import com.dms.service.RepairTaskService;

/**
 * Created by pxc on 2017年4月13日 下午2:14:28
 * 
 */
@Service
public class RepairTaskServiceImpl implements RepairTaskService {

	@Autowired
	private RepairTaskMapper repairTaskMapper;

	@Override
	public List<RepairTask> findAllRepairTasks(RepairTask repairTask) {

		return repairTaskMapper.selectAllRepairTasks(repairTask);
	}

	@Override
	public int addRepairTask(RepairTask repairTask) {
		return repairTaskMapper.insertSelective(repairTask);
	}

	@Override
	public int updateRepairTask(RepairTask repairTask) {
		
		return repairTaskMapper.updateByPrimaryKeySelective(repairTask);
	}

	@Override
	public RepairTask getRepairTaskById(Integer id) {
		
		return repairTaskMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delRepairTaskById(Integer id) {
		
		return repairTaskMapper.deleteByPrimaryKey(id);
	}

}
