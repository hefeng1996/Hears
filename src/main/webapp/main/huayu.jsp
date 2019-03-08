<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<html>
<head>
    <title>华语</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="An open collection of menu styles that use the line as a creative design element" />
    <meta name="keywords" content="web design, styles, inspiration, line, pseudo-element, SVG, animation" />

    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/demo.css" />

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/component.css" />
    <style>

        #logo {
            position: absolute;
            left: 30px;
            width: 164px;
            height: 62px;


        }
        #ul{
            position: absolute;
            left: 190px;
            top: -5px;
        }
        a{
            text-decoration: none;
            color: black;
        }
        #tuijian1 img{
            width: 182px;
            height: 182px;
        }
        #tuijian1 p{
            margin-top: 5px;
        }
        #bangdan a{
            color: black;
        }
        #bangdan #tab2 tr{
            border-bottom: 1px solid #d2d2d2;
            height: 20px;
        }
        #bangdan #tab2 .td{
            padding-left:12px;
            width: 50px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/bootstrap.min.css">

    <script src="<%= basePath%>main/js/jquery.min.js"></script>
    <!-- /container -->
    <script src="<%= basePath%>main/js/classie.js"></script>
    <script src="<%= basePath%>main/js/clipboard.min.js"></script>
    <script src="<%= basePath%>main/js/nav.js"></script>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/time.css" />
    <script src="<%= basePath%>main/js/time.js"></script>
    <script src="<%= basePath%>main/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<%= basePath%>main/css/bootstrap1.min.css">
    <script src="<%= basePath%>main/js/jquery1.min.js"></script>
    <script src="<%= basePath%>main/js/bootstrap1.min.js"></script>
    <style type="text/css">
        .img1 img{
            transition: all 0.6s;
        }
        .img1 img:hover{-moz-transform: scale(1.1); -ms-transform: scale(1.1);-webkit-transform:scale(1.1);z-index: 6;}
    </style>
</head>
<body  style="background-color: #f5f5f5;">
<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;" >
        <img href="#"  id="logo" src="<%= basePath%>main/img/logo.png"></img>
        <ul class="menu__list" id="ul">
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>songlist/index.action'">推荐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>bangdan.action' " href="javascript:void(0) ">排行榜</a></li>
            <li class="menu__item menu__item--current" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>songlist/huayu.action?id=31' " href="javascript:void(0)">歌单</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>artist/recommendsinger.action' " >歌手</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link" onclick="window.location = '<%= basePath%>user/mysongs.action'">我的音乐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link" onclick="window.location='<%= basePath%>friend/friendcircle.action'">朋友</a></li>
            <div class="search d7">
                <form action="<%=basePath%>search/searchall.action" method="get">
                    <input type="text" placeholder="Hear..." name="content">
                    <button type="submit"><img src="<%= basePath%>main/img/1.jpg"/></button>
                </form>
            </div>
            <li class="menu__item" style="margin-left: -10px">
                <c:if test="${empty sessionScope.user}">
                    <a href="#" class="menu__link" onclick="window.location = '<%= basePath%>jsp/login.jsp' " >登录</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <a href="javascript:void(0)" style="position:relative;top: 10px;width: 80px;"onclick="window.location ='<%=basePath%>user/personalInformation.action' " ><img style="border-radius: 40px;width: 40px;height: 40px;display: inline;" src="<%= resourcesPath%>head/${sessionScope.user.img}" ></a>
                    <a href="#"  style="position:relative;top: 10px;width: 80px;color: #e3e3e3;margin-left: 10px" onclick="window.location ='<%=basePath%>user/logout.action'">退出</a>
                </c:if>
            </li>
        </ul>
    </nav>

