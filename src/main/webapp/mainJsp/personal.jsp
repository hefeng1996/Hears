<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<jsp:useBean id="dateValue" class="java.util.Date"/>--%>
<%--<jsp:setProperty name="dateValue" property="time" value="${item.create_at}"/>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='<%=basePath%>bootstrap/css/bootstrap.min.css' />
    <script type='text/javascript' src='<%=basePath%>bootstrap/jquery.js'></script>
    <script type='text/javascript' src='<%=basePath%>bootstrap/js/bootstrap.min.js'></script>
    <title>个人中心</title>
    <link rel="stylesheet" href="<%=basePath%>css/button.css">
    <script src="js/jquery.min.js"></script>


    <!-- /container -->
    <script src="<%=basePath%>js/classie.js"></script>
    <script src="<%=basePath%>js/clipboard.min.js"></script>
    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css" />
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/component.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css">
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
    </style><%--导航栏--%>


    <style>
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
        .a{
            cursor: pointer;
            color:rgba(46,46,46,0.6)
        }
        .afont{
            color:black;cursor: pointer;font-weight: bold
        }
        .afont1{
            color:rgba(46,46,46,0.4);cursor: pointer
        }
        .odd {
            background-color:#f2f2f2;
        }
        .lasttd{
            width: 140px; background-color: #FCFCFC
        }
        .alltd{
            width: 190px; background-color: #FCFCFC
        }

    </style><%--头像字体等--%>


</head>

<body style="background-color: #FCFCFC">
<div class="container">
    <div style="width: 1000px;border: 1px solid #e0e0e0;background-color:white;margin: 0 auto">

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
                    <c:if test="${not empty user.name}">
                        <span style="color: #000000">${user.name}</span>
                    </c:if>
                    <c:if test="${empty user.name}">
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
                    <a href="<%=basePath%>/user/personalmoments.action?id=${user.id}"  style="color: rgba(46,46,46,0.6)">
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


            <a  href="<%=basePath%>mainJsp/informationEditing.jsp">
                <div id="changeimg" class="changeimg">
                    <span id="font" class="font">更换头像</span>
                </div>
            </a>

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
                <div style="width: 900px;height:auto;border: solid 1px #e0e0e0;border-top: none">
                    <table  id="palyrecord5" class="table-hover">
                        <c:forEach items="${playrecord5}" var="record5" varStatus="s">
                        <tr style="height: 40px">
                            <td style="width: 50px" align="right"><span style=";color:rgba(46,46,46,0.8)">${s.count}.</span></td>
                            <td style="width: 40px" align="center"><%--<img  src="<%=basePath%>images/play2.png" style="width: 16px;height: 16px">--%> </td>
                            <td style="width: 400px"><span style="font-size: 14px;font-weight: bolder"><a href="<%=basePath%>/song.action?id=${record5.song.id}">${record5.song.name}</a></span>&nbsp;-&nbsp;<span style="font-size: 12px;color:rgba(46,46,46,0.6)"><a href="<%=basePath%>/artist/singerhost.action?id=${record5.song.singer.id}">${record5.song.singer.name}</a></span> </td>
                            <td style="width: 120px;font-size: 12px"><fmt:formatNumber type="number" value="${record5.song.duration/60}" maxFractionDigits="0"/>:${record5.song.duration%60}</td>
                            <td style="width: 190px"><%--<img src="<%=basePath%>images/plus01.png">&nbsp;&nbsp;<img src="<%=basePath%>images/collection.png">&nbsp;&nbsp;<img src="<%=basePath%>images/share01.png">&nbsp;&nbsp;--%><a href="<%= resourcesPath%>song/${record5.song.url}" download="${record5.song.name}"><img src="<%=basePath%>images/download01.png"></a> </td>
                            <jsp:useBean id="dateValue" class="java.util.Date"/>
                            <jsp:setProperty name="dateValue" property="time" value="${record5.playtime}"/>
                            <td style="width: 200px"><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <%--<td style="width: 200px"><fmt:formatDate value="${record5.playtime}" type="both"/></td>--%>

                        </tr>
                    </c:forEach>
                    </table>

                    <table hidden id="palyrecord20" class="table-hover">
                        <c:forEach items="${playrecord20}" var="record20" varStatus="s">
                            <tr style="height: 40px">
                                <td style="width: 50px" align="right"><span style=";color:rgba(46,46,46,0.8)">${s.count}.</span></td>
                                <td style="width: 40px" align="center"><%--<img  src="<%=basePath%>images/play2.png" style="width: 16px;height: 16px">--%> </td>
                                <td style="width: 400px"><span style="font-size: 14px;font-weight: bolder"><a href="<%=basePath%>/song.action?id=${record20.song.id}">${record20.song.name}</a></span>&nbsp;-&nbsp;<span style="font-size: 12px;color:rgba(46,46,46,0.6)"><a href="<%=basePath%>/artist/singerhost.action?id=${record20.song.singer.id}">${record20.song.singer.name}</a></span> </td>
                                <td style="width: 120px;font-size: 12px"><fmt:formatNumber type="number" value="${record20.song.duration/60}" maxFractionDigits="0"/>:${record20.song.duration%60}</td>
                                <td style="width: 190px"><%--<img src="<%=basePath%>images/plus01.png">&nbsp;&nbsp;<img src="<%=basePath%>images/collection.png">&nbsp;&nbsp;<img src="<%=basePath%>images/share01.png">&nbsp;&nbsp;--%><a href="<%= resourcesPath%>song/${record20.song.url}" download="${record20.song.name}"><img src="<%=basePath%>images/download01.png"> </a></td>
                                <%--<td style="width: 200px"><fmt:formatDate value="${record20.playtime}" type="both"/></td>--%>
                                <jsp:useBean id="dateValue1" class="java.util.Date"/>
                                <jsp:setProperty name="dateValue1" property="time" value="${record20.playtime}"/>
                                <td style="width: 200px"><fmt:formatDate value="${dateValue1}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                    </table>


                </div>
                <div style="margin-left: 834px">
                    <a href="<%=basePath%>user/playrecord.action?id=${user.id}"  style="cursor: pointer"><span style="font-size: 12px;color:rgba(46,46,46,0.5) ">查看更多></span></a>
                </div>
            </div>

            <div style="width: 900px;margin-left: 50px;margin-top: 30px">
                <h3><span style="color:rgba(46,46,46,0.7)">我创建的歌单（${fn:length(songlists)}）</span></h3>
                <div style="background-color: red; width: 900px;height: 2px;margin-top: 3px"></div>
                <div style="width: 900px;margin-top:20px;border-top: none">
                    <table class="like" >
                        <tr style=>
                            <c:forEach items="${songlists}" var="songlist"  varStatus="s">
                            <td><a href="<%= basePath%>/songlist/songlist.action?id=${songlist.id}"><div style="width: 190px;height: 180px">
                                <c:if test="${not empty songlist.img}">
                                    <img src="<%=resourcesPath%>images/200songlist/${songlist.img}" style="width: 140px;height: 140px;">
                                </c:if>
                                <c:if test="${empty songlist.img}">
                                    <img src="<%=basePath%>images/default.jpg" style="width: 140px;height: 140px;">
                                </c:if>

                                <br>
                                <div style="width: 140px;" align="center"><span style="font-size: 14px">${songlist.name}</span></div></div></a></td>
                                <c:if test="${s.count%5==0}">
                                </tr><tr >
                                </c:if>
                            </c:forEach>
                        </tr>

                    </table>
                </div>
            </div>

        <div style=" height: auto;width: 900px;margin-left: 50px;margin-top: 30px">
            <h3><span style="color:rgba(46,46,46,0.7)">我收藏的歌单（${fn:length(songlikelists)}）</span></h3>
            <div style="background-color: red; width: 900px;height: 2px;margin-top: 3px"></div>
            <div style="width: 900px;margin-top:20px;border-top: none">
                <table class="like" >
                    <tr >
                        <c:forEach items="${songlikelists}" var="songlikelist"  varStatus="s">
                                <td><a href="<%= basePath%>/songlist/songlist.action?id=${songlikelist.id}">
                                    <div style="width: 190px;height: 180px">
                                        <c:if test="${empty songlikelist.img}">
                                            <img src="<%=basePath%>images/default.jpg" style="width: 140px;height: 140px;">
                                        </c:if>
                                        <c:if test="${not empty songlikelist.img}">
                                            <img src="<%=resourcesPath%>images/200songlist/${songlikelist.img}" style="width: 140px;height: 140px;">
                                        </c:if>

                                        <br><div style="width: 140px;" align="center"><span style="font-size: 14px">${songlikelist.name}</span></div></div></a></td>
                            <c:if test="${s.count%5==0}">
                                </tr><tr>
                            </c:if>
                        </c:forEach>
                    </tr>
                </table>
            </div>
        </div>

        </div>
    </div>

