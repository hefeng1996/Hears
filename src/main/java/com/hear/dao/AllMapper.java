package com.hear.dao;

import com.hear.entity.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AllMapper {
    public List<Song> getSongsByName(String songname);
    public List<Songlist> getSonglistsByName(String songlistname);
    public List<Album> getAlbumsByName(String albumname);
    public List<Singer> getSingersByName(String ingername);
    public List<User> getUsersByName(String username);

//查询用户创建的歌单数量
    public int getSonglistNumByUserId(int userId);
//    查询用户的粉丝数
    public int getfansByUserId(int userId);

    public int getSongNumBySonglistId(int songlistId);
    public int getCollectionNumBySonglistId(int songlistId);
}
