package com.dms.service.impl;

import java.util.List;

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
	public List<Register> findAllRegisters(Register register) {
		
		return registerMapper.selectAllRegisters(register);
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