</div>
</body>
<script>

    $(function () {
        $("#font").hover(function () {
            $("#font").removeClass("font").addClass("font1");
        },function () {
            $("#font").removeClass("font1").addClass("font");
        })
    })

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

    /*歌单table样式*/
    $(function (){
        $('tr:odd').addClass('odd');
    });
    $(function (){
        $('.like tr td:last-child').addClass('lasttd');
        $('.like tr td').not('lasttd').addClass("alltd");
    });

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

</script>

<script>
    $(function () {
        $("#f2").click(function () {
            $("#palyrecord5").prop("hidden",true);
            $("#palyrecord20").removeAttr("hidden");
        })
        $("#f1").click(function () {
            $("#palyrecord20").prop("hidden",true);
            $("#palyrecord5").removeAttr("hidden");
        })
    })
</script>

<script>
    $(function () {
        $("#attention").click(function () {
            var user='<%=session.getAttribute("user")%>';
            if(user=="null"||user==""){
                alert("请先登录");
            }else {
                if("关注"==$("#attention").val()){
                    $("#attention").val("取消关注");
                    var count=$("#atten").text();
                    $("#atten").html(parseInt(count)+1);
                    var id=${requestScope.id};
                    $.ajax({
                        type:"post",
                        url:"<%=basePath%>user/personalattention.action",
                        data:"id="+id,
                        success:function () {

                        }
                    })
                }else {
                    $("#attention").val("关注");
                    var count=$("#atten").text();
                    $("#atten").html(count-1);
                    var id=${requestScope.id};
                    $.ajax({
                        type:"post",
                        url:"<%=basePath%>user/removepersonalattention.action",
                        data:"id="+id,
                        success:function () {

                        }
                    })
                }
            }

        })
        $("#removeattention").click(function () {
            if("取消关注"==$("#removeattention").val()){
                $("#removeattention").val("关注");
                var count=$("#atten").text();
                $("#atten").html(count-1);

                var id=${requestScope.id};
                $.ajax({
                    type:"post",
                    url:"<%=basePath%>user/removepersonalattention.action",
                    data:"id="+id,
                    success:function (){
                    }
                })
            }else {
                $("#removeattention").val("取消关注");
                var count=$("#atten").text();
                $("#atten").html(parseInt(count)+1);
                var id=${requestScope.id};
                $.ajax({
                    type:"post",
                    url:"<%=basePath%>user/personalattention.action",
                    data:"id="+id,
                    success:function () {

                    }
                })
            }
        })
    })
</script>

</html>
