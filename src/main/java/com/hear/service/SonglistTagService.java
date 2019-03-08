package com.hear.service;

public interface SonglistTagService {
    public boolean insertSonglistTag(int songlistId, int tagId);
    public boolean removeSonglistTag(int songlistId);
}
