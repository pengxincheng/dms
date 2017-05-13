package com.dms.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.RegisterMapper;
import com.dms.entity.Register;
import com.dms.service.RegisterService;

/**
 *Created by pxc on 2017年4月24日 上午10:39:44
 * 
 */
@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private RegisterMapper registerMapper;
	
	@Override
	public List<Register> findAllRegisters(Register register,Date startDate,Date endDate) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("register", register);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return registerMapper.selectAllRegisters(map);
	}

	@Override
	public int addRegister(Register register) {
		
		return registerMapper.insertSelective(register);
	}

	@Override
	public int updateRegister(Register register) {

		return registerMapper.updateByPrimaryKeySelective(register);
	}

	@Override
	public Register getRegisterById(Integer id) {

		return registerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delRegisterById(Integer id) {
		
		return registerMapper.deleteByPrimaryKey(id);
	}

}
