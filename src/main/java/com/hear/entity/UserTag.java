package com.hear.entity;
//User-Tag
public class UserTag {
    private Integer id;

    private User user;

    private Tag tag;
    private Integer userID;

    private Integer tag_ID;

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getTag_ID() {
        return tag_ID;
    }

    public void setTag_ID(Integer tag_ID) {
        this.tag_ID = tag_ID;
    }

    public UserTag() {
    }

    public UserTag(User user, Tag tag) {
        this.user = user;
        this.tag = tag;
    }

    public UserTag(Integer id, User user, Tag tag) {
        this.id = id;
        this.user = user;
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "UserTag{" +
                "id=" + id +
                ", User=" + user +
                ", Tag=" + tag +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserTag ut = (UserTag) o;

        if (id != null ? !id.equals(ut.id) : ut.id != null) return false;
        if (user != null ? !user.equals(ut.user) : ut.user != null) return false;
        return tag != null ? tag.equals(ut.tag) : ut.tag == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (tag != null ? tag.hashCode() : 0);
        return result;
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

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }
}