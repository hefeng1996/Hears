package com.hear.control;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.hear.dao.SonglistMapper;
import com.hear.entity.*;
import com.hear.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.naming.Name;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserControl {
    @Autowired
    private UserService userService;
    @Autowired
    private MomentService momentService;
    @Autowired
    private RelationService relationService;
    @Autowired
    private PlayrecordService playrecordService;
    @Autowired
    private SonglistService songlistService;
    @Autowired
    private MySingerService mySingerService;
    @Autowired
    private AlbumService albumSerivce;
    @Autowired
    private SongSonglistLinkService songSonglistLinkService;
    @Autowired
    private TagService tagService;
    @Autowired
    private UserTagService userTagService;
    @Autowired
    private PraiseService praiseService;
    /*登录等问题处理*/
    @RequestMapping(value = "/login.action",method = RequestMethod.POST)
    public void loginSuccess (HttpServletRequest request,HttpServletResponse response,String userName,String password,HttpSession session){
        User user=null;
        user=userService.userLogin(userName);
        String checkbox=request.getParameter("checkbox");
        if(user!=null&&user.getPassword().equals(password)){
            if("1".equals(checkbox)){
                boolean flag=false;
                Cookie[] cookies=request.getCookies();
                for(Cookie c:cookies){
                    String [] pass= c.getValue().split("-");
                    if("userInfo".equals(c.getName())&&!password.equals(pass[1])){
                        flag=true;
                    }else{
                        flag=false;
                    }
                }
                if(!flag){
                    Cookie cookie=new Cookie("userInfo",userName+"-"+password);
                    cookie.setMaxAge(60*60*24*7);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
            session.setAttribute("user",user);
            try {
                response.sendRedirect(request.getContextPath()+"/user/personalInformation.action");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.sendRedirect(request.getContextPath()+"/jsp/login.jsp?flag=2");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
//退出登录
    @RequestMapping(value = "logout.action")
    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession(false);
        session.removeAttribute("user");
        response.sendRedirect(request.getContextPath()+"/songlist/index.action");
    }

    /*注册用户名ajax查询*/
    @RequestMapping(value = "/findUserName.action",method = RequestMethod.POST)
    public @ResponseBody String  findUserName(HttpServletRequest request, HttpServletResponse response, String username){
        User user=null;
        user=userService.userLogin(username);
        if(user==null){
            return "1";
        }else{
            return "2";
        }

    }

    /*用户注册*/
    @RequestMapping(value = "/register.action",method = RequestMethod.POST)
    public void registerSuccess(HttpServletRequest request,HttpServletResponse response,String username,String password,String tel,HttpSession session){
        User user=new User();
        user.setName(username);
        user.setPassword(password);
        user.setTel(tel);
        user.setRegisttime(new Date());
        boolean flag=userService.userRegister(user);
        if(flag){
            try {
                User u=userService.userLogin(username);
                session.setAttribute("user",u);
                response.sendRedirect(request.getContextPath()+"/user/tag.action");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /*个人信息标签查询*/
    @RequestMapping(value = "/tag.action",method = RequestMethod.GET)
    public void tag(HttpServletRequest request,HttpServletResponse response,HttpSession session){
        List<Tag> tags=tagService.selectAllTag();
        request.setAttribute("tags",tags);
        User user= (User) session.getAttribute("user");
        List<UserTag> userTags=userTagService.selectTagByUserId(user.getId());

        request.setAttribute("userTags",userTags);
        try {
            request.getRequestDispatcher("/jsp/informationEditing.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*修改信息*/
    @RequestMapping(value = "/modify.action",method = RequestMethod.POST)
    public void updateMessage(String [] checkbox,String usercity,String userprovince,String P1,String C1,String nicheng, String introduce, String sex, String tel, String birthday, MultipartFile imgup, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
        User user=null;
        user= (User) session.getAttribute("user");
        user.setNicheng(nicheng);
        if("男".equals(sex)){
            user.setSex(1);
        }else if("女".equals(sex)){
            user.setSex(0);
        }
        if(!"".equals(tel)){
            user.setTel(tel);
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date data = formatter.parse(birthday);
        user.setBirthday(data);
        if(!"".equals(P1)){
            user.setProvince(P1);
            user.setCity(C1);
        }else {
            user.setProvince(userprovince);
            user.setCity(usercity);
        }
        if(!"".equals(introduce)){
            user.setIntroduce(introduce);
        }
        if(imgup!=null&&!"".equals(imgup.getOriginalFilename())){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
            String date=sdf.format(new Date());
            String filename=date+imgup.getOriginalFilename();
            String path="D:/Hear/head";
            String img=path+"/"+filename;
            File file=new File(img);
            user.setImg(filename);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgup.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        boolean flag=userService.updateMessage(user,checkbox);
        if(flag){
            session.removeAttribute("user");
            session.setAttribute("user",user);
            try {
                response.sendRedirect(request.getContextPath()+"/user/personalInformation.action");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /*密码修改*/
    @RequestMapping(value = "/updatePassword.action",method = RequestMethod.POST)
    public void updatePassword(String confirmpassword,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
        User user = (User) session.getAttribute("user");
        user.setPassword(confirmpassword);
        boolean flag = userService.updatePassword(user);
        if (flag) {
            try {
                session.removeAttribute("user");
                response.sendRedirect(request.getContextPath()+("/jsp/login.jsp"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.sendRedirect(request.getContextPath()+("/jsp/login.jsp"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /*个人中心*/
    @RequestMapping(value = "/personalInformation.action",method = RequestMethod.GET)
    public void personalInformation(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User u= (User) session.getAttribute("user");
        int userid=0;
        if(!"".equals(id)&&id!=null){
            userid=Integer.parseInt(id);
        }else{
            userid=u.getId();
        }
        User user=userService.selectUserById(userid);
        List<Moment> moments=momentService.selectMomentsByUserId(userid);
        List<Relation> relations13=relationService.selectRelationByUserId13(userid);
        List<Relation> relations23=relationService.selectRelationByUserId23(userid);
        if(u!=null){
            List<Relation> relationsmy=relationService.selectRelationByUserId13(u.getId());
            int flag = 0;
            if(!"".equals(id)&&id!=null){
                for(Relation r:relationsmy){
                    System.out.println(Integer.parseInt(id)+"--"+r.getUserBy_id());
                    if(Integer.parseInt(id)==r.getUserBy_id()) {
                        flag = 1;
                        break;
                    }
                }
            }
            request.setAttribute("flag", flag);
        }

        List<Playrecord> playrecord5=playrecordService.selectPlayreCord5(userid);
        List<Playrecord> playrecord20=playrecordService.selectPlayreCord20(userid);
        int playcount=playrecordService.selectPlayreCordCount(userid);
        List<Songlist> songlists=songlistService.selectSonglistByUserId(userid);
        List<Songlist> songlikelists=songlistService.selectSonglistlikeByUserId(userid);

        request.setAttribute("user",user);
        request.setAttribute("id",id);
        request.setAttribute("songlikelists",songlikelists);
        request.setAttribute("songlists",songlists);
        request.setAttribute("playcount",playcount);
        request.setAttribute("playrecord5",playrecord5);
        request.setAttribute("playrecord20",playrecord20);
        request.setAttribute("moments",moments);
        request.setAttribute("attention",relations13);
        request.setAttribute("fans",relations23);


        try {
            request.getRequestDispatcher("/jsp/personal.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*ajax关注*/
    @RequestMapping(value = "/personalattention.action",method = RequestMethod.POST)
    public void personalattention(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User user= (User) session.getAttribute("user");
        relationService.removeRelation(user.getId(),Integer.parseInt(id));
        relationService.addrelation(user.getId(),Integer.parseInt(id));

    }
    /*ajax取消关注*/
    @RequestMapping(value = "/removepersonalattention.action",method = RequestMethod.POST)
    public void removepersonalattention(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User user= (User) session.getAttribute("user");
        relationService.removeRelation(user.getId(),Integer.parseInt(id));
    }


    /*播放记录*/
    @RequestMapping(value = "/playrecord.action",method = RequestMethod.GET)
    public void playrecord(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User u= (User) session.getAttribute("user");
        int userid=0;

        if(!"".equals(id)&&id!=null){
            userid=Integer.parseInt(id);
        }else{
            userid=u.getId();
        }

        List<Playrecord> playrecords20=playrecordService.selectPlayreCord20(userid);
        request.setAttribute("playrecords20",playrecords20);
        int playcount=playrecordService.selectPlayreCordCount(userid);
        request.setAttribute("playcount",playcount);
        List<Playrecord> playrecordsAll=playrecordService.selectPlayreCordAll(userid);
        System.out.println(playrecordsAll.size());
        request.setAttribute("playrecordsAll",playrecordsAll);
        try {
            request.getRequestDispatcher("/jsp/listofsongs.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*粉丝*/
    @RequestMapping(value = "/fans.action",method = RequestMethod.GET)
    public void fans(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User u= (User) session.getAttribute("user");
        int userid=0;

        if(!"".equals(id)&&id!=null){
            userid=Integer.parseInt(id);
        }else{
            userid=u.getId();
        }
        User user=userService.selectUserById(userid);
        List<Moment> moments=momentService.selectMomentsByUserId(userid);
        List<Relation> attention=relationService.selectRelationByUserId13(userid);
        List<Relation> fans=relationService.selectFansByUserId23(userid);
        for(Relation r:fans){
            List<Moment> fanmoment=momentService.selectMomentsByUserId(r.getUserbyId().getId());
            r.getUserbyId().setMoment(fanmoment.size());
            List<Relation> fanattention=relationService.selectRelationByUserId13(r.getUserbyId().getId());
            r.getUserbyId().setAttention(fanattention.size());
            List<Relation> fanfans=relationService.selectRelationByUserId23(r.getUserbyId().getId());
            r.getUserbyId().setFans(fanfans.size());
        }
        request.setAttribute("id",id);
        request.setAttribute("fans",fans);
        request.setAttribute("attention",attention);
        request.setAttribute("moments",moments);
        request.setAttribute("user",user);
        List<Relation> attentions=relationService.selectAttentionByUserId13(userid);
        for(Relation a:attentions){
            List<Moment> attentionsmoment=momentService.selectMomentsByUserId(a.getUserbyId().getId());
            a.getUserbyId().setMoment(attentionsmoment.size());
            List<Relation> attentionsattention=relationService.selectRelationByUserId13(a.getUserbyId().getId());
            a.getUserbyId().setAttention(attentionsattention.size());
            List<Relation> attentionsfans=relationService.selectRelationByUserId23(a.getUserbyId().getId());
            a.getUserbyId().setFans(attentionsfans.size());
        }
        request.setAttribute("attentions",attentions);


        try {
            request.getRequestDispatcher("/jsp/fans.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*关注*/
    @RequestMapping(value = "/attention.action",method = RequestMethod.GET)
    public void attention(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User u= (User) session.getAttribute("user");
        int userid=0;

        if(!"".equals(id)&&id!=null){
            userid=Integer.parseInt(id);
        }else{
            userid=u.getId();
        }
        User user=userService.selectUserById(userid);
        List<Moment> moments=momentService.selectMomentsByUserId(userid);
        List<Relation> attention=relationService.selectRelationByUserId13(userid);
        List<Relation> fans=relationService.selectFansByUserId23(userid);
        request.setAttribute("id",id);
        request.setAttribute("fans",fans);
        request.setAttribute("attention",attention);
        request.setAttribute("moments",moments);
        request.setAttribute("user",user);
        List<Relation> attentions=relationService.selectAttentionByUserId13(userid);
        for(Relation a:attentions){
            List<Moment> attentionsmoment=momentService.selectMomentsByUserId(a.getUserbyId().getId());
            a.getUserbyId().setMoment(attentionsmoment.size());
            List<Relation> attentionsattention=relationService.selectRelationByUserId13(a.getUserbyId().getId());
            a.getUserbyId().setAttention(attentionsattention.size());
            List<Relation> attentionsfans=relationService.selectRelationByUserId23(a.getUserbyId().getId());
            a.getUserbyId().setFans(attentionsfans.size());
        }
        request.setAttribute("attentions",attentions);

        try {
            request.getRequestDispatcher("/jsp/concern.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*关注ajax事件*/
    @RequestMapping(value = "attention.action",method = RequestMethod.POST)
    public @ResponseBody String attention(HttpSession session,int userId,HttpServletRequest request,HttpServletResponse response ){
        User user= (User) session.getAttribute("user");
        relationService.updateAttention(user.getId(),userId);
        List<Relation> attention=relationService.selectRelationByUserId13(user.getId());
        return  attention.size()+"";
    }

    /*取消关注ajax事件*/
    @RequestMapping(value = "removeattention.action",method = RequestMethod.POST)
    public @ResponseBody String removeattention(HttpSession session,int userId,HttpServletRequest request,HttpServletResponse response ){
        User user= (User) session.getAttribute("user");
        relationService.updateremoveAttention(user.getId(),userId);
        List<Relation> attention=relationService.selectRelationByUserId13(user.getId());
        return  attention.size()+"";
    }

    @RequestMapping(value = "dynamio.action",method = RequestMethod.POST)
    public void dynamic(HttpSession session,HttpServletRequest request,HttpServletResponse response){
        User user= (User) session.getAttribute("user");
        List<Moment> moments=momentService.selectMomentsByUserId(user.getId());
        List<Relation> attention=relationService.selectRelationByUserId13(user.getId());
        List<Relation> fans=relationService.selectFansByUserId23(user.getId());

        request.setAttribute("fans",fans);
        request.setAttribute("attention",attention);
        request.setAttribute("moments",moments);

        try {
            request.getRequestDispatcher("/jsp/concern.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*我的歌单*/
    @RequestMapping(value = "mysongs.action",method = RequestMethod.GET)
    public  void mySongs(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
        User user= (User) session.getAttribute("user");
        if(user==null ){
            response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
            return;
        }
        List<MySinger> mySingers=mySingerService.selectMySingerByUserId(user.getId());
        for(MySinger mySinger:mySingers){
            List<Album> album=albumSerivce.selectAlbumBySingerId(mySinger.getSinger().getId());
            mySinger.getSinger().setAlbumcount(album.size());
        }
        request.setAttribute("mySingers",mySingers);

        List<Songlist> songlist=songlistService.selectSonglistByUserId(user.getId());
        for(Songlist list:songlist){
            List<SongSonglistLink> songs=songSonglistLinkService.selectSonglistAndSongByListId(list.getId());
            List<Song> s=new ArrayList<>();
            for(SongSonglistLink song:songs){
                s.add(song.getSong());
            }
            list.setSongs(s);
        }
        request.setAttribute("songlist",songlist);

        //收藏歌单
        List<Songlist> likesonglist=songlistService.selectSonglistlikeByUserId(user.getId());
        for(Songlist list:likesonglist){
            List<SongSonglistLink> songs=songSonglistLinkService.selectSonglistAndSongByListId(list.getId());
            List<Song> s=new ArrayList<>();
            for(SongSonglistLink song:songs){
                s.add(song.getSong());
            }
            list.setSongs(s);
        }
        request.setAttribute("likesonglist",likesonglist);

        List<Tag> tags=tagService.selectAllTag();
        request.setAttribute("tags",tags);

        try {
            request.getRequestDispatcher("/mainJsp/mysongs.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*歌单创建*/
    @RequestMapping(value = "createsonglist.action",method = RequestMethod.POST)
    public void insertSongList(HttpSession session,HttpServletRequest request,HttpServletResponse response,String listname,String [] checkbox,String introduce,MultipartFile imgup){
        User user= (User) session.getAttribute("user");
        Songlist songlist=new Songlist();
        songlist.setUserId(user.getId());
        songlist.setName(listname);
        songlist.setCreatetime(new Date());
        songlist.setIntroduce(introduce);

        if(imgup!=null&&!"".equals(imgup.getOriginalFilename())){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
            String date=sdf.format(new Date());
            String filename=date+imgup.getOriginalFilename();
            String path="D://Hear//images//200songlist";
            String img=path+"/"+filename;
            File file=new File(img);
            songlist.setImg(filename);
            if(!file.exists()){
                file.mkdirs();
            }else{
                file.delete();
                file.mkdirs();
            }
            try {
                imgup.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            songlist.setImg("");
        }
        songlistService.insertSonglist(songlist,checkbox);

        try {
            response.sendRedirect(request.getContextPath()+("/user/mysongs.action"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*歌单删除*/
    @RequestMapping(value = "removesonglist.action",method = RequestMethod.GET)
    public void removeSongList(String songlistId,HttpServletRequest request,HttpServletResponse response){
        songlistService.removesonglistBySonglistId(Integer.parseInt(songlistId));
        try {
            response.sendRedirect(request.getContextPath()+("/user/mysongs.action"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*删除歌单里面的歌*/
    @RequestMapping(value = "removesong.action",method = RequestMethod.POST)
    public  void removeSong(HttpServletRequest request,HttpServletResponse response,String songlistId,String songId){
        System.out.println(songlistId+"++"+songId);
        songSonglistLinkService.removesongBySongIdAndSonglistId(Integer.parseInt(songlistId),Integer.parseInt(songId));
    }

    @RequestMapping(value = "/personalmoments.action",method = RequestMethod.GET)

    public void personalmoments(String id,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        User u= (User) session.getAttribute("user");
        int userid=0;
        if(!"".equals(id)&&id!=null){
            userid=Integer.parseInt(id);
        }else{
            userid=u.getId();
        }
        User user=userService.selectUserById(userid);

        List<Relation> relations13=relationService.selectRelationByUserId13(userid);
        List<Relation> relations23=relationService.selectRelationByUserId23(userid);
        if(u!=null){
            List<Relation> relationsmy=relationService.selectRelationByUserId13(u.getId());
            int flag = 0;
            if(!"".equals(id)&&id!=null){
                for(Relation r:relationsmy){
                    System.out.println(Integer.parseInt(id)+"--"+r.getUserBy_id());
                    if(Integer.parseInt(id)==r.getUserBy_id()) {
                        flag = 1;
                        break;
                    }
                }
            }
            request.setAttribute("flag", flag);

        }
        List<Moment> moments=momentService.selectMyMomentsByMyId(userid);
        if(moments!=null){
            for(Moment m:moments){
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

        request.setAttribute("moments",moments);

        request.setAttribute("user",user);
        request.setAttribute("attention",relations13);
        request.setAttribute("fans",relations23);
        request.getRequestDispatcher("/jsp/personalDynamics.jsp").forward(request,response);
    }

}