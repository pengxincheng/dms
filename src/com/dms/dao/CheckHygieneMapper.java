package com.dms.dao;

import java.util.List;
import java.util.Map;

import com.dms.entity.CheckHygiene;

public interface CheckHygieneMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CheckHygiene record);

    int insertSelective(CheckHygiene record);

    CheckHygiene selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CheckHygiene record);

    int updateByPrimaryKey(CheckHygiene record);
    
    List<CheckHygiene> selectAllCheckHygienes(CheckHygiene checkHygiene);
    
    List<Map<String,Object>> selectForPie();
}