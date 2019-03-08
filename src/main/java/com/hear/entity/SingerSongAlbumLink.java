package com.hear.entity;
//Singer-Song-Album
public class SingerSongAlbumLink {
    private Integer id;

    private Singer singer;

    private Song song;

    private Album Album;

    public SingerSongAlbumLink(Integer id, Singer singer, Song song, Album Album) {
        this.id = id;
        this.singer = singer;
        this.song = song;
        this.Album = Album;
    }

    public SingerSongAlbumLink() {
    }

    public SingerSongAlbumLink(Singer singer, Song song, Album Album) {
        this.singer = singer;
        this.song = song;
        this.Album = Album;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Album getAlbum() {
        return Album;
    }

    public void setAlbum(Album Album) {
        this.Album = Album;
    }

    @Override
    public String toString() {
        return "SingerSongAlbumLink{" +
                "id=" + id +
                ", Singer=" + singer +
                ", Song=" + song +
                ", Album=" + Album +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SingerSongAlbumLink ssa = (SingerSongAlbumLink) o;

        if (id != null ? !id.equals(ssa.id) : ssa.id != null) return false;
        if (singer != null ? !singer.equals(ssa.singer) : ssa.singer != null) return false;
        if (song != null ? !song.equals(ssa.song) : ssa.song != null) return false;
        return Album != null ? Album.equals(ssa.Album) : ssa.Album == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (singer != null ? singer.hashCode() : 0);
        result = 31 * result + (song != null ? song.hashCode() : 0);
        result = 31 * result + (Album != null ? Album.hashCode() : 0);
        return result;
    }
}