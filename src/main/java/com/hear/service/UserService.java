package com.hear.service;

import com.hear.entity.Moment;
import com.hear.entity.Song;
import com.hear.entity.User;

import java.util.List;

public interface UserService {
    public User userLogin(String name);//用户登录

    public boolean userRegister(User user);//用户注册

    public boolean updateMessage(User user, String[] checkbox);//编辑个人信息

    public boolean updatePassword(User user);//修改密码

    public User selectUserById(int id);



}
