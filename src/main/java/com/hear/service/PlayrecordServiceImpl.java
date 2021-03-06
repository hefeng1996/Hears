package com.hear.service;

import com.hear.dao.PlayrecordMapper;
import com.hear.entity.Playrecord;
import com.hear.entity.Song;
import com.hear.entity.User;
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
        Song song = playrecord.getSong();
        User user = playrecord.getUser();
        Integer userId = null;
        Integer songId = song.getId();
        if(user!=null){
            userId = user.getId();
        }
        return playrecordMapper.insertPlayreCord(userId,songId,System.currentTimeMillis());
    }


}
