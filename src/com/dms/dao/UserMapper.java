package com.dms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dms.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);
    /**
     * 查询所有已分配宿舍的学生
     * @param user
     * @return
     */
    List<User> selectAllUsers(User user);
    
    User selectForLogin(@Param("username") String username,@Param("password") String password);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    /**
     * 查询所有未分配宿舍的学生
     * @param user
     * @return
     */
    List<User> selectAllStusNotAlloted(User user);
    
    User selectByStuNo(String stuNo);
}