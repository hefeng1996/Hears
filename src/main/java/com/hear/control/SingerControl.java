package com.hear.control;

import com.hear.entity.*;
import com.hear.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RequestMapping("/artist")
@Controller
public class SingerControl {
    @Autowired
    private SingerService singerService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private SonglistService songlistService;
    @Autowired
    private MySingerService mySingerService;
    @RequestMapping(value="recommendsinger.action")
    public void recommendsinger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("recommendslist",singerService.selectSinger());
        request.setAttribute("myslist1",singerService.selectMySinger1());
        request.setAttribute("myslist2",singerService.selectMySinger2());

        request.setAttribute("chmaleslist",singerService.selectChMaleSinger());
        request.setAttribute("chfemaleslist",singerService.selectChFemaleSinger());
        request.setAttribute("chbandslist",singerService.selectChBand());

        request.setAttribute("engmaleslist",singerService.selectEngMaleSinger());
        request.setAttribute("engfemaleslist",singerService.selectEngFemaleSinger());
        request.setAttribute("engbandslist",singerService.selectEngBand());

        request.setAttribute("jkmaleslist",singerService.selectJkMaleSinger());
        request.setAttribute("jkfemaleslist",singerService.selectJkFemaleSinger());
        request.setAttribute("jkbandslist",singerService.selectJkBand());
//        request.getRequestDispatcher("/singerlist/singerlist.jsp").forward(request,response);
        request.getRequestDispatcher("/mainJsp/singerlist.jsp").forward(request,response);
    }

    @RequestMapping(value="singerhost.action")
    public void getSingerHost(int id, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        歌曲列表
        User user= (User) session.getAttribute("user");
        Singer singerhost=singerService.selectSingerhost(id);
        List<Singer> similarsingers=null;
        List<Song> songs=singerhost.getSong();
        List<Album> albums = albumService.selectAlbumsBySingerId(id);
        int singerCollected=1;
        int singerUnCollected=0;
        if (user != null) {
            List<Songlist> songlists=songlistService.getSonglistsInfoByUserId(user.getId());
            request.setAttribute("songlists",songlists);
            if(singerhost!=null){
                similarsingers= singerService.selectSimliarSinger(id);
                if(mySingerService.selectMySingerByUserId(user.getId())!=null){
                    List<MySinger> mySingers=mySingerService.selectMySingerByUserId(user.getId());
                    for (MySinger mysinger:mySingers) {
                        Integer mysingerid = mysinger.getSinger().getId();
                        if (id == mysingerid) {
                            request.setAttribute("singerCollected", singerCollected);
                            break;
                        }else {
                            request.setAttribute("singerCollected", singerUnCollected);
                        }
                    }
                }
                if(mySingerService.selectMySingerByUserId(user.getId()).size()==0){
                    request.setAttribute("singerCollected", singerUnCollected);
                }

            }

        }
        similarsingers= singerService.selectSimliarSinger(id);
        request.setAttribute("singerhost",singerhost);
        request.setAttribute("songs",songs);
        request.setAttribute("albums",albums);
        request.setAttribute("similarsingers",similarsingers);

//        request.setAttribute("albums",albums);
        request.getRequestDispatcher("/singerhost/singerhost.jsp?id="+id).forward(request,response);
    }

    @RequestMapping(value="singercollect.action")
    public void collectSinger(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uid=request.getParameter("uid");
        String singerid=request.getParameter("singerid");

        Integer userid=Integer.parseInt(uid);
        Integer sid=Integer.parseInt(singerid);
        User user=new User();
        Singer singer=new Singer();
        MySinger mySinger=new MySinger();
        user.setId(userid);
        singer.setId(sid);
        mySinger.setUser(user);
        mySinger.setSinger(singer);
        if(mySingerService.collectSinger(mySinger)) {

            PrintWriter out = response.getWriter();
            out.print(1);
        }
    }
    @RequestMapping(value="cancelsingercollect.action")
    public void cancelCollectSinger(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uid=request.getParameter("uid");
        String singerid=request.getParameter("singerid");

        Integer userid=Integer.parseInt(uid);
        Integer sid=Integer.parseInt(singerid);
        User user=new User();
        Singer singer=new Singer();
        MySinger mySinger=new MySinger();
        user.setId(userid);
        singer.setId(sid);
        mySinger.setUser(user);
        mySinger.setSinger(singer);
        if(mySingerService.cancelCollectSinger(mySinger)) {

            PrintWriter out = response.getWriter();
            out.print(1);
        }
    }
}
