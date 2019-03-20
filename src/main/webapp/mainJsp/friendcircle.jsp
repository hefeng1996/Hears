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
    <title>朋友圈</title>
    <meta charset="utf-8"/>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="description"
          content="An open collection of menu styles that use the line as a creative design element"/>
    <meta name="keywords" content="web design, styles, inspiration, line, pseudo-element, SVG, animation"/>


    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/demo.css"/>

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/component.css"/>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/bootstrap.css">
    <link href="<%= basePath%>css/bootstrap-fileinput.css" rel="stylesheet">
    <script src="<%= basePath%>js/iconfont.js"></script>
    <script src="<%= basePath%>js/iconfont-shipin.js"></script>
    <script src="<%= basePath%>js/iconfont-shanchu.js"></script>
    <script src="<%= basePath%>js/iconfont-shouqi.js"></script>
    <script src="<%= basePath%>js/iconfont-zan.js"></script>


    <style>
        .icon {
            /* 通过设置 font-size 来改变图标大小 */
            width: 1em;
            height: 1em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
            font-size: 20px;
            color: red;
        }
        .icon-shanchu {
            /* 通过设置 font-size 来改变图标大小 */
            width: 0.8em;
            height: 0.8em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
            font-size: 20px;
            color: grey;
        }
        .icon-shouqi {
            /* 通过设置 font-size 来改变图标大小 */
            width: 0.8em;
            height: 0.8em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
            font-size: 25px;
            color: grey;
        }

        .icon-weizan {
            /* 通过设置 font-size 来改变图标大小 */
            width: 0.8em;
            height: 0.8em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
            font-size: 20px;
            color: blue;
        }
        .icon-yizan {
            /* 通过设置 font-size 来改变图标大小 */
            width: 0.8em;
            height: 0.8em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
            font-size: 20px;
            color: red;
        }
        .zan {
            display: inline-block;
            height: 40px;
            width: 50px;
            margin: 20px 20px 0 750px;
            cursor: pointer;
            text-decoration: none;
        }

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

        #content {
            background-color: white;
            margin: 0 180px;
            min-height: 600px;
            padding: 20px;
        }

        .peiyue{
            outline: 0;
            border: 1px solid #f95d5d;
            box-shadow: 0px 0px 10px 0px #f95d5d;

        }
        .con4{

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




    </style>
    <title>搜索</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/base.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/tab.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/bootstrap.css">

    <script src="<%= basePath%>js/jquery.min.js"></script>
    <script src="<%= basePath%>js/bootstrap.js"></script>


    <%--<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>--%>

    <script src="<%= basePath%>js/bootstrap-fileinput.js"></script>

</head>
<body style="background-color: #f5f5f5;">
<div>
    <div id="content" style="width:1000px;margin:0 auto;">
        <span style="font-family: '微软雅黑';font-size: 20px;">
						动态
					</span>
        <button style="margin-bottom: 20px;margin-left: 800px;" class="btn btn-default" data-toggle="modal" data-target="#releasenews">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-tubiao09"></use>
            </svg>
            发动态
        </button>

        <div id="" style="height: 2px;background-color: red; margin-bottom: 20px;">

        </div>


        <!--分享歌曲-->
        <c:forEach items="${moments.list}" var="moment">
            <div class="dongtai" id="dm${moment.id}">
                <div>
                    <a style="vertical-align:top" href="<%=basePath%>/user/personalInformation.action?id=${moment.user.id}">
                        <c:if test="${empty moment.user.img}">
                            <img style="width: 45px;height: 45px" src="<%=basePath%>images/headimg.jpg">
                        </c:if>
                        <c:if test="${not empty moment.user.img}">
                            <img style="width: 45px;height: 45px" src="<%= resourcesPath%>head/${moment.user.img}">
                        </c:if>
                    </a>
                    <a style="vertical-align:top" href="<%=basePath%>/user/personalInformation.action?id=${moment.user.id}">${moment.user.name}</a>
                    <span style="font-size: 14px;vertical-align:top">分享歌曲</span>
                    <c:if test="${sessionScope.user.id==moment.user.id}">
                    <span style="cursor:pointer;font-size: 14px;vertical-align:top;margin-left: 750px"
                          onclick="showhide(${moment.id})">
                    ﹀
                    </span>
                    </c:if>


                    <div style="margin-top: -16px;margin-left: 50px;height: 18px;">
                    <span style="font-size: 12px;color:rgba(46,46,46,0.7)"><fmt:formatDate value="${moment.time}"
                                                                                           pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        <span id="dl${moment.id}"
                              style="margin-left: 700px;display: inline-block;width: 50px;cursor: pointer;display: none;"
                              onclick="deletemoment(${moment.id})">
                        <svg class="icon-shanchu" aria-hidden="true">
                            <use xlink:href="#icon-unie639"></use>
                        </svg>
                        删除
                    </span>
                    </div>

                    <c:if test="${not empty moment.text}">
                        <div id="" style="margin-left:50px ;padding: 15px 0;">
                                ${moment.text}
                        </div>
                    </c:if>

                    <div style="background-color:#F6F5F4;margin-left:50px ;padding: 15px;">
                        <a style="vertical-align:top" href=""><img style="width: 45px;height: 45px" src="<%= resourcesPath%>images/200album/${moment.song.album.img}"></a>
                        <a href="<%=basePath%>/song.action?id=${moment.song.id}" style="vertical-align:top">${moment.song.name}</a>

                        <div style="margin-top: -16px;margin-left: 50px">
                            <a style="font-size: 12px;color:rgba(46,46,46,0.7)" href="<%=basePath%>artist/singerhost.action?id=${moment.song.singer.id}">${moment.song.singer.name}</a>
                        </div>

                    </div>
                    <c:if test="${ not empty moment.img}">
                        <img src="<%= resourcesPath%>dongtai/${moment.img}" style="margin-top: 10px;margin-left: 50px;"
                             width="300px"/>

                    </c:if>

                    <a class="zan" href="javascript:void(0)" onclick="zan(${moment.id})">
                        <svg id="svg${moment.id}"
                             <c:if test="${moment.praiseType==0}">class="icon-yizan"</c:if>
                             <c:if test="${moment.praiseType==1}">class="icon-weizan"</c:if>

                             aria-hidden="true">
                            <use xlink:href="#icon-zan"></use>
                        </svg>
                        (<span id="z${moment.id}">${fn:length(moment.praiseList)}</span>)

                    </a>

                        <%--<a style="margin：0 30px 20px 30px;">转发&nbsp;&nbsp;&nbsp;&nbsp;</a>--%>
                    <a class="discuss" style="margin：0 30px 20px 30px;" href="javascript:void(0)" id="count${moment.id}"
                       onclick="tl(${moment.id})">评论<c:if
                            test="${fn:length(moment.comments) >0}">(<span id="cc${moment.id}">${fn:length(moment.comments)}</span>)</c:if></a>

                        <%--评论--%>
                    <div style="border: 1px solid #d9d9d9;display:none;background-color: #F9F8F7;margin-left: 50px;padding: 10px;font-size: 12px"
                         class="m${moment.id}">
                    <textarea style="width: 850px;height: 60px;margin-bottom: 20px" id="t${moment.id}"
                              placeholder="评论"></textarea>
                        <button class="btn btn-primary" style="margin-left: 750px" onclick="addcomments(${moment.id})">评论
                        </button>
                        <c:if test="${fn:length(moment.comments) >0}">
                            <div style="font-size: 12px;color: #666">最新评论</div>

                        </c:if>
                            <%--评论开始--%>
                        <c:forEach var="c" items="${moment.comments}">
                            <div id="dc${c.id}" onmouseover="showdelete(${c.id})" onmouseout="hiddendelete(${c.id})">
                                <hr style="border:1px dotted #ccc;;margin-top: 2px"></hr>
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
                                           onclick="deletecomment(${c.id},${moment.id})">删除</a>

                                    </c:if>

                                </div>
                                <div class="c${c.id}" style="display: none">
                                    <hr style="height: 1px;background-color: grey;border: none;margin-top: 2px"></hr>
                                    <div style="padding: 10px;margin-left: 35px;background-color: #F5F4F3;border: 1px solid #d9d9d9;">
                                    <textarea style="width:750px;height: 60px" id="a${moment.id}"
                                              placeholder="回复${c.user2.name}："></textarea>

                                        <button class="btn btn-primary" style="margin-left: 650px"
                                                onclick="addanswer(${moment.id},${c.id})">回复
                                        </button>


                                    </div>
                                </div>

                            </div>

                        </c:forEach>
                        <hr style="border:1px dotted #ccc;;margin-top: 2px"></hr>


                        <div style="margin-left: 760px;margin-top: 20px;cursor: pointer" onclick="tl(${moment.id})">
                            收起
                            <svg class="icon-shanchu" aria-hidden="true">
                                <use xlink:href="#icon-shouqi"></use>
                            </svg>
                        </div>
                    </div>


                    <hr color="#EAE9E7"/>
                </div>
            </div>
        </c:forEach>
        <nav aria-label="...">
            <ul class="pager">
                共 <b>${moments.total}</b> 条
                <a href="javascript:getPage(${moments.firstPage})" >首页</a>
                <c:if test="${!moments.isFirstPage}">
                    <li><a href="javascript:getPage(${moments.prePage})">上一页</a></li>
                </c:if>
                当前第<span>${moments.pageNum}</span>页
                <c:if test="${!moments.isLastPage}">
                    <li><a href="javascript:getPage(${moments.nextPage})">下一页</a></li>
                </c:if>
                <a href="javascript:getPage(${moments.lastPage})" >末页</a>

            </ul>
        </nav>
        <script >
            function getPage(curPage) {
                window.location.href ="<%=basePath%>friend/friendcircle.action?scurPage="+curPage;
            }


        </script>


        <%--
                        <!--分享歌单-->
                        <div class="dongtai">
                            <div>
                                <img style="width: 45px;height: 45px" src="<%= resourcesPath%>img/2.jpg">
                                <a href=""><span style="font-size: 14px">用户名</span></a>
                                <span style="font-size: 14px">分享歌单</span>

                                <div style="margin-top: -16px;margin-left: 50px">
                                    <span style="font-size: 12px;color:rgba(46,46,46,0.7)">时间</span>
                                </div>
                                <div id="" style="margin-left:50px ;padding: 15px 0;">
                                    wdeqweqweqweqweqweqweqweqweqweqweqweqweqwe
                                </div>
                                <div style="background-color:#F6F5F4;margin-left:50px ;padding: 15px;">
                                    <img style="width: 45px;height: 45px" src="<%= resourcesPath%>img/2.jpg">
                                    <span style="font-size: 14px;color: red;border: 1px red solid;">歌单</span>
                                    <a href=""><span style="font-size: 14px">歌名</span></a>


                                    <div style="margin-top: -16px;margin-left: 50px">
                                        <span style="font-size: 12px;color:rgba(46,46,46,0.7);margin-right:5px ;">by</span>
                                        <span style="font-size: 12px;color:rgba(46,46,46,0.7)">歌手</span>
                                    </div>
                                </div>
                                <img src="<%= resourcesPath%>img/动态图.jpg" style="margin-top: 10px;margin-left: 50px;"/>
                                <span id="zan"></span>
                                <a style="margin：0px 30px 20px 30px;">转发&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                <a style="margin：0px 30px 20px 30px;">评论</a>
                                <hr color="#EAE9E7"/>
                            </div>


                            <!--分享视频-->
                            <div class="dongtai">
                                <div>
                                    <img style="width: 45px;height: 45px" src="<%= resourcesPath%>img/2.jpg">
                                    <a href=""><span style="font-size: 14px">用户名</span></a>
                                    <span style="font-size: 14px">发布视频</span>

                                    <div style="margin-top: -16px;margin-left: 50px">
                                        <span style="font-size: 12px;color:rgba(46,46,46,0.7)">时间</span>
                                    </div>
                                    <div id="" style="margin-left:50px ;padding: 15px 0;">
                                        wdeqweqweqweqweqweqweqweqweqweqweqweqweqwe
                                    </div>
                                    <video width="300" height="200" style="margin-left: 50px;" controls="controls">
                                        <source src="video/3.mp4" type="video/mp4"></source>
                                        <source src="myvideo.ogv" type="video/ogg"></source>
                                        <source src="myvideo.webm" type="video/webm"></source>
                                        <object width="" height="" type="application/x-shockwave-flash" data="myvideo.swf">
                                            <param name="movie" value="myvideo.swf"/>
                                            <param name="flashvars" value="autostart=true&amp;file=myvideo.swf"/>
                                        </object>
                                        当前浏览器不支持 video直接播放，点击这里下载视频： <a href="myvideo.webm">下载视频</a>
                                    </video>

                                </div>

                                <span id="zan"></span>
                                <a style="margin：0px 30px 20px 30px;">转发&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                <a style="margin：0px 30px 20px 30px;">评论</a>
                                <hr color="#EAE9E7"/>
                            </div>

                            <!--转发-->
                            <div class="dongtai">
                                <div>
                                    <img style="width: 45px;height: 45px" src="<%= resourcesPath%>img/2.jpg">
                                    <a href=""><span style="font-size: 14px">用户名</span></a>
                                    <span style="font-size: 14px">转发</span>

                                    <div style="margin-top: -16px;margin-left: 50px">
                                        <span style="font-size: 12px;color:rgba(46,46,46,0.7)">时间</span>
                                    </div>
                                    <div id="" style="margin-left:50px ;padding: 15px 0;">
                                        wdeqweqweqweqweqweqweqweqweqweqweqweqweqwe
                                    </div>
                                    <div style="background-color:#F6F5F4;margin-left:50px ;padding: 15px;">
                                        <img style="width: 45px;height: 45px" src="<%= resourcesPath%>img/2.jpg">
                                        <a href=""><span style="font-size: 14px">歌名</span></a>


                                        <div style="margin-top: -16px;margin-left: 50px">
                                            <span style="font-size: 12px;color:rgba(46,46,46,0.7)">歌手</span>
                                        </div>

                                    </div>
                                    <img src="<%= resourcesPath%>img/动态图.jpg" style="margin-top: 10px;margin-left: 50px;"/>
                                    <span id="zan"></span>
                                    <a style="margin：0px 30px 20px 30px;">转发&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                    <a style="margin：0px 30px 20px 30px;">评论</a>
                                    <hr color="#EAE9E7"/>
                                </div>

                            </div>
                     --%>       <!--弹发表动态窗-->
        <div class="modal fade" id="releasenews">

            <div class="modal-dialog modal-sm" style="width:520px;">
                <div class="modal-content" style="border:none;">
                    <div class="modal-header" style="background-color: #2E2F2E;">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" style="color: white;">×</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title" style="font-size: 18px;color: white;">
                            分享</h4>
                    </div>
                    <div class="modal-body" style="margin-left: -350px">
                        <form id="login_form" action="<%=basePath%>friend/releaseNews.action" method="post"
                              autocomplete="off" enctype="multipart/form-data" onsubmit="return validate()">
                            <input type="hidden" name="user_id" value="1">
                            <input type="hidden" id="songid" name="songid">
                            <div style="border: 1px black solid;width: 480px;height: 150px;">
                                <textarea name="text" style="width: 480px;height: 90px;border-right: 1px solid black;"
                                          placeholder="一起聊聊吧~"></textarea>
                                <a href="#" class="list-group-item"
                                   style="border-top:1px grey solid;border-left: none;border-right: none;border-bottom: none;">
                                    <img src="<%= basePath%>img/添加音乐.jpg" width="35px" height="35px">
                                    <button style="" class="btn btn-default" id="add" data-toggle="modal"
                                            data-target="#addmusic" value="">给动态配音乐</button>
                                    <span style="margin-right: 0;">+</span></a>
                            </div>
                            <!--添加图片-->
                            <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                                <div class="fileinput-new thumbnail"
                                     style="width: 200px;height: auto;max-height:150px;">
                                    <img id='picImg' style="width: 100%;height: auto;max-height: 140px;"
                                         src="<%= basePath%>img/noimage.png" alt=""/>
                                </div>
                                <div class="fileinput-preview fileinput-exists thumbnail"
                                     style="max-width: 200px; max-height: 150px;"></div>
                                <div>
                                        <span class="btn btn-primary btn-file">
                                            <span class="fileinput-new">上传图片</span>
                                            <span class="fileinput-exists">换一张</span>
                                            <input type="file" name="imgFileUp" id="picID" accept="image/*"/>
                                        </span>
                                    <a href="javascript:;" class="btn btn-warning fileinput-exists"
                                       data-dismiss="fileinput">移除</a>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-default"
                                    style="margin-left:200px;background-color: #1b6d85">分享
                            </button>


                            </button>

                        </form>


                    </div>

                </div>
            </div>


        </div>

        <%--弹出搜索歌曲框--%>
        <!-- Large modal -->
        <div class="modal fade" id="addmusic" style="height:600px;overflow: auto">

            <div class="modal-dialog modal-sm" style="width:540px;">
                <div class="modal-content" style="border:none;">
                    <div class="modal-header" style="background-color: #2E2F2E;">
                        <button value="" type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" style="color: white;">×</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="loginModalLabel" style="font-size: 18px;color: white;">
                            添加音乐</h4>
                    </div>
                    <div class="modal-body" style="width: 548px;">

                        <form class="form-inline" style="width: 400px">
                            <input type="text" class="form-control " id="keywords" name="content" placeholder="" style="margin-left: 55px"><a class="btn btn-default" id="find">搜索</a>
                        </form>

                        <table class="table table-striped table-hover" id="songtable" style="">
                        </table>
                    </div>

                </div>
            </div>


            <!-- /container -->
            <script type="text/javascript" src="<%= basePath%>js/jquery2.2.2.min.js"></script>

            <script src="<%= basePath%>js/classie.js"></script>
            <script src="<%= basePath%>js/clipboard.min.js"></script>
            <script>
                (function () {
                    [].slice.call(document.querySelectorAll('.menu')).forEach(function (menu) {
                        var menuItems = menu.querySelectorAll('.menu__link'),
                            setCurrent = function (ev) {
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

                        [].slice.call(menuItems).forEach(function (el) {
                            el.addEventListener('click', setCurrent);
                        });
                    });

                    [].slice.call(document.querySelectorAll('.link-copy')).forEach(function (link) {
                        link.setAttribute('data-clipboard-text', location.protocol + '//' + location.host + location.pathname + '#' + link.parentNode.id);
                        new Clipboard(link);
                        link.addEventListener('click', function () {
                            classie.add(link, 'link-copy--animate');
                            setTimeout(function () {
                                classie.remove(link, 'link-copy--animate');
                            }, 300);
                        });
                    });
                })(window);
            </script>
            <script>
                //获取上传按钮
                var input1 = document.getElementById("upload");

                if (typeof FileReader === 'undefined') {
                    //result.innerHTML = "抱歉，你的浏览器不支持 FileReader";
                    input1.setAttribute('disabled', 'disabled');
                } else {
                    input1.addEventListener('change', readFile, false);
                    /*input1.addEventListener('change',function (e){
                        console.log(this.files);//上传的文件列表
                    },false); */
                }

                function readFile() {
                    var file = this.files[0];//获取上传文件列表中第一个文件
                    if (!/image\/\w+/.test(file.type)) {
                        //图片文件的type值为image/png或image/jpg
                        alert("文件必须为图片！");
                        return false;
                    }
                    // console.log(file);
                    var reader = new FileReader();//实例一个文件对象
                    reader.readAsDataURL(file);//把上传的文件转换成url
                    //当文件读取成功便可以调取上传的接口
                    reader.onload = function (e) {
                        // console.log(this.result);//文件路径
                        // console.log(e.target.result);//文件路径
                        /*var data = e.target.result.split(',');
                        var tp = (file.type == 'image/png')? 'png': 'jpg';
                        var imgUrl = data[1];//图片的url，去掉(data:image/png;base64,)
                        //需要上传到服务器的在这里可以进行ajax请求
                        // console.log(imgUrl);
                        // 创建一个 Image 对象
                        var image = new Image();
                        // 创建一个 Image 对象
                        // image.src = imgUrl;
                        image.src = e.target.result;
                        image.onload = function(){
                            document.body.appendChild(image);
                        }*/

                        var image = new Image();
                        // 设置src属性
                        image.src = e.target.result;
                        var max = 200;
                        // 绑定load事件处理器，加载完成后执行，避免同步问题
                        image.onload = function () {
                            // 获取 canvas DOM 对象
                            var canvas = document.getElementById("cvs");
                            // 如果高度超标 宽度等比例缩放 *=
                            /*if(image.height > max) {
                                image.width *= max / image.height;
                                image.height = max;
                            } */
                            // 获取 canvas的 2d 环境对象,
                            var ctx = canvas.getContext("2d");
                            // canvas清屏
                            ctx.clearRect(0, 0, canvas.width, canvas.height);
                            // 重置canvas宽高
                            /*canvas.width = image.width;
                            canvas.height = image.height;
                            if (canvas.width>max) {canvas.width = max;}*/
                            // 将图像绘制到canvas上
                            // ctx.drawImage(image, 0, 0, image.width, image.height);
                            ctx.drawImage(image, 0, 0, 200, 200);
                            // 注意，此时image没有加入到dom之中
                        };
                    }
                };
            </script>
            <script>
                $(document).ready(function () {

                    // 通过该方法来为每次弹出的模态框设置最新的zIndex值，从而使最新的modal显示在最前面
                    $(document).on('show.bs.modal', '.modal', function (event) {
                        var zIndex = 1040 + (10 * $('.modal:visible').length);
                        $(this).css('z-index', zIndex);
                        // setTimeout(function() {
                        //     $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
                        // }, 0);
                    });
                });

            </script>
            <script>
                //ajax搜索歌曲
                $("#find").click(function () {
                    $("#songtable").html("");
                    var content = $("#keywords").val();

                    $.ajax({
                        url: "${pageContext.request.contextPath}/friend/searchallfriend.action",
                        type: "post",
                        data: "content=" + content,
                        success: function (songs) {
//

                            var s = "";
                            for (var i = 0; i < songs.length; i++) {
                                var str=escape(songs[i].name);
                                s += "<tr data-dismiss='modal' style='font-size: 12px;cursor:pointer;color: #333' onclick=selectsong('"+str+"',"+songs[i].id+")>";
                                s+="<td>";
                                s+= songs[i].name;
                                s+=" </td>"
                                s+="<td>";
                                s+=songs[i].singer.name;
                                s+=" </td>"
                                s+="</tr>"

                            }
                            $("#songtable").append(s);


                        }
                    });
                });

            </script>
            <script>

                function selectsong(a,b) {


                    $("#add").text(unescape(a));
                    $("#songid").val(b);


                }

            </script>
            <script>
                //显示隐藏评论
                function tl(mid) {
                    $(".m" + mid).slideToggle(400);
                }

                function sl(cid) {
                    $(".c" + cid).slideToggle(400);
                }

                //                添加评论
                function addcomments(mid) {
                    var content = $("#t" + mid).val();
                    if(content=="null"||content==""){
                        alert("您还没有输入");
                    }else{
                    $.ajax({
                        url: "${pageContext.request.contextPath}/friend/addComment.action",
                        type: "post",
                        data: "content=" + content + "&momentid=" + mid,
                        success: function (zhi) {
                            if (zhi == "1") {
                                location.reload();
                            } else {
                                alert("评论失败");
                            }
                        }
                    });}

                }
                //               添加回复
                function addanswer(mid, upperid) {
                    var content = $("#a" + mid).val();
                    if(content=="null"||content==""){
                        alert("您还没有输入");
                    }else{
                    $.ajax({
                        url: "${pageContext.request.contextPath}/friend/addAnswer.action",
                        type: "post",
                        data: "content=" + content + "&momentid=" + mid + "&upperid=" + upperid,
                        success: function (zhi) {
                            if (zhi == "1") {
                                location.reload();
                            } else {
                                alert("回复失败");
                            }
                        }
                    });}

                }
                //                显示隐藏删除动态按钮
                function showhide(id) {
                    $("#dl" + id).toggle();
                }
                //                显示删除评论的按钮
                function showdelete(id) {
                    $("#sd" + id).show();
                }
                //                隐藏删除评论的按钮
                function hiddendelete(id) {
                    $("#sd" + id).hide();
                }
                //                删除动态
                function deletemoment(mid) {

                    $.ajax({
                        url: "${pageContext.request.contextPath}/friend/deleteMoment.action",
                        type: "post",
                        data: "momentid=" + mid,
                        success: function (zhi) {

                            if (zhi == "1") {
                                $("#dm" + mid).remove();
                                location.reload();

                            } else {
                                alert("删除动态失败");
                            }
                        }
                    });

                }
                //                删除评论
                function deletecomment(cid,mid) {
                    var ccount=$("#cc"+mid).text();


                    $.ajax({
                        url: "${pageContext.request.contextPath}/friend/deleteComment.action",
                        type: "post",
                        data: "commentid=" + cid,
                        success: function (zhi) {
                            if (zhi == "1") {
                                $("#dc" + cid).remove();
                                $("#cc"+mid).text(parseInt(ccount)-1);

                            } else {
                                alert("删除评论失败");
                            }
                        }
                    });

                }
                //                点赞
                function zan(mid) {
                    var count=$("#z"+mid).text();

                    if($("#svg"+mid).attr("class")=="icon-yizan"){
                        $("#svg"+mid).attr("class","icon-weizan");
                        $("#z"+mid).text(parseInt(count)-1);
                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/canclepraise.action",
                            type: "post",
                            data: "mid=" + mid,
                            success: function (zhi) {




                            }
                        });

                    }
                    else {
                        $("#svg"+mid).attr("class","icon-yizan");
                        $("#z"+mid).text(parseInt(count)+1);

                        $.ajax({
                            url: "${pageContext.request.contextPath}/friend/praise.action",
                            type: "post",
                            data: "mid=" + mid,
                            success: function (zhi) {


                            }
                        });


                    }

                }
                //                表单验证
                function validate() {
                    var s=$("#add").text();

                    if (s=="给动态配音乐"){

                        $("#add").addClass("peiyue");
                        return false;
                    }else{

                        $("#add").removeClass("peiyue");
                        return true;
                    }

                }
            </script>
        </div>
    </div>
</div>
<div style="width: 100%; height: 100px; margin-top: 30px;"></div>

</body>
</html>