</div>
<div style="height:1000px; background-color: white; border: 1px solid #cccccc;width: 980px; margin-left:190px; margin-right: 190px ;">
   <div style="margin: 40px; width: 900px;">
        <p style="float: left; font-size: xx-large">${tag}</p>
       <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" style="margin: 10px;height: 40px">
           <p style="font-color: blue">选择分类﹀</p> <%--<img style="margin-left: 10px" src="<%= basePath%>main/pic/2.jpg"/>--%>
       </button>
       <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                           &times;
                       </button>
                       <h4 class="modal-title" id="myModalLabel">
                           全部风格
                       </h4>
                   </div>
                   <div class="modal-body">
                       <table>
                           <tr>
                               <td style="border-bottom: 1px solid red"><img src="<%= basePath%>main/img/yu.png"></td>
                               <td style="border-bottom: 1px solid red">语种</td>
                               <td>
                                   <table>
                                       <tr>
                                           <td style="width: 50px;"> </td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px;margin-right: 10px;margin-left: 10px"><a  href="<%= basePath%>songlist/huayu.action?id=1" style="color: black;">华语</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=6" style="color: black;">欧美</a></td>
                                           <td style="width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=7" style="color: black;">日韩</a></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr>
                               <td style="border-bottom: 1px solid red"><img src="<%= basePath%>main/img/feng.png"></td>
                               <td style="border-bottom: 1px solid red">风格</td>
                               <td>
                                   <table>
                                       <tr>
                                           <td style="width: 50px;"> </td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=2" style="color: black;">流行</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=8" style="color: black;">摇滚</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=4" style="color: black;">民谣</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=3" style=" color: black;">古风</a></td>
                                           <td style=" width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=9" style="color: black;">轻音乐</a></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr>
                               <td style="border-bottom: 1px solid red"><img src="<%= basePath%>main/img/chang.png"></td>
                               <td style="border-bottom: 1px solid red">场景</td>
                               <td>
                                   <table>
                                       <tr>
                                           <td style="width: 50px;"> </td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px;"><a  href="<%= basePath%>songlist/huayu.action?id=5" style="color: black;">清晨</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=10" style="color: black;">夜晚</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=11" style="color: black;">学习</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=12" style="color: black;">工作</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=13" style="color: black;">午休</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a  href="<%= basePath%>songlist/huayu.action?id=14" style="color: black;">下午茶</a></td>
                                           <td style=" width: 50px"><a style="color: black;"  href="<%= basePath%>songlist/huayu.action?id=15">运动</a></td>

                                       </tr>
                                       <tr style="height: 8px"><td></td></tr>
                                       <tr >
                                           <td style="width: 50px;"> </td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=16" style="color: black;">散步</a></td>
                                           <td style=" width: 50px"><a style="color: black;" href="<%= basePath%>songlist/huayu.action?id=17">酒吧</a></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr>
                               <td style="border-bottom: 1px solid red"><img src="<%= basePath%>main/img/qing.png"></td>
                               <td style="border-bottom: 1px solid red">情感</td>
                               <td>
                                   <table>
                                       <tr>
                                           <td style="width: 50px;"> </td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px;"><a href="<%= basePath%>songlist/huayu.action?id=18" style="color: black;">怀旧</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=19" style="color: black;">清新</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=20" style="color: black;">安静</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=21" style="color: black;">伤感</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=22" style="color: black;">治愈</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=23" style="color: black;">思念</a></td>
                                           <td style=" width: 50px"><a style="color: black;" href="<%= basePath%>songlist/huayu.action?id=24">浪漫</a></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                           <tr>
                               <td><img src="<%= basePath%>main/img/zhu.png"></td>
                               <td>主题</td>
                               <td>
                                   <table>
                                       <tr>
                                           <td style="width: 50px;"> </td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px;"><a href="<%= basePath%>songlist/huayu.action?id=25" style="color: black;">80后</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=26" style="color: black;">90后</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=27" style="color: black;">00后</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=28" style="color: black;">经典</a></td>
                                           <td style="border-right: 1px solid #e5e5e5;width: 50px"><a href="<%= basePath%>songlist/huayu.action?id=29" style="color: black;">翻唱</a></td>
                                           <td style=" width: 50px"><a style="color: black;" href="<%= basePath%>songlist/huayu.action?id=30">吉他</a></td>
                                       </tr>
                                   </table>
                               </td>
                           </tr>
                       </table>
                   </div>

               </div><!-- /.modal-content -->
           </div><!-- /.modal -->
       </div>

        <div style="height: 2px; border: 1px solid red;width: 100%; margin-top: 10px"></div>
        <div class="img1" id="tuijian1" style="margin-top: 40px;  width: 100%;">
            <c:forEach items="${chinaSonglist}" var="china">
                <a style="float: left; color: black;height: 205px;width: 180px" href="<%= basePath%>songlist/songlist.action?id=${china.id}" >
                    <c:if test="${not empty china.img}">
                    <img  src="<%= resourcesPath%>images/200songlist/${china.img}" />
                    </c:if>
                    <c:if test="${empty china.img}">
                        <img src="<%=basePath%>images/default.jpg"
                    </c:if>
                    <p >${china.name}</p></a>
            </c:forEach>
        </div>
   </div>
</div>
<div style="width: 100%; height: 100px; margin-top: 30px;"></div>
</body>
</html>
