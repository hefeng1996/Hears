package com.hear.service;

import com.hear.dao.MySonglistMapper;
import com.hear.entity.MySonglist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MySonglistServiceImpl implements MySonglistService {
    @Autowired
    private MySonglistMapper mySonglistMapper;

    @Override
    public List<MySonglist> selectMySonglistByUserId(int id) {
        return mySonglistMapper.selectMySonglistByUserId(id);
    }

    @Override
    public boolean saveSonglist(MySonglist mySonglist) {
        return mySonglistMapper.saveSonglist(mySonglist);
    }

    @Override
    public boolean cancelSaveSonglist(MySonglist mySonglist) {
        return mySonglistMapper.cancelSaveSonglist(mySonglist);
    }

    @Override
    public boolean removeSaveSonglist(int songListId) {
        return mySonglistMapper.removeSaveSonglist(songListId);
    }
}
