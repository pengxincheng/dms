package com.dms.service;

import java.util.List;

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
	List<CheckHygiene> findAllCheckHygienes(CheckHygiene checkHygiene);

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
}
