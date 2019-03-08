package com.hear.service;

import com.hear.dao.*;
import com.hear.entity.Songlist;
import com.hear.entity.SonglistTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class SonglistServiceImpl implements SonglistService{
    @Autowired
    private SonglistMapper songlistMapper;
    @Autowired
    private SonglistTagMapper songlistTagMapper;
    @Autowired
    private AllMapper allMapper;
    @Autowired
    private SongSonglistLinkMapper songSonglistLinkMapper;
    @Autowired
    private MySonglistMapper mySonglistMapper;

    @Override
    public Songlist selectSonglistById(int id) {
        return songlistMapper.selectSonglistById(id);
    }
    @Override
    public List<Songlist> showSonglist() {
        return songlistMapper.showSonglist();
    }

    @Override
    public List<Songlist> chinaSonglist() {
        return songlistMapper.chinaSonglist();
    }

    @Override
    public List<Songlist> rageSonglist() {
        return songlistMapper.rageSonglist();
    }

    @Override
    public List<Songlist> ancientSonglist() {
        return songlistMapper.ancientSonglist();
    }

    @Override
    public List<Songlist> nationSonglist() {
        return songlistMapper.nationSonglist();
    }

    @Override
    public List<Songlist> morningSonglist() {
        return songlistMapper.morningSonglist();
    }

    @Override
    public List<Songlist> usaSonglist() {
        return songlistMapper.usaSonglist();
    }

    @Override
    public List<Songlist> rhSonglist() {
        return songlistMapper.rhSonglist();
    }

    @Override
    public List<Songlist> rockSonglist() {
        return songlistMapper.rockSonglist();
    }

    @Override
    public List<Songlist> softSonglist() {
        return songlistMapper.softSonglist();
    }

    @Override
    public List<Songlist> nightSonglist() {
        return songlistMapper.nightSonglist();
    }

    @Override
    public List<Songlist> studySonglist() {
        return songlistMapper.studySonglist();
    }

    @Override
    public List<Songlist> workSonglist() {
        return songlistMapper.workSonglist();
    }

    @Override
    public List<Songlist> restSonglist() {
        return songlistMapper.restSonglist();
    }

    @Override
    public List<Songlist> teaSonglist() {
        return songlistMapper.teaSonglist();
    }

    @Override
    public List<Songlist> exceSonglist() {
        return songlistMapper.exceSonglist();
    }

    @Override
    public List<Songlist> walkSonglist() {
        return songlistMapper.walkSonglist();
    }

    @Override
    public List<Songlist> blurSonglist() {
        return songlistMapper.blurSonglist();
    }

    @Override
    public List<Songlist> oldSonglist() {
        return songlistMapper.oldSonglist();
    }

    @Override
    public List<Songlist> freshSonglist() {
        return songlistMapper.freshSonglist();
    }

    @Override
    public List<Songlist> slienceSonglist() {
        return songlistMapper.slienceSonglist();
    }

    @Override
    public List<Songlist> sadSonglist() {
        return songlistMapper.sadSonglist();
    }

    @Override
    public List<Songlist> cureSonglist() {
        return songlistMapper.cureSonglist();
    }

    @Override
    public List<Songlist> missSonglist() {
        return songlistMapper.missSonglist();
    }

    @Override
    public List<Songlist> romnSonglist() {
        return songlistMapper.romnSonglist();
    }

    @Override
    public List<Songlist> eiSonglist() {
        return songlistMapper.eiSonglist();
    }

    @Override
    public List<Songlist> niSonglist() {
        return songlistMapper.niSonglist();
    }

    @Override
    public List<Songlist> zeSonglist() {
        return songlistMapper.zeSonglist();
    }

    @Override
    public List<Songlist> typSonglist() {
        return songlistMapper.typSonglist();
    }

    @Override
    public List<Songlist> siSonglist() {
        return songlistMapper.siSonglist();
    }

    @Override
    public List<Songlist> geSonglist() {
        return songlistMapper.geSonglist();
    }

    @Override
    public List<Songlist> selectSonglistByUserId(int id) {
        return songlistMapper.selectSonglistByUserId(id);
    }

    @Override
    public List<Songlist> selectSonglistlikeByUserId(int id) {
        return songlistMapper.selectSonglistlikeByUserId(id);
    }

    @Override
    public List<Songlist> getSonglistsInfoByUserId(int userid) {
        List<Songlist> songlists=songlistMapper.selectSonglistByUserId(userid);
        if (songlists!=null){
            for (Songlist sl:songlists) {
                sl.setSongNum(allMapper.getSongNumBySonglistId(sl.getId()));
            }
            return songlists;
        }
        return songlists;
    }

    @Transactional(propagation=Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public boolean insertSonglist(Songlist songlist,String []checkbox) {
        boolean f=songlistMapper.insertSonglist(songlist);
        if(checkbox!=null){
            for(String c:checkbox){
                Songlist list=songlistMapper.selectSonglistByCondition(songlist);
                SonglistTag songlistTag=new SonglistTag();
                songlistTag.setSonglistId(list.getId());
                songlistTagMapper.insertSonglistTag(list.getId(),Integer.parseInt(c));
            }
        }
        return f;
    }
    @Override
    public Songlist selectSonglistByCondition(Songlist songlist) {
        return songlistMapper.selectSonglistByCondition(songlist);
    }

    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public boolean removesonglistBySonglistId(int songlistId) {
        boolean s=mySonglistMapper.removeSaveSonglist(songlistId);
        boolean t=songlistTagMapper.removeSonglistTag(songlistId);
        boolean v=songSonglistLinkMapper.removeSonglistSongBySonglistId(songlistId);
        boolean f=songlistMapper.removesonglistBySonglistId(songlistId);


        if(s==true&&f==true&&t==true&&v==true){
            return true;
        }else {
            return false;
        }
    }
    @Override
    public boolean newSonglist(Songlist songlist) {
        return songlistMapper.newSonglist(songlist);
    }

}
