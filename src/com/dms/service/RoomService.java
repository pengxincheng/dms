package com.dms.service;

import java.util.List;

import com.dms.entity.Room;

/**
 *Created by pxc on 2017年4月10日 下午3:26:49
 * 
 */

public interface RoomService {

	/**
	 * 宿舍列表
	 * @param room
	 * @return
	 */
	List<Room> findAllRooms(Room room);
	/**
	 * 添加宿舍
	 * @param room
	 * @return
	 */
	int addRoom(Room room);
	
	/**
	 * 更新宿舍
	 * @param room
	 * @return
	 */
	int updateRoom(Room room);
	/**
	 * 宿舍详细
	 * @param roomId
	 * @return
	 */
	Room getRoomById(Integer roomId);
	
	/**
	 * 删除宿舍
	 * @param roomId
	 * @return
	 */
	int delRoomById(Integer roomId);
}
