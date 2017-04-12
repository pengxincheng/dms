package com.dms.entity;

import java.util.Date;

public class Building {
    private Integer buildingId;   //楼栋id

    private Integer areaId;  //宿舍区id

    private Date startTime;//开始使用时间

    private Date endTime;//房屋到期时间

    private String managerName;//宿舍管理员id

    private Integer totalStuNum;//可住总人数

    private Integer currentStuNum;//现有人数

    private String isFull;//是否住满

    private String buildingName;//楼栋名称

    private String introduct;  //说明
    
    private Area area;
    
    public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	

	public Integer getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Integer buildingId) {
        this.buildingId = buildingId;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public Integer getTotalStuNum() {
        return totalStuNum;
    }

    public void setTotalStuNum(Integer totalStuNum) {
        this.totalStuNum = totalStuNum;
    }

    public Integer getCurrentStuNum() {
        return currentStuNum;
    }

    public void setCurrentStuNum(Integer currentStuNum) {
        this.currentStuNum = currentStuNum;
    }

    public String getIsFull() {
        return isFull;
    }

    public void setIsFull(String isFull) {
        this.isFull = isFull == null ? null : isFull.trim();
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName == null ? null : buildingName.trim();
    }

    public String getIntroduct() {
        return introduct;
    }

    public void setIntroduct(String introduct) {
        this.introduct = introduct == null ? null : introduct.trim();
    }
}