package com.hear.control;

import com.github.pagehelper.PageInfo;
import com.hear.entity.*;
import com.hear.service.AllService;
import com.hear.service.MomentService;
import com.hear.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/search")
@Controller
public class AllControl {
    @Autowired
    private AllService allService;
    @Autowired
    private RelationService relationService;
    @RequestMapping(value = "searchall.action",method = {RequestMethod.GET,RequestMethod.POST})
    public  void searchAll(String content, String scurPage, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,Object> map=new HashMap<>();
        Integer pageSize=20;
        Integer curPage=1;

        if (scurPage!=null&&!scurPage.trim().equals("")){

            curPage=Integer.parseInt(scurPage);
        }
        map.put("curPage",curPage);
        map.put("pageSize",pageSize);
        map.put("content",content);
        PageInfo<Song> songs=allService.getSongsByName(map);

        response.setCharacterEncoding("utf-8");
        request.setAttribute("content",content);
//        获得单曲
        request.setAttribute("songs",songs);
//        获得歌手
        List<Singer> singers=allService.getSingersByName(content);
        request.setAttribute("singers",singers);
//        获得专辑
        List<Album> albums=allService.getAlbumsByName(content);
        request.setAttribute("albums",albums);
//        获得歌单
        List<Songlist> songlists=allService.getSonglistsByName(content);
        request.setAttribute("songlists",songlists);
//        获得用户
        List<User> users=allService.getUsersByName(content);
        User user= (User) session.getAttribute("user");
        if(user!=null){
            List<Relation> relationsmy=relationService.selectRelationByUserId13(user.getId());

            for (User u: users) {
                int flag = 0;
                for (Relation r : relationsmy) {
                    if (u.getId() == r.getUserBy_id()) {
                        flag = 1;
                        break;
                    }
                }
                u.setFlag(flag);
            }
        }
        request.setAttribute("users",users);
        request.getRequestDispatcher("/jsp/search.jsp").forward(request,response);

    }

}
