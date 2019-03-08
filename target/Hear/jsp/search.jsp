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
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/demo.css" />

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/component.css" />
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/bootstrap.css">
    <script src="<%= basePath%>js/jquery.min.js"></script>
    <!-- /container -->
    <script src="<%= basePath%>js/classie.js"></script>
    <script src="<%= basePath%>js/clipboard.min.js"></script>
    <script src="<%= basePath%>js/nav.js"></script>
    <script src="<%= basePath%>js/shjs.js"></script>
    <style>
        #logo {
            position: absolute;
            left: 30px;
            width: 164px;
            height: 62px;


        }
        /*选项卡*/
        #myTab{
            margin-bottom: auto;
            height: 39px;
            border: 1px solid #ccc;
            background-color: #F8F7F6!important;
            padding: 0;
            margin: 0;
            display: block;
            list-style-type: disc;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
            clear: both;
            display: block;


        }
        .change{
            border-top:2px solid red;
            background-color: white;
        }

        .tabli{
            position: relative;
            left: -1px;
            float: left;
            height: 39px;
            font-size: 14px;
            list-style: none;
            padding: 0;
            margin-left: 30px;
            display: list-item;
            text-align: -webkit-match-parent;
            word-wrap: break-word;

            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .taba{
            padding-left: 2px;
            float: left;
            height: 39px;
            font-size: 14px;
            outline: none;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            list-style: none;
            text-align: -webkit-match-parent;


        }
        .tabem{
            width: 140px;
            height: 37px;
            padding: 2px 2px 0 0;
            line-height: 37px;
            cursor: pointer;
            text-align: center;
            float: left;
            font-size: 14px;
            font-style: normal;
            color: #333;
            list-style: none;

        }
        .tabletr{
            padding: 10px 10px 10px 18px;
            border: none;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;

        }


        .tdplay{
            float: left;

        }
        .play{
            height: 17px;
            width: 17px;
        }
        .td-songname{
            width: 370px;
            float: left;

            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .td-tubiao{
            float: left;


        }
        .a-img{

            margin-bottom: 3px;
            width: 13px;
            height: 13px;
            margin-right: 8px;
            vertical-align: middle;
            cursor: pointer;
        }
        .td-singername{
            width: 15%;
            float: left;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .td-album{
            width: 18%;
            float: left;
            color: #666;!important;

        }
        .td-time{
            float: left;
            margin-right: 5px;
        }
        #danqu a{
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .td-album a{
            font-size: 12px;
            color: #666;
            font-family: Arial, Helvetica, sans-serif;
        }
        #danqu td{
            border: none!important;
        }
        #geshou{
            margin: 0 0 0 -24px;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        #zhuanji{
            margin: 0 0 0 -24px;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        #zhuanji td{
            width: 130px;
            height: 154px;
            padding: 0 0 30px 24px;
        }
        #geshou td{
            width: 130px;
            height: 154px;
            padding: 0 0 30px 24px;
        }

        #gedan{
            border-collapse: separate;
            border-spacing: 0;
            border: none;
            width: 100%;
            display: table;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        #gedan tr{
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        #gedan .td_play{
            border-left: 1px solid #fff;
            width: 25px;
            padding-top: 5px;
            padding-bottom: 5px;

            padding: 6px 10px;
            line-height: 18px;
            text-align: left;
            margin: 0;
            display: table-cell;
            vertical-align: inherit;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        #gedan .td_slimg{
            width: 50px;
            padding-top: 5px;
            padding-bottom: 5px;


            padding: 6px 10px;
            line-height: 18px;
            text-align: left;
            display: table-cell;
            vertical-align: inherit;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .td_slname{
            padding-top: 5px;
            padding-bottom: 5px;


            padding: 6px 10px;
            line-height: 18px;
            text-align: left;
            margin: 0;
            display: table-cell;
            vertical-align: inherit;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .td_slname span{
            position: relative;
            display: inline-block;
            padding-right: 25px;
            margin-right: -25px;
            max-width: 99%;
            height: 20px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            border: 0;
            line-height: 18px;
            text-align: left;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }

        #gedan .td_tubiao{
            padding-top: 5px;
            padding-bottom: 5px;


            padding: 6px 10px;
            line-height: 18px;
            text-align: left;
            margin: 0;
            display: table-cell;
            vertical-align: inherit;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .td_slcount{
            display: table-cell;
            line-height: 46px!important;

            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        a{
            cursor: pointer;
        }
        #yonghu td{
            float: left;
            border: none!important;
        }
        .td_guanzhu{
            width: 96px;
            padding-top: 18px!important;
            padding-bottom: 5px;
            padding: 6px 10px;
            line-height: 18px;
            text-align: left;
            display: table-cell;
            vertical-align: inherit;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 12px;
            color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }
        .my{
            display: none;
        }

        #ul{
            position: absolute;
            left: 190px;
            top: -5px;
        }
        .tablelist{
            width: 640px;
            min-height: 300px;
            background-color: #ffffff;
            font-size: 12px;
            color: #333;
        }
        .tab{
            border-collapse: collapse;
            border-spacing: 0;
            table-layout: fixed;
            border: none;
            width: 100%;
        }
        tbody{
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }
        tr{
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }
        td th{
            display: table-cell;
            vertical-align: inherit;
        }
        table td{
            padding: 6px 10px;
            line-height: 18px;
            text-align: left;
        }
        table .w1{
            width: 74px;
            font-size: 12px;
            color: #333;
        }

        table .ply {
            float:right;
            width: 17px;
            height: 17px;
            cursor: pointer;
            background-position: 0 -103px;
        }
        td a{
            color:#333;
        }
        td .plyimg{
            width: 18px;
            height: 18px;
        }

        .tt{
            float: left;
            width: 100%;
            margin-right: 20px;
        }
        .txt{
            position: relative;
            display: inline-block;
            margin-right: -25px;
            max-width: 99%;
            height: 20px;
            line-height: 20px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        #songtxt{
            padding-right: 25px;
            padding: 1px 0;
        }
        .txt a{
            font-size: 12px;
            color: #333;
        }
        .w3{
            position: relative;
            width: 69px;
            color: #666;
            font-size: 12px;
        }
        .songtime{
            position: relative;
            top: 2px;
        }
        .songtimebg{
            position: absolute;
            padding: 7px 0;
            left: 0;
            top: 0;
            display: none;
        }
        .w4{
            width: 20%;
            font-size: 12px;
            position: relative
        }
        .albumtxt{
            width: 100%;
            position: relative;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            top: 2px;
        }



        .tuijian1 img{
            width: 133px;
            height: 133px;
        }
        .tuijian1 p{
            margin-top: 5px;
        }

        .idiv{
            height:130px;
            width:130px;
            overflow: hidden;
        }
        .singerimg{
            height:130px;
            width:130px;
            transition: all 0.6s;
        }
        .singerimg:hover{
            transform: scale(1.3);
        }
    </style>
