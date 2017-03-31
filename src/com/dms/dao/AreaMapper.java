package com.dms.dao;

import com.dms.entity.Area;

public interface AreaMapper {
	/**
	 * 根据id删除宿舍区
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);
    /**
     * 新增宿舍区
     * @param record
     * @return
     */
    int insert(Area record);
    /**
     * 新增宿舍区
     * @param record
     * @return
     */
    int insertSelective(Area record);
    /**
     * 通过id查找宿舍区
     * @param id
     * @return
     */
    Area selectByPrimaryKey(Integer id);
    /**
     * 更新宿舍区
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Area record);
    /**
     * 更新宿舍区
     * @param record
     * @return
     */
    int updateByPrimaryKey(Area record);
}