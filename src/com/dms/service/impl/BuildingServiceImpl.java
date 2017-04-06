package com.dms.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.BuildingMapper;
import com.dms.entity.Building;
import com.dms.service.BuildingService;

/**
 *Created by pxc on 2017年4月4日 下午2:48:32
 * 
 */

@Service
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingMapper buildingMapper;
	
	@Override
	public List<Building> findAllBuildings(Building building) {
		 
		return buildingMapper.selectAllBuildings(building);
	}

	@Override
	public int addBuilding(Building building) {
		
		Date date = new Date();
		building.setStartTime(date);
		Calendar calendar = Calendar.getInstance();    
		calendar.setTime(date);    
		calendar.add(Calendar.YEAR, +70);//当前时间减去一年，即一年前的时间    
		building.setEndTime(calendar.getTime());
		return buildingMapper.insertSelective(building);
	}

	@Override
	public int updateBuilding(Building building) {
		
		return buildingMapper.updateByPrimaryKeySelective(building);
	}

	@Override
	public Building getBuildingById(Integer buildingId) {
		
		return buildingMapper.selectByPrimaryKey(buildingId) ;
	}

	@Override
	public int delBuildingById(Integer buildingId) {
		
		return buildingMapper.deleteByPrimaryKey(buildingId);
	}

}
