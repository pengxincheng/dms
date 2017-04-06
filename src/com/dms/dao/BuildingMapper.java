package com.dms.dao;

import java.util.List;

import com.dms.entity.Building;

public interface BuildingMapper {
	/**
	 * 删除
	 * @param buildingId
	 * @return
	 */
    int deleteByPrimaryKey(Integer buildingId);
    /**
     * 添加
     * @param record
     * @return
     */
    int insert(Building record);
    /**
     * 添加
     * @param record
     * @return
     */
    int insertSelective(Building record);
    /**
     * 通过id查询楼栋
     * @param buildingId
     * @return
     */
    Building selectByPrimaryKey(Integer buildingId);
    /**
     * 更新
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Building record);
    /**
     * 更新
     * @param record
     * @return
     */
    int updateByPrimaryKey(Building record);
    /**
     * 查询列表
     * @param building
     * @return
     */
    List<Building> selectAllBuildings(Building building);
}