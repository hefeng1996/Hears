package com.hear.dao;

import com.hear.entity.Comments;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SonglistCommentMapper {
//        根据歌曲id查所有评论
    public List<Comments> selectCommentsBySonglistId(int songlistid);
//    根据评论查上一级评论
    public Comments selectUpperCommentByComentId(int cid);
//    根据评论id删除评论
    public  boolean deleteCommentByCommnetId(int cid);

    //为歌曲添加评论
    public boolean insertSonglistComment(Comments comments);
//    回复歌曲的评论
    public boolean insertSonglistAnswer(Comments comments);
}

