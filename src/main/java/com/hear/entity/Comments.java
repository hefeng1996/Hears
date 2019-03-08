package com.hear.entity;


import java.util.Date;

public class Comments {
    private Integer id;

    private Comments upperComment;//上一级用户

    private String content;

    private User user2;

    private Date time;

    private Song song;

    private Album album;
    private Integer albumid;
    private Integer songlistid;
    private Integer songid;

    public Integer getAlbumid() {
        return albumid;
    }

    public void setAlbumid(Integer albumid) {
        this.albumid = albumid;
    }

    public Integer getSonglistid() {
        return songlistid;
    }

    public void setSonglistid(Integer songlistid) {
        this.songlistid = songlistid;
    }

    public Integer getSongid() {
        return songid;
    }

    public void setSongid(Integer songid) {
        this.songid = songid;
    }

    public Integer getMomentid() {
        return momentid;
    }

    public void setMomentid(Integer momentid) {
        this.momentid = momentid;
    }

    private Integer momentid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Comments getUpperComment() {
        return upperComment;
    }

    public void setUpperComment(Comments upperComment) {
        this.upperComment = upperComment;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }



    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


}