package com.hear.service;

import com.hear.dao.SonglistTagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SonglistTagServiceImpl implements SonglistTagService {
    @Autowired
    private SonglistTagMapper songlistTagMapper;
    @Override
    public boolean insertSonglistTag(int songlistId, int tagId) {
        return songlistTagMapper.insertSonglistTag(songlistId,tagId);
    }

    @Override
    public boolean removeSonglistTag(int songlistId) {
        return songlistTagMapper.removeSonglistTag(songlistId);
    }
}
