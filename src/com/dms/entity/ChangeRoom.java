package com.dms.entity;

import java.util.Date;

public class ChangeRoom {
    private Integer id;

    private Integer stuId;

    private String reasion;

    private String reamrk;

    private Date applyTime;

    private Date auditTime;

    private String status;

    private String auditOpinion;

    private Integer targetRoom;
    
    private User stu;
    
    public User getStu() {
		return stu;
	}

	public void setStu(User stu) {
		this.stu = stu;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getReasion() {
        return reasion;
    }

    public void setReasion(String reasion) {
        this.reasion = reasion == null ? null : reasion.trim();
    }

    public String getReamrk() {
        return reamrk;
    }

    public void setReamrk(String reamrk) {
        this.reamrk = reamrk == null ? null : reamrk.trim();
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion == null ? null : auditOpinion.trim();
    }

    public Integer getTargetRoom() {
        return targetRoom;
    }

    public void setTargetRoom(Integer targetRoom) {
        this.targetRoom = targetRoom;
    }
}