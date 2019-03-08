package com.hear.entity;

public class Relation {
    private Integer id;

    private User user;

    private User userbyId;//关注人的ID

    private Integer status;

    private Integer user_id;
    private Integer userBy_id;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getUserBy_id() {
        return userBy_id;
    }

    public void setUserBy_id(Integer userBy_id) {
        this.userBy_id = userBy_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUserbyId() {
        return userbyId;
    }

    public void setUserbyId(User userbyId) {
        this.userbyId = userbyId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}