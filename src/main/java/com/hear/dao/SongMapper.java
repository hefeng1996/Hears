package com.hear.dao;

import com.hear.entity.Song;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface SongMapper {
//    public List<Song> selectSongBySingerId(int id);
    List<Song> newSong();//新歌榜
    List<Song> hotSong();//热歌榜
    List<Song> mySong();//原创榜
    Song selectSongById(int id);//Z
    Song selectSongByIds(int id);//H 查询歌单详情
    List<Song> selectSongBySonglistId(int id);//查询歌单里所有歌曲
    List<Song> selectSongByAlbumId(int id);//查询专辑里所有歌曲

    List<Song> selectSongByName(String name);
}
