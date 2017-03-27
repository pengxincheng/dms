package com.dms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dms.dao.NotifyMapper;
import com.dms.entity.Notify;
import com.dms.service.NotifyService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * Created by pxc on 2017年3月6日 上午9:36:49
 * 
 */
@Service
public class NotifyServiceImpl implements NotifyService {

	@Autowired
	private NotifyMapper notifyMapper;

	@Override
	public List<Notify> findAllNotifies() {

		return notifyMapper.selectAllNotifies();
	}

	@Override
	public Page<Notify> findAllNotifiesForUser(Notify notify,int startPage,int pageSize) {

		PageHelper.startPage(startPage, pageSize);
		Page<Notify> page = (Page<Notify>) notifyMapper.selectAllNotifiesForUser(notify);
		return page;
	}

	@Override
	public int addNotify(Notify notify) {

		notify.setPublishTime(new Date());
		return notifyMapper.insert(notify);
	}

	@Override
	public int delNotifyById(Integer notifyId) {
		
		return notifyMapper.deleteByPrimaryKey(notifyId);
	}

	@Override
	public Notify getNotifyDetail(Integer notifyId) {
		
		return notifyMapper.selectByPrimaryKey(notifyId);
	}

	@Override
	public int editNotify(Notify notify) {
		
		return notifyMapper.updateByPrimaryKeySelective(notify);
	}

	@Override
	public List<Notify> getTop6Tzgg() {
		
		return notifyMapper.selectTop6Tzgg();
	}

	@Override
	public List<Notify> getTop10Swzl() {
		// TODO Auto-generated method stub
		return notifyMapper.selectTop10Swzl();
	}
	
	

}
