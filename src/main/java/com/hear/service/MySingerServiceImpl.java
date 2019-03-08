package com.hear.service;

import com.hear.dao.AlbumMapper;
import com.hear.dao.MySingerMapper;
import com.hear.entity.MySinger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MySingerServiceImpl implements MySingerService {
    @Autowired
    private MySingerMapper mySingerMapper;

    @Override
    public List<MySinger> selectMySingerByUserId(int id) {
        return mySingerMapper.selectMySingerByUserId(id);
    }

    @Override
    public boolean collectSinger(MySinger mySinger) {
        return mySingerMapper.collectSinger(mySinger);
    }

    @Override
    public boolean cancelCollectSinger(MySinger mySinger) {
        return mySingerMapper.cancelCollectSinger(mySinger);
    }
}
