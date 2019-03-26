package com.hear.dao;

import com.hear.entity.UserTag;

import java.util.List;

public interface UserTagMapper {
    boolean insertUserTag(int tagId, int userId);

    boolean removeUserTag(int userId);

    List<UserTag> selectTagByUserId(int userId);
}
