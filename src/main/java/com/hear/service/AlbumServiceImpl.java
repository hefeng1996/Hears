package com.hear.service;

import com.hear.dao.AlbumMapper;
import com.hear.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumMapper albumMapper;
    @Override
    public List<Album> selectAlbumBySingerId(int id) {
        return albumMapper.selectAlbumBySingerId(id);
    }
    @Override
    public Album selectAlbumBySongId(int id) {
        return albumMapper.selectAlbumBySongId(id);
    }

    @Override
    public List<Album> selectAlbumsBySingerId(int id) {
        return albumMapper.selectAlbumsBySingerId(id);
    }

    @Override
    public List<Album> selectAlbum() {
        return albumMapper.selectAlbum();
    }

    @Override
    public Album selectAlbumById(int id) {
        return albumMapper.selectAlbumById(id);
    }
}
