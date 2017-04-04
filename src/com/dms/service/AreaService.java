package com.dms.service;

import java.util.List;

import com.dms.entity.Area;

/**
 *Created by pxc on 2017年3月31日 下午5:12:40
 * 
 */

public interface AreaService {
	
	/**
	 * 宿舍区列表
	 * @param area
	 * @return
	 */
	List<Area> findAllAreas(Area area);
	/**
	 * 添加宿舍区
	 * @param area
	 * @return
	 */
	int addArea(Area area);
	
	/**
	 * 更新宿舍区
	 * @param area
	 * @return
	 */
	int updateArea(Area area);
	/**
	 * 宿舍区详细
	 * @param id
	 * @return
	 */
	Area getAreaById(Integer id);
	
	/**
	 * 删除宿舍区
	 * @param id
	 * @return
	 */
	int delAreaById(Integer id);

}
