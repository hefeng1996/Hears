package com.hear.service;

import com.hear.entity.SongSonglistLink;

import java.util.List;

public interface SongSonglistLinkService {
    public boolean insertSong(SongSonglistLink songSonglistLink);
    public List<SongSonglistLink> selectSonglistAndSongByListId(int id);//G
    public boolean removesongBySongIdAndSonglistId(int songlistId, int songId);//G
}
