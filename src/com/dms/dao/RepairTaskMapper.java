package com.dms.dao;

import java.util.List;

import com.dms.entity.RepairTask;

public interface RepairTaskMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RepairTask record);

    int insertSelective(RepairTask record);

    RepairTask selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RepairTask record);

    int updateByPrimaryKey(RepairTask record);
    
    List<RepairTask> selectAllRepairTasks(RepairTask repairTask);
}