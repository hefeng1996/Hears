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
<!-- /container -->
<script src="js/classie.js"></script>
<script src="js/clipboard.min.js"></script>
<div class="container">
<div id="center" style="background-color: white;">
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
    <div class="container">
        <div id="content" style="width:760px;float: left;">
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
                    <c:forEach items="${hotSong}" var="song" varStatus="s" begin="0" end="9">
                        <c:if test="${s.count<4}">
                            <tr style="height: 60px;">
                                <td style="text-align: center;">${s.count}</td>
                                <td style="width:100px"><img style="width: 50px; height: 50px;" src="<%= resourcesPath%>images/200album/${song.album.img}"/><a href="javascript:parent.playSongid('${song.id}')"><img src="<%= basePath%>main/pic/59.jpg"/></a><a href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                                <td style="position: relative;">
                                    <span class="songtime"> ${song.time}</span>

                                    <%--<c:if test="${s.count==1}">--%>
                                        <%--<div class="songtimebg" id="songtimebg" style="top: 18px;">--%>
                                    <%--</c:if>--%>
                                    <%--<c:if test="${s.count!=1}">--%>
                                        <%--<div class="songtimebg" id="songtimebg">--%>
                                     <%--</c:if>--%>
                                    <div class="songtimebg" id="songtimebg" style="top: 18px;">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                                <td style="width:100px"><a href="javascript:parent.playSongid('${song.id}')"><img src="<%= basePath%>main/pic/59.jpg"/></a><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                                <td style="position: relative;">
                                    <span class="songtime">${song.time}</span>
                                    <div class="songtimebg" id="songtimebg">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                    <c:forEach items="${newSong}" var="song" varStatus="s" begin="0" end="9">
                        <c:if test="${s.count<4}">
                            <tr style="height: 60px;">
                                <td style="text-align: center;">${s.count}</td>
                                <td style="width:100px"><img style="width: 50px; height: 50px;" src="<%= resourcesPath%>images/200album/${song.album.img}"/><a href="javascript:parent.playSongid('${song.id}')"><img src="<%= basePath%>main/pic/59.jpg"/></a><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                                <td>
                                    <span class="songtime1">${song.time}</span>
                                    <div class="songtimebg1">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                                <td style="width:100px"><a href="javascript:parent.playSongid('${song.id}')"><img src="<%= basePath%>main/pic/59.jpg"/></a><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                                <td>
                                    <span class="songtime1">${song.time}</span>
                                    <div class="songtimebg1" id="songtimebg">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                    <c:forEach items="${mySong}" var="song" varStatus="s" begin="0" end="9">
                        <c:if test="${s.count<4}">
                            <tr style="height: 60px;">
                                <td style="text-align: center;">${s.count}</td>
                                <td style="width:100px"><img style="width: 50px; height: 50px;" src="<%= resourcesPath%>images/200album/${song.album.img}"/>
                                    <a href="javascript:parent.playSongid('${song.id}')"><img src="<%= basePath%>main/pic/59.jpg"/></a><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                                <td>
                                    <span class="songtime2">${song.time}</span>
                                    <div class="songtimebg2" id="songtimebg">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
                                <td style="width:100px"><a href="javascript:parent.playSongid('${song.id}')"><img src="<%= basePath%>main/pic/59.jpg"/></a><a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
                                <td>
                                    <span class="songtime2">${song.time}</span>
                                    <div class="songtimebg2" id="songtimebg">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
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
</div>
</div>
<div style="width: 100%; height: 100px;"></div>
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
    });
</script>
<script>
    // 歌手歌曲行tr鼠标移入移出事件
    // var playimg = document.getElementById("playimg");
    var $plyimg = $(".plyimg");
    $plyimg.mouseover(function () {

        $(this).attr("src","${pageContext.request.contextPath}/singerhost/shimg/play2.png");
    }).mouseout(function () {
        $(this).attr("src","${pageContext.request.contextPath}/singerhost/shimg/play1.png");
    });

    var $songtimebg = $(".songtimebg");
    var $songtime = $(".songtime");
    $(".t tr").mouseover(function () {
        $(this).find($songtimebg).show();
        $(this).find($songtime).hide();
    }).mouseout(function () {
        $(this).find($songtimebg).hide();
        $(this).find($songtime).show();
    });

    var $songtimebg1 = $(".songtimebg1");
    var $songtime1 = $(".songtime1");
    $(".t1 tr").mouseover(function () {
        $(this).find($songtimebg1).show();
        $(this).find($songtime1).hide();
    }).mouseout(function () {
        $(this).find($songtimebg1).hide();
        $(this).find($songtime1).show();
    });

    var $songtimebg2 = $(".songtimebg2");
    var $songtime2 = $(".songtime2");
    $(".t2 tr").mouseover(function () {
        $(this).find($songtimebg2).show();
        $(this).find($songtime2).hide();
    }).mouseout(function () {
        $(this).find($songtimebg2).hide();
        $(this).find($songtime2).show();
    });

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
