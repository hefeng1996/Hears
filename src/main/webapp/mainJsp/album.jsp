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
    <title>songlist</title>
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
            color: #666;
        }
        table tr:nth-child(odd){

            background:#f7f7f7;

        }
        table tr:nth-child(even){

            background:white;

        }
        table  img{
            width: 24px;
            height: 24px;
        }
        table a{
            color: #666;
        }
        table{
            font-size: 12px;
            color: #666;
        }
        .songtimebg a img{
            width: 16px;
            height:16px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>main/css/bootstrap.min.css">

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


    <script src="<%= basePath%>main/js/jquery.min.js"></script>
    <!-- /container -->
    <script src="<%= basePath%>main/js/classie.js"></script>
    <script src="<%= basePath%>main/js/clipboard.min.js"></script>
    <script src="<%= basePath%>main/js/nav.js"></script>
    <script src="<%= basePath%>main/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f5f5f5">
<div class="container">
    <div style="background-color: white; border: 1px solid #cccccc;">
        <img style="float: left;margin: 40px;height: 200px; width: 200px" src="<%= resourcesPath%>images/200album/${album.img}"/>
        <img style=" float: left;margin-top: 40px;" src="<%= basePath%>main/pic/8.jpg"/>
        <p style="margin-top: 40px;"><a style="font-size: x-large;margin-left: 20px">${album.name}</a></p>
        <p><em>歌手：<a href="<%=basePath%>artist/singerhost.action?id=${album.singer.id}">${album.singer.name}</a></em></p>
        <p> <em>发行时间： <fmt:formatDate value="${album.date}" pattern="yyyy-MM-dd"/></em></p>
        <p><em>发行公司：${album.company} </em></p>

        <p><a><img style="margin-top: 10px" src="<%= basePath%>main/pic/a1.jpg"></a>
            <a><img src="<%= basePath%>main/pic/a3.jpg"></a></p>

        <div style="margin: 60px">
            <p style="font-size: x-large">包含歌曲列表</p>
            <div style="height: 2px;background-color: red;width: 100%;margin-bottom: 1px"></div>
            <table id="tab" style="width: 860px; border: 1px solid #cccccc">
                <tr style="height: 40px;border: 1px solid #cccccc" bgcolor="#f4f4f4">
                    <td style=" width: 0px;padding: 20px"></td>
                    <td style="width: 50px;"></td>
                    <td width="500px">歌曲标题</td>
                    <td width="120px">时长</td>
                    <td width="142px">歌手</td>
                </tr>
                <c:forEach items="${song}" var="song" varStatus="s">
                    <tr style="border-right: solid 1px #cccccc;border-left: solid 1px #cccccc;height: 35px">
                        <td><span style="margin: 20px">${s.count}</span></td>
                        <td><a href="javascript:parent.playSongid('${song.id}')" class="ply"><img style="height: 18px;width: 18px;" src="<%= basePath%>main/pic/play1.png"/></a></td>
                        <td><a href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></td>
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
                </c:forEach>
            </table>
        </div>
        <%--评论开始--%>
        <div style="margin: 60px">
            <p style="font-size: x-large">评论<em style="margin-left: 10px; font-size: small;color:grey">共${fn:length(comments)}条评论</em></p>
            <div style="height: 2px;background-color: red;width: 100%;margin-bottom: 1px">
            </div>
            <div style="padding: 10px;font-size: 12px" class="m${album.id}">
                <a href="<%=basePath%>/user/personalInformation.action?id=${sessionScope.user.id}">
                    <c:if test="${empty sessionScope.user.id}">
                        <img src="<%=basePath%>images/headimg.jpg" width="50px" height="50px">
                    </c:if>
                    <c:if test="${not empty sessionScope.user.id}">
                        <img src="<%= resourcesPath%>head/${sessionScope.user.img}" width="50px" height="50px">
                    </c:if>

                </a>
                <textarea style="display:inline-block;width: 750px;height: 60px;margin-bottom: 20px" id="t${album.id}"
                          placeholder="评论"></textarea>
                <button class="btn btn-primary" style="margin-left: 750px" onclick="addcomments(${album.id})">评论
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
                                <img style="width: 50px;height: 50px" src="<%=basePath%>images/headimg.jpg">
                            </c:if>
                            <c:if test="${not empty c.user2.img}">
                                <img style="width: 50px;height: 50px" src="<%= resourcesPath%>head/${c.user2.img}">
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
                                   onclick="deletecomment(${c.id},${album.id})">删除</a>

                            </c:if>

                        </div>
                        <div class="c${c.id}" style="display: none">
                            <hr style="height: 1px;background-color: grey;border: none;margin-top: 2px"></hr>
                            <div style="padding: 10px;margin-left: 35px;background-color: #F5F4F3;border: 1px solid #d9d9d9;">
                                        <textarea style="width:750px;height: 60px" id="a${album.id}"
                                                  placeholder="回复${c.user2.name}："></textarea>

                                <button class="btn btn-primary" style="margin-left: 695px"
                                        onclick="addanswer(${album.id},${c.id})">回复
                                </button>


                            </div>
                        </div>

                    </div>

                </c:forEach>
                <hr style="border:1px dotted #ccc;;margin-top: 2px"></hr>


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
                    <form id="login_form" class="share_form" action="<%=basePath%>friend/shareAlbum.action" method="post" enctype="multipart/form-data">
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
                                        <input type="hidden" name="albumid" id="albumid" value="${album.id}">
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
</div>
<script src="<%= basePath%>singerhost/playerjs/jquery.min.js"></script>
<%--<script src="<%= basePath%>singerhost/playerjs/mplayer.js"></script>--%>
<%--<script src="<%= basePath%>singerhost/playerjs/mplayer-list.js"></script>--%>
<%--<script src="<%= basePath%>singerhost/playerjs/mplayer-functions.js"></script>--%>
<%--<script src="http://cdn.bootcss.com/jquery-nstslider/1.0.13/jquery.nstSlider.min.js"></script>--%>
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
    $("#tab tr").mouseover(function () {
        $(this).find($songtimebg).show();
        $(this).find($songtime).hide();
    }).mouseout(function () {
        $(this).find($songtimebg).hide();
        $(this).find($songtime).show();
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
<%--//评论--%>
<script>
    function sl(cid) {
        $(".c" + cid).slideToggle(400);
    }

    //添加评论
    function addcomments(sid) {
        var user='<%=session.getAttribute("user")%>';
        if(user=="null"||user==""){
            alert("请先登录");
        }else {
            var content = $("#t" + sid).val();
            if(content=="null"||content==""){
                alert("您还没有输入");
            }else{
            location.reload();
            $.ajax({
                url: "${pageContext.request.contextPath}/addalbumcomment.action",
                type: "post",
                data: "content=" + content + "&albumid=" + sid,
                success: function () {



                }
            });}
        }



    }

    //               添加回复
    function addanswer(sid, upperid) {
        var user='<%=session.getAttribute("user")%>';
        if(user=="null"||user==""){
            alert("请先登录");
        }else {
            var content = $("#a" + sid).val();
            if(content=="null"||content==""){
                alert("您还没有输入");
            }else{
            location.reload();
            $.ajax({
                url: "${pageContext.request.contextPath}/addalbumanswer.action",
                type: "post",
                data: "content=" + content + "&albumid=" + sid + "&upperid=" + upperid,
                success: function () {





                }
            });}
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
