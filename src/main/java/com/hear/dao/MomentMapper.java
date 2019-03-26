package com.hear.dao;

import com.hear.entity.Comments;
import com.hear.entity.Moment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MomentMapper {
    List<Moment> selectMomentsByUserId(int id);//G
    List<Moment> selectMyMomentsByMyId(int myId);//Y
    List<Moment> selectAllMomentsByMyId(int myId);//Y
    List<Comments> selectCommentsByMonentId(int mId);//Y
    boolean insertMoment(Moment moment);//Y
    boolean insertComment(Comments comments);//Y
    Comments selectUpperCommentByComentId(int cId);//Y
    boolean insertAnswer(Comments comments);//Y


    //    根据动态的id删除下面所有评论
    boolean deleteComentByMomentId(int cId);
    //    根据动态的id删除动态
    boolean deleteMomentByMomentId(int mId);
    //    根据评论的id删除评论
    boolean deleteCommentByCommnetId(int cid);


}
