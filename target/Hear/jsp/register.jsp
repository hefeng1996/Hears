<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='<%=basePath%>bootstrap/css/bootstrap.min.css' />
    <script type='text/javascript' src='<%=basePath%>bootstrap/jquery.js'></script>
    <script type='text/javascript' src='<%=basePath%>bootstrap/js/bootstrap.min.js'></script>

    <script src="<%=basePath%>js/register.js"></script>
    <link href="<%=basePath%>css/registergloab.css" rel="stylesheet">
    <link href="<%=basePath%>css/register.css" rel="stylesheet">

    <!-- /container -->
    <script src="<%=basePath%>js/classie.js"></script>
    <script src="<%=basePath%>js/clipboard.min.js"></script>
    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css" />--%>
    <%--<!--主要样式-->--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/component.css" />
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css">--%>
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
    </style>


    <title>注册</title>
    <style>
        .color{
            color: green;
        }
    </style>



</head>
<body>


<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;" >
        <img href="#"  id="logo" src="<%= basePath%>main/img/logo.png"></img>
        <ul class="menu__list" id="ul">
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>songlist/index.action'">推荐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>bangdan.action' " href="javascript:void(0) ">排行榜</a></li>
            <li class="menu__item" style="margin-left: 1px"><a class="menu__link"onclick="window.location = '<%= basePath%>songlist/huayu.action?id=31' " href="javascript:void(0)">歌单</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>artist/recommendsinger.action' " >歌手</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link">我的音乐</a></li>
            <li class="menu__item" style="margin-left: 1px"><a href="#" class="menu__link">朋友</a></li>

            <li class="menu__item" style="margin-left: -20px"><a href="#" class="menu__link"onclick="window.location = '<%= basePath%>jsp/login.jsp' " >登录</a></li>
        </ul>
    </nav>

</div>





<div>
    <div style="height: 550px;width: 1000px;margin-left:180px;border: 1px solid #e0e0e0;background-color: #FCFCFC" align="center">
        <span style="font-size: 26px">新用户注册</span><br/>
        <div align="left" style="margin-left: 100px">
            <form id="myform" class="form-horizontal" action="<%=basePath%>user/register.action" method="post">
                <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                    <div class="part1">
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>
                            <div class="f-fl item-ifo">
                                <input type="text" name="username" maxlength="20" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头" id="adminNo" />                            <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus"><span id="username">3-20位，中文、字母、下划线的组合，以中文或字母开头</span></label>
                                <label class="focus valid"></label>
                            </div>
                        </div>

                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号：</span>
                            <div class="f-fl item-ifo">
                                <input type="text" name="tel" class="txt03 f-r3 required" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone" />
                                <span class="ie8 icon-close close hide"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus">请填写11位有效的手机号码</label>
                                <label class="focus valid"></label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
                            <div class="f-fl item-ifo">
                                <input type="password" name="password" id="password" maxlength="20" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                                <span class="ie8 icon-close close hide" style="right:55px"></span>
                                <span class="showpwd" data-eye="password"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                                <label class="focus valid"></label>
                                <span class="clearfix"></span>
                                <label class="strength">
                                    <span class="f-fl f-size12">安全程度：</span>
                                    <b><i>弱</i><i>中</i><i>强</i></b>
                                </label>
                            </div>
                        </div>
                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
                            <div class="f-fl item-ifo">
                                <input type="password" maxlength="20" class="txt03 f-r3 required" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                                <span class="ie8 icon-close close hide" style="right:55px"></span>
                                <span class="showpwd" data-eye="rePassword"></span>
                                <label class="icon-sucessfill blank hide"></label>
                                <label class="focus">请再输入一遍上面的密码</label>
                                <label class="focus valid"></label>
                            </div>
                        </div>

                        <div class="item col-xs-12" style="height:auto">
                            <span class="intelligent-label f-fl">&nbsp;</span>
                            <p>
                                <input type="checkbox" checked /><a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
                            </p>
                            <label class="focus valid"></label>
                        </div>

                        <div class="item col-xs-12">
                            <span class="intelligent-label f-fl">&nbsp;</span>
                            <div id="go" class="f-fl item-ifo">
                                <a  class="btn btn-blue f-r3" id="btn_part2">注册</a>
                            </div>
                        </div>

                        <div class="m-sPopBg" style="z-index:998;"></div>
                        <div class="m-sPopCon regcon">
                        <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
                        <div class="apply_up_content">
                            您在使用本服务时须遵守法律法规，不得利用本服务从事违法违规行为，包括但不限于：<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）发布、传送、传播、储存危害国家安全统一、破坏社会稳定、违反公序良俗、侮辱、诽谤、淫秽、暴力以及任何违反国家法律法规的内容；<br>
                            　　（2）发布、传送、传播、储存侵害他人知识产权、商业秘密等合法权利的内容；<br>
                            　　（3）恶意虚构事实、隐瞒真相以误导、欺骗他人；<br>
                            　　（4）发布、传送、传播广告信息及垃圾信息；<br>
                            　　（5）其他法律法规禁止的行为。<br>
                            &nbsp;<p>
                            &nbsp;<p>
                            <p>
                        </div>
                        <CENTER><a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a></CENTER>
                    </div>

                    </div>
                </div>
            </form>
        </div>

    </div>
</div>


</div>

<script>
    $(function(){
        $("#btn_part2").click(function(){
            if(!verifyCheck._click()){
                return;
            }else{
                if(!$("input").is(":checked")){
                    alert("请先同意条款");
                }else{
                $(".part2").hide();
                $(".part3").show();
                var username=$("#adminNo").val();
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/user/findUserName.action",
                    data:"username="+username,
                    success:function(val){
                        if(val=='1'){
                            document.getElementById('myform').submit();
                        }else{
                            alert("此用户名已存在，请重新注册");
                        }
                    }

                })
                }
            }
        });
    });

    function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
    function closeClause(){
        $(".m-sPopBg,.m-sPopCon").hide();
    }
</script> <%--注册判断此用户名是否已经存在--%>

<script>
    $(function(){
            $("#btn_part2").click(function () {

            })
    })

</script><%--条款事件--%>

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
    })(window);
</script><%--导航栏--%>


</body>
</html>
