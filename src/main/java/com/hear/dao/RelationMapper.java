package com.hear.dao;

import com.hear.entity.Relation;

import java.util.List;

public interface RelationMapper {
    List<Relation> selectRelationByUserId13(int id);
    List<Relation> selectRelationByUserId23(int id);

    List<Relation> selectRelationByAll(int userId, int userById);
    boolean removeRelation(int userId, int userById);

    boolean addRelatonById(int userId, int userById);


    List<Relation> selectFansByUserId23(int id);
    boolean updateAttention(int userid, int id);
    boolean updateAttentionByuserbyid(int userbyid, int id);

    List<Relation> selectAttentionByUserId13(int id);
    boolean updateremoveAttention(int userid, int id);
    boolean updateremoveAttentionByuserbyid(int userbyid, int id);

}