</head>
<body style="background-color: #f5f5f5;">
<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;" >
        <img href="#"  id="logo" src="<%= basePath%>img/logo.png"/>
        <ul class="menu__list" id="ul">
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>songlist/index.action'">推荐</a></li>
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

<div style="width: 980px;margin: 0 auto;background-color: #fff;border: 1px solid #d3d3d3;min-height: 700px;padding: 40px">
    <%--搜索栏--%>
    <div style="font-size: 12px;color: #333;font-family: Arial, Helvetica, sans-serif;">
        <form action="<%=basePath%>search/searchall.action" method="post" class="form-inline" style="width:500px;height: 40px;margin: 0 auto">
            <input type="text" class="form-control" id="keywords" placeholder="Hear" name="content" style="width: 390px;height: 40px" value="${content}"><button type="submit" class="btn btn-primary" style="height: 40px">搜索</button>
        </form>
    </div>
    <%--导航栏--%>
    <div>
        <div style="margin: 28px 0 17px;color: #999;font-family: Arial, Helvetica, sans-serif;font-size: 12px;"><%--搜索到--%><em style="color: #c20c0c;font-style: normal;text-align: left;font-size: inherit;"><%--600--%></em></div>
        <ul id="myTab">
            <li class="tabli change">
                <a class="taba">
                    <em  class="tabem">单曲</em>
                </a>
            </li>
            <li class="tabli">
                <a class="taba">
                    <em  class="tabem">歌手</em>
                </a>
            </li>
            <li class="tabli">
                <a class="taba">
                    <em  class="tabem">歌单</em>
                </a>
            </li>
            <li class="tabli">
                <a class="taba">
                    <em  class="tabem">专辑</em>
                </a>
            </li>
            <li class="tabli">
                <a class="taba">
                    <em  class="tabem">用户</em>
                </a>
            </li>

        </ul>
    </div>
    <%--切换的内容--%>
    <div class="mybox">
        <%--单曲--%>
        <div class="my" style="display: block">
            <table class="table table-striped table-hover" style="margin-top: 20px;" id="danqu">
                <c:forEach items="${songs.list}" var="song" varStatus="s">
                    <tr class="tabletr">
                        <!--序号和播放图标-->
                        <td class="tdplay">
                            <%--<a href="javascript:sendSongid('${song.id}')" class="play"><img class="plyimg" id="playimg" src="<%= basePath%>img/play1.png"/> </a>--%>
                        </td>
                        <!--歌曲名-->
                        <td class="td-songname">
                            <a href="<%=basePath%>song.action?id=${song.id}">${song.name}</a>
                        </td>
                        <td class="td-tubiao" style="visibility:hidden">
                            <%--<a class="a-img" href="#"><img width="13px" height="13px" src="<%= basePath%>img/plus01.png"/></a>--%>
                            <%--<a class="a-img" href="#"><img width="13px" height="13px" src="<%= basePath%>img/collect01.png"/></a>--%>
                            <%--<a class="a-img" href="#"><img width="13px" height="13px" src="<%= basePath%>img/share01.png"/></a>--%>
                            <a class="a-img" href="<%=resourcesPath%>song/${song.url}" download="${song.name}"><img width="13px" height="13px" src="<%= basePath%>img/download01.png"/></a>
                        </td>

                        <td class="td-singername">
                            <a href="<%=basePath%>artist/singerhost.action?id=${song.singer.id}">${song.singer.name}</a>
                        </td>
                        <!--专辑名-->
                        <td class="td-album">
                            <a href="<%=basePath%>album.action?id=${song.album.id}">${song.album.name}</a>
                        </td>
                        <td class="td-time">
                                ${song.time}
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <nav aria-label="...">
                <ul class="pager">
                    共 <b>${songs.total}</b> 条
                    <a href="javascript:getPage(${songs.firstPage})" >首页</a>
                    <c:if test="${!songs.isFirstPage}">
                        <li><a href="javascript:getPage(${songs.prePage})">上一页</a></li>
                    </c:if>
                    当前第<span>${songs.pageNum}</span>页
                    <c:if test="${!songs.isLastPage}">
                        <li><a href="javascript:getPage(${songs.nextPage})">下一页</a></li>
                    </c:if>
                    <a href="javascript:getPage(${songs.lastPage})" >末页</a>

                </ul>
            </nav>
            <script >
                function getPage(curPage) {
                    window.location.href ="<%=basePath%>search/searchall.action?scurPage="+curPage;
                }


            </script>
        </div>


        <%--歌手--%>
        <div class="my">


            <table style="margin-top: 20px;"  class="" id="geshou">
                <c:forEach var="singer" items="${singers}" varStatus="num">
                    <c:if test="${num.count eq 1 || (num.count-1)%6 eq 0 }">
                        <tr>
                    </c:if>
                    <td style="padding-bottom: 30px">
                        <div class="idiv" style="width: 130px;height: 130px;">
                            <a href="<%=basePath%>artist/singerhost.action?id=${singer.id}">
                                <img class="singerimg" style="width: 130px;height: 130px"  src="<%= resourcesPath%>images/100singer/${singer.img}" />
                            </a>
                        </div>
                        <p style="margin-top: 8px;font-family: Arial, Helvetica, sans-serif;">
                            <a style="color: #333" href="<%=basePath%>artist/singerhost.action?id=${singer.id}">${singer.name}</a>
                        </p>
                    </td>
                    <c:if test="${num.count % 6 eq 0 || num.count eq 6 }">
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>

        <%--歌单--%>
        <div class="my">


            <table class="table table-striped table-hover" style="margin-top: 20px;" id="gedan">
                <c:forEach items="${songlists}" var="sl">
                    <tr>
                        <%--<td class="td_play">
                            <a href="" class="ply"><img class="plyimg" id="playimg1" src="<%= basePath%>img/play1.png"/> </a>
                        </td>--%>
                        <td class="td_slimg">
                            <a href="<%=basePath%>songlist/songlist.action?id=${sl.id}">
                                <c:if test="${empty sl.img}">
                                    <img style="float: left; width: 50px; height: 50px; margin-right: 5px;" src="<%=basePath%>images/default.jpg">
                                </c:if>
                                <c:if test="${not empty sl.img}">
                                    <img style="float: left; width: 50px; height: 50px; margin-right: 5px;" src="<%= resourcesPath%>images/200songlist/${sl.img}">
                                </c:if>
                            </a>
                        </td>
                        <td class="td_slname">
                            <a style=" float: left; margin-top: 13px;" href="<%=basePath%>songlist/songlist.action?id=${sl.id}">${sl.name} </a>
                        </td>
                        <td style="width: 50px">

                        </td>

                        <td class="td_slcount">${sl.songNum}首</td>
                        <td style="width: 170px;font-size: 12px; color: #666;line-height: 46px!important;">by&nbsp;&nbsp;<a href="<%=basePath%>user/personalInformation.action?id=${sl.user.id}">${sl.user.name}</a></td>
                        <td style="width: 120px;font-size: 12px; color: #999;line-height: 46px!important;">收藏：&nbsp;${sl.collectionNum}</td>

                    </tr>
                </c:forEach>
            </table>
        </div>
        <%--专辑--%>
        <div class="my">


            <table style="margin-top: 20px;" class="" id="zhuanji">
                <c:forEach var="album" items="${albums}" varStatus="num">
                    <c:if test="${num.count eq 1 || (num.count-1)%6 eq 0 }">
                        <tr>
                    </c:if>
                    <td style="padding-bottom: 30px">
                        <div class="idiv" style="width: 130px;height: 130px;">
                            <a href="<%=basePath%>album.action?id=${album.id}">
                                <img class="singerimg" style="width: 130px;height: 130px"  src="<%= resourcesPath%>images/200album/${album.img}" />
                            </a>
                        </div>
                        <p style="margin-top: 8px;font-family: Arial, Helvetica, sans-serif;height: 14px;overflow: hidden">
                            <a style="color: #333" href="<%=basePath%>album.action?id=${album.id}">${album.name}</a>
                        </p>
                        <p style="font-family: Arial, Helvetica, sans-serif;">
                            <a style="color: #333" href="<%=basePath%>artist/singerhost.action?id=${album.singer.id}">${album.singer.name}</a>
                        </p>
                    </td>
                    <c:if test="${num.count % 6 eq 0 || num.count eq 6 }">
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
        <%--用户--%>
        <div class="my">


            <table class="table table-striped table-hover" style="margin-top: 20px;" id="yonghu">
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>
                            <a style="width: 45px;height: 45px " href="<%=basePath%>user/personalInformation.action?id=${user.id}">
                                <c:if test="${empty user.img}">
                                    <img style="width: 45px;height: 45px" src="<%=basePath%>images/headimg.jpg">
                                </c:if>
                                <c:if test="${not empty user.img}">
                                    <img style="width: 45px;height: 45px" src="<%= resourcesPath%>head/${user.img}">
                                </c:if>
                            </a>
                        </td>
                        <td style="width: 480px">
                            <div>
                                <a href="<%=basePath%>user/personalInformation.action?id=${user.id}">${user.name}</a>
                            </div>
                            <div style="margin-top: 10px">
                                <span style="font-size: 12px;color:rgba(46,46,46,0.7)">${user.introduce}</span>
                            </div>
                        </td>
                        <td class="td_guanzhu">
                            <c:if test="${user.flag==1}">
                                <c:if test="${user.id==sessionScope.user.id}">
                                    <a class="btn btn-default btn-sm r${user.id}" style="visibility: hidden">
                                        已关注
                                    </a>
                                </c:if>
                                <c:if test="${user.id!=sessionScope.user.id}">
                                    <a class="btn btn-default btn-sm r${user.id}" style="">
                                        已关注
                                    </a>
                                </c:if>


                            </c:if>
                            <c:if test="${user.flag!=1||empty sessionScope.user}">
                                <c:if test="${user.id==sessionScope.user.id}">
                                    <a class="btn btn-default btn-sm r${user.id}" style="visibility: hidden" href="javascript:void(0)" onclick="attention(${user.id})">
                                        <em style="color: red">+</em>
                                        关注
                                    </a>
                                </c:if>
                                <c:if test="${user.id!=sessionScope.user.id}">
                                    <a class="btn btn-default btn-sm r${user.id}" style="" href="javascript:void(0)" onclick="attention(${user.id})">
                                        <em style="color: red">+</em>
                                        关注
                                    </a>
                                </c:if>
                            </c:if>

                        </td>
                        <td style="width: 96px;color: #999;font-family: Arial, Helvetica, sans-serif;font-size: 12px;padding-top: 25px;margin-left: 20px">歌单：&nbsp;${user.createSongListNum}</td>
                        <td style="width: 96px;color: #999;font-family: Arial, Helvetica, sans-serif;font-size: 12px;padding-top: 25px;margin-left: 40px">粉丝：&nbsp;${user.fansNum}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <script>
        $().ready(function(){
            $("#myTab li").click(function(){
                //通过 .index()方法获取元素下标，从0开始，赋值给某个变量
                var index = $(this).index();

                //让内容框的第 _index 个显示出来，其他的被隐藏
                $(".my").eq(index).show().siblings().hide();
                //改变选中时候的选项框的样式，移除其他几个选项的样式
                $(this).addClass("change").siblings().removeClass("change");
            });
            $("#danqu tr").mouseover(function(){
                //通过 .index()方法获取元素下标，从0开始，赋值给某个变量

                //让内容框的第 _index 个显示出来，其他的被隐藏
                $(this).children("td").eq(2).css("visibility","visible");
            }).mouseout(function () {
                $(this).children("td").eq(2).css("visibility","hidden");
            });

        });
    </script>

</div>
<script>
    function  attention(id) {
        var user='<%=session.getAttribute("user")%>';
        if(user=="null"||user==""){
            alert("请先登录");
        }
        else {
            $(".r"+id).text("已关注");
            $.ajax({
                type:"post",
                url:"<%=basePath%>user/personalattention.action",
                data:"id="+id,
                success:function () {

                }
            });
        }
    }





</script>
</body>

</html>