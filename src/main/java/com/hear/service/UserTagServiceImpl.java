package com.hear.service;

import com.hear.dao.UserTagMapper;
import com.hear.entity.UserTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserTagServiceImpl implements UserTagService {
    @Autowired
    private UserTagMapper userTagMapper;


    @Override
    public List<UserTag> selectTagByUserId(int userId) {
        return userTagMapper.selectTagByUserId(userId);
    }
}
