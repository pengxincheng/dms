package com.dms.service;

import java.util.List;

import net.sf.json.JSONObject;

import com.dms.entity.User;

/**
 *@author pxc
 *@date ：2017年2月22日 下午11:08:28
 */

public interface UserService {
	/**
	 * 通过id查询用户
	 * @param userId
	 * @return
	 */
	public User getUserById(Integer userId);
	
	/**
	 * 检查用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	public User checkLogin(String username,String password);
	/**
	 * 获取所有用户
	 * @param user
	 * @return
	 */
	public List<User> getAllUsers(User user);
	/**
	 * 获取所有未分配宿舍的学生
	 * @param user
	 * @return
	 */
	List<User> getAllStusNotAlloted(User user);
	
	int addStu(User user);
	
	int delStu(Integer userId);
	
	int updateStu(User user);
	
	User getStuByStuNo(String stuNo);
	
	int batchAddStu(List<User> stus);
	
	int batchDelStu(Integer[] ids);
	
	JSONObject autoAllot(Integer[] ids,Integer areaId);
	
	int addManager(User user);
	
	List<User> getAllManager(User user);
}
