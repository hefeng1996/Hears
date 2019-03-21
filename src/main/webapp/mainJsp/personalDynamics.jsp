
<%--
  Created by IntelliJ IDEA.
  User: 明宸
  Date: 2018/6/2
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<html>
<head>
    <title>个人动态</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='<%=basePath%>bootstrap/css/bootstrap.min.css' />
    <script type='text/javascript' src='<%=basePath%>bootstrap/jquery.js'></script>
    <script type='text/javascript' src='<%=basePath%>bootstrap/js/bootstrap.min.js'></script>
    <!-- /container 导航栏 -->
    <script src="<%=basePath%>js/classie.js"></script>
    <script src="<%=basePath%>js/clipboard.min.js"></script>
    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css" /><%--样式冲突--%>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/component.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css"><%--样式冲突--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/tab.css">
    <script src="<%= basePath%>js/iconfont.js"></script>
    <script src="<%= basePath%>js/iconfont-shipin.js"></script>
    <script src="<%= basePath%>js/iconfont-shanchu.js"></script>
    <script src="<%= basePath%>js/iconfont-shouqi.js"></script>
    <script src="<%= basePath%>js/iconfont-zan.js"></script>

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

        .changeimg{
            position: absolute;
            margin-top: -35px;
            margin-left: 55px ;
            background-color: rgba(96,96,96,0.8);
            width: 190px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
        }
        .font{
            color: #e0e0e0;
        }
        .font1{
            color: #e0e0e0;
            border-bottom:1px white solid;
        }
    </style><%--头像字体--%>

    <style>
        .share:hover{
            text-decoration: underline;
        }
    </style><%--转发等悬停下划线样式--%>

    <style>
        #mydiv {
            background-color: #FFCC66;
            border: 1px solid #f00;
            text-align: center;
            line-height: 40px;
            font-size: 12px;
            font-weight: bold;
            z-index:99;
            left:40%;/*FF IE7*/
            top:30%;/*FF IE7*/
            margin-left:-150px!important;/*FF IE7 该值为本身宽的一半 */
            margin-top:-60px!important;/*FF IE7 该值为本身高的一半*/
            margin-top:0px;
            position:fixed!important;/*FF IE7*/
            position:absolute;/*IE6*/
            /*_top: expression(eval(document.compatMode &&document.compatMode=='CSS1Compat') ?documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :!*IE6*!document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);!*IE5 IE5.5*!*/
        }
    </style><%--转发弹窗--%>
    <%--多行文本--%>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/text_exp.css" />
    <style type="text/css">
        .xm-bq{margin:20px 0;font-size:14px;color:#333;}
        .xm-bq a{color:#09c;margin:0 5px;}
        .xm-bq a:hover{color:#E10602;}
        .comment-main{display:inline-block; *display:inline;zoom:1;width:600px;margin:0auto;border:1pxsolid#ddd;background:#eee;padding:20px;border-radius:3px;text-align:left;}
        .comment-main textarea{width:100%;border:1px solid #dcdcdc;}
        .comment-main textarea:focus{outline:none;border-color:#4bf;}
        .comment-main a{font-size:12px;text-decoration:none;color:#09c;}
        .comment-main a:hover{color:#E10602;}
    </style>

</head>
<body style="background-color: #FCFCFC">
<div class="container">
    <div style="width: 1000px;border: 1px solid #e0e0e0;background-color:white">  <%--margin-left:180px;--%>

        <div>
            <div id="change"  style="margin-left: 50px;margin-top: 50px;width: 200px;height: 200px;border:1px solid #b4b4b4" >
                <c:if test="${not empty user.img}">
                    <img src="<%=resourcesPath%>head/${user.img}" width="190px" height="190px " style="margin:4px 4px">
                </c:if>
                <c:if test="${empty user.img}">
                    <img src="<%=basePath%>images/headimg.jpg" width="190px" height="190px " style="margin:4px 4px">
                </c:if>
            </div>

            <div style="width: 650px;height: 200px;float: right;position: absolute;margin-top: -200px;margin-left: 300px">

                <div style="width: 200px;height: 50px;line-height: 50px;font-size: 28px">
                    <c:if test="${not empty user.nicheng}">
                        <span style="color: #000000">${user.nicheng}</span>
                    </c:if>
                    <c:if test="${empty user.nicheng}">
                        <span style="color: #000000">${user.name}</span>
                    </c:if>
                    <c:if test="${user.sex=='1'}">
                        <img src="<%=basePath%>images/boy.png" width="40px" height="40px">
                    </c:if>
                    <c:if test="${user.sex=='0'}">
                        <img src="<%=basePath%>images/girl.png" width="40px" height="40px">
                    </c:if>
                </div>
                <c:if test="${sessionScope.user.id==requestScope.id||requestScope.id==null}">
                    <div style="width: 120px;height: 50px; position: absolute;margin-left: 540px;margin-top: -45px">
                        <a href="<%=basePath%>user/tag.action"><input class="btn btn-default" id="modify" type="button" value="编辑个人信息"></a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user.id!=requestScope.id&&requestScope.id!=null}">
                    <c:if test="${flag!='1'}">
                        <div style="width: 120px;height: 50px; position: absolute;margin-left: 540px;margin-top: -45px">
                            <a href="javascript:void (0)"><input style="width: 100px" class="btn btn-default" id="attention" type="button" value="关注"></a>
                        </div>
                    </c:if>
                    <c:if test="${flag=='1'}">
                        <div  style="width: 120px;height: 50px; position: absolute;margin-left: 540px;margin-top: -45px">
                            <a href="javascript:void (0)"><input style="width: 100px" class="btn btn-default" id="removeattention" type="button" value="取消关注"></a>
                        </div>
                    </c:if>
                </c:if>

                <hr style="border:0px solid #b4b4b4;background-color: #b4b4b4">

                <div style="width: 70px;height: 55px;line-height: 50px;position: absolute;margin-top: -20px;">
                    <a  href="<%=basePath%>/user/personalmoments.action?id=${user.id}"  style="color: rgba(46,46,46,0.6)">
                        <span style="position: absolute;margin-top: -15px;font-size: 24px; ">${fn:length(moments)}</span>
                        <span style="position: absolute;margin-top: 10px">动态</span>
                    </a>
                </div>

                <div style="width: 70px;height: 55px;line-height: 50px;position: absolute;margin-top: -20px;margin-left: 70px">
                    <a href="<%=basePath%>user/attention.action?id=${user.id}"  style="color: rgba(46,46,46,0.6)">
                        <span  style="position: absolute;margin-top: -15px;font-size: 24px; ">${fn:length(attention)}</span>
                        <span style="position: absolute;margin-top: 10px">关注</span>
                    </a>
                </div>
                <div style="width: 70px;height: 55px;line-height: 50px;position: absolute;margin-top: -20px;margin-left: 140px">
                    <a href="<%=basePath%>user/fans.action?id=${user.id}"  style="color: rgba(46,46,46,0.6)">
                        <span id="atten" style="position: absolute;margin-top: -15px;font-size: 24px; ">${fn:length(fans)}</span>
                        <span style="position: absolute;margin-top: 10px">粉丝</span>
                    </a>
                </div>


                <div style="color: #3e3e3e;position: absolute;margin-top: 40px;font-size: 12px">
                    <div style="width: 420px">
                        <span>个人介绍:</span><span>${user.introduce}</span><br>
                    </div>
                    <div style="position: absolute;margin-top: 10px;width: 420px">
                        <span >所在地区:</span><span>${user.province}</span>&nbsp;-&nbsp;<span>${sessionScope.user.city}</span>
                    </div>
                </div>
            </div>


            <a  href="<%=basePath%>mianJsp/informationEditing.jsp">
                <div id="changeimg" class="changeimg">
                    <span id="font" class="font">更换头像</span>
                </div>
            </a>
            <div style="margin-left: 50px;margin-top:30px;font-size: 24px">动态</div>
            <div style="background-color: red; width: 90%;height: 2px;margin-left: 50px;margin-top: 3px;margin-bottom: 20px"></div>
            <%--动态开始--%>
            <c:forEach items="${moments}" var="moment">
                <div class="dongtai" id="dm${moment.id}" style="margin-left: 45px">
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

                        <div style="background-color:#F6F5F4;margin-left:50px ;padding: 15px;width: 88%">
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
                        <a class="discuss" style="margin:0 30px 20px 30px;" href="javascript:void(0)" id="count${moment.id}"
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
                    });

                }
                //               添加回复
                function addanswer(mid, upperid) {
                    var content = $("#a" + mid).val();
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
                    });

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
                </script>

        </div>

    </div>
</div>

<script>
    $(function () {
        $("#font").hover(function () {
            $("#font").removeClass("font").addClass("font1");
        },function () {
            $("#font").removeClass("font1").addClass("font");
        })
    })
</script><%--更换字体悬停事件--%>

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
    var index=true;
    var val=false;
    $(function () {
        $("#down<%=1%>").click(function () {
            if(index){
                $("#delete<%=1%>").removeAttr("hidden");
                index=false;
                val=true;
            }else{
                $("#delete<%=1%>").prop("hidden",true);
                index=true;
            }
        })
    })
</script><%--删除按钮事件--%>

<script>
    var staus=2;
    $(function () {
        $("#praise<%=1%>").click(function () {
            if(staus==2){
                $("#praise<%=1%>").attr("src","<%=basePath%>images/praised.png");
                $.ajax({
                    type:"get",
                    url:"",
                    data:"type_id="+<%=11%>,
                    success:function (val) {
                        val=13;
                        var c=$("#praisecount<%=1%>").text(val);
                        staus=1;
                    }
                })
            }else{
                $("#praise<%=1%>").attr("src","<%=basePath%>images/praise.png");
                $.ajax({
                    type:"get",
                    url:"",
                    data:"type_id="+<%=11%>,
                    success:function (val) {
                        val=12;
                        var c=$("#praisecount<%=1%>").text(val);
                        staus=2;
                    }
                })
            }
        })
    })
</script><%--点赞ajax--%>
</body>
</html>
