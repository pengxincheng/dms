package com.dms.service;

import java.util.List;

import com.dms.entity.Building;

/**
 *Created by pxc on 2017年4月31日 下午14:43:40
 * 
 */

public interface BuildingService {
	
	/**
	 * 楼栋列表
	 * @param building
	 * @return
	 */
	List<Building> findAllBuildings(Building building);
	/**
	 * 添加楼栋
	 * @param building
	 * @return
	 */
	int addBuilding(Building building);
	
	/**
	 * 更新楼栋
	 * @param building
	 * @return
	 */
	int updateBuilding(Building building);
	/**
	 * 楼栋详细
	 * @param buildingId
	 * @return
	 */
	Building getBuildingById(Integer buildingId);
	
	/**
	 * 删除楼栋
	 * @param buildingId
	 * @return
	 */
	int delBuildingById(Integer buildingId);

}
