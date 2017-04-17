package com.dms.dao;

import java.util.List;

import com.dms.entity.VisitEnregister;

public interface VisitEnregisterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VisitEnregister record);

    int insertSelective(VisitEnregister record);

    VisitEnregister selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VisitEnregister record);

    int updateByPrimaryKey(VisitEnregister record);
    
    List<VisitEnregister> selectAllVisitEnregister(VisitEnregister visitEnregister);
}