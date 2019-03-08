package com.hear.dao;

import com.hear.entity.Playrecord;

import java.util.List;

public interface PlayrecordMapper {
    public List<Playrecord> selectPlayreCord5(int id);
    public List<Playrecord> selectPlayreCord20(int id);
    public List<Playrecord> selectPlayreCordAll(int id);

    public int selectPlayreCordCount(int id);
}
