package com.hear.service;

import com.hear.dao.SonglistCommentMapper;
import com.hear.entity.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SonglistCommentServiceImpl implements SonglistCommentService {
    @Autowired
    private SonglistCommentMapper songlistCommentMapper;
    @Override
    public List<Comments> selectCommentsBySonglistId(int songlistid) {
          List<Comments> commentsList = songlistCommentMapper.selectCommentsBySonglistId(songlistid);
          if (commentsList.size()>0){
              for (Comments c:commentsList){
                  Comments uppercomment = songlistCommentMapper.selectUpperCommentByComentId(c.getId());
                  c.setUpperComment(uppercomment);
              }
              return commentsList;
          }
        return null;
    }
    @Override

    public Comments selectUpperCommentByComentId(int cid) {
        return songlistCommentMapper.selectUpperCommentByComentId(cid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean deleteCommentByCommnetId(int cid) {
        return songlistCommentMapper.deleteCommentByCommnetId(cid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean insertSonglistComment(Comments comments) {
        return songlistCommentMapper.insertSonglistComment(comments);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean insertSonglistAnswer(Comments comments) {

        return songlistCommentMapper.insertSonglistAnswer(comments);
    }
}
