package com.hear.dao;

import com.hear.entity.MySinger;
import com.hear.entity.Singer;
import com.hear.entity.User;

import java.util.List;

public interface MySingerMapper {
    public List<MySinger> selectMySingerByUserId(int id);
//    收藏歌手
    public boolean collectSinger(MySinger mySinger);
//    取消收藏歌手
    public boolean cancelCollectSinger(MySinger mySinger);
}
