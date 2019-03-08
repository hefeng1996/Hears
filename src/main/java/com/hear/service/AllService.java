package com.hear.service;

import com.github.pagehelper.PageInfo;
import com.hear.entity.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface AllService {
    public PageInfo<Song> getSongsByName(Map<String, Object> map);
    public List<Song> getSongsByNameForCircle(String songname);
    public List<Songlist> getSonglistsByName(String songlistname);
    public List<Album> getAlbumsByName(String albumname);
    public List<Singer> getSingersByName(String ingername);
    public List<User> getUsersByName(String username);


}
