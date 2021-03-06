package com.dms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.ApplyGoodMapper;
import com.dms.entity.ApplyGood;
import com.dms.service.ApplyGoodService;

/**
 *Created by pxc on 2017年4月14日 下午4:15:10
 * 
 */
@Service
public class ApplyGoodServiceImpl implements ApplyGoodService {

	@Autowired
	private ApplyGoodMapper applyGoodMapper;
	
	@Override
	public List<ApplyGood> findAllApplyGoods(ApplyGood applyGood) {
		
		return applyGoodMapper.selectAllApplyGoods(applyGood);
	}

	@Override
	public int addApplyGood(ApplyGood applyGood) {

		return applyGoodMapper.insertSelective(applyGood);
	}

	@Override
	public int updateApplyGood(ApplyGood applyGood) {
		
		return applyGoodMapper.updateByPrimaryKeySelective(applyGood);
	}

	@Override
	public ApplyGood getApplyGoodById(Integer id) {
		
		return applyGoodMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delApplyGoodById(Integer id) {
		
		return applyGoodMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<ApplyGood> getAllApplyGoods(ApplyGood applyGood) {
		
		return applyGoodMapper.selectAllApplyGoods(applyGood);
	}

	@Override
	public void submitApplyGood(Integer id,String auditMan) {
		
		ApplyGood applyGood = applyGoodMapper.selectByPrimaryKey(id);
		applyGood.setApplyTime(new Date());
		applyGood.setAuditMan(auditMan);
		applyGood.setStatus("待审核");
		applyGoodMapper.updateByPrimaryKeySelective(applyGood);
		
	}

	@Override
	public void auditApplyGood(Integer id, String status, String auditOponion) {
		
		ApplyGood applyGood = applyGoodMapper.selectByPrimaryKey(id);
		
		applyGood.setStatus(status);
		applyGood.setAuditTime(new Date());
		applyGood.setAuditOpinion(auditOponion);
		applyGoodMapper.updateByPrimaryKeySelective(applyGood);
	}
}
