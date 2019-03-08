package com.hear.dao;

import com.hear.entity.Album;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AlbumMapper {
    public Album selectAlbumBySongId(int id);

    public List<Album> selectAlbumsBySingerId(int id);
    public List<Album> selectAlbumBySingerId(int id);
    //查询所有专辑，按时间升序排列
    public List<Album> selectAlbum();
    public Album selectAlbumById(int id);//根据专辑id查询专辑信息

}
