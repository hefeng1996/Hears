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
    <title>榜单</title>
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
        .tabs li:hover{
            background-color: #E6E6E6;
        }
        table a{
            font-weight: normal;
            font-size: 12px;
            color: #333;
            text-decoration: none;
            cursor: pointer;
        }
        table td{
            font-weight: normal;
            font-size: 12px;
            color: #333;
        }
    </style>
    <title>搜索</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/tab.css">
    <%--<link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/bootstrap.css">--%>

    <%--<script src="<%= basePath%>main/js/jquery.min.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/shcss/singerhost.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/colectsong.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/sharecontent.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/tab.css">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-fileinput.css" rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap.css " rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= basePath%>singerhost/playercss/mplayer.css">
    <script src="<%= basePath%>singerhost/shjs/shjs.js"></script>
    <script src="<%= basePath%>singerhost/sharejs/share.js"></script>
    <!-- /container -->
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/jquery-1.11.2.js"></script>
    <script src="<%= basePath%>singerhost/playerjs/jquery.min.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap-fileinput.js"></script>
    <script src="<%= basePath%>main/js/nav.js"></script>
</head>
<body style="background-color: #f5f5f5">
<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;" >
        <img href="#"  id="logo" src="<%= basePath%>main/img/logo.png"></img>
        <ul class="menu__list" id="ul">
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>songlist/index.action'">推荐</a></li>
            <li class="menu__item menu__item--current" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>bangdan.action' " href="javascript:void(0) ">排行榜</a></li>
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
<!-- /container -->
<script src="js/classie.js"></script>
<script src="js/clipboard.min.js"></script>
<div id="center" style="background-color: white; border: 1px solid #cccccc;width: 980px;height:800px;margin-left:190px; margin-right: 190px ; ">
    <div id="left" style="float: left;width:200px;height:800px;background-color: #f5f5f5; border: 1px solid #cccccc;">
        <h4 style=" margin-top: 25px; margin-left: 5px;font-family: '微软雅黑';"><strong>音乐排行榜</strong></h4>
        <ul id="tabs" class="tabs">
            <a title="tab1" style="font:'微软雅黑';cursor:pointer;text-decoration-line: none;">
                <li style="position: relative;height: 80px;padding-top: 10px;padding-bottom: 10px;">
                    <div style="height: 60px;vertical-align: middle;position: relative;">
                        <img style="width: 50px; height: 50px; display:inline;margin-left: 20px; margin-right: 10px;" src="<%= basePath%>main/img/4.jpg" />h音乐热歌榜
                    </div>
                </li>
            </a>
            <a title="tab2" style="font:'微软雅黑';cursor:pointer;text-decoration-line: none;">
                <li style="position: relative;height: 80px;padding-top: 10px;padding-bottom: 10px;">
                    <div style="height: 60px;vertical-align: middle;position: relative;">
                        <img style="width: 50px; height: 50px; display:inline;margin-left: 20px; margin-right: 10px;" src="<%= basePath%>main/img/3.jpg" />h音乐新歌榜
                    </div>
                </li>
            </a>
            <a title="tab3" style="font:'微软雅黑';cursor:pointer;text-decoration-line: none;">
                <li style="position: relative;height: 80px;padding-top: 10px;padding-bottom: 10px;">
                    <div style="height: 60px;vertical-align: middle;position: relative;">
                        <img style="width: 50px; height: 50px; display:inline;margin-left: 20px; margin-right: 10px;" src="<%= basePath%>main/img/2.jpg" />h音乐原创榜
                    </div>
                </li>
            </a>
        </ul>
    </div>
    <div id="content" style="width:760px;float: right;">
        <%--热歌榜--%>
        <div id="tab1">
            <img style="border: 2px pink solid;padding: 1px; margin-top: 30px; margin-left: 20px; float: left;" src="<%= basePath%>main/pic/4.jpg" />
            <h3 style="width: 560px; float: right; margin-top: 40px;">H音乐热歌榜</h3>

            <img style="margin-top: 50px; margin-left: 20px;" src="<%= basePath%>main/pic/a1.jpg"/>
            <img style="margin-top: 46px;" src="<%= basePath%>main/pic/a3.jpg" />
            <h3 style="width: 740px;height:30px; float: right; margin-top: 20px;">歌曲列表</h3>

            <table id="tab" class ="t" style="width: 670px; border: 1px solid #d9d9d9;margin-left: 40px">
                <tr style="border: 1px solid #d9d9d9; background-color: #f5f5f5; height: 40px">
                    <td style="width: 80px;"><br /></td>
                    <td style="width: 500px; font-size: large;">标题</td>
                    <td style="width: 190px; font-size: large;">时长</td>
                    <td style="width: 180px; font-size: large;">歌手</td>
                </tr>
                <c:forEach items="${hotSong}" var="song" varStatus="s" begin="24" end="33">
                    <c:if test="${s.count<4}">
                        <tr style="height: 60px;">
                            <td style="text-align: center;">${s.count}</td>
                            <td style="width:100px"><img style="width: 50px; height: 50px;" src="<%= resourcesPath%>images/200album/${song.album.img}"/><img src="<%= basePath%>main/pic/59.jpg"/><a href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                            <td style="position: relative;">
                                <span class="songtime"> ${song.time}</span>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                    <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>

                            </td>
                            <td><a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                        </tr>
                    </c:if>
                    <c:if test="${s.count>3}">
                        <tr style="height: 40px;">
                            <td style="text-align: center;">${s.count}</td>
                            <td style="width:100px"><img src="<%= basePath%>main/pic/59.jpg"/><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                            <td style="position: relative;">
                                <span class="songtime">${song.time}</span>
                                <div class="songtimebg" id="songtimebg">
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                    <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                            <td><a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>

        </div>
         <%--新歌榜--%>
        <div id="tab2">
            <img style="border: 2px pink solid;padding: 1px; margin-top: 30px; margin-left: 20px; float: left;" src="<%= basePath%>main/pic/3.jpg" />
            <h3 style="width: 560px; float: right; margin-top: 40px;">H音乐新歌榜</h3>
            <img style="margin-top: 50px; margin-left: 20px;" src="<%= basePath%>main/pic/a1.jpg"/>
            <img style="margin-top: 46px;" src="<%= basePath%>main/pic/a3.jpg" />
            <h3 style="width: 740px;height:30px; float: right; margin-top: 20px;">歌曲列表</h3>
            <span style="text-decoration:line-through;"></span>
            <table class="t1" style="width: 670px; border: 1px solid #d9d9d9;margin-left: 40px">
                <tr style="border: 1px solid #d9d9d9; background-color: #f5f5f5; height: 40px; ">
                    <td style="width: 80px;"><br /></td>
                    <td style="width: 500px; font-size: large;">标题</td>
                    <td style="width: 190px; font-size: large;">时长</td>
                    <td style="width: 180px; font-size: large;">歌手</td>
                </tr>
                <c:forEach items="${newSong}" var="song" varStatus="s" begin="34" end="43">
                    <c:if test="${s.count<4}">
                        <tr style="height: 60px;">
                            <td style="text-align: center;">${s.count}</td>
                            <td style="width:100px"><img style="width: 50px; height: 50px;" src="<%= resourcesPath%>images/200album/${song.album.img}"/><img src="<%= basePath%>main/pic/59.jpg"/><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                            <td>
                                <span class="songtime1">${song.time}</span>
                                <div class="songtimebg1">
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                    <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                            <td><a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                        </tr>
                    </c:if>
                    <c:if test="${s.count>3}">
                        <tr style="height: 40px;">
                            <td style="text-align: center;">${s.count}</td>
                            <td style="width:100px"><img src="<%= basePath%>main/pic/59.jpg"/><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                            <td>
                                <span class="songtime1">${song.time}</span>
                                <div class="songtimebg1" id="songtimebg">
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                    <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                            <td><a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
         <%--原创榜--%>
        <div id="tab3">
            <img style="border: 2px pink solid;padding: 1px; margin-top: 30px; margin-left: 20px; float: left;" src="<%= basePath%>main/img/2.jpg" />
            <h3 style="width: 560px; float: right; margin-top: 40px;">H音乐原创榜</h3>
            <img style="margin-top: 50px; margin-left: 20px;" src="<%= basePath%>main/pic/a1.jpg"/>
            <img style="margin-top: 46px;" src="<%= basePath%>main/pic/a3.jpg" />
            <h3 style="width: 740px;height:30px; float: right; margin-top: 20px;">歌曲列表</h3>
            <span style="text-decoration:line-through;"></span>
            <table class="t2" style="width: 670px; border: 1px solid #d9d9d9;margin-left: 40px">
                <tr style="border: 1px solid #d9d9d9; background-color: #f5f5f5; height: 40px;">
                    <td style="width: 80px;"><br /></td>
                    <td style="width: 500px; font-size: large;">标题</td>
                    <td style="width: 190px; font-size: large;">时长</td>
                    <td style="width: 180px; font-size: large;">歌手</td>
                </tr>
                <c:forEach items="${mySong}" var="song" varStatus="s" begin="44" end="53">
                    <c:if test="${s.count<4}">
                        <tr style="height: 60px;">
                            <td style="text-align: center;">${s.count}</td>
                            <td style="width:100px"><img style="width: 50px; height: 50px;" src="<%= resourcesPath%>images/200album/${song.album.img}"/><img src="<%= basePath%>main/pic/59.jpg"/><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                            <td>
                                <span class="songtime2">${song.time}</span>
                                <div class="songtimebg2" id="songtimebg">
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                    <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                            <td><a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                        </tr>
                    </c:if>
                    <c:if test="${s.count>3}">
                        <tr style="height: 40px;">
                            <td style="text-align: center;">${s.count}</td>
                            <td style="width:100px"><img src="<%= basePath%>main/pic/59.jpg"/><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                            <td>
                                <span class="songtime2">${song.time}</span>
                                <div class="songtimebg2" id="songtimebg">
                                    <a href="javascript:sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                    <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                    <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
                                </div>
                            </td>
                            <td><a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>

    </div>
    <c:if test="${not empty sessionScope.user}">
        <%--新建歌单弹出框--%>
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 475px;">
                <div class="modal-content" style="height: 240px;">
                    <div class="modal-header modalheader">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #ffffff";>&times;</button>
                        <h4 class="modal-title" id="myModalLabel2" style="color: #ffffff;font-size: 14px";>新建歌单</h4>
                    </div>
                    <div class="modal-body newcontent">
                        <form id="newsonglist_form" class="newsonglistform" action="<%=basePath%>songlist/newsonglist.action" method="post" enctype="multipart/form-data">
                            <div class="inputcontent">
                                <label class="col-sm-3 control-label setfont">歌单名：</label>
                                <div class="col-sm-9 setinput">
                                    <input type="text" name="newsonglist" class="form-control" value=""/>
                                    <input type="hidden" name="ncolsongid" id="ncolsongid" value="">
                                    <input type="hidden" name="nsongs" id="nsongs" value="">
                                        <%--<input type="hidden" name="colsonglistid" id="ncolsonglistid" value="${songlist.id}">--%>
                                    <input type="hidden" name="nsingerid" id="nsingersid" value="">
                                </div>
                            </div>
                            <div class="discribe">可通过“收藏”将音乐添加到新歌单中</div>
                            <div class="newsonglist_button">
                                <button type="submit" class="btn btn-primary">
                                    新建
                                </button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    取消
                                </button>
                            </div>
                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <%--收藏歌曲弹出框--%>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 475px;">
                <div class="modal-content"style="min-height: 380px;">
                    <div class="modal-header modalheader">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #ffffff";>&times;</button>
                        <h4 class="modal-title" id="myModalLabel1" style="color: #ffffff;font-size: 14px";>添加到歌单</h4>
                    </div>
                    <div class="modal-body colectsonglist">
                        <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal2" data-dismiss="modal" onclick="hidecollect()">
                            <img style="width: 100%;height: 56px;" src="<%= basePath%>singerhost/shimg/createSonglist.png"/>
                        </a>
                    </div>
                    <div class="modal-body colectsonglist">
                        <form id="collect_form" class="collect_form" action="<%=basePath%>songlist/colsonglist1.action" method="post" enctype="multipart/form-data">
                            <ul class="collect_ul" style="min-height: 56px;">
                                <c:forEach items="${songlists}" var="songlists">
                                    <li style="margin-left:-160px;width: 460px;" class="collect_li" onclick="jingjing()">
                                        <div class="collect_li_div" style="width: 100%;">
                                            <a class="collect_li_div_left" href="#">
                                                <c:if test="${not empty songlists.img}">
                                                    <img src="<%= resourcesPath%>images/200songlist/${songlists.img}"/>
                                                </c:if>
                                                <c:if test="${empty songlists.img}">
                                                    <img src="<%=basePath%>images/default.jpg"/>
                                                </c:if> <%--需要更改图片地址--%>
                                            </a>
                                            <a class="collect_li_songlistname">
                                                    ${songlists.name}
                                            </a>
                                            <p class="collect_li_songnum">${songlists.songNum}</p>
                                        </div>
                                        <input type="hidden" name="colsongid" id="colsongid" value="">
                                        <input type="hidden" name="colsonglistid" id="colsonglistid" value="${songlists.id}">
                                        <input type="hidden" name="songs" id="songs" value="">
                                    </li>
                                </c:forEach>
                            </ul>
                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <%--分享歌曲弹出框--%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

            <div class="modal-dialog" style="width: 475px;">
                <form id="login_form" class="share_form" action="<%=basePath%>friend/shareBangdan.action" method="post" enctype="multipart/form-data">
                    <div class="modal-content">
                            <%--表头--%>
                        <div class="modal-header modalheader">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true" style="color: #ffffff";>×
                            </button>
                            <h4 class="modal-title" id="myModalLabel" style="color: #ffffff;font-size: 14px;">
                                分享
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="share_text">
                                <textarea style="width: 440px;" name="text" id="" form-control class="share_textarea" cols="70" rows="8"></textarea>
                                <div class="share_info">
                                    <p class="share_info-txt">单曲：<span id="songInfo"></span></p>
                                    <input type="hidden" name="songid" id="songid" value="">
                                    <input type="hidden" name="songlistid" id="songlistid" value="${songlist.id}">
                                </div>
                            </div>
                        </div>
                            <%--上传--%>
                        <div class="modal-body share_upload">
                                <%--上传图片--%>
                            <div class="form-group" id="uploadForm" enctype='multipart/form-data'>
                                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                                    <div class="fileinput-new thumbnail" style="max-width: 200px;height: auto;max-height:150px;">
                                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                                    <div>
                                                                            <span class="btn btn-primary btn-file">
                                                                                <span class="fileinput-new">选择图片</span>
                                                                                <span class="fileinput-exists">换一张</span>
                                                                                <input type="file" name="imgFileUp" id="picID" accept="image/*"/>
                                                                            </span>
                                        <a href="javascript:void(0);" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                                    </div>
                                </div>
                            </div>


                                <%--结束图片上传--%>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">
                                分享
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                取消
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </form>
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </c:if>

