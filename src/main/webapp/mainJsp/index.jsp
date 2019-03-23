<%--
  Created by IntelliJ IDEA.
  User: 1725
  Date: 2019/3/10
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Hear</title>
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
    <link rel="stylesheet" href="<%= basePath%>singerhost/playercss/mplayer.css">
    <%--<link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/tab.css">--%>
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
            width: 133px;
            height: 133px;
        }
        #tuijian1 p{
            margin-top: 5px;
        }
        #bangdan a{
            color: black;
        }
        #bangdan .tab2 tr{
            position: relative;
            border-bottom: 1px solid #d2d2d2;
            height: 20px;
        }
        #bangdan .tab2 .td{
            padding-left:12px;
            width:50px;
        }
        .songtimebg{
            display: none;
            position: relative;
            float: right;
            width: 60px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/ft-carouse1.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/lunbo2.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/time.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/shcss/singerhost.css">
    <script src="<%= basePath%>main/js/jquery.min.js"></script>
    <!-- /container -->
    <script src="<%= basePath%>main/js/classie.js"></script>
    <script src="<%= basePath%>main/js/clipboard.min.js"></script>
    <script src="<%= basePath%>main/js/nav.js"></script>
    <script src="<%= basePath%>main/js/ft-carouse1.min.js"></script>

    <script src="<%= basePath%>main/js/time.js"></script>
    <script src="<%= basePath%>main/js/bootstrap.min.js"></script>
    <script src="<%= basePath%>main/js/lunbo2.js"></script>
    <style type="text/css">
        .img1 img{
            transition: all 0.6s;
        }
        .img1 img:hover{-moz-transform: scale(1.1); -ms-transform: scale(1.1);-webkit-transform:scale(1.1);z-index: 6;}
    </style>
</head>
<body style="background-color: #f5f5f5">
</div>
<div style="height: 4px; background-color: #d94f5c;"></div>
<div class="example" style="margin: 0 auto">
    <div class="ft-carousel" id="carousel_1">
        <ul class="carousel-inner">
            <li class="carousel-item"><img src="<%= basePath%>main/img/22.jpg" /></li>
            <li class="carousel-item"><img src="<%= basePath%>main/img/24.jpg" /></li>
            <li class="carousel-item"><img src="<%= basePath%>main/img/21.jpg" /></li>
            <li class="carousel-item"><img src="<%= basePath%>main/img/19.jpg" /></li>
            <li class="carousel-item"><img src="<%= basePath%>main/img/17.jpg" /></li>
            <li class="carousel-item"><img src="<%= basePath%>main/img/26.jpg" /></li>
        </ul>
    </div>
</div>
<script type="text/javascript">
    $("#carousel_1").FtCarousel();
</script>
<div class="container" style="background-color: white;">
    <div id="remen">
        <a href="#" ><img style="margin-left: 20px; margin-top: 30px;" src="<%= basePath%>main/img/31.jpg"/></a>
        <div class="btn-toolbar" role="toolbar" style="margin-left: 120px; margin-top: -25px;">
            <div class="btn-group">
                <a href="<%= basePath%>songlist/huayu.action?id=1" type="button" class="btn btn-default" style="border: none; background: none;">华语</a>
                <a href="<%= basePath%>songlist/huayu.action?id=2" type="button" class="btn btn-default" style="border: none; background: none;">流行</a>
                <a href="<%= basePath%>songlist/huayu.action?id=3" type="button" class="btn btn-default" style="border: none; background: none;">古风</a>
                <a href="<%= basePath%>songlist/huayu.action?id=4" type="button" class="btn btn-default" style="border: none; background: none;">民谣</a>
                <a href="<%= basePath%>songlist/huayu.action?id=5" type="button" class="btn btn-default" style="border: none; background: none;">清晨</a>
            </div>
            <a href="<%= basePath%>songlist/huayu.action?id=31"><img style="float: right; margin-right: 20px; margin-top: 3px;" src="<%= basePath%>main/img/32.jpg" /></a>
        </div>
        <div style="height: 2px; background-color: red;"></div>
        <div class="img1" id="tuijian1" style="margin-top: 20px;  width: 100%; height:180px;">
            <c:forEach items="${showSonglist}" var="songlist" begin="0" end="5">
                <a href="<%= basePath%>/songlist/songlist.action?id=${songlist.id}"style="float: left; color: black;"><img style="margin-left: 50px;"  src="<%= resourcesPath%>images/200songlist/${songlist.img}" /><p style="margin-left: 50px; width: 130px">${songlist.name}</p></a>
            </c:forEach>
        </div>
    </div>
    <div id="geshou">
        <a href="<%=basePath%>artist/recommendsinger.action"><img style="margin-left: 20px; margin-top: 30px;" src="<%= basePath%>main/img/33.jpg"/></a>
        <a href="<%=basePath%>artist/recommendsinger.action"><img style="float: right; margin-right: 20px; margin-top: 30px;" src="<%= basePath%>main/img/32.jpg" /></a>
        <div style="height: 2px; background-color: red;"></div>
        <div class="img1" id="tuijian1" style="margin-top: 20px;  width: 100%; height:180px;">
            <c:forEach items="${myslist1}" var="singer" begin="0" end="9">
                <a href="<%= basePath%>artist/singerhost.action?id=${singer.id}" style="float: left; color: black;"><img style="margin-left: 50px;"  src="<%= resourcesPath%>images/100singer/${singer.img}" /><p style="margin-left: 50px;">${singer.name}</p></a>
            </c:forEach>
        </div>
    </div>
    <div id="tuijian" style="height: 400px;">
        <a href="#"><img style="margin-left: 20px; margin-top: 30px;" src="<%= basePath%>main/img/34.jpg"/></a>
        <div style="height: 2px; background-color: red;"></div>
        <div class="box" id="clock" style="margin-left: 10px;margin-top: 20px; float: left;">
            <!-- 原点 -->
            <div class="origin"></div>
            <!-- 时钟数 -->
            <div class="dot_box">
                <div class="dot">6</div>
                <div class="dot">5</div>
                <div class="dot">4</div>
                <div class="dot">3</div>
                <div class="dot">2</div>
                <div class="dot">1</div>
                <div class="dot">12</div>
                <div class="dot">11</div>
                <div class="dot">10</div>
                <div class="dot">9</div>
                <div class="dot">8</div>
                <div class="dot">7</div>
            </div>
            <!-- 时、分、秒针 -->
            <div class="clock_line hour_line" id="hour_line"></div>
            <div class="clock_line minute_line" id="minute_line"></div>
            <div class="clock_line second_line" id="second_line"></div>
            <!-- 日期 -->
            <div class="date_info" id="date_info"></div>
            <!-- 时间 -->
            <div class="time_info" >
                <div class="time" id="hour_time"></div>
                <div class="time" id="minute_time"></div>
                <div class="time" id="second_time"></div>
            </div>
        </div>
        <div class="img1" id="tuijian1" style="margin-top: 60px;  width: 100%; height:180px;">
            <c:forEach items="${showSonglist}" var="songlist" begin="1" end="4">
                <a href="<%= basePath%>/songlist/songlist.action?id=${songlist.id}" style="float: left; color: black;"><img style="margin-left: 50px;"  src="<%= resourcesPath%>images/200songlist/${songlist.img}" /><p style="margin-left: 50px; width: 130px">${songlist.name}</p></a>
            </c:forEach>
        </div>
    </div>
    <div id="xindie" >
        <a href="#"><img style="margin-left: 20px; margin-top: 30px;" src="<%= basePath%>main/img/35.jpg"/></a>
        <div style="height: 2px; background-color: red;"></div>
        <div style="background-color: #f5f5f5; border: 1px solid #d2d2d2; width:930px; height: 250px; margin-left: 20px; margin-top: 20px;">
            <div id="" class="slide_div">
                <div id="slide_img_div">
                    <div class="img1">
                        <ul class="slide_img_ul" style="margin-top: 20px;">
                            <li>
                                <c:forEach items="${newalbum}" var="album" begin="0" end="4">
                                    <a href="<%=basePath%>album.action?id=${album.id}" style="float: left; color: black;"><img style="margin-left: 40px;"  src="<%= resourcesPath%>images/200album/${album.img}" /><p style="margin-left: 50px;">${album.name}</p></a>
                                </c:forEach>
                            </li>
                            <li>
                                <c:forEach items="${newalbum}" var="album" begin="5" end="9">
                                    <a href="<%=basePath%>album.action?id=${album.id}" style="float: left; color: black;"><img style="margin-left: 40px;"  src="<%= resourcesPath%>images/200album/${album.img}" /><p style="margin-left: 50px;">${album.name}</p></a>
                                </c:forEach>
                            </li>
                        </ul>
                        <ul class="slide_option">
                            <li class="check_li"></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="bangdan" style="padding-bottom: 30px;">
        <a href="#"><img style="margin-left: 20px; margin-top: 30px;" src="<%= basePath%>main/img/36.jpg"/></a>
        <a href="<%= basePath%>bangdan.action"><img style="float: right; margin-right: 20px; margin-top: 27px;" src="<%= basePath%>main/img/32.jpg" /></a>
        <div style="height: 2px; background-color: red;"></div>
        <div style="height: 605px; width: 930px; border: 1px solid #d2d2d2; margin-left: 25px; margin-top: 30px; background-color: #f4f4f4;">
            <table style="width: 930px; height: 205px; border: 1px solid #d2d2d2;">
                <tr style="border-bottom: 1px solid #d2d2d2;">
                    <td><img style="margin:25px; " src="<%= basePath%>main/img/4.jpg"/></td>
                    <td style="width: 120px;border-right: 1px solid #d2d2d2;"><a style="font-size: larger;">H音乐</br>热歌榜</a></td>

                    <td><img style="margin: 25px; " src="<%= basePath%>main/img/3.jpg"/></td>
                    <td style="width: 120px;border-right: 1px solid #d2d2d2;"><a style="font-size: larger;">H音乐</br>新歌榜</a></td>

                    <td><img style="margin: 25px; " src="<%= basePath%>main/img/2.jpg"/></td>
                    <td style="width: 120px;border-right: 1px solid #d2d2d2;"><a style="font-size: larger;">H音乐</br>原创榜</a></td>
                </tr>
            </table>
            <table id="tab1" class="tab2" style="width:310px; height: 400px;border: 1px solid #d2d2d2; float: left;">
                <c:forEach items="${hotSong}" var="song" begin="0" end="9" varStatus="s">
                    <tr >
                        <c:if test="${s.count<4}" >
                            <td class="td"  style="color: red;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>

                        </c:if>
                        <c:if test="${s.count>3}">
                            <td class="td"  style="color: black;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                <tr>
                    <td class="td"></td>
                    <td style="float: right; margin-right: 10px; margin-top: 10px;"><a href="<%= basePath%>bangdan.action">查看全部></a></td>
                </tr>
            </table>
            <table  id="tab2" class="tab2" style="width:309px; height: 400px;border: 1px solid #d2d2d2; float: left;">
                <c:forEach items="${newSong}" var="song" begin="0" end="9" varStatus="s">
                    <tr >
                        <c:if test="${s.count<4}" >
                            <td class="td"  style="color: red;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${s.count>3}">
                            <td class="td"  style="color: black;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                <tr>
                    <td class="td"></td>
                    <td style="float: right; margin-right: 10px; margin-top: 10px;"><a href="<%= basePath%>bangdan.action">查看全部></a></td>
                </tr>
            </table>
            <table  id="tab3" class="tab2" style="width:309px; height: 400px;border: 1px solid #d2d2d2;">
                <c:forEach items="${mySong}" var="song" begin="0" end="9" varStatus="s">
                    <tr >
                        <c:if test="${s.count<4}" >
                            <td class="td"  style="color: red;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${s.count>3}">
                            <td class="td"  style="color: black;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                        <%--<c:if test="${s.count>3}">--%>
                            <%--<td class="td"  style="color: black;">${s.count}</td>--%>
                            <%--<td>--%>
                                <%--<a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>--%>
                                    <%--<a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>--%>
                                    <%--<a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>--%>
                                    <%--<a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>--%>
                                <%--</div>--%>
                            <%--</td>--%>
                        <%--</c:if>--%>
                    </tr>
                </c:forEach>
                <tr>
                    <td class="td"></td>
                    <td style="float: right; margin-right: 10px; margin-top: 10px;"><a href="<%= basePath%>bangdan.action">查看全部></a></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div style="width: 100%; height: 100px; margin-top: 30px;"></div>




<script>
    var $songtimebg = $(".songtimebg");
    // var $songtime = $(".songtime");
    $(".tab2 tr").mouseover(function () {
        $(this).find($songtimebg).show();
        // $(this).find($songtime).hide();
    }).mouseout(function () {
        $(this).find($songtimebg).hide();
        // $(this).find($songtime).show();
    })
</script>
</body>

</html>

