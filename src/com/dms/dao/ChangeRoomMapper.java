package com.dms.dao;

import java.util.List;

import com.dms.entity.ChangeRoom;

public interface ChangeRoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChangeRoom record);

    int insertSelective(ChangeRoom record);

    ChangeRoom selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ChangeRoom record);

    int updateByPrimaryKey(ChangeRoom record);
    
    List<ChangeRoom> selectAllChangeRooms(ChangeRoom changeRoom);
}