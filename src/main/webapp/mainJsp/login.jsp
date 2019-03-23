<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='<%=basePath%>bootstrap/css/bootstrap.min.css' />
    <script type='text/javascript' src='<%=basePath%>bootstrap/jquery.js'></script>
    <script type='text/javascript' src='<%=basePath%>bootstrap/js/bootstrap.min.js'></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">

    <title>登录</title>
    <link rel="stylesheet" href="<%=basePath%>css/code.css">
    <link rel="stylesheet" href="<%=basePath%>css/popup.css">


    <script src="<%=basePath%>js/popup.js"></script>

    <style>
        *{margin: 0;padding: 0;}
        body{ background-color: #3A3A3A; }
        #main {position: absolute;width: 200px;left: 50%;margin-left: -100px;top:200px;text-align: center;}
        #main li{list-style-type: none;margin-top: 5px;}
        #main li a{color: #fff;}
        #main li a:hover{color: #99e;}
        #main li a:active{color: #e99;}

        *{padding: 0;
            margin: 0;
    }
        .container {
            width: 310px;
            margin: 100px auto;
        }
        input {
            display: block;
            width: 290px;
            line-height: 40px;
            margin: 10px 0;
            padding: 0 10px;
            outline: none;
            border:1px solid #c8cccf;
            border-radius: 4px;
            color:#6a6f77;
        }
        #msg {
            width: 100%;
            line-height: 40px;
            font-size: 14px;
            text-align: center;
        }
        a:link,a:visited,a:hover,a:active {
            margin-left: 100px;
            color: #0366D6;
        }
        .background-pic{
            background: url(<%=basePath%>images/loginbg.jpg) no-repeat center center;
            background-size:cover;
            background-attachment: fixed;
            width: 100%;
            height: 100%;
            position: fixed;
            top:0;
            left:0;
            right:0;
            bottom:0;
        }
        #remember{
            margin-left: 18px;
            margin-top: -18px;
        }
        #regist{
            float: right;
            margin-top: -25px;
            margin-right: -100px;
        }
        .forget{
            color: #a7bbc8 ;
        }
        forget1{
            color: #5bccff;
        }
        #rain { position: absolute; top: 0; left: 0; opacity: 0.5; z-index: -1}
    </style>
    <script type="text/javascript">
        $(function () {
            var W = $(window).width(),
                H = $(window).height(),
                x2 = -15, len = 30, count = 100;
            var canvas = document.getElementById("rain");
            canvas.width = W;
            canvas.height = H;
            var ctx = canvas.getContext('2d');

            setInterval(clearCanvas,100);
            function clearCanvas() {
                ctx.clearRect(0, 0, W, H);
                draws();
            }

            function draw(x, y) {
                //canvas写渐变：createLinearGradient（startX,startY,endX,endY）
                var grd = ctx.createLinearGradient(x, y, x + x2, y + len);
                grd.addColorStop(0, "rgba(0,0,0,0)");
                grd.addColorStop(0.5, "rgba(105,105,105,1)");
                grd.addColorStop(1, "rgba(255,255,255,1)");
                ctx.strokeStyle = grd;

                ctx.beginPath();
                ctx.moveTo(x, y);
                ctx.lineTo(x + x2, y + len);
                ctx.lineWidth = 2;
                ctx.stroke();
                ctx.closePath();
            }
            function draws() {
                for (var i = 1; i <= count; i++) {
                    console.log(i)
                    draw(Math.random() * W, Math.random() * H);
                }
            }
        });
    </script><%--下雨事件--%>



    <script>
        /*登录信息错误弹窗*/
        $(function () {
            //单次单选弹框
            $("#onlyChoseAlert").click(function () {
                var onlyChoseAlert = simpleAlert({
                    "content": "用户名或者密码错误!",
                    "buttons": {
                        "确定": function () {
                            onlyChoseAlert.close();
                        }
                    }
                })
            })
        })

        <%--/*忘记密码事件*/--%>
        <%--$(function(){--%>
            <%--$("#forget").hover(function(){--%>
                <%--$("#forget").removeClass('forget').addClass('forget1');--%>
            <%--},function(){--%>
                <%--$("#forget").removeClass('forget1').addClass("forget");--%>
            <%--})--%>
            <%--$("#forget").click(function () {--%>
                <%--window.open("<%=basePath%>personal.jsp");--%>
            <%--})--%>
            <%--$("#jump").click(function () {--%>
                <%--window.open("<%=basePath%>jsp/register.jsp");--%>
            <%--})--%>
        <%--})--%>


    </script><%--登录异常事件--%>

</head>
<body class="background-pic">

<c:set var="myCookie" value="${cookie.userInfo.value }"></c:set>
<c:set var="info" value="${fn:split(myCookie,'-') }"></c:set>
<button hidden id="onlyChoseAlert" type="button">密码错误</button>

<canvas id="rain"></canvas>
<div class="container">
    <div align="center">
        <img id="" src="<%=basePath%>images/logo.png">
    </div>
    <form action="<%= basePath %>user/login.action" id="myform" method="post">
        <div class='form-group'>
            <input type='text' id="userName" name='userName' class='form-control'  value="${info[0]}" placeholder='用户名' style="width:310px">
        </div>
        <div class='form-group'>
            <input type='password' id="password" name='password' class='form-control'  value="${info[1]}" placeholder='密   码' style="width:310px">
        </div>
        <div  style="width:210px" class='form-group'>

            <c:if test="${empty cookie.userInfo.value }">
                <div><input type="checkbox" value="1" name="checkbox" style="height: 15px;width: 15px;margin: 0px"></div>
            </c:if>
            <c:if test="${not empty cookie.userInfo.value }">
                <div><input type="checkbox" value="1" checked="checked" name="checkbox" style="height: 15px;width: 15px;margin: 0px"></div>
            </c:if>

            <div id="remember"><span style="width: 30px;height: 20px;color: #a7bbc8">记住我</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



                <span class="forget" id="forget">&nbsp;</span></div>

            <div id="regist"><button type="button" id="jump" class='btn btn-default'style="background-color: rgba(52,60,94,0.67);color: white;width: 100px" >注册</button></div>
        </div>

        <div id="captcha" style="position: relative" ></div>
        <div id="msg"></div>
    </form>
</div>
<script type="text/javascript" src="<%=basePath%>/js/code.js"></script><%--验证码事件--%>
<script type="text/javascript">
    jigsaw.init(document.getElementById('captcha'), function () {

        var userName=$("#userName").val;
        var password=$("#password").val();
        if (userName!=""&&password!=""){
            document.getElementById('msg').innerHTML = '登录成功！';
            document.getElementById('myform').submit();
        }else{
            $("#onlyChoseAlert").trigger("click");/*用户信息为空弹窗*/
        }

    })
</script><%--验证成功跳转事件--%>

<script type="text/javascript">
    function error() {
        $("#onlyChoseAlert").trigger("click");
    }
    var flag=${param.flag};
    if(flag=="2"){
        $(document).ready(function(){
            window.onload=error();
        });
    }
</script><%--密码错误弹窗--%>

/*忘记密码事件*/
<script>
$(function(){
$("#forget").hover(function(){
$("#forget").removeClass('forget').addClass('forget1');
},function(){
$("#forget").removeClass('forget1').addClass("forget");
})
$("#forget").click(function () {
window.open("<%=basePath%>personal.jsp");
})
$("#jump").click(function () {
window.open("<%=basePath%>mainJsp/register.jsp");
})
})
</script>


</body>
</html>
