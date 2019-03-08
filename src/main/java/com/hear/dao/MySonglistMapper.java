package com.hear.dao;

import com.hear.entity.MySonglist;

import java.util.List;

public interface MySonglistMapper {
    public List<MySonglist> selectMySonglistByUserId(int id);//查看用户收藏的歌单
    public boolean saveSonglist(MySonglist mySonglist);//收藏歌单
    public boolean cancelSaveSonglist(MySonglist mySonglist);//取消收藏
    public boolean removeSaveSonglist(int songListId);//删除收藏

}
