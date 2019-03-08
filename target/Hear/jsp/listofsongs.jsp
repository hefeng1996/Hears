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
    <title>听歌排行</title>

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
        .odd {
            background-color:#f2f2f2;
        }

        .afont{
            color:black;cursor: pointer;font-weight: bold
        }
        .afont1{
            color:rgba(46,46,46,0.4);cursor: pointer
        }

    </style>


</head>
<body style="background-color: #FCFCFC">
<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;" >
        <img href="#"  id="logo" src="<%= basePath%>main/img/logo.png"></img>
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
                    <a href="#"  style="position:relative;top: 20px;width: 80px;color: #e3e3e3;margin-left: 10px" onclick="window.location ='<%=basePath%>user/logout.action'">退出</a>
                </c:if>
            </li>
        </ul>
    </nav>

</div>


    <div style="width: 1000px;margin-left:180px;border: 1px solid #e0e0e0;background-color: white">

        <div style="width: 900px;margin-left: 50px;margin-top: 60px">
            <span style="color:rgba(46,46,46,0.7);position: absolute;margin-top: -4px"><h2>听歌排行</h2></span>
            <div style="color:rgba(46,46,46,0.4);margin-top: -27px;margin-left: 100px">
                <span>累计听歌</span>
                <span>${playcount}首</span>
            </div>
            <div style="margin-left: 760px;margin-top: -20px">
                <a id="f1" style="text-decoration:none"><span  id="afont" class="afont">最近歌曲</span></a>丨
                <a id="f2" style="text-decoration:none"><span id="afont1" class="afont1">所有歌曲</span></a>
            </div>
            <div style="background-color: red; width: 900px;height: 2px;margin-top: 3px"></div>
            <div id="#table" style="width: 900px;height:auto;border: solid 1px #e0e0e0;border-top: none">
                <table id="playcord" class="table-hover">
                    <c:forEach items="${playrecords20}" var="record20" varStatus="s">
                        <tr  style="height: 40px">
                            <td style="width: 50px" align="right"><span style=";color:rgba(46,46,46,0.8)">${s.count}.</span></td>
                            <td style="width: 40px" align="center"><%--<img src="<%=basePath%>main/img/a4.jpg" style="width: 30px;height: 30px">--%> </td>
                            <td style="width: 400px"><span style="font-size: 14px;font-weight: bolder"><a href="<%=basePath%>/song.action?id=${record20.song.id}">${record20.song.name}</a></span>&nbsp;-&nbsp;<span style="font-size: 12px;color:rgba(46,46,46,0.6)"><a href="<%=basePath%>/artist/singerhost.action?id=${record20.song.singer.id}">${record20.song.singer.name}</a></span> </td>
                            <td style="width: 120px;font-size: 12px"><fmt:formatNumber type="number" value="${record20.song.duration/60}" maxFractionDigits="0"/>:${record20.song.duration%60}</td>
                            <td style="width: 190px"><%--<img src="<%=basePath%>images/plus01.png">&nbsp;&nbsp;<img src="<%=basePath%>images/collection.png">&nbsp;&nbsp;<img src="<%=basePath%>images/share01.png">&nbsp;&nbsp;--%><a href="<%= resourcesPath%>song/${record20.song.url}" download="${record20.song.name}"><img src="<%=basePath%>images/download01.png"></a></td>
                            <td style="width: 200px;font-size: 12px"><fmt:formatDate value="${record20.playtime}" type="both"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <table hidden id="playcordAll"  class="table-hover">
                    <c:forEach items="${playrecordsAll}" var="recordsAll" varStatus="s">
                        <tr style="height: 40px">
                            <td style="width: 50px" align="right"><span style=";color:rgba(46,46,46,0.8)">${s.count}.</span></td>
                            <td style="width: 40px" align="center"><%--<img src="<%=basePath%>main/img/a4.jpg" style="width: 30px;height: 30px"> --%></td>
                            <td style="width: 400px"><span style="font-size: 14px;font-weight: bolder"><a href="<%=basePath%>/song.action?id=${record20.song.id}">${recordsAll.song.name}</a></span>&nbsp;-&nbsp;<span style="font-size: 12px;color:rgba(46,46,46,0.6)"><a href="<%=basePath%>/artist/singerhost.action?id=${record20.song.singer.id}">${recordsAll.song.singer.name}</a></span> </td>
                            <td style="width: 120px;font-size: 12px"><fmt:formatNumber type="number" value="${recordsAll.song.duration/60}" maxFractionDigits="0"/>:${recordsAll.song.duration%60}</td>
                            <td style="width: 190px"><%--<img src="<%=basePath%>images/plus01.png">&nbsp;&nbsp;<img src="<%=basePath%>images/collection.png">&nbsp;&nbsp;<img src="<%=basePath%>images/share01.png">&nbsp;&nbsp;--%><img src="<%=basePath%>images/download01.png"></td>
                            <td style="width: 200px;font-size: 12px"><fmt:formatDate value="${recordsAll.playtime}" type="both"/></td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div style="height: 50px"></div>
        </div>

    </div>

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
    </script><%--歌单table样式--%>

    <script>
        /*排行字体点击事件*/
        $(function () {
            $("#f1").click(function () {
                $("#afont").removeClass("afont1").addClass("afont");
                $("#afont1").removeClass("afont").addClass("afont1");
            })
            $("#f2").click(function () {
                $("#afont1").removeClass("afont1").addClass("afont");
                $("#afont").removeClass("afont").addClass("afont1");
            })
        })
    </script><%--排行字体点击事件--%>

    <script>
        $(function () {
            $("#f2").click(function () {
                $("#playcord").prop("hidden",true);
                $("#playcordAll").removeAttr("hidden");
            })
            $("#f1").click(function () {
                $("#playcordAll").prop("hidden",true);
                $("#playcord").removeAttr("hidden");
            })
        })
    </script>



</body>
</html>
