package com.hear.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hear.dao.MomentMapper;
import com.hear.entity.Comments;
import com.hear.entity.Moment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class MomentServiceImpl implements MomentService {
    @Autowired
    private MomentMapper momentMapper;
    @Override
    public List<Moment> selectMomentsByUserId(int id) {
        List moments=momentMapper.selectMomentsByUserId(id);
        return moments;
    }
    public PageInfo<Moment> selectAllMomentsByMyId(Map<String,Object> map)
    {

        Integer myId= (Integer) map.get("myId");
        int curPage= (int) map.get("curPage");
        int pageSize= (int) map.get("pageSize");
        PageHelper.startPage(curPage,pageSize);
        List<Moment> moments=momentMapper.selectAllMomentsByMyId(myId);
        if (moments!=null) {
            for (Moment m : moments) {
                List<Comments> commentsList = momentMapper.selectCommentsByMonentId(m.getId());
                if (commentsList != null) {
                    for(Comments c:commentsList) {
                        Comments comments = momentMapper.selectUpperCommentByComentId(c.getId());
                        c.setUpperComment(comments);
                    }
                }
                m.setComments(commentsList);
            }
            PageInfo<Moment> pageInfo=new PageInfo<>(moments);
            return pageInfo;
        }

        return null;
    }

    @Override
    public List<Moment> selectMyMomentsByMyId(int myId) {
        List<Moment> moments=momentMapper.selectMyMomentsByMyId(myId);
        if (moments!=null) {
            for (Moment m : moments) {
                List<Comments> commentsList = momentMapper.selectCommentsByMonentId(m.getId());
                if (commentsList != null) {
                    for(Comments c:commentsList) {
                        Comments comments = momentMapper.selectUpperCommentByComentId(c.getId());
                        c.setUpperComment(comments);
                    }
                }
                m.setComments(commentsList);
            }

            return moments;
        }

        return null;
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public boolean insertMoment(Moment moment) {
        return momentMapper.insertMoment(moment);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public boolean insertComment(Comments comments) {
        return momentMapper.insertComment(comments);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public boolean insertAnswer(Comments comments) {
        return momentMapper.insertAnswer(comments);
    }


    //根据动态id删除动态
    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public boolean deleteMomentByMomentId(int mId) {
        boolean f1=true;
        List<Comments> commentsList=momentMapper.selectCommentsByMonentId(mId);
        if(commentsList.size()!=0){
            f1=momentMapper.deleteComentByMomentId(mId);
        }
        boolean f2=momentMapper.deleteMomentByMomentId(mId);
        if(f1&&f2){
            return true;
        }
        else {
            return false;
        }
    }
    //根据评论id删除评论
    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public boolean deleteCommentByCommentId(int cid) {
        return momentMapper.deleteCommentByCommnetId(cid);
    }



}
