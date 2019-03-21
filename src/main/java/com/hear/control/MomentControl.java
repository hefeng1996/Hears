package com.hear.control;

import com.github.pagehelper.PageInfo;
import com.hear.entity.*;
import com.hear.service.AllService;
import com.hear.service.MomentService;
import com.hear.service.PraiseService;
import com.hear.service.SonglistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/friend")
@Controller
public class MomentControl {
    @Autowired
    private MomentService momentService;

    @Autowired
    private PraiseService praiseService;
    @Autowired
    private SonglistService songlistService;
    @RequestMapping(value = "friendcircle.action")
    public void friendcircle(String scurPage,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");

        if (user==null){
            response.sendRedirect(request.getContextPath()+"/mainJsp/hear.jsp?flag=2");
        }
        else{
            Map<String,Object> map=new HashMap<>();
            Integer pageSize=6;
            Integer curPage=1;

            if (scurPage!=null&&!scurPage.trim().equals("")){

                curPage=Integer.parseInt(scurPage);
            }
            Integer myId=user.getId();
            map.put("curPage",curPage);
            map.put("pageSize",pageSize);
            map.put("myId",myId);

            PageInfo<Moment> moments=momentService.selectAllMomentsByMyId(map);

            List<Moment> momentList=moments.getList();
            if(momentList!=null){
                for(Moment m:momentList){
                    Integer praiseType=1;
                    List<Praise> praiseList= praiseService.getPraise(m.getId());
                    for (Praise p: praiseList){
                        if (p.getUsr_id()==1){
                            praiseType=0;
                            break;
                        }
                    }
                    m.setPraiseType(praiseType);
                    m.setPraiseList(praiseList);
                }
            }
            moments.setList(momentList);
            request.setAttribute("moments",moments);

            request.getRequestDispatcher("/mainJsp/friendcircle.jsp").forward(request,response
            );

        }

    }
    @RequestMapping(value = "releaseNews.action")
    public void releaseNews(String songid, String text, MultipartFile imgFileUp,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Moment moment=new Moment();
        User user= (User) session.getAttribute("user");

        moment.setUser(user);
        moment.setTime(new Date());
        Song song=new Song();
        song.setId(Integer.parseInt(songid));


        moment.setSong(song);
        moment.setText(text);

        if(imgFileUp.getSize()!=0){
            String filename=System.currentTimeMillis()+imgFileUp.getOriginalFilename();
            String path="D://Hear//dongtai";
            String img=path+"/"+filename;
            File file=new File(img);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgFileUp.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            moment.setImg(filename);


        }
        momentService.insertMoment(moment);
        response.sendRedirect(request.getContextPath()+"/friend/friendcircle.action");



    }
    @Autowired
    private AllService allService;
    @RequestMapping(value = "searchallfriend.action",method = {RequestMethod.GET,RequestMethod.POST})

    public @ResponseBody List<Song> searchAllfriend(String content, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得歌曲
        List<Song> songs=allService.getSongsByNameForCircle(content);
        return songs;


//        allmap.put("songs",songs);
//        获得歌手
        /*List<Singer> singers=allService.getSingersByName(content);
        allmap.put("singers",singers);
//        获得专辑

        List<Album> albums=allService.getAlbumsByName(content);

        allmap.put("albums",albums);
//        获得歌单
        List<Songlist> songlists=allService.getSonglistsByName(content);
        allmap.put("songlists",songlists);
*/




    }


    @RequestMapping(value = "addComment.action")
    public @ResponseBody String addComment(String momentid,String content,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Comments comments=new Comments();
        comments.setMomentid(Integer.parseInt(momentid));
        comments.setContent(content);
        comments.setTime(new Date());
        User user= (User) session.getAttribute("user");

        comments.setUser2(user);
        if(momentService.insertComment(comments)){
            return  "1";
        }else {
            return "0";
        }
    }
    @RequestMapping(value = "addAnswer.action")
    public @ResponseBody String addAnswer(String momentid,String content,String upperid,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Comments comments=new Comments();
        comments.setMomentid(Integer.parseInt(momentid));
        comments.setContent(content);
        Comments upperComment=new Comments();
        upperComment.setId(Integer.parseInt(upperid));
        comments.setUpperComment(upperComment);
        comments.setTime(new Date());
        User user= (User) session.getAttribute("user");
        comments.setUser2(user);
        if(momentService.insertAnswer(comments)){
            return  "1";
        }else {
            return "0";
        }
    }

    @RequestMapping(value = "deleteMoment.action")
    public @ResponseBody String deleteMoment(String momentid,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(momentService.deleteMomentByMomentId(Integer.parseInt(momentid))){
            return  "1";
        }else {
            return "0";
        }
    }
    @RequestMapping(value = "deleteComment.action")
    public @ResponseBody String deleteComment(String commentid,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(momentService.deleteCommentByCommentId(Integer.parseInt(commentid))){
            return  "1";
        }else {
            return "0";
        }
    }
    @RequestMapping(value = "canclepraise.action",method = {RequestMethod.GET,RequestMethod.POST})
    public void canclepraise(String mid,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        List<Praise> praiseList=praiseService.getPraise(Integer.parseInt(mid));
        for (Praise p:praiseList){
            if (p.getUsr_id()==user.getId()){
                praiseService.deletePraise(p.getId());
                break;
            }
        }

    }

