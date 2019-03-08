package com.hear.entity;

import java.util.List;

public class Singer {
    private Integer id;

    private String name;

    private Integer sex;

    private Integer zone;

    private String img;

    private String introduce;

    private String bigimg;

    private List<Song> song;

    private List<Album> album;

    private int albumcount;

    public int getAlbumcount() {
        return albumcount;
    }

    public void setAlbumcount(int albumcount) {
        this.albumcount = albumcount;
    }
    public Singer() {
    }

    public String getBigimg() {
        return bigimg;
    }

    public void setBigimg(String bigimg) {
        this.bigimg = bigimg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getZone() {
        return zone;
    }

    public void setZone(Integer zone) {
        this.zone = zone;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public List<Song> getSong() {
        return song;
    }

    public void setSong(List<Song> song) {
        this.song = song;
    }

    public List<Album> getAlbum() {
        return album;
    }

    public void setAlbum(List<Album> album) {
        this.album = album;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", zone=" + zone +
                ", img='" + img + '\'' +
                ", introduce='" + introduce + '\'' +
                ", bigimg='" + bigimg + '\'' +
                ", song=" + song +
                ", album=" + album +
                '}';
    }
}