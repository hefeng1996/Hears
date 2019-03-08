package com.hear.service;

import com.github.pagehelper.PageInfo;
import com.hear.entity.Comments;
import com.hear.entity.Moment;

import java.util.List;
import java.util.Map;

public interface MomentService {
    public List<Moment> selectMomentsByUserId(int id);//G
    //    分页查询
    public PageInfo<Moment> selectAllMomentsByMyId(Map<String, Object> map);//Y
//    查询个人动态
    public List<Moment> selectMyMomentsByMyId(int myId);//Y

    //    插入动态
    public boolean insertMoment(Moment moment);//Y
    //    插入评论
    public boolean insertComment(Comments comments);//Y
    //    插入回复
    public boolean insertAnswer(Comments comments);//Y


    //    根据动态的id删除动态与旗下的
    public boolean deleteMomentByMomentId(int mId);//Y
    //    根据评论的id删除评论
    public boolean deleteCommentByCommentId(int cid);//Y


}
