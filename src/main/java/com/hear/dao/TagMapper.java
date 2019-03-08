package com.hear.dao;

import com.hear.entity.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TagMapper {
    public List<Tag> selectSonglistTagById(int id);//根据ID查询歌单标签信息
    public List<Tag> selectAllTag();
}
