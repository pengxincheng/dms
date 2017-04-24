package com.dms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.ChangeRoomMapper;
import com.dms.entity.ChangeRoom;
import com.dms.service.ChangeRoomService;

/**
 *Created by pxc on 2017年4月24日 下午5:51:03
 * 
 */
@Service
public class ChangeRoomServicesImpl implements ChangeRoomService {

	@Autowired
	private ChangeRoomMapper changeRoomMapper;
	
	@Override
	public List<ChangeRoom> findAllChangeRooms(ChangeRoom changeRoom) {
		return changeRoomMapper.selectAllChangeRooms(changeRoom);
	}

	@Override
	public int addChangeRoom(ChangeRoom changeRoom) {
		return changeRoomMapper.insertSelective(changeRoom);
	}

	@Override
	public int updateChangeRoom(ChangeRoom changeRoom) {
		return changeRoomMapper.updateByPrimaryKeySelective(changeRoom);
	}

	@Override
	public ChangeRoom getChangeRoomById(Integer id) {
		return changeRoomMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delChangeRoomById(Integer id) {
		return changeRoomMapper.deleteByPrimaryKey(id);
	}

}
