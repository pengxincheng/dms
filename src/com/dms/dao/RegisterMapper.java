package com.dms.dao;

import java.util.List;

import com.dms.entity.Register;

public interface RegisterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Register record);

    int insertSelective(Register record);

    Register selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Register record);

    int updateByPrimaryKey(Register record);
    
    List<Register> selectAllRegisters(Register register);
}