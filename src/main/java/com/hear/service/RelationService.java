package com.hear.service;

import com.hear.entity.Relation;

import java.util.List;

public interface RelationService {
    public List<Relation> selectRelationByUserId13(int id);
    public List<Relation> selectRelationByUserId23(int id);

    public boolean addrelation(int userId, int userById);
    public List<Relation> selectRelationByAll(int userId, int userById);
    public boolean updaterelation(int userId, int userById);
    public boolean removeRelation(int userId, int userById);

    public List<Relation> selectFansByUserId23(int id);
    public boolean updateAttention(int userid, int id);

    public List<Relation> selectAttentionByUserId13(int id);
    public boolean updateremoveAttention(int userid, int id);
}
