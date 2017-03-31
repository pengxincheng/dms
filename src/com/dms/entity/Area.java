package com.dms.entity;

public class Area {
    private Integer id;   //宿舍区id

    private String areaname;  //宿舍区名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname == null ? null : areaname.trim();
    }
}