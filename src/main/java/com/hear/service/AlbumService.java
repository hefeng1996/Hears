package com.hear.service;

import com.hear.entity.Album;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AlbumService {
    public Album selectAlbumBySongId(int id);
    public List<Album> selectAlbumBySingerId(int id);
    public List<Album> selectAlbumsBySingerId(int id);
    //查询所有专辑，按时间升序排列
    public List<Album> selectAlbum();
    public Album selectAlbumById(int id);//根据专辑id查询专辑信息
}
