package com.hear.dao;

import com.hear.entity.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongCommentMapper {
//        根据歌曲id查所有评论
    List<Comments> selectCommentsBySongId(int songid);
//    根据评论查上一级评论
    Comments selectUpperCommentByComentId(int cid);
//    根据评论id删除评论
    boolean deleteCommentByCommnetId(int cid);

    //为歌曲添加评论
    boolean insertSongComment(Comments comments);
//    回复歌曲的评论
    boolean insertSongAnswer(Comments comments);
}

