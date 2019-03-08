package com.hear.entity;

public class Praise {
    private Integer id;

    private Integer typeId;

    private Integer type;

    private Integer usr_id;


    public Integer getUsr_id() {
        return usr_id;
    }

    public void setUsr_id(Integer usr_id) {
        this.usr_id = usr_id;
    }

    public Integer getMoment_id() {
        return moment_id;
    }

    public void setMoment_id(Integer moment_id) {
        this.moment_id = moment_id;
    }

    private Integer moment_id;



    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }





    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}