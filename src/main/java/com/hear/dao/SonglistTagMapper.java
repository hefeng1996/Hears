package com.hear.dao;

public interface SonglistTagMapper {
    public boolean insertSonglistTag(int songlistId, int tagId);

    public boolean removeSonglistTag(int songlistId);
}
