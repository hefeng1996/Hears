package com.hear.dao;

import com.hear.entity.SongSonglistLink;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongSonglistLinkMapper {
    public boolean insertSong(SongSonglistLink songSonglistLink);
    public List<SongSonglistLink> selectSonglistAndSongByListId(int id);//G

    public boolean removeSonglistSongBySonglistId(int songlistId);//G

    public boolean removesongBySongIdAndSonglistId(int songlistId, int songId);//G
}
