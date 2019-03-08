package com.hear.service;

import com.hear.dao.UserMapper;
import com.hear.dao.UserTagMapper;
import com.hear.entity.Moment;
import com.hear.entity.Song;
import com.hear.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserTagMapper userTagMapper;
    @Override
    public User userLogin(String name) {
        User user=null;
        user=userMapper.selectUserByName(name);
        return user;
    }/*用户登录*/

    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public boolean updateMessage(User user,String []checkbox) {
        boolean f= userMapper.updateMessage(user);
        if(checkbox!=null){
            System.out.println(user.getId());
            boolean s=userTagMapper.removeUserTag(user.getId());
            for (String c:checkbox){
                boolean t=userTagMapper.insertUserTag(user.getId(),Integer.parseInt(c));
                if(t==false){
                    return false;
                }else{
                    return true;
                }
            }
        }else {
            boolean e=userTagMapper.removeUserTag(user.getId());
            return true;
        }
        return f;
    }/*修改个人信息*/

    @Override
    public boolean userRegister(User user) {
        return userMapper.insertUser(user);
    }/*注册新用户*/



    @Override
    public boolean updatePassword(User user){
        return userMapper.updatePassword(user);
    }//修改密码

    @Override
    public User selectUserById(int id) {
        return userMapper.selectUserById(id);
    }



}
