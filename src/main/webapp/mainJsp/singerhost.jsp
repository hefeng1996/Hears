<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String imgPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>歌手主页</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/demo.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/component.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/navcss/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/shcss/singerhost.css">
    <link rel="stylesheet" href="<%= basePath%>singerhost/playercss/mplayer.css">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-fileinput.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/sharecontent.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/colectsong.css">
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/jquery-1.11.2.js"></script>
    <script src="<%= basePath%>singerhost/playerjs/jquery.min.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap-fileinput.js"></script>
    <script src="<%= basePath%>singerhost/sharejs/share.js"></script>
    <script src="<%= basePath%>singerhost/navjs/jquery.min.js"></script>
    <script src="<%= basePath%>singerhost/navjs/classie.js"></script>
    <script src="<%= basePath%>singerhost/navjs/clipboard.min.js"></script>
    <script src="<%= basePath%>singerhost/shjs/shjs.js"></script>



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
        .collect_ul li{
            height: 56px;
            width: 100%;
            position: relative;
            padding: 6px 0 6px 35px;
            margin: 0;
            border-top: 1px solid #e0e0e0;
            cursor: pointer;
        }
        .collect_li:hover{
            background: #f2f2f2;
        }
        .collect_li_div{
            padding-left: 50px;
            text-align: -webkit-match-parent;
        }
        .collect_li_div_left{
            display: inline;
            float: left;
            margin-left: -50px;
            overflow: hidden;
            width: 40px;
            height: 40px;
        }
        .collect_li_div_left img{
            height: 40px;
            width: 40px;
        }
        .collect_li_songlistname{
            margin-top: 2px;
            margin-bottom: 8px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
        }
        .collect_li_songnum{
            display: block;
            color: #666;
            margin-top: 8px;
            cursor: pointer;
        }
        .collect_form{
            position: relative;
            width: 100%;
            min-height: 200px;
        }
    </style>
</head>

<body style="background-color: #f5f5f5">
<!--导航-->

<script type="text/javascript" src="<%= basePath%>singerhost/Scripts/jquery.min.js"></script>
<script type="text/javascript">
    //tab切换
    $(function(){
        $('.aui-nav-list-box ul li').click(function(){
            $(this).addClass('aui-current').siblings().removeClass('aui-current');
            $('.aui-nav-list-tab>div:eq('+$(this).index()+')').show().siblings().hide();
        })
    });
