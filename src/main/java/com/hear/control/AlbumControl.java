package com.hear.control;

import com.hear.entity.Comments;
import com.hear.entity.User;
import com.hear.service.AlbumCommentService;
import com.hear.service.AlbumService;
import com.hear.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;


@Controller
public class AlbumControl {
    @Autowired
    private AlbumCommentService albumCommentService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private SongService songService;
    @RequestMapping(value = "album.action")
    public void selectAlbumById(int id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("comments",albumCommentService.selectCommentsByAlbumId(id));
        request.setAttribute("album",albumService.selectAlbumById(id));
        request.setAttribute("song",songService.selectSongByAlbumId(id));
        request.getRequestDispatcher("/mainJsp/album.jsp?id="+id).forward(request,response);
    }
    @RequestMapping(value = "addalbumcomment.action")
    public void addsongcomment(HttpSession session, HttpServletRequest request, HttpServletResponse response, Integer albumid, String content) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Comments comment=new Comments();
        comment.setContent(content);
        comment.setAlbumid(albumid);
        comment.setUser2(user);
        comment.setTime(new Date());
        albumCommentService.insertAlbumComment(comment);
        response.sendRedirect(request.getContextPath()+"/album.action?id="+albumid);
    }
    @RequestMapping(value = "addalbumanswer.action")
    public void addalbumanswer(HttpSession session,HttpServletRequest request, HttpServletResponse response,Integer albumid,String content,Integer upperid) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Comments comment=new Comments();
        Comments upperComment=new Comments();
        upperComment.setId(upperid);
        comment.setTime(new Date());
        comment.setUser2(user);
        comment.setContent(content);
        comment.setAlbumid(albumid);
        comment.setUpperComment(upperComment);
        albumCommentService.insertAlbumAnswer(comment);
        response.sendRedirect(request.getContextPath()+"/album.action?id="+albumid);
    }

}
