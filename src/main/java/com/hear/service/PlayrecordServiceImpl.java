package com.hear.service;

import com.hear.dao.PlayrecordMapper;
import com.hear.entity.Playrecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PlayrecordServiceImpl implements PlayrecordService {
    @Autowired
    private PlayrecordMapper playrecordMapper;

    @Override
    public List<Playrecord> selectPlayreCord5(int id) {
        return playrecordMapper.selectPlayreCord5(id);
    }

    @Override
    public List<Playrecord> selectPlayreCord20(int id) {
        return playrecordMapper.selectPlayreCord20(id);
    }

    @Override
    public List<Playrecord> selectPlayreCordAll(int id) {
        return playrecordMapper.selectPlayreCordAll(id);
    }

    @Override
    public int selectPlayreCordCount(int id) {
        return playrecordMapper.selectPlayreCordCount(id);
    }

    @Override
    public boolean insertPlayreCordCount(Playrecord playrecord) {
        return playrecordMapper.insertPlayreCord(playrecord);
    }


}
