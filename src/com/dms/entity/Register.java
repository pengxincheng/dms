package com.dms.entity;

import java.util.Date;

public class Register {
    private Integer id;

    private Integer stuId;

    private Date registerDate;

    private Date returnTime;

    private String type;

    private Integer buildingId;

    private String reasion;

    private String remark;
    
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

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Integer buildingId) {
        this.buildingId = buildingId;
    }

    public String getReasion() {
        return reasion;
    }

    public void setReasion(String reasion) {
        this.reasion = reasion == null ? null : reasion.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}