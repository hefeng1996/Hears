package com.hear.service;

import com.hear.entity.Comments;

import java.util.List;

public interface AlbumCommentService {
    //        根据歌曲id查所有评论
    public List<Comments> selectCommentsByAlbumId(int albumid);
    //    根据评论查上一级评论
    public Comments selectUpperCommentByComentId(int cid);
    //    根据评论id删除评论
    public  boolean deleteCommentByCommnetId(int cid);

    //为歌曲添加评论
    public boolean insertAlbumComment(Comments comments);
    //    回复歌曲的评论
    public boolean insertAlbumAnswer(Comments comments);

}
