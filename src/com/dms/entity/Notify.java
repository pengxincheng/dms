package com.dms.entity;

import java.util.Date;

import com.dms.enums.NotifyType;

public class Notify {
	private Integer notifyId;

	private String notifyTitle;

	private String notifyContent;

	private Integer publisherId;

	private Date publishTime;

	private String status;

	private String type;

	private User user;
	

	public Integer getNotifyId() {
		return notifyId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setNotifyId(Integer notifyId) {
		this.notifyId = notifyId;
	}

	public String getNotifyTitle() {
		return notifyTitle;
	}

	public void setNotifyTitle(String notifyTitle) {
		this.notifyTitle = notifyTitle == null ? null : notifyTitle.trim();
	}

	public String getNotifyContent() {
		return notifyContent;
	}

	public void setNotifyContent(String notifyContent) {
		this.notifyContent = notifyContent == null ? null : notifyContent
				.trim();
	}

	public Integer getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Integer publisherId) {
		this.publisherId = publisherId;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}