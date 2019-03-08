package com.hear.entity;
//Songlist-Tag
public class SonglistTag {
    private Integer id;

    private Songlist songlist;

    private Tag tag;
    private Integer songlistId;

    private Integer tagId;

    public Integer getSonglistId() {
        return songlistId;
    }

    public void setSonglistId(Integer songlistId) {
        this.songlistId = songlistId;
    }

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public SonglistTag() {
    }

    public SonglistTag(Integer id, Songlist songlist, Tag tag) {
        this.id = id;
        this.songlist = songlist;
        this.tag = tag;
    }

    public SonglistTag(Songlist songlist, Tag tag) {
        this.songlist = songlist;
        this.tag = tag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Songlist getSonglist() {
        return songlist;
    }

    public void setSonglist(Songlist songlist) {
        this.songlist = songlist;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SonglistTag st = (SonglistTag) o;

        if (id != null ? !id.equals(st.id) : st.id != null) return false;
        if (songlist != null ? !songlist.equals(st.songlist) : st.songlist != null) return false;
        return tag != null ? tag.equals(st.tag) : st.tag == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (songlist != null ? songlist.hashCode() : 0);
        result = 31 * result + (tag != null ? tag.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "SonglistTag{" +
                "id=" + id +
                ", Songlist=" + songlist +
                ", Tag=" + tag +
                '}';
    }
}