package com.hear.service;

import com.hear.dao.SongSonglistLinkMapper;
import com.hear.entity.SongSonglistLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongSonglistLinkServiceImpl implements SongSonglistLinkService {
    @Autowired
    private SongSonglistLinkMapper songSonglistLinkMapper;
    @Override
    public boolean insertSong(SongSonglistLink songSonglistLink) {
        return songSonglistLinkMapper.insertSong(songSonglistLink);
    }
    @Override
    public List<SongSonglistLink> selectSonglistAndSongByListId(int id) {
        return songSonglistLinkMapper.selectSonglistAndSongByListId(id);
    }
    @Override
    public boolean removesongBySongIdAndSonglistId(int songlistId, int songId) {
        return songSonglistLinkMapper.removesongBySongIdAndSonglistId(songlistId,songId);
    }
}
