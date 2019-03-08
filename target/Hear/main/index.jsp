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
            left:160px;
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

<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;" >
        <img href="#"  id="logo" src="<%= basePath%>main/img/logo.png"></img>
        <ul class="menu__list" id="ul">
            <li class="menu__item menu__item--current" style="margin-left: 1px"><a href="#" class="menu__link">推荐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>bangdan.action' " href="javascript:void(0) ">排行榜</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>songlist/huayu.action?id=31' " href="javascript:void(0)">歌单</a></li>
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
<div style="background-color: white; border: 1px solid #cccccc;width: 980px; margin-left:190px; margin-right: 190px ;">
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
            <c:forEach items="${showSonglist}" var="songlist" begin="0" end="9">
                <a href="<%= basePath%>/songlist/songlist.action?id=${songlist.id}"style="float: left; color: black;"><img style="margin-left: 50px;"  src="<%= resourcesPath%>images/200songlist/${songlist.img}" /><p style="margin-left: 50px; width: 130px">${songlist.name}</p></a>
            </c:forEach>
        </div>
    </div>
    <div id="geshou">
        <a href="<%=basePath%>artist/recommendsinger.action"><img style="margin-left: 20px; margin-top: 30px;" src="<%= basePath%>main/img/33.jpg"/></a>
        <a href="<%=basePath%>artist/recommendsinger.action"><img style="float: right; margin-right: 20px; margin-top: 30px;" src="<%= basePath%>main/img/32.jpg" /></a>
        <div style="height: 2px; background-color: red;"></div>
        <div class="img1" id="tuijian1" style="margin-top: 20px;  width: 100%; height:180px;">
            <c:forEach items="${myslist2}" var="singer" begin="0" end="9">
                <a href="<%= basePath%>artist/singerhost.action?id=${singer.id}" style="float: left; color: black;"><img style="margin-left: 50px;"  src="<%= resourcesPath%>images/100singer/${singer.img}" /><p style="margin-left: 50px;">${singer.name}</p></a>
            </c:forEach>
        </div>
    </div>
    <div id="tuijian" style="height: 560px;">
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
            <c:forEach items="${showSonglist}" var="songlist" begin="10" end="13">
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
                                    <a href="javascript:playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>

                        </c:if>
                        <c:if test="${s.count>3}">
                            <td class="td"  style="color: black;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                <c:forEach items="${newSong}" var="song" begin="210" end="219" varStatus="s">
                    <tr >
                        <c:if test="${s.count<4}" >
                            <td class="td"  style="color: red;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${s.count>3}">
                            <td class="td"  style="color: black;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                <c:forEach items="${mySong}" var="song" begin="120" end="129" varStatus="s">
                    <tr >
                        <c:if test="${s.count<4}" >
                            <td class="td"  style="color: red;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                        </c:if>
                        <c:if test="${s.count>3}">
                            <td class="td"  style="color: black;">${s.count}</td>
                            <td>
                                <a href="<%=basePath%>/song.action?id=${song.id}" class="songtime">${song.name}</a>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:playSongid('${song.id}')" class="ply"><img class="plyimg" src="<%= basePath%>singerhost/shimg/play1.png"/></a>
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
        </div>
    </div>
</div>
<div style="width: 100%; height: 100px; margin-top: 30px;"></div>




<script>
    var $songtimebg = $(".songtimebg");
    var $songtime = $(".songtime");
    $(".tab2 tr").mouseover(function () {
        $(this).find($songtimebg).show();
        $(this).find($songtime).hide();
    }).mouseout(function () {
        $(this).find($songtimebg).hide();
        $(this).find($songtime).show();
    })
