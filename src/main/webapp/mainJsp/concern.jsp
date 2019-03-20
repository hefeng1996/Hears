<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<html>
<head>
    <title>关注的人</title>

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
        .a:hover{
            text-decoration: underline;
        }
    </style>

    <style>
        .odd {
            background-color: #FCFCFC;
        }

    </style>
</head>
<body style="background-color: #FCFCFC">
<div style="width: 1000px;height: auto;margin-left:180px;border: 1px solid #e0e0e0;background-color: white">
    <div>
        <div id="change"  style="margin-left: 50px;margin-top: 50px;width: 200px;height: 200px;border:1px solid #b4b4b4" >
            <c:if test="${not empty user.img}">
                <img src="<%=resourcesPath%>/head/${user.img}" width="190px" height="190px " style="margin:4px 4px">
            </c:if>
            <c:if test="${empty user.img}">
                <img src="<%=basePath%>images/headimg.jpg" width="190px" height="190px " style="margin:4px 4px">
            </c:if>
        </div>
        <div style="width:auto;height: 200px;float: right;position: absolute;margin-top: -200px;margin-left: 300px">

            <div style="width: 200px;height: 50px;line-height: 50px;font-size: 28px">
                <span style="color: #000000">${user.name}</span>
                <c:if test="${user.sex=='1'}">
                    <img src="<%=basePath%>images/boy.png" width="40px" height="40px">
                </c:if>
                <c:if test="${user.sex=='0'}">
                    <img src="<%=basePath%>images/girl.png" width="40px" height="40px">
                </c:if>
            </div>
            <c:if test="${sessionScope.user.id==requestScope.id||requestScope.id==null}">
                <div style="width: 120px;height: 50px; position: absolute;margin-left: 540px;margin-top: -45px">
                    <a href="<%=basePath%>jsp/informationEditing.jsp">
                        <input class="btn btn-default" id="modify" type="button" value="编辑个人信息"></a>
                </div>
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
                    <span id="attentioncount" style="position: absolute;margin-top: -15px;font-size: 24px; ">${fn:length(attention)}</span>
                    <span style="position: absolute;margin-top: 10px">关注</span>
                </a>
            </div>
            <div style="width: 70px;height: 55px;line-height: 50px;position: absolute;margin-top: -20px;margin-left: 140px">
                <a href="<%=basePath%>user/fans.action?id=${user.id}"  style="color: rgba(46,46,46,0.6)">
                    <span  style="position: absolute;margin-top: -15px;font-size: 24px; ">${fn:length(fans)}</span>
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
        <a  href="login.jsp">
            <div id="changeimg" class="changeimg">
                <span id="font" class="font">更换头像</span>
            </div>
        </a>


        <div id="attention" style="width: 900px;margin-left: 50px;margin-top: 60px">
            <h2><span style="color:rgba(46,46,46,0.7)">关注（${fn:length(attentions)}）</span></h2>
            <div style="background-color: red; width: 900px;height: 2px;margin-top: 3px"></div>
            <div style="width: 450px;" >
                <table>
                    <tr>
                        <c:forEach items="${attentions}" var="attention" varStatus="s">
                        <td >
                            <div style="height: 100px;width: 450px;border-right: solid 1px #e0e0e0;border-left: solid 1px #e0e0e0;border-bottom: solid 1px #e0e0e0">
                                <img src="<%=resourcesPath%>head/${attention.userbyId.img}" style="width: 62px;height: 62px;margin-top: 19px;margin-left: 19px">
                                <div style="margin-top: -60px;margin-left: 90px">
                                    <a href="<%=basePath%>user/personalInformation.action?id=${attention.userbyId.id}"><span class="a" style="color:rgba(12,0,255,0.8);font-size: 14px">${attention.userbyId.name}</span></a>
                                    <img src="<%=basePath%>images/boy.png" width="30px" height="30px" style="margin-top: -10px">
                                    <br>
                                    <a href="<%=basePath%>user/personalmoments.action?id=${attention.userbyId.id}"><span style="font-size: 12px;cursor: pointer" class="a">动态(<span style="color:rgba(12,0,255,0.8);font-size: 12px" class="a">${attention.userbyId.moment}</span>)</span></a>&nbsp;&nbsp;&nbsp;
                                    <a href="<%=basePath%>user/attention.action?id=${attention.userbyId.id}"><span style="font-size: 12px;cursor: pointer" class="a">关注(<span style="color:rgba(12,0,255,0.8);font-size: 12px" class="a">${attention.userbyId.attention}</span>)</span></a>&nbsp;&nbsp;&nbsp;
                                    <a href="<%=basePath%>user/fans.action?id=${attention.userbyId.id}"><span style="font-size: 12px;cursor: pointer" class="a">粉丝(<span style="color:rgba(12,0,255,0.8);font-size: 12px" class="a">${attention.userbyId.fans}</span>)</span></a>&nbsp;&nbsp;&nbsp;<br>
                                    <span style="font-size: 12px;color:rgba(46,46,46,0.7)">${attention.userbyId.introduce}</span>
                                </div>
                                <div style="margin-left: 360px;margin-top: -45px">
                                    <button id="${attention.userbyId.id}" class="btn btn-default" type="button" style="width: 82px" onclick="attention(${attention.userbyId.id},${attention.status})">取消关注</button>
                                </div>
                            </div>
                        </td>
                        <c:if test="${s.count%2==0}">
                    </tr><tr>
                    </c:if>
                    </c:forEach>
                </tr>
                </table>
            </div>
        </div>


    </div>
</div>
<script>
    /*歌单table样式*/
    $(function (){
        $('tr:odd').addClass('odd');
    });
</script>

<script>

    function attention(id,status) {
        if(status=="3"||status=="1"){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/user/removeattention.action",
                data:"userId="+id,
                success:function(val){
                    $("#attentioncount").text(val);
                    $("#"+id+"").text("已经取消");
                }
            });


        }
    }


</script> <%--取消关注事件--%>

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
</body>
</html>
