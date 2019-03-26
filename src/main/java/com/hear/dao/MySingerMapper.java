package com.hear.dao;

import com.hear.entity.MySinger;
import com.hear.entity.Singer;
import com.hear.entity.User;

import java.util.List;

public interface MySingerMapper {
    List<MySinger> selectMySingerByUserId(int id);
//    收藏歌手
    boolean collectSinger(MySinger mySinger);
//    取消收藏歌手
    boolean cancelCollectSinger(MySinger mySinger);
}
