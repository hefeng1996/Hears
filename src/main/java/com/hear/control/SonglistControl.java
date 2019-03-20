package com.hear.control;

import com.hear.entity.*;
import com.hear.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@RequestMapping("/songlist")
@Controller
public class SonglistControl {
    @Autowired
    private SonglistService songlistService;
    @Autowired
    private SingerService singerService;
    @Autowired
    private AlbumService albumService;
    @Autowired
    private SongService songService;
    @Autowired
    private TagService tagService;
    @Autowired
    private SongSonglistLinkService songSonglistLinkService;
    @Autowired
    private MySonglistService mySonglistService;
    @Autowired
    private SonglistCommentService songlistCommentService;
    @RequestMapping(value = "/index.action")
    public void searchSonglist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("hotSong",songService.hotSong());
        request.setAttribute("newSong",songService.newSong());
        request.setAttribute("mySong",songService.mySong());

        request.setAttribute("myslist2",singerService.selectMySinger2());

        request.setAttribute("newalbum",albumService.selectAlbum());

        request.setAttribute("showSonglist",songlistService.showSonglist());
        request.setAttribute("rageSonglist",songlistService.rageSonglist());
        request.setAttribute("nationSonglist",songlistService.nationSonglist());
        request.setAttribute("ancientSonglist",songlistService.ancientSonglist());
        request.setAttribute("morningSonglist",songlistService.morningSonglist());
        request.getRequestDispatcher("/mainJsp/index.jsp").forward(request,response);
    }

    @RequestMapping(value = "hear.action")
    public void hear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("hotSong",songService.hotSong());
        request.setAttribute("newSong",songService.newSong());
        request.setAttribute("mySong",songService.mySong());

        request.setAttribute("myslist2",singerService.selectMySinger2());

        request.setAttribute("newalbum",albumService.selectAlbum());

        request.setAttribute("showSonglist",songlistService.showSonglist());
        request.setAttribute("rageSonglist",songlistService.rageSonglist());
        request.setAttribute("nationSonglist",songlistService.nationSonglist());
        request.setAttribute("ancientSonglist",songlistService.ancientSonglist());
        request.setAttribute("morningSonglist",songlistService.morningSonglist());
        request.getRequestDispatcher("/mainJsp/hear.jsp").forward(request,response);
    }


    @RequestMapping(value = "huayu.action")
    public void searchChina(int id,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
       String tag=null;
       if (id ==1){
           tag="华语";
           request.setAttribute("chinaSonglist",songlistService.chinaSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 2){
            tag="流行";
            request.setAttribute("chinaSonglist",songlistService.rageSonglist());
            request.setAttribute("tag",tag);
       }else if(id == 3){
           tag="古风";
           request.setAttribute("chinaSonglist",songlistService.ancientSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 4){
           tag="民谣";
           request.setAttribute("chinaSonglist",songlistService.nationSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 5){
           tag="清晨";
           request.setAttribute("chinaSonglist",songlistService.morningSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 6){
           tag="欧美";
           request.setAttribute("chinaSonglist",songlistService.usaSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 7){
           tag="日韩";
           request.setAttribute("chinaSonglist",songlistService.rhSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 8){
           tag="摇滚";
           request.setAttribute("chinaSonglist",songlistService.rockSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 9){
           tag="轻音乐";
           request.setAttribute("chinaSonglist",songlistService.softSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 10){
           tag="夜晚";
           request.setAttribute("chinaSonglist",songlistService.nightSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 11){
           tag="学习";
           request.setAttribute("chinaSonglist",songlistService.studySonglist());
           request.setAttribute("tag",tag);
       }else if(id == 12){
           tag="工作";
           request.setAttribute("chinaSonglist",songlistService.workSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 13){
           tag="午休";
           request.setAttribute("chinaSonglist",songlistService.restSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 14){
           tag="下午茶";
           request.setAttribute("chinaSonglist",songlistService.teaSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 15){
           tag="运动";
           request.setAttribute("chinaSonglist",songlistService.exceSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 16){
           tag="散步";
           request.setAttribute("chinaSonglist",songlistService.walkSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 17){
           tag="酒吧";
           request.setAttribute("chinaSonglist",songlistService.blurSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 18){
           tag="怀旧";
           request.setAttribute("chinaSonglist",songlistService.oldSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 19){
           tag="清新";
           request.setAttribute("chinaSonglist",songlistService.freshSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 20){
           tag="安静";
           request.setAttribute("chinaSonglist",songlistService.siSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 21){
           tag="伤感";
           request.setAttribute("chinaSonglist",songlistService.sadSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 22){
           tag="治愈";
           request.setAttribute("chinaSonglist",songlistService.cureSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 23){
           tag="思念";
           request.setAttribute("chinaSonglist",songlistService.missSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 24){
           tag="浪漫";
           request.setAttribute("chinaSonglist",songlistService.romnSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 25){
           tag="80后";
           request.setAttribute("chinaSonglist",songlistService.eiSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 26){
           tag="90后";
           request.setAttribute("chinaSonglist",songlistService.nightSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 27){
           tag="00后";
           request.setAttribute("chinaSonglist",songlistService.zeSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 28){
           tag="经典";
           request.setAttribute("chinaSonglist",songlistService.typSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 29){
           tag="翻唱";
           request.setAttribute("chinaSonglist",songlistService.siSonglist());
           request.setAttribute("tag",tag);
       }else if(id == 30){
           tag="吉他";
           request.setAttribute("chinaSonglist",songlistService.geSonglist());
           request.setAttribute("tag",tag);
       }else{
           tag="全部";
           request.setAttribute("chinaSonglist",songlistService.showSonglist());
           request.setAttribute("tag",tag);
       }

        request.getRequestDispatcher("/mainJsp/huayu.jsp").forward(request,response);

    }
    @RequestMapping(value = "songlist.action")
    public void selectSonglistById(int id, HttpSession session, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        int songlistCollected=1;
        int songlistUnCollected=0;
        if (user != null) {
            List<Songlist> songlists=songlistService.getSonglistsInfoByUserId(user.getId());
            request.setAttribute("songlists",songlists);
            if(songlists!=null){
                if(mySonglistService.selectMySonglistByUserId(user.getId())!=null){
                    List<MySonglist> mySonglists = mySonglistService.selectMySonglistByUserId(user.getId());
                    for (MySonglist mySonglist:mySonglists){
                        System.out.println(mySonglist.getSonglist());
                        Integer mysonglistid = mySonglist.getSonglist().getId();
                        if(id==mysonglistid){
                            request.setAttribute("songlistCollected",songlistCollected);
                            break;
                        }else {
                            request.setAttribute("songlistCollected",songlistUnCollected);
                        }
                    }
                }
                if(mySonglistService.selectMySonglistByUserId(user.getId()).size()==0){
                    request.setAttribute("songlistCollected",songlistUnCollected);
                }
            }
        }
        request.setAttribute("comments",songlistCommentService.selectCommentsBySonglistId(id));
        request.setAttribute("songlist",songlistService.selectSonglistById(id));

        request.setAttribute("tag", tagService.selectSonglistTagById(id));
        request.setAttribute("song",songService.selectSongBySonglistId(id));

        request.getRequestDispatcher("/mainJsp/songlist.jsp?id="+id).forward(request,response);
    }

    @RequestMapping(value = "colsonglist.action")
    public void collectSongInSonglist(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String singerid = request.getParameter("singerid");
        String songlistid = request.getParameter("colsonglistid");

        String songs=request.getParameter("songs");
        Integer slid = Integer.parseInt(songlistid);
        if(!"".equals(songs)) {
            JSONArray jsonsongs = JSONArray.fromObject(songs);
            if (jsonsongs.size() > 0) {
                for (int i = 0; i < jsonsongs.size(); i++) {
                    JSONObject job = jsonsongs.getJSONObject(i);
                    String id=(String)job.get("id");
                    Integer songsid=Integer.parseInt(id);
                    Song asong = new Song();
                    Songlist asonglist = new Songlist();
                    SongSonglistLink asongSonglistLink = new SongSonglistLink();

                    asong.setId(songsid);
                    asonglist.setId(slid);
                    asongSonglistLink.setSong(asong);
                    asongSonglistLink.setSonglist(asonglist);
                    songSonglistLinkService.insertSong(asongSonglistLink);
                }
            }
        }else{
            String songid = request.getParameter("colsongid");
            if(!"".equals(songid)){
                Integer sid = Integer.parseInt(songid);
                Song song = new Song();
                Songlist songlist = new Songlist();
                SongSonglistLink songSonglistLink = new SongSonglistLink();

                song.setId(sid);
                songlist.setId(slid);
                songSonglistLink.setSong(song);
                songSonglistLink.setSonglist(songlist);
                songSonglistLinkService.insertSong(songSonglistLink);
            }


        }
        request.getRequestDispatcher("/artist/singerhost.action?id="+singerid).forward(request, response);
    }
    //往歌单里面添加歌曲
    @RequestMapping(value = "colsonglist1.action")
    public void collectSongInSonglist1(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        String songlistid = request.getParameter("colsonglistid");

        String songs=request.getParameter("songs");
        Integer slid = Integer.parseInt(songlistid);
        if(!"".equals(songs)) {
            JSONArray jsonsongs = JSONArray.fromObject(songs);
            if (jsonsongs.size() > 0) {
                for (int i = 0; i < jsonsongs.size(); i++) {
                    JSONObject job = jsonsongs.getJSONObject(i);
                    String id=(String)job.get("id");
                    Integer songsid=Integer.parseInt(id);
                    Song asong = new Song();
                    Songlist asonglist = new Songlist();
                    SongSonglistLink asongSonglistLink = new SongSonglistLink();

                    asong.setId(songsid);
                    asonglist.setId(slid);
                    asongSonglistLink.setSong(asong);
                    asongSonglistLink.setSonglist(asonglist);
                    songSonglistLinkService.insertSong(asongSonglistLink);
                }
            }
        }else{
            String songid = request.getParameter("colsongid");
            if(!"".equals(songid)){
                Integer sid = Integer.parseInt(songid);
                Song song = new Song();
                Songlist songlist = new Songlist();
                SongSonglistLink songSonglistLink = new SongSonglistLink();

                song.setId(sid);
                songlist.setId(slid);
                songSonglistLink.setSong(song);
                songSonglistLink.setSonglist(songlist);
                songSonglistLinkService.insertSong(songSonglistLink);
            }


        }
        if(request.getParameter("songlistid")!=null){
            String songlistids=request.getParameter("songlistid");
            Integer songlistids1=Integer.parseInt(songlistids);
            request.getRequestDispatcher("/songlist/songlist.action?id="+songlistids1).forward(request, response);
        }else{
            request.getRequestDispatcher("/bangdan.action").forward(request,response);
        }

    }

    @RequestMapping(value = "colsonglist2.action")
    public void collectSongInSong(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//        String singerid = request.getParameter("singerid");
        String songlistid = request.getParameter("colsonglistid");

//        String songs=request.getParameter("songs");
        Integer slid = Integer.parseInt(songlistid);
        String songid = request.getParameter("colsongid");
        if(!"".equals(songid)){
             Integer sid = Integer.parseInt(songid);
             Song song = new Song();
             Songlist songlist = new Songlist();
             SongSonglistLink songSonglistLink = new SongSonglistLink();

             song.setId(sid);
             songlist.setId(slid);
             songSonglistLink.setSong(song);
             songSonglistLink.setSonglist(songlist);
             songSonglistLinkService.insertSong(songSonglistLink);
            request.getRequestDispatcher("/song.action?id="+sid).forward(request, response);
        }

    }
    //新建歌单
    @RequestMapping(value = "newsonglist.action")
    public void newSonglist(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) session.getAttribute("user");
        Songlist songlist=new Songlist();
        String songlistname=request.getParameter("newsonglist");

        songlist.setUser(user);
        songlist.setName(songlistname);
        songlist.setCreatetime(new Date());
        songlist.setStatus(0);
        songlistService.newSonglist(songlist);
        int songlistid=songlist.getId();
//        歌曲收藏到新建的歌单(song_Songlist)中
        String singerid=request.getParameter("nsingerid");
        String nsongs=request.getParameter("nsongs");
        if(!"".equals(nsongs)){
            JSONArray jsonsongs = JSONArray.fromObject(nsongs);
            if(jsonsongs.size()>0){
                for (int i = 0; i < jsonsongs.size(); i++) {
                    JSONObject job = jsonsongs.getJSONObject(i);
                    String id=(String)job.get("id");
                    Integer songsid=Integer.parseInt(id);
                    Song asong = new Song();
                    SongSonglistLink songSonglistLink = new SongSonglistLink();
                    asong.setId(songsid);
                    songlist.setId(songlistid);
                    songSonglistLink.setSong(asong);
                    songSonglistLink.setSonglist(songlist);
                    songSonglistLinkService.insertSong(songSonglistLink);
                }
            }
        }else {
            String songid = request.getParameter("ncolsongid");

            Integer sid = Integer.parseInt(songid);

            Song song = new Song();
            SongSonglistLink songSonglistLink = new SongSonglistLink();
            song.setId(sid);
            songlist.setId(songlistid);
            songSonglistLink.setSong(song);
            songSonglistLink.setSonglist(songlist);
            songSonglistLinkService.insertSong(songSonglistLink);
        }
        request.getRequestDispatcher("/artist/singerhost.action?id="+singerid).forward(request, response);
    }
    //收藏歌单
    @RequestMapping(value = "savesonglist.action")
    public void saveSonglist(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid=request.getParameter("uid");
        String songlistid=request.getParameter("songlistid");
        Integer userid=Integer.parseInt(uid);
        Integer sid=Integer.parseInt(songlistid);
        User user=new User();
        Songlist songlist=new Songlist();
        MySonglist mySonglist=new MySonglist();
        user.setId(userid);
        songlist.setId(sid);
        mySonglist.setUser(user);
        mySonglist.setSonglist(songlist);
        if(mySonglistService.saveSonglist(mySonglist)){

            PrintWriter out = response.getWriter();
            out.print(1);
        }

    }
    //取消收藏
    @RequestMapping(value = "cancelSave.action")
    public void cancelSave(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid=request.getParameter("uid");
        String songlistid=request.getParameter("songlistid");
        Integer userid=Integer.parseInt(uid);
        Integer sid=Integer.parseInt(songlistid);
        User user=new User();
        Songlist songlist=new Songlist();
        MySonglist mySonglist=new MySonglist();
        user.setId(userid);
        songlist.setId(sid);
        mySonglist.setUser(user);
        mySonglist.setSonglist(songlist);
        if(mySonglistService.cancelSaveSonglist(mySonglist)){

            PrintWriter out = response.getWriter();
            out.print(1);
        }
    }

    @RequestMapping(value = "addsonglistcomment.action")
    public void addsonglistcomment(HttpSession session,HttpServletRequest request, HttpServletResponse response, Integer songlistid, String content) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Comments comment=new Comments();
        comment.setContent(content);
        comment.setSonglistid(songlistid);
        comment.setUser2(user);
        comment.setTime(new Date());
        songlistCommentService.insertSonglistComment(comment);
        response.sendRedirect(request.getContextPath()+"/songlist.action?id="+songlistid);
    }
    @RequestMapping(value = "addsonglistanswer.action")
    public void addsonglistanswer(HttpSession session,HttpServletRequest request, HttpServletResponse response,Integer songlistid,String content,Integer upperid) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Comments comment=new Comments();
        Comments upperComment=new Comments();
        upperComment.setId(upperid);
        comment.setTime(new Date());
        comment.setUser2(user);
        comment.setContent(content);
        comment.setSonglistid(songlistid);
        comment.setUpperComment(upperComment);
        songlistCommentService.insertSonglistAnswer(comment);

        response.sendRedirect(request.getContextPath()+"/songlist.action?id="+songlistid);
    }


}

