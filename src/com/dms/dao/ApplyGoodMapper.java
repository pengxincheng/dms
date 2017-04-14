package com.dms.dao;

import java.util.List;

import com.dms.entity.ApplyGood;

public interface ApplyGoodMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ApplyGood record);

    int insertSelective(ApplyGood record);

    ApplyGood selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApplyGood record);

    int updateByPrimaryKey(ApplyGood record);
    
    List<ApplyGood> selectAllApplyGoods(ApplyGood applyGood);
}