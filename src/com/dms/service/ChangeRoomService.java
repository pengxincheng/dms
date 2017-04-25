package com.dms.service;

import java.util.List;

import com.dms.entity.ChangeRoom;

/**
 *Created by pxc on 2017年4月24日 下午5:48:42
 * 
 */

public interface ChangeRoomService {
	/**
	 * 调换宿舍申请列表
	 * @param changeRoom
	 * @return
	 */
	List<ChangeRoom> findAllChangeRooms(ChangeRoom changeRoom);
	/**
	 * 添加调换宿舍申请
	 * @param changeRoom
	 * @return
	 */
	int addChangeRoom(ChangeRoom changeRoom);
	
	/**
	 * 更新调换宿舍申请
	 * @param changeRoom
	 * @return
	 */
	int updateChangeRoom(ChangeRoom changeRoom);
	/**
	 * 调换宿舍申请详细
	 * @param id
	 * @return
	 */
	ChangeRoom getChangeRoomById(Integer id);
	
	/**
	 * 删除调换宿舍申请
	 * @param id
	 * @return
	 */
	int delChangeRoomById(Integer id);
	/**
	 * 审核
	 * @param id
	 * @param status
	 * @param auditOponion
	 */
	void auditApply(Integer id, String status, String auditOponion);
	/**
	 * 提交
	 * @param id
	 */
	void submitApply(Integer id,String auditMan);
}
