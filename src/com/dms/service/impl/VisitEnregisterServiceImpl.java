package com.dms.service.impl;

import java.util.Date;
import java.util.List;

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
	public List<VisitEnregister> findAllVisitEnregisters(VisitEnregister visitEnregister) {
		
		return visitEnregisterMapper.selectAllVisitEnregister(visitEnregister);
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