</script>
<!--导航结束-->
<div class="main">
    <!--左侧部分-->
    <div id="leftpart" class="leftpart">
        <%--歌手大图--%>
        <div class="singerinfo">
            <div class="singername">
                <h2>${singerhost.name}</h2>
            </div>
            <div class="singerimg">
                <img class="simg" src="<%= imgPath%>images/640singer/${singerhost.bigimg}">
                <a href="javascript:void(0)" id="collectsinger_img" class="collectsinger" onclick="collectedSinger('${singerhost.id}')">
                    <c:if test="${singerCollected==0}">
                        <img id="simg" src="<%= basePath%>singerhost/shimg/colectsinger.png" />
                    </c:if>
                    <c:if test="${singerCollected==1}">
                        <img id="simg" src="<%= basePath%>singerhost/shimg/collectedsinger.png" />
                    </c:if>
                </a>
            </div>
        </div>
        <!--中间选项卡部分-->
        <div class="aui-nav-content-box">
            <div class="aui-nav-list-box">
                <ul>
                    <li id="li1" class="aui-current">
                        <a href="#">热门单曲</a>
                    </li>
                    <li id="li2">
						<a href="#">所有专辑</a>
                    </li>
                    <li>
                        <a href="#">歌手介绍</a>
                    </li>
                </ul>
            </div>
            <div class="aui-nav-list-tab">
                <!--热门单曲内容-->
                <div class="aui-nav-list-item" style="display:block">
                    <!--两个按钮-->
                    <div class="btncontainer">
                        <!--播放-->
                        <div class="btncon">
                            <a href="#">
                                <span class="playbtn"><img class="playbtn-img" src="<%= basePath%>singerhost/shimg/play.png"/>&nbsp;播放</span>
                                <div class="imgplaybg"></div>
                            </a>
                            <a href="#">
                                <span class="collectbtn"><img class="collectbtn-img" src="<%= basePath%>singerhost/shimg/plus.png"/> </span>
                                <div class="imgcolbg"></div>
                            </a>
                        </div>
                        <!--收藏热门-->
                        <div class="btn-hotcon">
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectsongs('${singerhost.id}')">
                                <span class="collectionbtn"><img class="colbtn-img" src="<%= basePath%>singerhost/shimg/collection.png"/>&nbsp;收藏热门</span>
                                <div class="imgcollectbg"></div>
                            </a>
                        </div>
                    </div>

                    <!--歌曲列表-->
                    <div class="tablelist">
                        <table class="tab" id="tab">
                            <tbody>
                            <c:forEach items="${songs}" var="song" varStatus="s">
                            <tr>
                                <!--序号和播放图标-->
                                <td class="w1">
                                    <span>${s.count}</span>
                                    <%--<%= basePath%>songplay.action?id=${song.id}--%>
                                    <a href="javascript:parent.playSongid('${song.id}')" class="ply"><img class="plyimg" id="playimg" src="<%= basePath%>singerhost/shimg/play1.png"/> </a>
                                </td>
                                <!--歌曲名-->
                                <td style="width: 309px">
                                    <span id="songtxt" class="txt"><a href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></span>
                                </td>
                                <!--歌曲时长-->
                                <td class="w3">
                                    <span class="songtime">${song.time}</span>

                                    <div class="songtimebg" id="songtimebg">
                                        <a href="javascript:parent.sendSongid('${song.id}')"><img src="<%= basePath%>singerhost/shimg/plus01.png"/></a>
                                        <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${singerhost.id}')"><img src="<%= basePath%>singerhost/shimg/collect01.png"/></a>
                                        <a href="javascript:void(0)" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${singerhost.id}','${singerhost.name}')"><img src="<%= basePath%>singerhost/shimg/share01.png"/></a>
                                        <a href="<%= imgPath%>song/${song.url}" download="${song.name}"><img src="<%= basePath%>singerhost/shimg/download01.png"/></a>
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
                                                <%--新建歌单连接--%>
                                                <div class="modal-body colectsonglist">
                                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal2" data-dismiss="modal" >
                                                        <img style="width: 100%;height: 56px;" src="<%= basePath%>singerhost/shimg/createSonglist.png"/>
                                                    </a>
                                                </div>
                                                <div class="modal-body colectsonglist">
                                                    <form id="collect_form" class="collect_form" action="<%=basePath%>songlist/colsonglist.action" method="post" enctype="multipart/form-data">
                                                    <ul class="collect_ul" style="min-height: 56px;">
                                                        <c:forEach items="${songlists}" var="songlist">
                                                        <li class="collect_li" onclick="jingjing()">
                                                            <div class="collect_li_div">
                                                                <a class="collect_li_div_left" href="#">
                                                                    <img src="<%= imgPath%>images/200songlist/${songlist.img}"/>
                                                                    <%--需要更改图片地址--%>
                                                                </a>
                                                                <a class="collect_li_songlistname">
                                                                    ${songlist.name}
                                                                </a>
                                                                <p class="collect_li_songnum">${songlist.songNum}</p>
                                                            </div>
                                                            <input type="hidden" name="colsongid" id="colsongid" value="">
                                                            <input type="hidden" name="colsonglistid" id="colsonglistid" value="${songlist.id}">
                                                            <input type="hidden" name="singerid" id="singersid" value="">
                                                            <%--json字符串形式发到后台--%>
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
                                            <form id="login_form" class="share_form" action="<%=basePath%>friend/releaseSong.action" method="post" enctype="multipart/form-data">
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
                                                            <textarea name="text" id="" form-control class="share_textarea" cols="70" rows="8"></textarea>
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
                                                                            <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
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
                                </td>
                                <!--专辑名-->
                                <td class="w4">
										<span class="albumtxt">
											<a href="#">${song.album.name}</a>
										</span>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--所有专辑内容-->
                <div class="aui-nav-list-item">
                    <!--背景板-->
                    <div class="albumcontainer">
                        <!--专辑单元-->
                        <c:if test="${empty albums}">
                            ${warning}
                        </c:if>
                        <c:forEach items="${albums}" var="album">
                            <div class="singerhost-albumcontain">
                                <div class="ablumimgcon">
                                    <a href="<%=basePath%>album.action?id=${album.id}"><img class="albumimg" src="<%= imgPath%>images/200album/${album.img}"/></a>
                                </div>
                                <p class="album-name">${album.name}</p>
                                <p>
                                    <fmt:formatDate value="${album.date}" pattern="yyyy-MM-dd"/>
                                </p>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <!--歌手介绍-->
                <div class="aui-nav-list-item">
                    <div>
                        <div class="introduce-head">
                            <h2>${singerhost.name}简介</h2>
                        </div>
                        <div class="introduce-body">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;
                                ${singerhost.introduce}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--右侧部分-->
    <div id="rightpart" class="rightpart">
        <div class="right-contain">
            <h3 class="right-head">
                <span>相似歌手</span>
            </h3>
            <div class="right-body">
                <c:forEach items="${similarsingers}" var="singer">
                    <div class="right-body-singerpart">
                        <div class="right-body-singerpart-img">
                            <a href="<%= basePath%>artist/singerhost.action?id=${singer.id}">
                                <img class="singerpart-singerimg" src="<%= imgPath%>images/100singer/${singer.img}"/>
                            </a>
                        </div>
                        <p><a class="singerimg-a" href="<%= basePath%>artist/singerhost.action?id=${singer.id}">${singer.name}</a></p>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<!--播放器-->
