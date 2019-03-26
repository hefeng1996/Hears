package com.hear.dao;

import com.hear.entity.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TagMapper {
    List<Tag> selectSonglistTagById(int id);//根据ID查询歌单标签信息
    List<Tag> selectAllTag();
}
