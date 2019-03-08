package com.hear.control;

import com.hear.entity.Admin;
import com.hear.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/admin")
@Controller
public class AdminControl {
    @Autowired
    private AdminService adminService;
    @RequestMapping(value ="/login.action",method = RequestMethod.POST)
    public void login(String name, String password, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        name=request.getParameter("admin");
        password=request.getParameter("password");
        int info=1;
        Admin admin=adminService.adminLogin(name);
        if(admin != null){
            //管理员存在
            if(admin.getPassword().equals(password)){
                //密码正确
                response.sendRedirect(request.getContextPath()+"/HearManager/index.jsp");
            }else {
                //密码不正确
                info=2;
                request.setAttribute("info",info);
                response.sendRedirect(request.getContextPath()+"/HearManager/login.jsp?info=2");
            }
        }else {
            //用户名不存在
            info=1;
            request.setAttribute("info",info);
            response.sendRedirect(request.getContextPath()+"/HearManager/login.jsp?info=1");
        }

    }
}
