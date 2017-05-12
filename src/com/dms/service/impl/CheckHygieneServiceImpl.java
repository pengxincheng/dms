package com.dms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.CheckHygieneMapper;
import com.dms.entity.CheckHygiene;
import com.dms.service.CheckHygieneService;

/**
 * Created by pxc on 2017年4月25日 下午5:48:02
 * 
 */
@Service
public class CheckHygieneServiceImpl implements CheckHygieneService {

	@Autowired
	private CheckHygieneMapper checkHygieneMapper;

	@Override
	public List<CheckHygiene> findAllCheckHygienes(CheckHygiene checkHygiene) {
		return checkHygieneMapper.selectAllCheckHygienes(checkHygiene);
	}

	@Override
	public int addCheckHygiene(CheckHygiene checkHygiene) {
		return checkHygieneMapper.insertSelective(checkHygiene);
	}

	@Override
	public int updateCheckHygiene(CheckHygiene checkHygiene) {
		return checkHygieneMapper.updateByPrimaryKeySelective(checkHygiene);
	}

	@Override
	public CheckHygiene getCheckHygieneById(Integer id) {
		return checkHygieneMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delCheckHygieneById(Integer id) {
		return checkHygieneMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Map<String,Object>> censusAll() {
		
		return checkHygieneMapper.selectForPie();
	}

}
