package com.hear.control;


import com.hear.entity.*;
import com.hear.service.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class SongControl {
    @Autowired
    private SongService songService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private SonglistService songlistService;
    @Autowired
    private MySonglistService mySonglistService;
    @Autowired
    private SongCommentService songCommentService;

    @RequestMapping(value="songplay.action",produces = "text/plain;charset=utf-8")
    public  @ResponseBody String  selectSonginfo(int id,HttpServletRequest request, HttpServletResponse response){

            Song songInfo = songService.selectSongById(id);
            String path="D:\\Hear\\lyrics\\"+songInfo.getLyrics();
            List<Map<String, String>> list = songService.parse(path);
            String s=songService.printLrc2(list);

            songInfo.setLyrics(s);
            JSONObject ja = JSONObject.fromObject(songInfo);
            return ja.toString();
    }

    @RequestMapping(value = "bangdan.action")
    public void searchSong(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        if (user != null){
            List<Songlist> songlists=songlistService.getSonglistsInfoByUserId(user.getId());
            request.setAttribute("songlists",songlists);
        }
        request.setAttribute("hotSong",songService.hotSong());
        request.setAttribute("newSong",songService.newSong());
        request.setAttribute("mySong",songService.mySong());


//        request.getRequestDispatcher("/main/bangdan.jsp").forward(request,response);
        request.getRequestDispatcher("/mainJsp/bangdan.jsp").forward(request,response);
    }
    @RequestMapping(value = "song.action")
    public void selectSong(HttpSession session,HttpServletRequest request, HttpServletResponse response,int id) throws ServletException, IOException {
        String path = "D:\\Hear\\lyrics\\"+songService.selectSongById(id).getLyrics(); // 歌词文件路径

        List<Map<String, String>> list = songService.parse(path);
        String s=songService.printLrc(list);
        request.setAttribute("s",s);

        User user= (User) session.getAttribute("user");
        if (user != null) {
            List<Songlist> songlists = songlistService.getSonglistsInfoByUserId(user.getId());
            request.setAttribute("songlists", songlists);
        }
        List<Comments> comments=songCommentService.selectCommentsBySongId(id);request.setAttribute("comments",comments);

        request.setAttribute("song",songService.selectSongByIds(id));

        request.getRequestDispatcher("/mainJsp/song.jsp").forward(request,response);
    }

    @RequestMapping(value = "addsongcomment.action")
    public void addsongcomment(HttpSession session,HttpServletRequest request, HttpServletResponse response, Integer songid, String content) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Comments comment=new Comments();
        comment.setContent(content);
        comment.setSongid(songid);
        comment.setUser2(user);
        comment.setTime(new Date());
        songCommentService.insertSongComment(comment);
        response.sendRedirect(request.getContextPath()+"/song.action?id="+songid);
    }
    @RequestMapping(value = "addsonganswer.action")
    public void addsonganswer(HttpSession session,HttpServletRequest request, HttpServletResponse response,Integer songid,String content,Integer upperid) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Comments comment=new Comments();
        Comments upperComment=new Comments();
        upperComment.setId(upperid);
        comment.setTime(new Date());
        comment.setUser2(user);
        comment.setContent(content);
        comment.setSongid(songid);
        comment.setUpperComment(upperComment);
        songCommentService.insertSongAnswer(comment);

        response.sendRedirect(request.getContextPath()+"/song.action?id="+songid);
    }


}
