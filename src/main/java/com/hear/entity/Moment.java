package com.hear.entity;

import java.util.Date;
import java.util.List;

public class  Moment {
    private Integer id;

    private User user;

    private Song song;

    private Video video;

    private String text;

    private Date time;
    private User user1;
    private Integer type;
    private String img;

    public List<Praise> getPraiseList() {
        return praiseList;
    }

    public Integer getPraiseType() {
        return praiseType;
    }

    public void setPraiseType(Integer praiseType) {
        this.praiseType = praiseType;
    }

    private Integer praiseType;

    public void setPraiseList(List<Praise> praiseList) {
        this.praiseList = praiseList;
    }

    private List<Praise> praiseList;

    public List<Comments> getComments() {
        return comments;
    }

    public void setComments(List<Comments> comments) {
        this.comments = comments;
    }

    private List<Comments> comments;
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}