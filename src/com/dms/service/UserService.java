package com.dms.service;

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

}
