package com.dms.dao;

import com.dms.entity.Dorm;

public interface DormMapper {
	/**
	 * 根据id删除宿舍
	 * @param dormid
	 * @return
	 */
    int deleteByPrimaryKey(Integer dormid);
	/**
	 * 新增宿舍
	 * @param record
	 * @return
	 */
    int insert(Dorm record);
    /**
     * 新增宿舍 字段为空时不插入
     * @param record
     * @return
     */
    int insertSelective(Dorm record);

    /**
     * 根据主键查询宿舍
     * @param dormid
     * @return
     */
    Dorm selectByPrimaryKey(Integer dormid);
    /**
     * 修改宿舍  字段为空时不修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Dorm record);
    /**
     * 修改宿舍
     * @param record
     * @return
     */
    int updateByPrimaryKey(Dorm record);
}