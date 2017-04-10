package com.dms.entity;

public class Room {
	private Integer roomId;

	private Integer areaId;

	private Integer buildingId;

	private String type;

	private String introduct;

	private Integer totalnum;

	private Integer currentnum;

	private String isfiled; // 是否住满   0 已满   1 未满

	private String roomSn;

	private Area area;

	private Building building;
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getIntroduct() {
		return introduct;
	}

	public void setIntroduct(String introduct) {
		this.introduct = introduct == null ? null : introduct.trim();
	}

	public Integer getTotalnum() {
		return totalnum;
	}

	public void setTotalnum(Integer totalnum) {
		this.totalnum = totalnum;
	}

	public Integer getCurrentnum() {
		return currentnum;
	}

	public void setCurrentnum(Integer currentnum) {
		this.currentnum = currentnum;
	}

	public String getIsfiled() {
		return isfiled;
	}

	public void setIsfiled(String isfiled) {
		this.isfiled = isfiled == null ? null : isfiled.trim();
	}

	public String getRoomSn() {
		return roomSn;
	}

	public void setRoomSn(String roomSn) {
		this.roomSn = roomSn == null ? null : roomSn.trim();
	}
}