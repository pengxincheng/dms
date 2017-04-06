package com.dms.enums;

/**
 *Created by pxc on 2017年4月6日 下午4:20:21
 * 
 */

public enum DormType {
	four("四人间"),
	six("六人间");
	
	private String desc;

	public String getDesc() {
		return desc;
	}

	private DormType(String desc) {
		this.desc = desc;
	}
}
