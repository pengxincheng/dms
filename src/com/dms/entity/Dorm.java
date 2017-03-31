package com.dms.entity;

public class Dorm {
    private Integer dormid;  //宿舍id

    private String dormname;  //名字

    private Integer bednum;   //床位

    private Integer currentpeople;  //现住人数

    private Integer isfilled;  //是否住满   0，住满  1未主满 

    public Integer getDormid() {
        return dormid;
    }

    public void setDormid(Integer dormid) {
        this.dormid = dormid;
    }

    public String getDormname() {
        return dormname;
    }

    public void setDormname(String dormname) {
        this.dormname = dormname == null ? null : dormname.trim();
    }

    public Integer getBednum() {
        return bednum;
    }

    public void setBednum(Integer bednum) {
        this.bednum = bednum;
    }

    public Integer getCurrentpeople() {
        return currentpeople;
    }

    public void setCurrentpeople(Integer currentpeople) {
        this.currentpeople = currentpeople;
    }

    public Integer getIsfilled() {
        return isfilled;
    }

    public void setIsfilled(Integer isfilled) {
        this.isfilled = isfilled;
    }
}