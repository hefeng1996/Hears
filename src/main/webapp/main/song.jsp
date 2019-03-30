<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String resourcesPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/hearupload/";

%>
<html>
<head>
    <title>song</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="description"
          content="An open collection of menu styles that use the line as a creative design element"/>
    <meta name="keywords" content="web design, styles, inspiration, line, pseudo-element, SVG, animation"/>

    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/demo.css"/>

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/component.css"/>
    <style>

        #logo {
            position: absolute;
            left: 30px;
            width: 164px;
            height: 62px;

        }

        #ul {
            position: absolute;
            left: 190px;
            top: -5px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        table tr:nth-child(odd) {

            background: #f7f7f7;

        }

        table tr:nth-child(even) {

            background: white;

        }

        table img {
            width: 24px;
            height: 24px;
        }

        table a {
            color: black;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/shcss/singerhost.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/colectsong.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/sharecontent.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/bootstrap.css">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-fileinput.css" rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap.css " rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= basePath%>singerhost/playercss/mplayer.css">
    <script src="<%= basePath%>singerhost/shjs/shjs.js"></script>
    <script src="<%= basePath%>singerhost/sharejs/share.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/jquery-1.11.2.js"></script>
    <script src="<%= basePath%>singerhost/playerjs/jquery.min.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap-fileinput.js"></script>
    <%--<script src="<%= basePath%>main/js/jquery.min.js"></script>--%>
    <script src="<%= basePath%>js/jquery2.2.2.min.js"></script>
    <!-- /container -->
    <script src="<%= basePath%>main/js/classie.js"></script>
    <script src="<%= basePath%>main/js/clipboard.min.js"></script>
    <script src="<%= basePath%>main/js/nav.js"></script>
    <%--<script src="<%= basePath%>main/js/bootstrap.js"></script>--%>
</head>
<body style="background-color: #f5f5f5">
<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;">
        <img href="#" id="logo" src="<%= basePath%>main/img/logo.png"/>
        <ul class="menu__list" id="ul">
            <li class="menu__itemt" style="margin-left: 1px;margin-top: 15px;"><a href="#" class="menu__link" onclick="window.location = '<%= basePath%>songlist/index.action'">推荐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link" onclick="window.location = '<%= basePath%>bangdan.action' " href="javascript:void(0) ">排行榜</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>songlist/huayu.action?id=31' " href="javascript:void(0)">歌单</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>artist/recommendsinger.action' ">歌手</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>user/mysongs.action'">我的音乐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location='<%= basePath%>friend/friendcircle.action'">朋友</a></li>
            <div class="search d7">
                <form action="<%=basePath%>search/searchall.action" method="get">
                    <input type="text" placeholder="Hear..." name="content">
                    <button type="submit"><img src="<%= basePath%>main/img/1.jpg"/></button>
                </form>
            </div>
            <li class="menu__item" style="margin-left: -10px">
                <c:if test="${empty sessionScope.user}">
                    <a href="#" class="menu__link" onclick="window.location = '<%= basePath%>jsp/login.jsp' ">登录</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <a href="javascript:void(0)" style="position:relative;top: 10px;width: 80px;"
                       onclick="window.location ='<%=basePath%>user/personalInformation.action' "><img style="border-radius: 40px;width: 40px;height: 40px;display: inline;" src="<%= resourcesPath%>head/${sessionScope.user.img}"></a>
                    <a href="#" style="position:relative;top: 10px;width: 80px;color: #e3e3e3;margin-left: 10px"
                       onclick="window.location ='<%=basePath%>user/logout.action'">退出</a>
                </c:if>
            </li>
        </ul>
    </nav>

</div>
<div style="background-color: white; border: 1px solid #cccccc;width: 980px; margin-left:190px; margin-right: 190px ;">
    <img style="float: left;margin: 50px;height: 200px; width: 200px"
         src="<%= resourcesPath%>images/200album/${song.album.img}"/>
    <img style=" float: left;margin-top: 50px;" src="<%= basePath%>main/img/12.jpg"/>
    <p style="margin-top: 55px;"><a style="font-size: x-large;margin-left: 20px">${song.name}</a></p>
    <p><em>歌手：<a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></em></p>
    <p><em>所属专辑：<a href="<%=basePath%>album.action?id=${song.album.id}">${song.album.name}</a> </em></p>
    <p><em>发行公司：&nbsp;${song.album.company}  </em></p>
    <p><em>发行时间：&nbsp;<fmt:formatDate value="${song.album.date}" pattern="yyyy-MM-dd"/></em></p>

    <p>
        <a href="javascript:playSongid('${song.id}')"><img style="margin-top: 10px" src="<%= basePath%>main/img/7.jpg"></a>
        <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img style="margin-top: 13px;margin-left: 5px" src="<%= basePath%>main/img/9.jpg"></a>
        <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="sharesong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img style="margin-top: 14px;margin-left: 5px" src="<%= basePath%>main/img/8.jpg"></a>
        <a href="<%= resourcesPath%>song/${song.url}" download="${song.name}"><img style="margin-top: 13px;margin-left: 5px" src="<%= basePath%>main/img/6.jpg"></a>
    </p>
    <div style="width: 700px;margin-top: 10px;margin-left: 300px;">
        <p><em>作词：&nbsp;${song.author}  </em></p>
        <p><em>作曲：&nbsp;${song.composer} </em></p>
        <div style="width: 600px;height: 200px;overflow: auto;">
            ${s}

        </div>
    </div>
    <div style="margin: 60px">
        <p style="font-size: x-large">评论<em style="margin-left: 10px; font-size: small;color:grey">共${fn:length(comments)}条评论</em></p>
        <div style="height: 2px;background-color: red;width: 100%;margin-bottom: 1px">
        </div>
        <div style="padding: 10px;font-size: 12px" class="m${song.id}">
            <a href="<%=basePath%>/user/personalInformation.action?id=${sessionScope.user.id}">
                <c:if test="${empty sessionScope.user.id}">
                    <img src="<%=basePath%>images/headimg.jpg" width="50px" height="50px">
                </c:if>
                <c:if test="${not empty sessionScope.user.id}">
                    <img src="<%= resourcesPath%>head/${sessionScope.user.img}" width="50px" height="50px">
                </c:if>

            </a>
                    <textarea style="display:inline-block;width: 750px;height: 60px;margin-bottom: 20px" id="t${song.id}"
                              placeholder="评论"></textarea>
            <button class="btn btn-primary" style="margin-left: 750px" onclick="addcomments(${song.id})">评论
            </button>
             <c:if test="${fn:length(comments)>0}">
                 <div style="font-size: 12px;color: #666">最新评论</div>

             </c:if>
            <%--评论开始--%>
            <c:forEach var="c" items="${comments}">
                <div id="dc${c.id}" onmouseover="showdelete(${c.id})" onmouseout="hiddendelete(${c.id})">
                    <hr style="border:0.5px solid #ccc;;margin-top: 2px"></hr>
                    <a href="<%=basePath%>/user/personalInformation.action?id=${c.user2.id}">
                        <c:if test="${empty c.user2.img}">
                            <img style="width: 30px;height: 30px" src="<%=basePath%>images/headimg.jpg">
                        </c:if>
                        <c:if test="${not empty c.user2.img}">
                            <img style="width: 30px;height: 30px" src="<%= resourcesPath%>head/${c.user2.img}">
                        </c:if>
                    </a>
                    <div style="display: inline-block">
                        <a href="<%=basePath%>/user/personalInformation.action?id=${c.user2.id}">${c.user2.name}:&nbsp;</a>${c.content}

                    </div>
                        <%--上一级评论--%>
                    <c:if test="${not empty c.upperComment}">
                        <div style="border: 1px solid #d9d9d9;margin-left: 35px;background-color: #F5F4F3;font-size: 12px;color: #666;padding-left: 20px;padding-top: 10px;padding-bottom: 10px">
                            <a href="<%=basePath%>/user/personalInformation.action?id=${c.user2.id}">${c.upperComment.user2.name}:</a>${c.upperComment.content}
                        </div>
                    </c:if>
                    <div style="margin-left: 35px;margin-top: 10px;margin-bottom: 10px">
                        <fmt:formatDate value="${c.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <a style="margin-left: 500px;margin-right: 50px" class="answer"
                           href="javascript:void(0)" onclick="sl(${c.id})">回复</a>
                        <c:if test="${sessionScope.user.id==c.user2.id}">
                            <a style="display: none" href="javascript:void(0)" id="sd${c.id}"
                               onclick="deletecomment(${c.id},${song.id})">删除</a>

                        </c:if>

                    </div>
                    <div class="c${c.id}" style="display: none">
                        <hr style="height: 1px;background-color: grey;border: none;margin-top: 2px"></hr>
                        <div style="padding: 10px;margin-left: 35px;background-color: #F5F4F3;border: 1px solid #d9d9d9;">
                                    <textarea style="width:750px;height: 60px" id="a${song.id}"
                                              placeholder="回复${c.user2.name}："></textarea>

                            <button class="btn btn-primary" style="margin-left: 695px"
                                    onclick="addanswer(${song.id},${c.id})">回复
                            </button>


                        </div>
                    </div>

                </div>

            </c:forEach>
            <hr style="border:1px dotted #ccc;;margin-top: 2px"></hr>


        </div>
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
                    <form id="collect_form" class="collect_form" action="<%=basePath%>songlist/colsonglist2.action" method="post" enctype="multipart/form-data">
                        <ul class="collect_ul" style="min-height: 56px;">
                            <c:forEach items="${songlists}" var="songlists">
                                <li style="margin-left:-160px;width: 460px;" class="collect_li" onclick="jingjing(${songlists.id})">
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
                                    <input type="hidden" name="singerid" id="singersid" value="${song.singer.id}">
                                    <input type="hidden" name="songs" id="songs" value="">
                                    <input type="hidden" name="songlistid" id="songlistid1" value="${songlist.id}">
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
            <form id="login_form" class="share_form" action="<%=basePath%>friend/shareSong.action" method="post" enctype="multipart/form-data">
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
                                <input type="hidden" name="singerid" id="singerid" value="">

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
<div style="width: 100%; margin-top: 30px;">

</div>
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
<script>
    //    模态框传参 分享歌曲
    function sharesong(songid,songname,singerid,singername) {
        <c:if test="${empty sessionScope.user}">
            alert("请先登录");
        </c:if>
        <c:if test="${not empty sessionScope.user}">
        var songInfo = document.getElementById("songInfo");
        var ssongid=document.getElementById("songid")
        var ssingerid=document.getElementById("singerid");
        songInfo.innerText=songname+"-"+singername;
        ssongid.value=songid;
        ssingerid.value=singerid;
        </c:if>
    }
    //  收藏歌曲
    function collectSong(sid,singerid) {
        <c:if test="${empty sessionScope.user}">
        alert("请先登录");
        </c:if>
        <c:if test="${not empty sessionScope.user}">
        var songid=document.getElementById("colsongid");
        var ssingerid=document.getElementById("singersid");
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
        document.getElementById("colsonglistid").value=id;
        document.getElementById("collect_form").submit();
    }

    function hidecollect() {
//        document.getElementById("myModal1").style.display="none";
        parent.closechild();
    }

</script>
<script>
    function sl(cid) {
        $(".c" + cid).slideToggle(400);
    }

    //添加评论
    function addcomments(sid) {
        var user = '<%=session.getAttribute("user")%>';
        if (user == "null" || user == "") {
            alert("请先登录");
        } else {
            var content = $("#t" + sid).val();
            if (content == "null" || content == "") {
                alert("您还没有输入哟！");
            } else {

                location.reload();
                $.ajax({
                    url: "${pageContext.request.contextPath}/addsongcomment.action",
                    type: "post",
                    data: "content=" + content + "&songid=" + sid,
                    success: function () {


                    }

                });
            }


        }

    }
    //               添加回复
    function addanswer(sid, upperid) {

        var user = '<%=session.getAttribute("user")%>';
        if (user == "null" || user == "") {
            alert("请先登录");
        } else {
            var content = $("#a" + sid).val();
            if (content == "null" || content == "") {
                alert("您还没有输入哟！");
            } else {
                location.reload();
                $.ajax({
                    url: "${pageContext.request.contextPath}/addsonganswer.action",
                    type: "post",
                    data: "content=" + content + "&songid=" + sid + "&upperid=" + upperid,
                    success: function () {

                    }
                });
            }
        }
    }

    //                显示删除评论的按钮
    function showdelete(id) {
        $("#sd" + id).show();
    }

    //                隐藏删除评论的按钮
    function hiddendelete(id) {
        $("#sd" + id).hide();
    }

    function deletecomment(cid, mid) {
        var ccount = $("#cc" + mid).text();


        $.ajax({
            url: "${pageContext.request.contextPath}/friend/deleteComment.action",
            type: "post",
            data: "commentid=" + cid,
            success: function (zhi) {
                if (zhi == "1") {
                    $("#dc" + cid).remove();
                    $("#cc" + mid).text(parseInt(ccount) - 1);

                } else {
                    alert("删除评论失败");
                }
            }
        });

    }
</script>

</body>
</html>

