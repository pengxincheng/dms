package com.dms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.AreaMapper;
import com.dms.entity.Area;
import com.dms.service.AreaService;

/**
 *Created by pxc on 2017年3月31日 下午5:15:26
 * 
 */
@Service
public class AreaServiceImpl implements AreaService {

	@Autowired 
	private AreaMapper areaMapper;
	
	@Override
	public List<Area> findAllAreas(Area area) {
		
		return areaMapper.selectAllAreas(area);
	}

	@Override
	public int addArea(Area area) {
		area.setBuildTime(new Date());
		return areaMapper.insertSelective(area);
	}

	@Override
	public int updateArea(Area area) {
		
		return areaMapper.updateByPrimaryKeySelective(area);
	}

	@Override
	public Area getAreaById(Integer id) {
		
		return areaMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delAreaById(Integer id) {
		
		return areaMapper.deleteByPrimaryKey(id);
	}

}
