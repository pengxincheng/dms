package com.dms.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.VisitEnregisterMapper;
import com.dms.entity.VisitEnregister;
import com.dms.service.VisitEnregisterService;

/**
 *Created by pxc on 2017年4月17日 下午5:12:44
 * 
 */
@Service
public class VisitEnregisterServiceImpl implements VisitEnregisterService {

	@Autowired
	private VisitEnregisterMapper visitEnregisterMapper;
	
	@Override
	public List<VisitEnregister> findAllVisitEnregisters(VisitEnregister visitEnregister,Date startDate,Date endDate) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("visitEnregister", visitEnregister);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return visitEnregisterMapper.selectAllVisitEnregister(map);
	}

	@Override
	public int addVisitEnregister(VisitEnregister visitEnregister) {

		visitEnregister.setStartTime(new Date());
		visitEnregister.setIsLeave("未离开");
		return visitEnregisterMapper.insertSelective(visitEnregister);
	}

	@Override
	public int updateVisitEnregister(VisitEnregister visitEnregister) {
		
		return visitEnregisterMapper.updateByPrimaryKeySelective(visitEnregister);
	}

	@Override
	public VisitEnregister getVisitEnregisterById(Integer id) {
	
		return visitEnregisterMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delVisitEnregisterById(Integer id) {
		
		return visitEnregisterMapper.deleteByPrimaryKey(id);
	}

}
