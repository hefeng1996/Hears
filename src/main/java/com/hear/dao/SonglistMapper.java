package com.hear.dao;

import com.hear.entity.Songlist;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SonglistMapper {
    Songlist selectSonglistById(int id);//根据ID查询歌单信息
    List<Songlist> showSonglist();
    List<Songlist> chinaSonglist();//查看华语歌单
    List<Songlist> rageSonglist();//查看流行歌单
    List<Songlist> ancientSonglist();//查看古风歌单
    List<Songlist> nationSonglist();//民谣歌单
    List<Songlist> morningSonglist();//清晨歌单
    List<Songlist> usaSonglist();//欧美歌单
    List<Songlist> rhSonglist();//日韩歌单
    List<Songlist> rockSonglist();//摇滚歌单
    List<Songlist> softSonglist();//轻音乐歌单
    List<Songlist> nightSonglist();//夜晚歌单
    List<Songlist> studySonglist();//学习歌单
    List<Songlist> workSonglist();//工作歌单
    List<Songlist> restSonglist();//午休歌单
    List<Songlist> teaSonglist();//下午茶歌单
    List<Songlist> exceSonglist();//运动歌单
    List<Songlist> walkSonglist();//散步歌单
    List<Songlist> blurSonglist();//酒吧歌单
    List<Songlist> oldSonglist();//怀旧歌单
    List<Songlist> freshSonglist();//清新歌单
    List<Songlist> slienceSonglist();//安静歌单
    List<Songlist> sadSonglist();//伤感歌单
    List<Songlist> cureSonglist();//治愈歌单
    List<Songlist> missSonglist();//思念歌单
    List<Songlist> romnSonglist();//浪漫歌单
    List<Songlist> eiSonglist();//80后歌单
    List<Songlist> niSonglist();//90后歌单
    List<Songlist> zeSonglist();//00后歌单
    List<Songlist> typSonglist();//经典歌单
    List<Songlist> siSonglist();//翻唱歌单
    List<Songlist> geSonglist();//吉他歌单
//    public List<Songlist> getMySonglistById(int id);//得到我创建的歌单
    List<Songlist> selectSonglistByUserId(int id);
    List<Songlist> selectSonglistlikeByUserId(int id);

//    public List<Songlist> selectSonglistAndSongsByUserId(int id);
//    public List<Songlist> getSonglistsInfoByUserId(int userid);
    boolean insertSonglist(Songlist songlist);//G
    Songlist selectSonglistByCondition(Songlist songlist);//G
    boolean removesonglistBySonglistId(int songlistId);//G

    boolean newSonglist(Songlist songlist);

}
