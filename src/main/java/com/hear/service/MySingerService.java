package com.hear.service;

import com.hear.entity.MySinger;

import java.util.List;

public interface MySingerService {
    public List<MySinger> selectMySingerByUserId(int id);
    //    收藏歌手
    public boolean collectSinger(MySinger mySinger);
    //    取消收藏歌手
    public boolean cancelCollectSinger(MySinger mySinger);
}
