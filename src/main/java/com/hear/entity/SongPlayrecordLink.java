package com.hear.entity;
//Song-Playrecord
public class SongPlayrecordLink {
    private Integer id;
    private Song song;
    private Playrecord playrecord;

    public SongPlayrecordLink(Integer id, Song song, Playrecord playrecord) {
        this.id = id;
        this.song = song;
        this.playrecord = playrecord;
    }

    public SongPlayrecordLink() {
    }

    public SongPlayrecordLink(Song song, Playrecord playrecord) {
        this.song = song;
        this.playrecord = playrecord;
    }

    @Override
    public String toString() {
        return "SongPlayrecordLink{" +
                "id=" + id +
                ", Song=" + song +
                ", Playrecord=" + playrecord +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SongPlayrecordLink sp = (SongPlayrecordLink) o;

        if (id != null ? !id.equals(sp.id) : sp.id != null) return false;
        if (song != null ? !song.equals(sp.song) : sp.song != null) return false;
        return playrecord != null ? playrecord.equals(sp.playrecord) : sp.playrecord == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (song != null ? song.hashCode() : 0);
        result = 31 * result + (playrecord != null ? playrecord.hashCode() : 0);
        return result;
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

    public Playrecord getPlayrecord() {
        return playrecord;
    }

    public void setPlayrecord(Playrecord playrecord) {
        this.playrecord = playrecord;
    }
}
