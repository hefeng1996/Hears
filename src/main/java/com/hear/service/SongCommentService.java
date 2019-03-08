package com.hear.service;

import com.github.pagehelper.PageInfo;
import com.hear.entity.Comments;
import com.hear.entity.Moment;

import java.util.List;
import java.util.Map;

public interface SongCommentService {
    //        根据歌曲id查所有评论
    public List<Comments> selectCommentsBySongId(int songid);
    //    根据评论查上一级评论
    public Comments selectUpperCommentByComentId(int cid);
    //    根据评论id删除评论
    public  boolean deleteCommentByCommnetId(int cid);

    //为歌曲添加评论
    public boolean insertSongComment(Comments comments);
    //    回复歌曲的评论
    public boolean insertSongAnswer(Comments comments);

}
