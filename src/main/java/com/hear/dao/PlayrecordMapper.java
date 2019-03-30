package com.hear.dao;

import com.hear.entity.Playrecord;

import java.util.List;

public interface PlayrecordMapper {
    List<Playrecord> selectPlayreCord5(int id);
    List<Playrecord> selectPlayreCord20(int id);
    List<Playrecord> selectPlayreCordAll(int id);

    int selectPlayreCordCount(int id);

    boolean insertPlayreCord(Integer userId,Integer songId,Long time);
}
