package com.dms.service.impl;

import java.util.List;

import javax.persistence.criteria.From;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.Util.PasswordUtil;
import com.dms.dao.UserMapper;
import com.dms.entity.Room;
import com.dms.entity.User;
import com.dms.service.RoomService;
import com.dms.service.UserService;

/**
 * @author pxc
 * @date ：2017年2月22日 下午11:10:34
 */

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoomService roomServices;

	@Override
	public User getUserById(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);

	}

	@Override
	public User checkLogin(String username, String password) {

		password = PasswordUtil.EncoderByMd5(password);
		return (User) userMapper.selectForLogin(username, password);
	}

	@Override
	public List<User> getAllUsers(User user) {

		return userMapper.selectAllUsers(user);
	}

	@Override
	public List<User> getAllStusNotAlloted(User user) {

		return userMapper.selectAllStusNotAlloted(user);
	}

	@Override
	public int addStu(User user) {

		user.setIsAlloted("0");
		user.setPassword("ICy5YqxZB1uWSwcVLSNLcA=="); // 初始密码123
		user.setRoleId(3);
		user.setUsername(user.getStuNo());
		return userMapper.insertSelective(user);
	}

	@Override
	public int delStu(Integer userId) {

		return userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public int updateStu(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User getStuByStuNo(String stuNo) {

		return userMapper.selectByStuNo(stuNo);
	}

	@Override
	public int batchAddStu(List<User> stus) {

		return userMapper.batchInsert(stus);
	}

	@Override
	public int batchDelStu(Integer[] ids) {

		return userMapper.batchDelStu(ids);
	}

	@Override
	public JSONObject autoAllot(Integer[] ids, Integer areaId) {
		JSONObject jsonObject = new JSONObject();
		Room room = new Room();
		room.setAreaId(areaId);
		List<Room> rooms = roomServices.findAllRooms(room);
		int i = 0;
		for (Room r : rooms) {
			int available = r.getTotalnum() - r.getCurrentnum();
			if (available <= 0) {
				continue;
			}
			int j = i;
			if (ids.length-i > available) {
				
				for (; j < (i + available); j++) {
					User stu = userMapper.selectByPrimaryKey(ids[j]);
					stu.setRoomId(String.valueOf(r.getRoomId()));
					stu.setBuildingId(String.valueOf(r.getBuildingId()));
					stu.setAreaId(String.valueOf(areaId));
					stu.setIsAlloted("1");
					userMapper.updateByPrimaryKeySelective(stu);
				}
				r.setCurrentnum(r.getTotalnum());
				r.setIsfiled("0");// 住满
				roomServices.updateRoom(r);
				i=j;
			} else {
				for (; j < ids.length; j++) {
					User stu = userMapper.selectByPrimaryKey(ids[j]);
					stu.setRoomId(String.valueOf(r.getRoomId()));
					stu.setBuildingId(String.valueOf(r.getBuildingId()));
					stu.setAreaId(String.valueOf(areaId));
					stu.setIsAlloted("1");
					userMapper.updateByPrimaryKeySelective(stu);
				}
				r.setCurrentnum(ids.length-i);
				r.setIsfiled("1");
				roomServices.updateRoom(r);
				i=j;
			}
			if(i >= ids.length){
				break;
			}
		}
		jsonObject.put("total", ids.length);
		jsonObject.put("alloted", i);
		return jsonObject;
	}

}
