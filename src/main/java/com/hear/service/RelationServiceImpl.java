package com.hear.service;

import com.hear.dao.RelationMapper;
import com.hear.entity.Relation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class RelationServiceImpl implements RelationService {
    @Autowired
    private RelationMapper relationMapper;

    @Override
    public List<Relation> selectRelationByUserId13(int id) {
        return relationMapper.selectRelationByUserId13(id);
    }

    @Override
    public List<Relation> selectRelationByUserId23(int id) {
        return relationMapper.selectRelationByUserId23(id);
    }

    @Override
    public boolean addrelation(int userId, int userById) {
        return relationMapper.addRelatonById(userId,userById);
    }

    @Override
    public List<Relation> selectRelationByAll(int userId, int userById) {
        return relationMapper.selectRelationByAll(userId,userById);
    }

    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @Override
    public boolean updaterelation(int userId, int userById) {
        relationMapper.updateAttentionByuserbyid(userId,userById);
        relationMapper.updateAttentionByuserbyid(userById,userId);
        return true;
    }

    @Override
    public boolean removeRelation(int userId,int userById) {
        return relationMapper.removeRelation(userId,userById);
    }

    @Override
    public List<Relation> selectFansByUserId23(int id) {
        return relationMapper.selectFansByUserId23(id);
    }

    @Override
    public boolean updateAttention(int userid, int id) {
        relationMapper.updateAttention(userid,id);
        relationMapper.updateAttentionByuserbyid(userid,id);
        return true;
    }

    @Override
    public List<Relation> selectAttentionByUserId13(int id) {
        return relationMapper.selectAttentionByUserId13(id);
    }

    @Override
    public boolean updateremoveAttention(int userid, int id) {
        relationMapper.updateremoveAttention(userid,id);
        relationMapper.updateAttentionByuserbyid(userid,id);
        return true;
    }

}
