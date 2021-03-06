package com.dms.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dms.entity.CheckHygiene;

/**
 * Created by pxc on 2017年4月25日 下午5:42:53
 * 
 */

public interface CheckHygieneService {
	/**
	 * 卫生检查列表
	 * 
	 * @param checkHygiene
	 * @return
	 */
	List<CheckHygiene> findAllCheckHygienes(CheckHygiene checkHygiene,Date startDate,Date endDate);

	/**
	 * 添加卫生检查
	 * 
	 * @param checkHygiene
	 * @return
	 */
	int addCheckHygiene(CheckHygiene checkHygiene);

	/**
	 * 更新卫生检查
	 * 
	 * @param checkHygiene
	 * @return
	 */
	int updateCheckHygiene(CheckHygiene checkHygiene);

	/**
	 * 卫生检查详细
	 * 
	 * @param id
	 * @return
	 */
	CheckHygiene getCheckHygieneById(Integer id);

	/**
	 * 删除卫生检查
	 * 
	 * @param id
	 * @return
	 */
	int delCheckHygieneById(Integer id);
	/**
	 * 全校卫生统计
	 * @return
	 */
	List<Map<String,Object>> censusAll(CheckHygiene checkHygiene);
	
	List<Map<String,Object>> censusBuilding();
}
