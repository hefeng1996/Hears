package com.hear.dao;

import com.hear.entity.SongSonglistLink;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongSonglistLinkMapper {
    boolean insertSong(SongSonglistLink songSonglistLink);
    List<SongSonglistLink> selectSonglistAndSongByListId(int id);//G

    boolean removeSonglistSongBySonglistId(int songlistId);//G

    boolean removesongBySongIdAndSonglistId(int songlistId, int songId);//G
}
