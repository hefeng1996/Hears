package com.hear.dao;

import com.hear.entity.Comments;
import com.hear.entity.Moment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MomentMapper {
    public List<Moment> selectMomentsByUserId(int id);//G
    public List<Moment> selectMyMomentsByMyId(int myId);//Y
    public List<Moment> selectAllMomentsByMyId(int myId);//Y
    public List<Comments> selectCommentsByMonentId(int mId);//Y
    public boolean insertMoment(Moment moment);//Y
    public boolean insertComment(Comments comments);//Y
    public Comments selectUpperCommentByComentId(int cId);//Y
    public boolean insertAnswer(Comments comments);//Y


    //    根据动态的id删除下面所有评论
    public boolean deleteComentByMomentId(int cId);
    //    根据动态的id删除动态
    public boolean deleteMomentByMomentId(int mId);
    //    根据评论的id删除评论
    public boolean deleteCommentByCommnetId(int cid);


}
