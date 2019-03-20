<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";
%>

<html>
<head>
    <title>我的音乐</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/shcss/singerhost.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/colectsong.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>singerhost/sharecss/sharecontent.css">
    <link rel='stylesheet' href='<%=basePath%>bootstrap/css/bootstrap.min.css' />
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-fileinput.css" rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap.css " rel="stylesheet">
    <link href="<%= basePath%>singerhost/bootstrap-3.3.7-dist/css/bootstrap-theme.css" rel="stylesheet">
    <script type='text/javascript' src='<%=basePath%>bootstrap/jquery.js'></script>
    <script type='text/javascript' src='<%=basePath%>bootstrap/js/bootstrap.min.js'></script>
    <script src="<%= basePath%>singerhost/bootstrap-3.3.7-dist/js/bootstrap-fileinput.js"></script>
    <script src="<%= basePath%>singerhost/sharejs/share.js"></script>
    <!-- /container 导航栏 -->
    <script src="<%=basePath%>js/classie.js"></script>
    <script src="<%=basePath%>js/clipboard.min.js"></script>
    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css" /><%--样式冲突--%>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/component.css" />
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css">&lt;%&ndash;样式冲突&ndash;%&gt;--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/tab.css">

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
    </style>  <%--导航栏--%>

    <style>
        html, body{
            padding:0px;
            margin:0px;
            font-family: 'Raleway', sans-serif;
            color:#FFF;
            height:100%;
        }
        body{
            background:rgba(0, 0, 0, 0.5);
        }

        .container2{
            max-width:200px;
            background:rgba(0, 0, 0, 0.75);
            margin:40px auto;
            padding:10px 0px 20px 0px;
            border:1px solid #111;
            border-radius:4px;
            box-shadow:0px 4px 5px rgba(0, 0, 0, 0.75);
        }
        .link{
            font-size:16px;
            font-weight:300;
            text-align:center;
            position:relative;
            height:40px;
            line-height:40px;
            margin-top:10px;
            overflow:hidden;
            width:90%;
            margin-left:5%;
            cursor:pointer;
        }
        .link:after{
            content: '';
            position:absolute;
            width:80%;
            border-bottom:1px solid rgba(255, 255, 255, 0.5);
            bottom:50%;
            left:-100%;

            transition: all 0.5s;
        }
        .link:hover:after,
        .link.hover:after{
            left:100%;
        }
        .link .text{
            text-shadow:0px -40px 0px rgba(255, 255, 255, 1);
            transition:all 0.75s;
            transform:translateY(100%) translateZ(0);

        }
        .link:hover .text,
        .link.hover .text{
            text-shadow:0px -40px 0px rgba(255, 255, 255, 0);
            transform:translateY(0%) translateZ(0) scale(1.1);
            font-weight:600;
        }</style><%--左侧导航栏--%>

    <style>
        .a:hover{
            text-decoration: underline;
            text-decoration-color: blue;
        }
    </style>

    <style>
        .odd {
            background-color:#f2f2f2;
        }
    </style>

    <style type="text/css">
        .con4{
            width: 200px;
            height: 200px;
            overflow: hidden;
            margin: 15px auto;
            color: #FFFFFF;
        }
        .con4 .btn{
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: #d8b49c;
            display: block;
            font-size: 16px;
            border-radius: 5px;
        }
        .upload{
            float: left;
            position: relative;
        }
        .upload_pic{
            display: block;
            width: 100%;
            height: 40px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            border-radius: 5px;
            cursor: pointer;
        }
        #cvs{
            border: none;
        }
    </style>    <%--上传图片--%>

    <style>
        .changeimg{
            position: absolute;
            margin-top: -34px;
            margin-left: 4px ;
            background-color: rgba(96,96,96,0.7);
            width: 140px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
        }
        .font{
            color: white;
        }
        .font1{
            color: white;
            border-bottom:1px white solid;
        }

    </style><%--换图--%>

    <style type="text/css">
        *{padding:0;margin:0;list-style-type:none;}
        /* go */
        .go{width:47px;height:66px;background-color:#FFF;position:fixed;_position:absolute;right:60px;bottom:15%;border-radius:5px;box-shadow:0 0 2px #6E6E6E;*border:solid 1px #ddd;}
        .go a{background:url(<%=basePath%>images/retop.png) no-repeat;display:block;text-indent:999em;width:37px;margin:5px;border:0;overflow:hidden;float:left}
        .go .top{background-position:4px 7px;height:22px}
        .go .top:hover{background-position:-34px 7px;}
        .go .feedback{background-position:4px -18px;height:32px}
        .go .feedback:hover{background-position:-34px -18px}
        .go .bottom{background-position:4px -56px;height:22px}
        .go .bottom:hover{background-position:-34px -56px}
    </style>

</head>
<body style="background-color: #FCFCFC">



<%--<a name="gotop">&nbsp;</a>--%>
<div class="container">
    <div style="height: 1000px;width: 1000px;border: 1px solid #e0e0e0;background-color: white">

        <div style="width: 200px;height: 550px;margin-left: 40px;float: left ;position: fixed;top: 70px;overflow-y: auto">
            <div id="dd" class="container2" style="margin-top:50px">
                <div class="link">
                    <div class="text">首页</div>
                </div>
                <div class="link">
                    <a href="<%=basePath%>user/personalInformation.action"><div class="text">个人中心</div></a>
                </div>
                <div class="link" id="mysinger">
                    <div  class="text">我的歌手</div>
                </div>
                <div class="link" id="createsonglist">
                    <div  class="text">创建歌单</div>
                </div>
                <div class="link" id="createlist">
                    <div  class="text">创建的歌单</div>
                </div>
                    <div  id="create">
                    <c:forEach items="${songlist}" var="list">
                    <div class="${list.id} link" style="margin-top: -15px" onclick="songhidden(${list.id})">
                        <div class="text" style="margin-left: 20px;font-size: 12px;">
                                -${list.name}
                        </div>
                    </div>
                    </c:forEach>
                    </div>
                <div class="link" id="likelist">
                    <div class="text">收藏的歌单</div>
                </div>
                    <div id="like">
                        <c:forEach items="${likesonglist}" var="list">
                            <div  class="${list.id} link" style="margin-top: -15px" onclick="likesonghidden(${list.id})">
                                <div class="text" style="margin-left: 20px;font-size: 12px;">
                                    -${list.name}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
            </div>
        </div>

        <div hidden id="singer" class="aaa" style="width: 720px;height:100%;margin-left: 280px;margin-top: 70px">
            <div style="height: 50px"></div>
            <h1><span style="color:rgba(46,46,46,0.9);font-weight: bold">我的歌手（${fn:length(mySingers)}）</span></h1>
            <div style="background-color: red; width: 680px;height: 2px;margin-top: 10px"></div>
            <div style="height: 100px;width:680px;">

                <table>
                    <c:forEach items="${mySingers}" var="mysinger" >
                    <tr>
                        <td>
                            <div style="height: 100px;width:680px;border-bottom:1px solid #e0e0e0 ">
                                <a href="<%=basePath%>artist/singerhost.action?id=${mysinger.singer.id}"><img src="<%=resourcesPath%>images/100singer/${mysinger.singer.img}" style="width: 80px;height: 80px;margin-top: 10px"></a>
                                <div style="margin-left: 100px;margin-top: -70px">
                                    <span style="color:rgba(0,0,0,0.9);font-weight: bolder;font-size: 18px"><a href="<%=basePath%>artist/singerhost.action?id=${mysinger.singer.id}">${mysinger.singer.name}</a></span>
                                </div>
                                <div style="margin-left: 100px;margin-top: 20px">
                                    <span style="color:rgba(0,0,0,0.7);font-size: 12px"><span>${mysinger.singer.albumcount}</span>个专辑&nbsp;&nbsp;&nbsp;</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                </table>

            </div>
        </div><%--我的歌手--%>

        <div hidden id="new" class="aaa" style="width: 720px;height: 600px;margin-left: 280px;margin-top: 100px;">
            <div style="margin-left: 60px;margin-top: 40px"><h3><span style="color: black;font-weight: bolder">新建歌单</span></h3></div>
            <hr style="width: 600px;margin-top: 10px">
            <div>
                <form id="form1" action="<%=basePath%>user/createsonglist.action" onsubmit="return check()" enctype="multipart/form-data" method="post">
                    <div style="margin-left: -230px">
                        <div><span style="color: red">*</span><span style="font-size: 14px;color: black">歌单名:</span></div>
                        <input id="listname" type="text" name="listname" value="" class="form-control" maxlength="8"  style="width: 260px;margin-left: 55px;margin-top: -25px">
                        <div style="height: 20px"><span>&nbsp;</span></div>
                    </div>

                    <div style="margin-left: -230px">
                        <div style="margin-left: 20px"><span style="font-size: 14px;color: black">标签:</span></div>
                        <div style="margin-left: 55px;margin-top: -20px">
                            <table>
                                <tr style="font-size: 12px">
                                    <c:forEach items="${tags}" var="tag" varStatus="s">
                                    <td style="width: 60px">
                                        <input type="checkbox" value="${tag.id}" name="checkbox">
                                        <label style="color: black">${tag.name}</label>
                                    </td>
                                        <c:if test="${s.count%4==0}">
                                            </tr><tr style="width: 60px;font-size: 12px">
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <div style="margin-left: -230px;margin-top: 20px;color: black">
                        <div style="margin-left: 20px"><span style="font-size: 14px;color: black">介绍:</span></div>
                        <textarea name="introduce" cols="34" rows="5" style="margin-left: 55px;margin-top: -25px;resize: none"></textarea>
                    </div>
                    <div style="margin-left: -170px;margin-top: 20px;color: black;">
                        <input id="submitbutton" class="btn btn-info" style="width: 100px" type="submit" value="保存">
                        <input class="btn btn-info" style="width: 100px;margin-left: 50px" type="button" value="取消">
                    </div>

                    <div style="width: 300px;margin-top: -410px;margin-left: 100px">
                        <div id="change"  style="margin-left: 75px;margin-top:0px;width: 150px;height: 150px;border:1px solid #b4b4b4" >
                                <img src="<%=basePath%>images/default.jpg" width="140px" height="140px " style="margin:4px 4px">
                            <div id="changeimg" class="changeimg">
                                <span id="font" class="font" style="color: black" >更换头像<input name="imgup" type="file" class="upload_pic" id="upload" /></span>
                            </div>

                        </div>

                        <div class="con4" >
                            <canvas id="cvs" width="200" height="200"></canvas>
                        </div>

                        <div>
                            <button id="clean" type="button" class="btn btn-default" style="width: 150px;margin-left: 75px;margin-top: -5px">取消头像上传</button>
                        </div>

                    </div>



                </form>
            </div>
        </div><%--创建歌单--%>
        <c:forEach items="${songlist}" var="list" varStatus="s">
                <c:if test="${s.count==1}">
                    <div id="${list.id}" class="aaa" style="width: 720px;  margin-left: 280px;margin-top: 100px;">
                        <div style="width: 209px;height: 209px;border: 1px solid #e0e0e0;margin-top: 40px ">
                            <c:if test="${not empty list.img}">
                                <a href="<%=basePath%>songlist/songlist.action?id=${list.id}"><img src="<%=resourcesPath%>images/200songlist/${list.img}"  style="width: 200px;height: 200px;margin-top: 4px;margin-left: 4px"></a>
                            </c:if>
                            <c:if test="${empty list.img}">
                                <a href="<%=basePath%>songlist/songlist.action?id=${list.id}"><img src="<%=basePath%>images/default.jpg"  style="width: 200px;height: 200px;margin-top: 4px;margin-left: 4px"></a>
                            </c:if>
                        </div>

                    <div style="margin-top: -200px;margin-left: 230px">
                        <div style="background-color: #b90200;width: 40px" align="center"><span>歌单</span></div>
                    </div>
                    <div style="margin-left: 280px;margin-top: -25px">
                        <a href="<%=basePath%>songlist/songlist.action?id=${list.id}"><span style="color: #0f0f0f;font-size: 20px">${list.name}</span></a>
                    </div>
                    <div  style="margin-top:20px;margin-left: 230px;">
                        <a href="<%=basePath%>user/personalInformation.action" ><img src="<%=resourcesPath%>head/${sessionScope.user.img}" style="width: 36px;height: 36px"></a>
                        <div style="margin-left: 50px;margin-top: -30px">
                            <a class="a" href="<%=basePath%>user/personalInformation.action"><span style="font-size: 12px;color: #5763ff">${sessionScope.user.name}</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <span style="font-size: 12px;color: rgba(46,46,46,0.5)"><fmt:formatDate value="${list.createtime}" type="both"/> </span>
                        </div>
                    </div>
                    <div style="margin-top: 30px;margin-left: 230px">
                        <%--<a class="btn btn-default" href="#" role="button">播放</a>&nbsp;&nbsp;&nbsp;
                        <a class="btn btn-default" href="#" role="button"><img src="<%=basePath%>images/shareto.png" style="height: 16px;width: 16px">分享</a>&nbsp;&nbsp;&nbsp;
                        <a class="btn btn-default" href="#" role="button"><img src="<%=basePath%>images/download.png" style="height: 16px;width: 16px">下载</a><br/>
                        &nbsp;<br/>--%>
                        <c:if test="${ not empty list.introduce}">
                            <span style="color:rgba(46,46,46,0.6);font-size: 12px">介绍:${list.introduce}</span>
                        </c:if>
                        <c:if test="${ empty list.introduce}">
                            <span style="color:rgba(46,46,46,0.6);font-size: 12px">&nbsp;</span>
                        </c:if>
                    </div>
                    <div style="margin-left: 600px;margin-top: -135px">
                        <a href="<%=basePath%>user/removesonglist.action?songlistId=${list.id}">删除</a>
                    </div>
                    <div style="margin-top: 220px">
                        <div>
                            <h2><span style="color:rgba(46,46,46,0.7)">歌曲列表</span></h2>
                            <div style="margin-top: -25px;margin-left: 130px">
                                <span style="color:rgba(46,46,46,0.7);font-size: 12px"><span id="count${list.id}" >${fn:length(list.songs)}</span><span>首歌</span></span>
                            </div>
                        </div>
                        <div style="background-color: red; width: 680px;height: 2px;margin-top: 10px"></div>
                        <div style="height: 100px;width:680px;">
                        </div>
                    </div>

                    <div style="width: 720px;height:auto;margin-top: -100px">
                        <div style="width: 75px;height: 35px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <span></span>
                        </div>
                        <div style="width: 250px;height: 35px;margin-top: -35px;margin-left: 75px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0; ">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;歌曲标题</span>
                        </div>
                        <div style="width: 110px;height: 35px;margin-top: -35px;margin-left:325px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;时长</span>
                        </div>
                        <div style="width: 110px;height: 35px;margin-top: -35px;margin-left:435px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;歌手</span>
                        </div>
                        <div style="width: 135px;height: 35px;margin-top: -35px;margin-left:545px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;专辑</span>
                        </div>
                        <div>
                            <table id="tab${list.id}" class="table-hover">
                                <c:forEach items="${list.songs}" var="song" varStatus="s">
                                    <tr id="${song.id}" class="song" style="height: 40px" onmouseover="over(${song.id})" onmouseout="out(${song.id})">
                                        <td style="width: 35px" align="right">
                                            <div class="image" hidden="hidden">
                                                <a title="删除" onclick="remove(${list.id},${song.id})"><img  style="width: 16px;height: 16px;opacity: 0.4" src="<%=basePath%>images/delete.png"></a>
                                            </div>
                                        </td>
                                        <td style="width: 40px" align="center"><a href="javascript:parent.playSongid('${song.id}')"><img src="<%=basePath%>images/play2.png" style="width: 16px;height: 16px"></a> </td>
                                        <td style="width: 250px"><span style="color:rgba(46,46,46,0.8);font-size: 12px;font-weight: bolder">&nbsp;<a  href="<%=basePath%>song.action?id=${song.id}">${song.name}</a></span> </td>
                                        <td style="width: 110px;color:rgba(46,46,46,0.8);font-size: 12px">
                                            <div class="songtime">&nbsp;<fmt:formatNumber type="number" value="${song.duration/60}" maxFractionDigits="0"/>:${song.duration%60}</div>
                                            <div class="image" hidden="hidden">
                                                <%--改--%>
                                                &nbsp;<a href="javascript:parent.sendSongid('${song.id}')"><img src="<%=basePath%>images/plus01.png"></a>&nbsp;
                                                <%--<a href="#" data-toggle="modal" data-target="#myModal1" onclick="collectSong('${song.id}','${song.singer.id}')"><img src="<%=basePath%>images/collection.png"></a>&nbsp;--%>
                                                <%--<a href="#" id="ashare" data-toggle="modal" data-target="#myModal" onclick="shareSong('${song.id}','${song.name}','${song.singer.id}','${song.singer.name}')"><img src="<%=basePath%>images/share01.png"></a>&nbsp;--%>
                                                <a href="<%=resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%=basePath%>images/download01.png"></a>
                                            </div>
                                        </td>
                                        <td style="width: 110px;color:rgba(46,46,46,0.8);font-size: 14px">&nbsp;<a href="<%=basePath%>/artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                                        <td style="width: 135px;color:rgba(46,46,46,0.8);font-size: 14px">&nbsp;<a href="<%=basePath%>/album.action?id=${song.album.id}">${song.album.name}</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                </div><%--创建的歌单--%>

            </c:if>

            <c:if test="${s.count!=1}">
                <div hidden id="${list.id}" class="aaa" style="width: 720px;  margin-left: 280px;margin-top: 100px;">
                    <div style="width: 209px;height: 209px;border: 1px solid #e0e0e0;margin-top: 40px ">
                        <c:if test="${not empty list.img}">
                            <a href="<%=basePath%>songlist/songlist.action?id=${list.id}"><img src="<%=resourcesPath%>images/200songlist/${list.img}"  style="width: 200px;height: 200px;margin-top: 4px;margin-left: 4px"></a>
                        </c:if>
                        <c:if test="${empty list.img}">
                            <a  href="<%=basePath%>songlist/songlist.action?id=${list.id}"><img src="<%=basePath%>images/default.jpg"  style="width: 200px;height: 200px;margin-top: 4px;margin-left: 4px"></a>
                        </c:if>
                    </div>

                    <div style="margin-top: -200px;margin-left: 230px">
                        <div style="background-color: #b90200;width: 40px" align="center"><span>歌单</span></div>
                    </div>
                    <div style="margin-left: 280px;margin-top: -25px">
                        <a href="<%=basePath%>songlist/songlist.action?id=${list.id}"><span style="color: #0f0f0f;font-size: 20px">${list.name}</span></a>
                    </div>
                    <div  style="margin-top:20px;margin-left: 230px;">

                        <a href="<%=basePath%>use/personalInformation.action"><img src="<%=resourcesPath%>/head/${sessionScope.user.img}" style="width: 36px;height: 36px"></a>
                        <div style="margin-left: 50px;margin-top: -30px">
                            <a class="a" href="<%=basePath%>user/personalInformation.action"><span style="font-size: 12px;color: #5763ff">${sessionScope.user.name}</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <span style="font-size: 12px;color: rgba(46,46,46,0.5)"><fmt:formatDate value="${list.createtime}" type="both"/> </span>
                        </div>
                    </div>
                    <div style="margin-top: 30px;margin-left: 230px">
                        <%--<a class="btn btn-default" href="#" role="button">播放</a>&nbsp;&nbsp;&nbsp;--%>
                        <%--<a class="btn btn-default" href="#" role="button"><img src="<%=basePath%>images/shareto.png" style="height: 16px;width: 16px">分享</a>&nbsp;&nbsp;&nbsp;--%>
                        <%--<a class="btn btn-default" href="#" role="button"><img src="<%=basePath%>images/download.png" style="height: 16px;width: 16px">下载</a><br/>--%>
                        <%--&nbsp;<br/>--%>
                        <c:if test="${ not empty list.introduce}">
                            <span style="color:rgba(46,46,46,0.6);font-size: 12px">介绍:${list.introduce}</span>
                        </c:if>
                        <c:if test="${ empty list.introduce}">
                            <span style="color:rgba(46,46,46,0.6);font-size: 12px">&nbsp;</span>
                        </c:if>
                    </div>
                    <div style="margin-left: 600px;margin-top: -135px">
                        <a href="<%=basePath%>user/removesonglist.action?songlistId=${list.id}">删除</a>
                    </div>
                    <div style="margin-top: 220px">
                        <div>
                            <h2><span style="color:rgba(46,46,46,0.7)">歌曲列表</span></h2>
                            <div style="margin-top: -25px;margin-left: 130px">
                                <span style="color:rgba(46,46,46,0.7);font-size: 12px"><span id="count${list.id}" >${fn:length(list.songs)}</span><span>首歌</span></span>
                            </div>
                        </div>
                        <div style="background-color: red; width: 680px;height: 2px;margin-top: 10px"></div>
                        <div style="height: 100px;width:680px;">
                        </div>
                    </div>

                    <div style="width: 720px;height:auto;margin-top: -100px">
                        <div style="width: 75px;height: 35px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <span></span>
                        </div>
                        <div style="width: 250px;height: 35px;margin-top: -35px;margin-left: 75px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0; ">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;歌曲标题</span>
                        </div>
                        <div style="width: 110px;height: 35px;margin-top: -35px;margin-left:325px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;时长</span>
                        </div>
                        <div style="width: 110px;height: 35px;margin-top: -35px;margin-left:435px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;歌手</span>
                        </div>
                        <div style="width: 135px;height: 35px;margin-top: -35px;margin-left:545px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                            <div style="height: 10px"></div>
                            <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;专辑</span>
                        </div>
                        <div>
                            <table id="tab${list.id}" class="table-hover">
                                <c:forEach items="${list.songs}" var="song" varStatus="s">
                                    <tr id="${song.id}" class="song" style="height: 40px" onmouseover="over(${song.id})" onmouseout="out(${song.id})">
                                        <td style="width: 35px" align="right">
                                            <div class="image" hidden="hidden">
                                            <a title="删除" onclick="remove(${list.id},${song.id})"><img  style="width: 16px;height: 16px;opacity: 0.4" src="<%=basePath%>images/delete.png"></a>
                                            </div>
                                        </td>
                                        <td style="width: 40px" align="center"><img src="<%=basePath%>images/play2.png" style="width: 16px;height: 16px"> </td>
                                        <td style="width: 250px"><span style="color:rgba(46,46,46,0.8);font-size: 12px;font-weight: bolder">&nbsp;<a href="<%=basePath%>/song.action?id=${song.id}">${song.name}</a></span> </td>
                                        <td style="width: 110px;color:rgba(46,46,46,0.8);font-size: 12px">
                                            <div class="songtime">&nbsp;<fmt:formatNumber type="number" value="${song.duration/60}" maxFractionDigits="0"/>:${song.duration%60}</div>
                                            <div class="image" hidden="hidden">
                                                &nbsp;<a href="javascript:parent.sendSongid('${song.id}')"><img src="<%=basePath%>images/plus01.png"></a>&nbsp;
                                                <%--<a href="#"><img src="<%=basePath%>images/collection.png"></a>&nbsp;--%>
                                                <%--<a href="#"><img src="<%=basePath%>images/share01.png"></a>&nbsp;--%>
                                                <a href="<%=resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%=basePath%>images/download01.png"></a>
                                            </div>
                                        </td>
                                        <td style="width: 110px;color:rgba(46,46,46,0.8);font-size: 14px">&nbsp;<a href="<%=basePath%>/artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                                        <td style="width: 135px;color:rgba(46,46,46,0.8);font-size: 14px">&nbsp;<a href="<%=basePath%>/album.action?id=${song.album.id}">${song.album.name}</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>



                </div><%--创建的歌单--%>
            </c:if>
        </c:forEach><%--创建的歌单--%>

        <c:forEach items="${likesonglist}" var="likelist">
            <div hidden id="${likelist.id}" class="aaa" style="width: 720px;  margin-left: 280px;margin-top: 100px;">

                <div style="width: 209px;height: 209px;border: 1px solid #e0e0e0;margin-top: 40px ">
                    <a href="<%=basePath%>songlist/songlist.action?id=${likelist.id}"><img src="<%=resourcesPath%>images/200songlist/${likelist.img}"  style="width: 200px;height: 200px;margin-top: 4px;margin-left: 4px"></a>
                </div>

                <div style="margin-top: -200px;margin-left: 230px">
                    <div style="background-color: #b90200;width: 40px" align="center"><span>歌单</span></div>
                </div>
                <div style="margin-left: 280px;margin-top: -25px">
                    <a href="<%=basePath%>songlist/songlist.action?id=${likelist.id}"><span style="color: #0f0f0f;font-size: 20px">${likelist.name}</span></a>
                </div>
                <div  style="margin-top:20px;margin-left: 230px;">
                    <a href="personalInformation.action?id=${likelist.user.id}"><img src="<%=resourcesPath%>head/${likelist.user.img}" style="width: 36px;height: 36px"></a>
                    <div style="margin-left: 50px;margin-top: -30px">
                        <a class="a" href="personalInformation.action?id=${likelist.user.id}"><span style="font-size: 12px;color: #5763ff">${likelist.user.name}</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="font-size: 12px;color: rgba(46,46,46,0.5)"><fmt:formatDate value="${likelist.createtime}" type="both"/> </span>
                    </div>
                </div>
                <div style="margin-top: 30px;margin-left: 230px">

                    <c:if test="${ not empty likelist.introduce}">
                    <span style="color:rgba(46,46,46,0.6);font-size: 12px">介绍:${likelist.introduce}</span>
                    </c:if>
                    <c:if test="${ empty likelist.introduce}">
                        <span style="color:rgba(46,46,46,0.6);font-size: 12px">&nbsp;</span>
                    </c:if>
                </div>
                <div style="margin-left: 600px;margin-top: -135px">
                    &nbsp;
                </div>
                <div style="margin-top: 220px">
                    <div>
                        <h2><span style="color:rgba(46,46,46,0.7)">歌曲列表</span></h2>
                        <div style="margin-top: -25px;margin-left: 130px">
                            <span style="color:rgba(46,46,46,0.7);font-size: 12px">${fn:length(likelist.songs)}<span></span>首歌</span>
                        </div>
                    </div>
                    <div style="background-color: red; width: 680px;height: 2px;margin-top: 10px"></div>
                    <div style="height: 100px;width:680px;">
                    </div>
                </div>

                <div style="width: 720px;height:auto;margin-top: -100px">
                    <div style="width: 75px;height: 35px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                        <span></span>
                    </div>
                    <div style="width: 250px;height: 35px;margin-top: -35px;margin-left: 75px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0; ">
                        <div style="height: 10px"></div>
                        <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;歌曲标题</span>
                    </div>
                    <div style="width: 110px;height: 35px;margin-top: -35px;margin-left:325px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                        <div style="height: 10px"></div>
                        <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;时长</span>
                    </div>
                    <div style="width: 110px;height: 35px;margin-top: -35px;margin-left:435px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                        <div style="height: 10px"></div>
                        <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;歌手</span>
                    </div>
                    <div style="width: 135px;height: 35px;margin-top: -35px;margin-left:545px;border-bottom: solid 1px #e0e0e0;border-right:solid 1px #e0e0e0;">
                        <div style="height: 10px"></div>
                        <span style="color:rgba(46,46,46,0.7);font-size: 14px">&nbsp;专辑</span>
                    </div>
                    <div>
                        <table class="table-hover">
                            <c:forEach items="${likelist.songs}" var="song" varStatus="s">
                                <tr id="${song.id}" class="song" style="height: 40px" onmouseover="over(${song.id})" onmouseout="out(${song.id})">
                                    <td style="width: 35px" align="right"><span style=";color:rgba(46,46,46,0.8)">${s.count}.</span></td>
                                    <td style="width: 40px" align="center"><img src="<%=basePath%>images/play2.png" style="width: 16px;height: 16px"> </td>
                                    <td style="width: 250px"><span style="color:rgba(46,46,46,0.8);font-size: 12px;font-weight: bolder">&nbsp;<a href="<%=basePath%>/song.action?id=${song.id}">${song.name}</a></span> </td>
                                    <td style="width: 110px;color:rgba(46,46,46,0.8);font-size: 12px">
                                        <div class="songtime">&nbsp;<fmt:formatNumber type="number" value="${song.duration/60}" maxFractionDigits="0"/>:${song.duration%60}</div>
                                        <div hidden class="image">
                                            &nbsp;<a href="javascript:parent.sendSongid('${song.id}')"><img src="<%=basePath%>images/plus01.png"></a>
                                            <a href="<%=resourcesPath%>song/${song.url}" download="${song.name}"><img src="<%=basePath%>images/download01.png"></a>
                                        </div>
                                    </td>
                                    <td style="width: 110px;color:rgba(46,46,46,0.8);font-size: 14px">&nbsp;<a href="<%=basePath%>/artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a></td>
                                    <td style="width: 135px;color:rgba(46,46,46,0.8);font-size: 14px">&nbsp;<a href="<%=basePath%>/album.action?id=${song.album.id}">${song.album.name}</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div><%--收藏的歌单--%>
        </c:forEach><%--收藏的歌单--%>


    </div>

    <a name="gobottom">&nbsp;</a>

    <div class="go">
        <a title="返回顶部" class="top" href="#gotop"></a>
        <a title="返回底部" class="bottom" href="#gobottom"></a>
    </div>
</div>
<script>
    function remove(val,data) {
        var songtab="#tab"+val;
        var songtr="#"+data;
        var songcount="#count"+val;
       $.ajax({
           type:"post",
           url:"<%=basePath%>user/removesong.action",
           data:"songlistId="+val+"&songId="+data,
           success:function () {
               $(songtab+" "+songtr).remove();
               var count=$(songcount).html()
               $(songcount).text(count-1);
           }
       });
    }
</script>

<script>
    function over(val) {
        $("#"+val+" .songtime").prop("hidden",true);
        $("#"+val+" .image").removeAttr("hidden");
    }
    function out(val) {
        $("#"+val+" .image").prop("hidden",true);
        $("#"+val+" .songtime").removeAttr("hidden");
    }

</script>

<script>
    var issubmit="false";
    function check() {
        if(issubmit=="true"){
            return true;
        }else{
            alert("歌单名不能为空哦！");
            return false;
        }
    }
    $(function () {
        $("#submitbutton").click(function () {
            var val=$("#listname").val();
            if(val!=""){
                issubmit="true";
            }
        })
    })


</script><%--歌单名不能为空--%>

<script>
    var input1 = document.getElementById("upload");

    if(typeof FileReader==='undefined'){
        input1.setAttribute('disabled','disabled');
    }else{
        input1.addEventListener('change',readFile,false);
    }
    function readFile(){
        var file = this.files[0];
        if(!/image\/\w+/.test(file.type)){
            alert("文件必须为图片！");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            var image = new Image();
            image.src = e.target.result;
            var max=200;
            image.onload = function(){
                var canvas = document.getElementById("cvs");
                var ctx = canvas.getContext("2d");
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.drawImage(image, 0, 0, 200, 200);
            };
        }
    };
</script><%--上传图片--%>

<script>
    $(function () {
        $("#clean").click(function () {
            var canvas=document.getElementById("cvs");
            var ctx=canvas.getContext("2d");
            ctx.clearRect(0,0,canvas.width,canvas.height);
            var image=document.getElementById("upload");
            image.value='';

        })
    })

</script><%--清除上传--%>

<%--点击显示隐藏事件--%>
<script>
    $(function () {
        $("#createlist").click(function () {
            if($("#create").is(":hidden")){
                $("#create").removeAttr("hidden");
            }else {
                $("#create").prop("hidden",true);
            }
        })
    })
    function songhidden(data) {
        $(".aaa").prop("hidden",true);
        $("#"+data+"").removeAttr("hidden");
    }
</script>
<script>
    $(function () {
        $("#createsonglist").click(function () {
            $(".aaa").prop("hidden",true);
            $("#new").removeAttr("hidden");
        })
    })
</script>
<script>
    $(function () {
        $("#mysinger").click(function () {
            $(".aaa").prop("hidden",true);
            $("#singer").removeAttr("hidden");
        })
    })
</script>

<script>
    $(function () {
        $("#likelist").click(function () {
            if($("#like").is(":hidden")){
                $("#like").removeAttr("hidden");
            }else {
                $("#like").prop("hidden",true);
            }
        })
    })
    function likesonghidden(data) {
        $(".aaa").prop("hidden",true);
        $("#"+data+"").removeAttr("hidden");
    }
</script>

<script>
    (function() {
        [].slice.call(document.querySelectorAll('.menu')).forEach(function(menu) {
            var menuItems = menu.querySelectorAll('.menu__link'),
                setCurrent = function(ev) {
                    ev.preventDefault();

                    var item = ev.target.parentNode; // li

                    // return if already current
                    if (classie.has(item, 'menu__item--current')) {
                        return false;
                    }
                    // remove current
                    classie.remove(menu.querySelector('.menu__item--current'), 'menu__item--current');
                    // set current
                    classie.add(item, 'menu__item--current');
                };

            [].slice.call(menuItems).forEach(function(el) {
                el.addEventListener('click', setCurrent);
            });
        });

        [].slice.call(document.querySelectorAll('.link-copy')).forEach(function(link) {
            link.setAttribute('data-clipboard-text', location.protocol + '//' + location.host + location.pathname + '#' + link.parentNode.id);
            new Clipboard(link);
            link.addEventListener('click', function() {
                classie.add(link, 'link-copy--animate');
                setTimeout(function() {
                    classie.remove(link, 'link-copy--animate');
                }, 300);
            });
        });
    })(window);/*导航栏*/
</script><%--导航栏--%>

<script>
    /*歌单table样式*/
    $(function (){
        $('tr:odd').addClass('odd');
    });
</script><%--table样式--%>

<%--<link rel="stylesheet" href="<%= basePath%>singerhost/playercss/mplayer.css">--%>
<%--<script src="<%= basePath%>singerhost/playerjs/jquery.min.js"></script>--%>
<%--<script src="<%= basePath%>singerhost/playerjs/mplayer.js"></script>--%>
<%--<script src="<%= basePath%>singerhost/playerjs/mplayer-list.js"></script>--%>
<%--<script src="<%= basePath%>singerhost/playerjs/mplayer-functions.js"></script>--%>
<%--<script src="http://cdn.bootcss.com/jquery-nstslider/1.0.13/jquery.nstSlider.min.js"></script>--%>

<%--模态框--%>
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
        <form id="login_form" class="share_form" action="<%=basePath%>friend/share.action" method="post" enctype="multipart/form-data">
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
</div>

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
