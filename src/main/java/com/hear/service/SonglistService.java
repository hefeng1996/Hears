package com.hear.service;

import com.hear.entity.Songlist;

import java.util.List;

public interface SonglistService {


    public Songlist selectSonglistById(int id);//根据ID查询歌单信息
    public List<Songlist> showSonglist();//查看歌单信息
    public boolean insertSonglist(Songlist songlist, String[] checkbox);//G
    public Songlist selectSonglistByCondition(Songlist songlist);//G
    public boolean removesonglistBySonglistId(int songlistId);//G
    public List<Songlist> chinaSonglist();//查看华语歌单
    public List<Songlist> rageSonglist();//查看流行歌单
    public List<Songlist> ancientSonglist();//查看古风歌单
    public List<Songlist> nationSonglist();//民谣歌单
    public List<Songlist> morningSonglist();//清晨歌单
    public List<Songlist> usaSonglist();//欧美歌单
    public List<Songlist> rhSonglist();//日韩歌单
    public List<Songlist> rockSonglist();//摇滚歌单
    public List<Songlist> softSonglist();//轻音乐歌单
    public List<Songlist> nightSonglist();//夜晚歌单
    public List<Songlist> studySonglist();//学习歌单
    public List<Songlist> workSonglist();//工作歌单
    public List<Songlist> restSonglist();//午休歌单
    public List<Songlist> teaSonglist();//下午茶歌单
    public List<Songlist> exceSonglist();//运动歌单
    public List<Songlist> walkSonglist();//散步歌单
    public List<Songlist> blurSonglist();//酒吧歌单
    public List<Songlist> oldSonglist();//怀旧歌单
    public List<Songlist> freshSonglist();//清新歌单
    public List<Songlist> slienceSonglist();//安静歌单
    public List<Songlist> sadSonglist();//伤感歌单
    public List<Songlist> cureSonglist();//治愈歌单
    public List<Songlist> missSonglist();//思念歌单
    public List<Songlist> romnSonglist();//浪漫歌单
    public List<Songlist> eiSonglist();//80后歌单
    public List<Songlist> niSonglist();//90后歌单
    public List<Songlist> zeSonglist();//00后歌单
    public List<Songlist> typSonglist();//经典歌单
    public List<Songlist> siSonglist();//翻唱歌单
    public List<Songlist> geSonglist();//吉他歌单
    public List<Songlist> selectSonglistByUserId(int id);//G
    public List<Songlist> selectSonglistlikeByUserId(int id);//G

    public List<Songlist> getSonglistsInfoByUserId(int userid);
    public boolean newSonglist(Songlist songlist);
}
