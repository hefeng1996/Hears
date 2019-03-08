package com.hear.service;

import com.hear.entity.Tag;

import java.util.List;

public interface TagService {
    public List<Tag> selectSonglistTagById(int id);//根据ID查询歌单标签信息
    public List<Tag> selectAllTag();
}
