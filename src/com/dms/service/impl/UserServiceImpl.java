package com.dms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.Util.PasswordUtil;
import com.dms.dao.UserMapper;
import com.dms.entity.User;
import com.dms.service.UserService;

/**
 * @author pxc
 * @date ：2017年2月22日 下午11:10:34
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

	@Override
	public List<User> getAllStusNotAlloted(User user) {

		return userMapper.selectAllStusNotAlloted(user);
	}

	@Override
	public int addStu(User user) {

		user.setIsAlloted("0");
		user.setPassword("ICy5YqxZB1uWSwcVLSNLcA=="); // 初始密码123
		user.setRoleId(3);
		user.setUsername(user.getStuNo());
		return userMapper.insertSelective(user);
	}

	@Override
	public int delStu(Integer userId) {

		return userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public int updateStu(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User getStuByStuNo(String stuNo) {

		return userMapper.selectByStuNo(stuNo);
	}

	@Override
	public int batchAddStu(List<User> stus) {
		
		return userMapper.batchInsert(stus);
	}
	

}
