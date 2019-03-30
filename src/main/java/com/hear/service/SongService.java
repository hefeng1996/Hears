package com.hear.service;

import com.hear.entity.Song;

import java.util.List;
import java.util.Map;

public interface SongService {
    public List<Map<String, String>> parse(String path);//Y

    public long getLongTime(String min, String sec, String mill);//Y
    public String printLrc(List<Map<String, String>> list) ;//Y
    public String printLrc2(List<Map<String, String>> list);
//    public List<Song> selectSongBySingerId(int id);//通过歌手id查询歌手的歌曲信息
    public List<Song> selectSongBySonglistId(int id);//查询歌单里的歌曲
    public List<Song> selectSongByAlbumId(int id);//查询专辑里所有歌曲
    public Song selectSongById(int id);//通过歌曲id查询歌曲信息(点击播放歌曲)
    public Song selectSongByIds(int id);//H 查询歌单详情
    public List<Song> newSong();//新歌榜
    public List<Song> hotSong();//热歌榜
    public List<Song> mySong();//原创榜

    List<Song> selectSongByName(String name);

}
