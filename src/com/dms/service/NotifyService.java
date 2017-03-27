package com.dms.service;

import java.util.List;

import com.dms.entity.Notify;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

/**
 *Created by pxc on 2017年3月6日 上午9:34:52
 * 
 */

public interface NotifyService {
	/**
     * 查询所有的通知公告
     * @return
     */
	List<Notify> findAllNotifies();
	/**
     * 查询当前用户所有的通知公告
     * @return
     */
	Page<Notify> findAllNotifiesForUser(Notify notify,int startPage,int pageSize);
	
	/**
	 * 添加通知公告
	 * @param notify
	 * @return
	 */
	int addNotify(Notify notify);
	
	/**
	 * 删除通知公告
	 * @param notifyId
	 * @return
	 */
	int delNotifyById(Integer notifyId);
	
	/**
	 * 通知公告详细
	 * @param notifyId
	 * @return
	 */
	Notify getNotifyDetail(Integer notifyId);
	
	/**
	 * 修改通知公告
	 * @param notify
	 * @return
	 */
	int editNotify(Notify notify);
	
	/**
	 * 前6条通知公告
	 * @return
	 */
	List<Notify> getTop6Tzgg();
	
	/**
	 * 前10条失物招领
	 * @return
	 */
	List<Notify> getTop10Swzl();

}
