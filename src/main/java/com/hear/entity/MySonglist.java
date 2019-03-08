package com.hear.entity;

public class MySonglist {
    private Integer id;
    private User user;
    private Songlist songlist;

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

    public Songlist getSonglist() {
        return songlist;
    }

    public void setSonglist(Songlist songlist) {
        this.songlist = songlist;
    }

    public MySonglist(Integer id, User user, Songlist songlist) {
        this.id = id;
        this.user = user;
        this.songlist = songlist;
    }

    public MySonglist() {
    }
}
