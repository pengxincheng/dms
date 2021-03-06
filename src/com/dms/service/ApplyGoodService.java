package com.dms.service;

import java.util.List;

import com.dms.entity.ApplyGood;

/**
 *Created by pxc on 2017年4月14日 下午4:09:45
 * 
 */

public interface ApplyGoodService {

	/**
	 * 物品申请列表
	 * @param applyGood
	 * @return
	 */
	List<ApplyGood> findAllApplyGoods(ApplyGood applyGood);
	/**
	 * 添加物品申请
	 * @param applyGood
	 * @return
	 */
	int addApplyGood(ApplyGood applyGood);
	
	/**
	 * 更新物品申请
	 * @param applyGood
	 * @return
	 */
	int updateApplyGood(ApplyGood applyGood);
	/**
	 * 物品申请详细
	 * @param id
	 * @return
	 */
	ApplyGood getApplyGoodById(Integer id);
	
	/**
	 * 删除物品申请
	 * @param id
	 * @return
	 */
	int delApplyGoodById(Integer id);
	
	/**
	 * 学生提交申请
	 * @param id
	 * @param auditMan
	 */
	void submitApplyGood(Integer id,String auditMan);
	/**
	 * 管理员审核
	 * @param is
	 * @param status
	 * @param auditOponion
	 */
	void auditApplyGood(Integer id,String status,String auditOponion);
	
	List<ApplyGood> getAllApplyGoods(ApplyGood applyGood);
}
