package com.dms.enums;

/**
 *Created by pxc on 2017年3月6日 上午11:10:01
 * 
 */

public enum NotifyType {

	tzgg("通知公告"),
	swzl("失物招领");
	
	private String desc;

	public String getDesc() {
		return desc;
	}

	private NotifyType(String desc) {
		this.desc = desc;
	}
	
	
}
