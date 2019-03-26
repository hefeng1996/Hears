package com.hear.dao;

public interface SonglistTagMapper {
    boolean insertSonglistTag(int songlistId, int tagId);

    boolean removeSonglistTag(int songlistId);
}
