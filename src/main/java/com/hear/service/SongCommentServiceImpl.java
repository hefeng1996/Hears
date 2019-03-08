package com.hear.service;

import com.hear.dao.SongCommentMapper;
import com.hear.entity.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class SongCommentServiceImpl implements SongCommentService {
    @Autowired
    private SongCommentMapper songCommentMapper;
    @Override
    public List<Comments> selectCommentsBySongId(int songid) {
          List<Comments> commentsList = songCommentMapper.selectCommentsBySongId(songid);
          if (commentsList.size()>0){
              for (Comments c:commentsList){
                  Comments uppercomment = songCommentMapper.selectUpperCommentByComentId(c.getId());
                  c.setUpperComment(uppercomment);
              }
              return commentsList;
          }
        return null;
    }
    @Override
    public Comments selectUpperCommentByComentId(int cid) {
        return songCommentMapper.selectUpperCommentByComentId(cid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean deleteCommentByCommnetId(int cid) {
        return songCommentMapper.deleteCommentByCommnetId(cid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean insertSongComment(Comments comments) {
        return songCommentMapper.insertSongComment(comments);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean insertSongAnswer(Comments comments) {

        return songCommentMapper.insertSongAnswer(comments);
    }
}
