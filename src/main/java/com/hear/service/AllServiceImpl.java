package com.hear.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hear.dao.AllMapper;
import com.hear.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AllServiceImpl implements AllService {
    @Autowired
    private AllMapper allMapper;
    @Override
    public PageInfo<Song> getSongsByName(Map<String,Object> map)
    {
        String songname= (String) map.get("content");
        int curPage= (int) map.get("curPage");
        int pageSize= (int) map.get("pageSize");
        PageHelper.startPage(curPage,pageSize);
        List<Song> songs=allMapper.getSongsByName(songname);
        PageInfo<Song> pageInfo=new PageInfo<>(songs);
        return pageInfo;
    }

    @Override
    public List<Song> getSongsByNameForCircle(String songname) {
        return allMapper.getSongsByName(songname);
    }

    @Override
    public List<Songlist> getSonglistsByName(String songlistname) {

        List<Songlist> songlists=allMapper.getSonglistsByName(songlistname);

        if (songlists!=null){
            for(Songlist sl:songlists){
               sl.setCollectionNum(allMapper.getCollectionNumBySonglistId(sl.getId()));
               sl.setSongNum(allMapper.getSongNumBySonglistId(sl.getId()));
            }

            return songlists;
        }
        return songlists;
    }

    @Override
    public List<Album> getAlbumsByName(String albumname) {

        return allMapper.getAlbumsByName(albumname);
    }

    @Override
    public List<Singer> getSingersByName(String singername) {
        return allMapper.getSingersByName(singername);
    }

    @Override
    public List<User> getUsersByName(String username) {
        List<User> users=allMapper.getUsersByName(username);
        if (users!=null){
            for(User u:users){
               u.setCreateSongListNum(allMapper.getSonglistNumByUserId(u.getId()));
               u.setFansNum(allMapper.getfansByUserId(u.getId()));
            }
            return users;
        }
        return users;
    }


}
