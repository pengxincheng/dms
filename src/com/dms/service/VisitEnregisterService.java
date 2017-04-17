package com.dms.service;

import java.util.List;

import com.dms.entity.VisitEnregister;

/**
 *Created by pxc on 2017年4月17日 下午5:07:57
 * 
 */

public interface VisitEnregisterService {
	
	/**
	 * 来访登记列表
	 * @param visitEnregister
	 * @return
	 */
	List<VisitEnregister> findAllVisitEnregisters(VisitEnregister visitEnregister);
	/**
	 * 添加来访登记
	 * @param visitEnregister
	 * @return
	 */
	int addVisitEnregister(VisitEnregister visitEnregister);
	
	/**
	 * 更新来访登记
	 * @param visitEnregister
	 * @return
	 */
	int updateVisitEnregister(VisitEnregister visitEnregister);
	/**
	 * 来访登记详细
	 * @param id
	 * @return
	 */
	VisitEnregister getVisitEnregisterById(Integer id);
	
	/**
	 * 删除来访登记
	 * @param id
	 * @return
	 */
	int delVisitEnregisterById(Integer id);
}