<div class="songerhost-bottom"></div>

<script src="<%= basePath%>singerhost/playerjs/mplayer.js"></script>
<script src="<%= basePath%>singerhost/playerjs/mplayer-list.js"></script>
<script src="<%= basePath%>singerhost/playerjs/mplayer-functions.js"></script>
<script src="http://cdn.bootcss.com/jquery-nstslider/1.0.13/jquery.nstSlider.min.js"></script>


<script>
//    模态框传参 分享歌曲
    function shareSong(songid,songname,singerid,singername) {
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
            var songs=[<c:forEach items="${songs}" var="song">
                {id:"${song.id}"},
                </c:forEach> ];
            var jsonsongs=JSON.stringify(songs);
            var songid=document.getElementById("songs");
            songid.value=jsonsongs;
            nsongs.value=jsonsongs;
        </c:if>
    }


    function collectedSinger(singerid){
        <c:if test="${empty sessionScope.user}">
            alert("请先登录");
        </c:if>
        <c:if test="${not empty sessionScope.user}">

        if($("#simg").attr("src")==(jsbasePath()+"/singerhost/shimg/colectsinger.png")){
            $.ajax(
                    {
                        type: "post",
                        url: jsbasePath()+"/artist/singercollect.action",
                        data: "uid=" + ${sessionScope.user.id} + "&singerid=" + singerid,
                        success:function (data) {
                            if(data==1){
                                $("#simg").attr("src", jsbasePath()+"/singerhost/shimg/collectedsinger.png");
                            }
                        }
                    }
                );
        }else{
//                $("#simg").attr("src", jsbasePath()+"/singerhost/shimg/collectedsinger.png");
            $.ajax(
                    {
                        type: "post",
                        url: jsbasePath()+"/artist/cancelsingercollect.action",
                        data: "uid=" + ${sessionScope.user.id} + "&singerid=" + singerid,
                        success:function (data) {
                            if(data==1){
                                $("#simg").attr("src", jsbasePath()+"/singerhost/shimg/colectsinger.png");
                            }
                        }
                    }
                );
        }
        </c:if>
    }
</script>

</body>
</html>
