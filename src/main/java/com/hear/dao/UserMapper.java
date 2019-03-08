package com.hear.dao;

import com.hear.entity.Moment;
import com.hear.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserMapper {
    public User selectUserByName(String username);/*通过用户名查询用户*/

    public boolean insertUser(User user);/*新用户注册*/

    public boolean updateMessage(User user);/*修改用户信息*/

    public boolean updatePassword(User user);//修改密码

    public User selectUserById(int id);/*通过用户id查询用户*/


}
