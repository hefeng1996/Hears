package com.hear.service;

import com.hear.entity.UserTag;

import java.util.List;

public interface UserTagService {
    public List<UserTag> selectTagByUserId(int userId);
}
