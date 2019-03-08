package com.hear.service;

import com.hear.dao.AlbumCommentMapper;
import com.hear.entity.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AlbumCommentServiceImpl implements AlbumCommentService {
    @Autowired
    private AlbumCommentMapper albumCommentMapper;
    @Override
    public List<Comments> selectCommentsByAlbumId(int albumid) {
          List<Comments> commentsList = albumCommentMapper.selectCommentsByAlbumId(albumid);
          if (commentsList.size()>0){
              for (Comments c:commentsList){
                  Comments uppercomment = albumCommentMapper.selectUpperCommentByComentId(c.getId());
                  c.setUpperComment(uppercomment);
              }
              return commentsList;
          }
        return null;
    }
    @Override
    public Comments selectUpperCommentByComentId(int cid) {
        return albumCommentMapper.selectUpperCommentByComentId(cid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean deleteCommentByCommnetId(int cid) {
        return albumCommentMapper.deleteCommentByCommnetId(cid);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean insertAlbumComment(Comments comments) {
        return albumCommentMapper.insertAlbumComment(comments);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)

    public boolean insertAlbumAnswer(Comments comments) {

        return albumCommentMapper.insertAlbumAnswer(comments);
    }
}