    @RequestMapping(value = "praise.action",method = {RequestMethod.GET,RequestMethod.POST})
    public void praise(String mid,HttpServletRequest request,HttpSession session, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) session.getAttribute("user");
        Praise praise=new Praise();
        praise.setMoment_id(Integer.parseInt(mid));
        praise.setUsr_id(user.getId());
        praiseService.insertPraise(praise);

    }
    @RequestMapping(value = "share.action")//Z
    public void shareSong(MultipartFile imgFileUp,HttpSession session,HttpServletRequest request, HttpServletResponse response,Moment moment) throws ServletException, IOException {
        String songid=request.getParameter("songid");
        String singerid=request.getParameter("singerid");
        String songlistid=request.getParameter("songlistid");

        Integer soid = Integer.parseInt(songid);
        Integer sid = Integer.parseInt(singerid);
        User user= (User) session.getAttribute("user");
        moment.setUser(user);
        moment.setTime(new Date());
        Song song=new Song();
        song.setId(soid);
        moment.setSong(song);

        if(imgFileUp.getSize()!=0){
            String filename=System.currentTimeMillis()+imgFileUp.getOriginalFilename();
            String path="D://Hear//dongtai";
            String img=path+"/"+filename;
            File file=new File(img);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgFileUp.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            moment.setImg(filename);
        }

        momentService.insertMoment(moment);

        request.getRequestDispatcher("/songlist/songlist.action?id="+songlistid).forward(request, response);

    }

    @RequestMapping(value = "shareBangdan.action")//Z
    public void shareBangdanSong(MultipartFile imgFileUp,HttpSession session,HttpServletRequest request, HttpServletResponse response,Moment moment) throws ServletException, IOException {
        String songid=request.getParameter("songid");
        String songlistid=request.getParameter("songlistid");

        Integer soid = Integer.parseInt(songid);
        User user= (User) session.getAttribute("user");
        moment.setUser(user);
        moment.setTime(new Date());
        Song song=new Song();
        song.setId(soid);
        moment.setSong(song);

        if(imgFileUp.getSize()!=0){
            String filename=System.currentTimeMillis()+imgFileUp.getOriginalFilename();
            String path="D://Hear//dongtai";
            String img=path+"/"+filename;
            File file=new File(img);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgFileUp.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            moment.setImg(filename);
        }

        momentService.insertMoment(moment);

        request.getRequestDispatcher("/bangdan.action").forward(request, response);

    }

    @RequestMapping(value = "shareAlbum.action")//Z
    public void shareAlbum(MultipartFile imgFileUp,HttpSession session,HttpServletRequest request, HttpServletResponse response,Moment moment) throws ServletException, IOException {
        String songid=request.getParameter("songid");
        String albumid=request.getParameter("albumid");

        Integer soid = Integer.parseInt(songid);
        User user= (User) session.getAttribute("user");
        moment.setUser(user);
        moment.setTime(new Date());
        Song song=new Song();
        song.setId(soid);
        moment.setSong(song);

        if(imgFileUp.getSize()!=0){
            String filename=System.currentTimeMillis()+imgFileUp.getOriginalFilename();
            String path="D://Hear//dongtai";
            String img=path+"/"+filename;
            File file=new File(img);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgFileUp.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            moment.setImg(filename);
        }

        momentService.insertMoment(moment);

        request.getRequestDispatcher("/album.action?id="+albumid).forward(request, response);

    }

    @RequestMapping(value = "shareSong.action")//Z
    public void sharSong(MultipartFile imgFileUp,HttpSession session,HttpServletRequest request, HttpServletResponse response,Moment moment) throws ServletException, IOException {
        String songid=request.getParameter("songid");
//        String albumid=request.getParameter("albumid");

        Integer soid = Integer.parseInt(songid);
        User user= (User) session.getAttribute("user");
        moment.setUser(user);
        moment.setTime(new Date());
        Song song=new Song();
        song.setId(soid);
        moment.setSong(song);

        if(imgFileUp.getSize()!=0){
            String filename=System.currentTimeMillis()+imgFileUp.getOriginalFilename();
            String path="D://Hear//dongtai";
            String img=path+"/"+filename;
            File file=new File(img);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgFileUp.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            moment.setImg(filename);
        }

        momentService.insertMoment(moment);

        request.getRequestDispatcher("/song.action?id="+soid).forward(request, response);

    }

    @RequestMapping(value = "releaseSong.action")
    public void releaseSong(MultipartFile imgFileUp,HttpSession session,HttpServletRequest request, HttpServletResponse response,Moment moment) throws ServletException, IOException {
        String songid=request.getParameter("songid");
        String singerid=request.getParameter("singerid");
        Integer soid = Integer.parseInt(songid);
        Integer sid = Integer.parseInt(singerid);
        User user= (User) session.getAttribute("user");
        moment.setUser(user);
        moment.setTime(new Date());
        Song song=new Song();
        song.setId(soid);
        moment.setSong(song);

        if(imgFileUp.getSize()!=0){
            String filename=System.currentTimeMillis()+imgFileUp.getOriginalFilename();
            String path="D://Hear//img";
            String img=path+"/"+filename;
            File file=new File(img);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgFileUp.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            moment.setImg(filename);
        }

        momentService.insertMoment(moment);
        request.getRequestDispatcher("/artist/singerhost.action?id="+sid).forward(request, response);

    }

}
