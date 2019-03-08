package com.hear.entity;
//User-comment用户评论关联表
public class UserCommentsLink {
    private Integer id;

    private Comments comments;

    private User user;

    public UserCommentsLink(Integer id, Comments comments, User user) {
        this.id = id;
        this.comments = comments;
        this.user = user;
    }

    public UserCommentsLink(Comments comments, User user) {
        this.comments = comments;
        this.user = user;
    }

    public UserCommentsLink() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Comments getComments() {
        return comments;
    }

    public void setComments(Comments comments) {
        this.comments = comments;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserCommentsLink uc = (UserCommentsLink) o;

        if (id != null ? !id.equals(uc.id) : uc.id != null) return false;
        if (comments != null ? !comments.equals(uc.comments) : uc.comments != null) return false;
        return user != null ? user.equals(uc.user) : uc.user == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "UserCommentsLink{" +
                "id=" + id +
                ", Comments=" + comments +
                ", User=" + user +
                '}';
    }
}