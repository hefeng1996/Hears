package com.hear.entity;


//Song-Songlist
public class SongSonglistLink {
    private Integer id;
    private Song song;
    private Songlist songlist;

    public SongSonglistLink(Integer id, Song song, Songlist songlist) {
        this.id = id;
        this.song = song;
        this.songlist = songlist;
    }

    public SongSonglistLink() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Songlist getSonglist() {
        return songlist;
    }

    public void setSonglist(Songlist songlist) {
        this.songlist = songlist;
    }
}