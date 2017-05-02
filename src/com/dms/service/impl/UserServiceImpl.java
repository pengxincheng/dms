package com.dms.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.From;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.Util.PasswordUtil;
import com.dms.dao.UserMapper;
import com.dms.entity.Building;
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
		int alloted = 0;
		List<User> boyStus = new ArrayList<User>();
		List<User> girlStus = new ArrayList<User>();
		for (int i = 0; i < ids.length; i++) {
			User user = new User();
			user = userMapper.selectByPrimaryKey(ids[i]);
			if (user.getGender().equals("男")) {
				boyStus.add(user);
			} else {
				girlStus.add(user);
			}
		}
		// 开始分配男生
		if (boyStus.size() > 0) {
			Room room = new Room();
			room.getBuilding().setIntroduct("男");
			room.setAreaId(areaId);
			room.setIsfiled("1");
			List<Room> rooms = roomServices.findAllRooms(room);
			boolean flag = false;
			for (Room r : rooms) {
				if(flag){
					break;
				}
				int available = r.getTotalnum() - r.getCurrentnum();
				List<User> allotedStus = new ArrayList<User>();
				for (int j = 0; j < available; j++) {
					if (j >= boyStus.size()) {
						flag = true;
						break;
					}
					User stu = boyStus.get(j);
					stu.setRoomId(String.valueOf(r.getRoomId()));
					stu.setBuildingId(String.valueOf(r.getBuildingId()));
					stu.setAreaId(String.valueOf(areaId));
					stu.setIsAlloted("1");
					userMapper.updateByPrimaryKeySelective(stu);
					r.setCurrentnum(r.getCurrentnum() + 1);
					alloted += 1;
					allotedStus.add(stu);
				}
				boyStus.removeAll(allotedStus);
				if (r.getCurrentnum() == r.getTotalnum()) {
					r.setIsfiled("0");// 住满
				} else {
					r.setIsfiled("1");
				}
				roomServices.updateRoom(r);
				
			}
		}
		// 开始分配女生
		if (girlStus.size() > 0) {
			Room room1 = new Room();
			room1.getBuilding().setIntroduct("女");
			room1.setAreaId(areaId);
			room1.setIsfiled("1");
			List<Room> rooms1 = roomServices.findAllRooms(room1);
			boolean flag = false;
			for (Room r : rooms1) {
				if(flag){
					break;
				}
				List<User> allotedStus = new ArrayList<User>();
				int available = r.getTotalnum() - r.getCurrentnum();
				for (int j = 0; j < available; j++) {
					if (j >= girlStus.size()) {
						flag = true;
						break;
					}
					User stu = girlStus.get(j);
					stu.setRoomId(String.valueOf(r.getRoomId()));
					stu.setBuildingId(String.valueOf(r.getBuildingId()));
					stu.setAreaId(String.valueOf(areaId));
					stu.setIsAlloted("1");
					userMapper.updateByPrimaryKeySelective(stu);
					r.setCurrentnum(r.getCurrentnum() + 1);
					alloted += 1;
					allotedStus.add(stu);
				}
				girlStus.removeAll(allotedStus);
				if (r.getCurrentnum() == r.getTotalnum()) {
					r.setIsfiled("0");// 住满
				} else {
					r.setIsfiled("1");
				}
				roomServices.updateRoom(r);
			}
		}

		jsonObject.put("total", ids.length);
		jsonObject.put("alloted", alloted);
		return jsonObject;
	}

}
