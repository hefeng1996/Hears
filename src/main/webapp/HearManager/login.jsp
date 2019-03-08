<%--
  Created by IntelliJ IDEA.
  User: 挪威的秘密
  Date: 2018/6/23
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hear-管理登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>HearManager/css/font.css">
    <link rel="stylesheet" href="<%=basePath%>HearManager/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=basePath%>HearManager/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=basePath%>HearManager/js/xadmin.js"></script>

</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">Hear-管理登录</div>
    <div id="darkbannerwrap"></div>
    <c:if test="${info == 1 }">
        <span style='color:red'>用户名不存在</span>
    </c:if>
    <c:if test="${info == 2 }">
        <span style='color:red'>密码错误</span>
    </c:if>

    <form method="post" class="layui-form" >
        <input name="admin" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
</div>

<script>
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            var name=$("#admin").val();
            var password=$("#password").val();


            form.on('submit(login)', function(info){
                if(info==1){
                    layer.msg("用户名不存在！",function(){
                        location.href='<%=basePath%>HearManager/login.jsp'
                    });
                }else if(info==2){
                    layer.msg("密码错误！",function(){
                        location.href='<%=basePath%>HearManager/login.jsp'
                    });
                }else{
                layer.msg("登录成功！",function(){
                    location.href='<%=basePath%>HearManager/index.jsp'
                });
                }
                return false;
            });
        });
    })


</script>


</body>
</html>