</div>

<div style="width: 100%; height: 100px; margin-top: 30px;"></div>
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
        defaultImg: 'img/mplayer_error.png',
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#content div").hide(); // Initially hide all content
        $("#tabs li:first").attr("id","current"); // Activate first tab
        $("#content div:first").fadeIn();// Show first tab content
        $('#tabs a').click(function(e) {
            e.preventDefault();
            $("#content div").hide(); //Hide all content
            $("#tabs li").attr("id",""); //Reset id's
            $(this).parent().attr("id","current"); // Activate this
            $('#' + $(this).attr('title')).fadeIn();// Show content for current tab
        });
    })();
</script>
<script>
    // 歌手歌曲行tr鼠标移入移出事件
    // var playimg = document.getElementById("playimg");
    var $plyimg = $(".plyimg");
    $plyimg.mouseover(function () {

        $(this).attr("src","${pageContext.request.contextPath}/singerhost/shimg/play2.png");
    }).mouseout(function () {
        $(this).attr("src","${pageContext.request.contextPath}/singerhost/shimg/play1.png");
    })

    var $songtimebg = $(".songtimebg");
    var $songtime = $(".songtime");
    $(".t tr").mouseover(function () {
        $(this).find($songtimebg).show();
        $(this).find($songtime).hide();
    }).mouseout(function () {
        $(this).find($songtimebg).hide();
        $(this).find($songtime).show();
    })

    var $songtimebg1 = $(".songtimebg1");
    var $songtime1 = $(".songtime1");
    $(".t1 tr").mouseover(function () {
        $(this).find($songtimebg1).show();
        $(this).find($songtime1).hide();
    }).mouseout(function () {
        $(this).find($songtimebg1).hide();
        $(this).find($songtime1).show();
    })

    var $songtimebg2 = $(".songtimebg2");
    var $songtime2 = $(".songtime2");
    $(".t2 tr").mouseover(function () {
        $(this).find($songtimebg2).show();
        $(this).find($songtime2).hide();
    }).mouseout(function () {
        $(this).find($songtimebg2).hide();
        $(this).find($songtime2).show();
    })

    //    模态框传参 分享歌曲
    function shareSong(songid,songname,singerid,singername) {
        <c:if test="${empty sessionScope.user}">
        alert("请先登录");
        </c:if>
        <c:if test="${not empty sessionScope.user}">
        var songInfo = document.getElementById("songInfo");
        var ssongid=document.getElementById("songid")
        songInfo.innerText=songname+"-"+singername;
        ssongid.value=songid;
        </c:if>
    }
    //  收藏歌曲
    function collectSong(sid,singerid) {
        <c:if test="${empty sessionScope.user}">
            alert("请先登录");
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            var songid=document.getElementById("colsongid");
            var nsongid=document.getElementById("ncolsongid");
            var nssingerid=document.getElementById("nsingersid");
            songid.value=sid;
            ssingerid.value=singerid;
            nsongid.value=sid;
            nssingerid.value=singerid;
        </c:if>
    }
    //    收藏歌曲提交
    function jingjing() {
        document.getElementById("collect_form").submit();
    }
    //    收藏歌单所有歌曲
    function collectsongs(singerid) {
        <c:if test="${empty sessionScope.user}">
        alert("请先登录");
        </c:if>
        <c:if test="${not empty sessionScope.user}">
        var ssingerid=document.getElementById("singersid");
        var nssingerid=document.getElementById("nsingersid");
        var nsongs=document.getElementById("nsongs");
        ssingerid.value=singerid;
        nssingerid.value=singerid;
        var songs=[<c:forEach items="${song}" var="song">
            {id:"${song.id}"},
            </c:forEach> ];
        var jsonsongs=JSON.stringify(songs);
        var songid=document.getElementById("songs");
        songid.value=jsonsongs;
        nsongs.value=jsonsongs;
        </c:if>
    }

    function hidecollect() {
//        document.getElementById("myModal1").style.display="none";
        parent.closechild();
    }

</script>
</body>
</html>
