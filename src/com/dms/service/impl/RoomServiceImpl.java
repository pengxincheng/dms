package com.dms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.RoomMapper;
import com.dms.entity.Room;
import com.dms.service.RoomService;

/**
 *Created by pxc on 2017年4月10日 下午3:30:09
 * 
 */
@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper roomMapper;
	
	@Override
	public List<Room> findAllRooms(Room room) {
		
		return roomMapper.selectAllRooms(room);
	}

	@Override
	public int addRoom(Room room) {
		room.setTotalnum(Integer.parseInt(room.getType()));
		room.setCurrentnum(0);
		room.setIsfiled("1");
		return roomMapper.insertSelective(room);
	}

	@Override
	public int updateRoom(Room room) {
		
		return roomMapper.updateByPrimaryKeySelective(room);
	}

	@Override
	public Room getRoomById(Integer roomId) {
		
		return roomMapper.selectByPrimaryKey(roomId);
	}

	@Override
	public int delRoomById(Integer roomId) {
		
		return roomMapper.deleteByPrimaryKey(roomId);
	}

}
