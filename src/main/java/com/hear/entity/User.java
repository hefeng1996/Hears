package com.hear.entity;

import java.util.Date;

public class User {
    private Integer id;

    private String name;

    private String password;

    private Date registtime;

    private Integer sex;

    private String nicheng;

    private Date birthday;

    private String province;
    private String city;
    private Integer moment;
    private Integer fans;
    private Integer attention;
    private Integer fansNum;
    private Integer createSongListNum;

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    private Integer flag;

    public Integer getFansNum() {
        return fansNum;
    }

    public void setFansNum(Integer fansNum) {
        this.fansNum = fansNum;
    }

    public Integer getCreateSongListNum() {
        return createSongListNum;
    }

    public void setCreateSongListNum(Integer createSongListNum) {
        this.createSongListNum = createSongListNum;
    }

    public Integer getFans() {
        return fans;
    }

    public void setFans(Integer fans) {
        this.fans = fans;
    }

    public Integer getAttention() {
        return attention;
    }

    public void setAttention(Integer attention) {
        this.attention = attention;
    }

    public Integer getMoment() {
        return moment;
    }

    public void setMoment(Integer moment) {
        this.moment = moment;
    }



    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String area) {
        this.city = area;
    }

    private String img;
    private Integer isvip;
    private String tel;
    private Date vipdate;
    private String introduce;

    public Integer getSex() {
        return sex;
    }

    public Integer getIsvip() {
        return isvip;
    }

    public void setIsvip(Integer isvip) {
        this.isvip = isvip;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getVipdate() {
        return vipdate;
    }

    public void setVipdate(Date vipdate) {
        this.vipdate = vipdate;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getRegisttime() {
        return registtime;
    }

    public void setRegisttime(Date registtime) {
        this.registtime = registtime;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getNicheng() {
        return nicheng;
    }

    public void setNicheng(String nicheng) {
        this.nicheng = nicheng == null ? null : nicheng.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }


}