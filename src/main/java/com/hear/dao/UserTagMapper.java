package com.hear.dao;

import com.hear.entity.UserTag;

import java.util.List;

public interface UserTagMapper {
    public boolean insertUserTag(int tagId, int userId);

    public boolean removeUserTag(int userId);

    public List<UserTag> selectTagByUserId(int userId);
}
