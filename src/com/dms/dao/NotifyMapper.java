package com.dms.dao;

import java.util.List;

import com.dms.entity.Notify;

public interface NotifyMapper {
	/**
	 * 根据主键删除查询通知公告
	 * @param notifyId
	 * @return
	 */
    int deleteByPrimaryKey(Integer notifyId);

    /**
     * 插入一条记录 
     * @param record
     * @return
     */
    int insert(Notify record);

    /**
     * 根据主键查询通知公告
     * @param notifyId
     * @return
     */
    Notify selectByPrimaryKey(Integer notifyId);

    /**
     * 修改通知公告   选择性的修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Notify record);

    /**
     * 修改通知公告   全属性修改
     * @param record
     * @return
     */
    int updateByPrimaryKey(Notify record);
    
    /**
     * 查询所有的通知公告
     * @return
     */
    List<Notify> selectAllNotifies();
    
    /**
     * 查询当前用户所有的通知公告
     * @return
     */
    List<Notify> selectAllNotifiesForUser(Notify notify);
}