</script>
</body>
<div class="mp">
    <div class="mp-box">
        <img src="<%= basePath%>singerhost/playerimg/mplayer_error.png" alt="music cover" class="mp-cover">
        <div class="mp-info">
            <p class="mp-name">燕归巢</p>
            <p class="mp-singer">许嵩</p>
            <p><span class="mp-time-current">00:00</span>/<span class="mp-time-all">00:00</span></p>
        </div>
        <div class="mp-btn">
            <button class="mp-prev" title="上一首"></button>
            <button class="mp-pause" title="播放"></button>
            <button class="mp-next" title="下一首"></button>
            <button class="mp-mode" title="播放模式"></button>
            <div class="mp-vol">
                <button class="mp-vol-img" title="静音"></button>
                <div class="mp-vol-range" data-range_min="0" data-range_max="100" data-cur_min="80">
                    <div class="mp-vol-current"></div>
                    <div class="mp-vol-circle"></div>
                </div>
            </div>
        </div>
        <div class="mp-pro">
            <div class="mp-pro-current"></div>
        </div>
        <div class="mp-menu">
            <button class="mp-list-toggle"></button>
            <button class="mp-lrc-toggle"></button>
        </div>
    </div>
    <button class="mp-toggle">
        <span class="mp-toggle-img"></span>
    </button>
    <div class="mp-lrc-box">
        <ul class="mp-lrc"></ul>
    </div>
    <button class="mp-lrc-close"></button>
    <div class="mp-list-box">
        <ul class="mp-list-title"></ul>
        <table class="mp-list-table">
            <thead>
            <tr>
                <th>歌名</th>
                <th>歌手</th>
                <th>时长</th>
            </tr>
            </thead>
            <tbody class="mp-list"></tbody>
        </table>
    </div>
</div>
<script src="<%= basePath%>singerhost/playerjs/jquery.min.js"></script>
<script src="<%= basePath%>singerhost/playerjs/mplayer.js"></script>
<script src="<%= basePath%>singerhost/playerjs/mplayer-list.js"></script>
<script src="<%= basePath%>singerhost/playerjs/mplayer-functions.js"></script>
<script src="http://cdn.bootcss.com/jquery-nstslider/1.0.13/jquery.nstSlider.min.js"></script>
<script>
    var modeText = ['顺序播放','单曲循环','随机播放','列表循环'];
    var player = new MPlayer({
        // 容器选择器名称
        containerSelector: '.mp',
        // 播放列表
        songList: mplayer_song,
        // 专辑图片错误时显示的图片
//        defaultImg: '../img/mplayer_error.png',
        defaultImg: 'http://localhost:8080/Hear/img/mplayer_error.png',
        // 自动播放
        autoPlay: true,
        // 播放模式(0->顺序播放,1->单曲循环,2->随机播放,3->列表循环(默认))
        playMode:0,
        playList:0,
        playSong:0,
        // 当前歌词距离顶部的距离
        lrcTopPos: 34,
        // 列表模板，用${变量名}$插入模板变量
        listFormat: '<tr><td>${name}</td><td>${singer}</td><td>${time}</td></tr>',
        // 音量滑块改变事件名称
        volSlideEventName:'change',
        // 初始音量
        defaultVolume:80
    }, function () {
        // 绑定事件
        this.on('afterInit', function () {
            console.log('播放器初始化完成，正在准备播放');
        }).on('beforePlay', function () {
            var $this = this;
            var song = $this.getCurrentSong(true);
            var songName = song.name + ' - ' + song.singer;
            console.log('即将播放'+songName+'，return false;可以取消播放');
        }).on('timeUpdate', function () {
            var $this = this;
            console.log('当前歌词：' + $this.getLrc());
        }).on('end', function () {
            var $this = this;
            var song = $this.getCurrentSong(true);
            var songName = song.name + ' - ' + song.singer;
            console.log(songName+'播放完毕，return false;可以取消播放下一曲');
        }).on('mute', function () {
            var status = this.getIsMuted() ? '已静音' : '未静音';
            console.log('当前静音状态：' + status);
        }).on('changeMode', function () {
            var $this = this;
            var mode = modeText[$this.getPlayMode()];
            $this.dom.container.find('.mp-mode').attr('title',mode);
            console.log('播放模式已切换为：' + mode);
        });
    });


    $(document.body).append(player.audio); // 测试用

    setEffects(player);

</script>
</html>
