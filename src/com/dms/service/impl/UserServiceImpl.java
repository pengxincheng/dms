package com.dms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.Util.PasswordUtil;
import com.dms.dao.UserMapper;
import com.dms.entity.User;
import com.dms.service.UserService;


/**
 *@author pxc
 *@date ：2017年2月22日 下午11:10:34
 */

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User getUserById(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
		
		
	}

	@Override
	public User checkLogin(String username, String password) {
		
		password = PasswordUtil.EncoderByMd5(password);
		return (User) userMapper.selectForLogin(username, password);
	}

	@Override
	public List<User> getAllUsers(User user) {
		
		return userMapper.selectAllUsers(user);
	}

}
