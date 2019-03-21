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
    <title>个人信息编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' href='<%=basePath%>bootstrap/css/bootstrap.min.css' />
    <script type='text/javascript' src='<%=basePath%>bootstrap/jquery.js'></script>
    <script type='text/javascript' src='<%=basePath%>bootstrap/js/bootstrap.min.js'></script>
    <%--地区--%>
    <script type="text/javascript" src="<%=basePath%>js/areaData.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/provinceCity.js"></script>


    <%--日期--%>
    <script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>

    <!-- /container 导航栏 -->
    <script src="<%=basePath%>js/classie.js"></script>
    <script src="<%=basePath%>js/clipboard.min.js"></script>
    <!--公共样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/normalize.css" />
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css" />--%><%--样式冲突--%>
    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/component.css" />
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/base.css">--%><%--样式冲突--%>
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
        .modifypassword{
            font-size: 12px;
            color:rgba(46,46,46,0.4) ;
        }
        .modifypasswordfocus{
            font-size: 12px;
            color: black;
        }
        .errorpasswordblur{
            font-size: 12px;
            color: red;
        }
        .truepassword{
            font-size: 12px;
            color: green;
        }
    </style><%--/*表单验证字体*/--%>

    <script language="javascript" src="../js/PCASClass.js"></script>
    <style>
        select{font-size:12px;text-decoration:none;}
        pre{color:#808080;}
    </style>
    <%--<style type="text/css">--%>
        <%--*{padding:0;margin:0;list-style-type:none;}--%>
        <%--/* go */--%>
        <%--.go{width:47px;height:66px;background-color:#FFF;position:fixed;_position:absolute;right:60px;bottom:15%;border-radius:5px;box-shadow:0 0 2px #6E6E6E;*border:solid 1px #ddd;}--%>
        <%--.go a{background:url(<%=basePath%>images/retop.png) no-repeat;display:block;text-indent:999em;width:37px;margin:5px;border:0;overflow:hidden;float:left}--%>
        <%--.go .top{background-position:4px 7px;height:22px}--%>
        <%--.go .top:hover{background-position:-34px 7px;}--%>
        <%--.go .feedback{background-position:4px -18px;height:32px}--%>
        <%--.go .feedback:hover{background-position:-34px -18px}--%>
        <%--.go .bottom{background-position:4px -56px;height:22px}--%>
        <%--.go .bottom:hover{background-position:-34px -56px}--%>
    <%--</style>--%>


</head>
<body>


<a name="gotop">&nbsp;</a>

<div style="height: auto;width: 1000px;margin-left:180px;border: 1px solid #e0e0e0;background-color: #FCFCFC">
    <div style="height: auto;width: auto;margin-left:50px">
        <div style="margin-left: 25px;margin-top: 30px"><h3><span>资料设置</span></h3></div>
        <div style="height: auto;width: auto;margin-left: 125px; margin-top: 30px">
            <form action="<%=basePath%>user/modify.action" enctype="multipart/form-data" method="post" onsubmit="return check()">
                <div style="width:auto;height: auto;margin-left: 0">
                   <div>
                       <div><span style="font-size: 14px">昵称:</span></div>
                        <c:if test="${not empty sessionScope.user.nicheng}">
                            <input id="nicheng" type="text" name="nicheng" maxlength="8" value="${sessionScope.user.nicheng}" class="form-control"  style="width: 260px;margin-left: 40px;margin-top: -20px">
                        </c:if>
                       <c:if test="${empty sessionScope.user.nicheng}">
                           <input id="nicheng" type="text" name="nicheng" maxlength="8" value="${sessionScope.user.name}" class="form-control"  style="width: 260px;margin-left: 40px;margin-top: -20px">
                       </c:if>
                   </div>

                    <div style="width: 300px;margin-top:-30px;margin-left: 350px">
                        <div id="change"  style="margin-left: 75px;margin-top:0px;width: 150px;height: 150px;border:1px solid #b4b4b4" >
                            <c:if test="${empty sessionScope.user.img}">
                                <img src="<%=basePath%>images/headimg.jpg" width="140px" height="140px " style="margin:4px 4px">
                            </c:if>
                            <c:if test="${not empty sessionScope.user.img}">
                                <img src="<%=resourcesPath%>head/${sessionScope.user.img}" width="140px" height="140px " style="margin:4px 4px">
                            </c:if>
                            <div id="changeimg" class="changeimg">
                                <span id="font" class="font" >更换头像<input name="imgup" type="file" class="upload_pic" id="upload" /></span>
                            </div>

                        </div>

                        <div class="con4" >
                            <canvas id="cvs" width="200" height="200"></canvas>
                        </div>

                        <div>
                            <button id="clean" type="button" class="btn btn-default" style="width: 150px;margin-left: 75px;margin-top: -5px">取消头像上传</button>
                        </div>

                    </div><%--图片上传--%>


                    <div style="margin-top: -370px;margin-left: -20px">
                        <div style="margin-left: 20px"><span style="font-size: 14px;color: black">标签:</span>
                            &nbsp;<a onclick="choosetag()" href="javascript:void(0)">选择标签</a>
                        </div>
                        <div hidden id="tag" style="margin-left: 70px">
                            <table>
                                <tr style="font-size: 12px">
                                    <c:forEach items="${tags}" var="tag" varStatus="s">
                                    <td style="width: 60px">
                                        <input type="checkbox" value="${tag.id}"
                                            <c:forEach items="${userTags}" var="usertag">
                                                <c:if test="${tag.id==usertag.tag_ID}">
                                                    checked="checked"
                                                </c:if>
                                            </c:forEach>
                                            name="checkbox">
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


                    <div style="margin-top: 50px">
                        <div style="margin-top: -40px"><span style="font-size: 14px">介绍:</span></div>
                        <c:if test="${not empty sessionScope.user.introduce}">
                            <textarea name="introduce" cols="34" rows="5" style="resize: none;margin-left: 40px;margin-top: -20px" placeholder="填写您的个人介绍哦！">${sessionScope.user.introduce}</textarea>
                        </c:if>
                        <c:if test="${empty sessionScope.user.introduce}">
                            <textarea name="introduce" cols="34" rows="10" placeholder="填写您的个人介绍哦！" style="resize: none;margin-left: 40px;margin-top: -20px"></textarea>
                        </c:if>
                    </div>
                    <div style="margin-top: 50px">
                        <div style="margin-top: -40px"><span style="font-size: 14px">性别:</span></div>
                        <div style="margin-left: 40px;margin-top: -22px">
                            <c:if test="${sessionScope.user.sex==1}">
                            <input class="sex" type="radio" name="sex" checked="checked" value="男" style="width: 15px ;height: 15px"/>
                            <span>男</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="sex" type="radio" name="sex" value="女" />
                            <span>女</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="sex" type="radio"  name="sex" value="" />
                            <span>保密</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <c:if test="${sessionScope.user.sex==0}">
                                <input class="sex" type="radio" name="sex"  value="男" style="width: 15px ;height: 15px"/>
                                <span>男</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="sex" type="radio" checked="checked" name="sex" value="女" />
                                <span>女</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="sex" type="radio"  name="sex" value="" />
                                <span>保密</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <c:if test="${empty sessionScope.user.sex}">
                                <input class="sex" type="radio" name="sex"  value="男" style="width: 15px ;height: 15px"/>
                                <span>男</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="sex" type="radio"  name="sex" value="女" />
                                <span>女</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="sex" type="radio" checked="checked"  name="sex" value="" />
                                <span>保密</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                        </div>
                    </div>

                    <div>
                        <div><span style="font-size: 14px">手机:</span></div>
                        <c:if test="${empty sessionScope.user.tel}">
                            <input id="tel" type="text" name="tel" value="" class="form-control"  style="width: 260px;margin-left: 40px;margin-top: -20px">
                        </c:if>
                        <c:if test="${ not empty sessionScope.user.tel}">
                            <input id="tel" type="text" name="tel" value="${sessionScope.user.tel}" class="form-control"  style="width: 260px;margin-left: 40px;margin-top: -20px">
                        </c:if>
                    </div>

                    <div style="margin-top: 50px;">
                        <div style="margin-top: -40px"><span style="font-size: 14px">生日:</span></div>
                        <div style="margin-left: 40px;margin-top: -25px;width: 230px">
                            <c:if test="${empty sessionScope.user.birthday}">
                            <input type="text"  style="width: 260px"  class="form-control" value="1995-08-05" onClick="WdatePicker()" readonly="readonly" name="birthday" id="startdate">
                            </c:if>
                            <c:if test="${not empty sessionScope.user.birthday}">
                                <input style="width: 260px" type="text" class="form-control" value="<fmt:formatDate value="${sessionScope.user.birthday}" pattern="yyyy-MM-dd"/>" onClick="WdatePicker()" readonly="readonly" name="birthday" id="startdate">
                            </c:if>
                        </div>
                    </div>

                    <div style="margin-top: 50px">
                        <div style="margin-top: -40px"><span style="font-size: 14px">地区:</span></div>
                        <div style="margin-left: 40px;margin-top: -20px">
                            <div>
                                <input hidden type="text" name="userprovince" value="${sessionScope.user.province}">
                                <input hidden type="text" name="usercity" value="${sessionScope.user.city}">
                                <span>${sessionScope.user.province}</span>
                                <span>${sessionScope.user.city}</span>
                                    <select class="form-control"style="width: 130px;height:35px;" name="P1"></select>
                                    <select class="form-control"style="width: 130px;height:35px;margin-top: -35px;margin-left: 130px" name="C1"></select>
                            </div>
                        </div>
                    </div>

                    <div style="margin-top: 30px;margin-left: 50px">
                        <button id="submitbutton" type="submit" class="btn btn-info" style="width: 180px">保存信息</button>
                    </div>



                </div>
            </form>
        </div>
    </div>
    <div style="height: auto;width: auto;margin-left: 50px">
        <div style="margin-left: 25px;margin-top: 30px"><h3><span style="">修改密码</span></h3></div>
        <div style="width: auto;height: auto;margin-top: 20px">
            <form action="<%=basePath%>user/updatePassword.action" method="post" onsubmit="return checkform()">
                <div style="width:auto;height: auto;margin-left: 125px;margin-top: 30px">
                    <div>
                        <div><span style="font-size: 14px">当前密码:</span></div>
                        <input id="currentpassword" type="password" name="currentpassword" class="form-control" style="width: 230px;margin-left: 65px;margin-top: -20px">
                        <div style="margin-left: 230px;margin-top: -25px">
                            <span id="currentpasswordspan" class="modifypassword" style="margin-left: 70px">必须与当前登录密码一致</span>
                        </div>

                    </div>

                    <div style="margin-top: 30px">
                        <div><span style="font-size: 14px">&nbsp;新&nbsp;密&nbsp;码:</span></div>
                        <input id="newpassword" type="password" name="newpassword" value=""class="form-control" style="width: 230px;margin-left: 65px;margin-top: -20px">
                        <div style="margin-left: 230px;margin-top: -25px">
                            <span id="newpasswordspan" class="modifypassword" style="margin-left: 70px">必须为6-20位数字和字母的组合</span>
                        </div>
                    </div>

                    <div style="margin-top: 30px">
                        <div><span style="font-size: 14px">确认密码:</span></div>
                        <input id="confirmpassword" type="password" name="confirmpassword" value=""class="form-control" style="width: 230px;margin-left: 65px;margin-top: -20px">
                        <div style="margin-left: 230px;margin-top: -25px">
                            <span id="confirmpasswordspan" class="modifypassword" style="margin-left: 70px">必须与新密码一致</span>
                        </div>
                    </div>

                    <div style="margin-top: 30px;margin-left:48px">
                        <button type="submit" class="btn btn-info" style="width: 180px">确认密码修改</button>
                    </div>

                </div>

            </form>

        </div>
        </div>

    </div>

<a name="gobottom">&nbsp;</a>


<div class="go">
    <a title="返回顶部" class="top" href="#gotop"></a>
    <a title="返回底部" class="bottom" href="#gobottom"></a>
</div><%--锚点--%>

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

<script>
    var issubmit="false";
    function check() {
        if(issubmit=="true"){
            return true;
        }else{
            alert("昵称不能为空哦！");
            return false;
        }
    }
    $(function () {
        $("#submitbutton").click(function () {
            var val=$("#nicheng").val();
            if(val!=""){
                issubmit="true";
            }
        })
    })

</script><%--昵称验证--%>

<script>
    var first="false";
    var second="false";
    var third="false";
    var password=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
    function checkform() {
            if(first=="true"&&second=="true"&&third=="true"){
                return true;
            }else{
                return false;
            }
        return false;
    }/*表单可否提交验证*/

    $(function () {
            $("#currentpassword").focus(function () {
                $("#currentpasswordspan").removeClass("truepassword").removeClass("modifypassword").removeClass("errorpasswordblur").addClass("modifypasswordfocus");
                $("#currentpasswordspan").text("必须与当前登录密码一致");
                first="false";
            })/*当前密码获得焦点事件*/

        $("#currentpassword").blur(function () {
            var currentpassword=$("#currentpassword").val();
            var truepassword="${sessionScope.user.password}";
            if(currentpassword==truepassword){
                $("#currentpasswordspan").removeClass("modifypasswordfocus").addClass("truepassword");
                $("#currentpasswordspan").text("✔");
                first="true";
            }else{
                $("#currentpasswordspan").removeClass("modifypasswordfocus").addClass("errorpasswordblur");
                $("#currentpasswordspan").text("必须与当前登录密码一致");
                first="false";
            }

        })/*当前密码失去焦点事件*/
    })/*当前密码事件*/

    $(function () {
            $("#newpassword").focus(function () {
                $("#newpasswordspan").removeClass("truepassword").removeClass("modifypassword").removeClass("errorpasswordblur").addClass("modifypasswordfocus");
                $("#newpasswordspan").text("必须为6-20位数字和字母的组合");
                second="false";
            })/*新密码获得焦点事件*/

            $("#newpassword").blur(function () {
                var newpassword=$("#newpassword").val();
                if(newpassword!=""&&password.test(newpassword)){
                    $("#newpasswordspan").removeClass("modifypasswordfocus").addClass("truepassword");
                    $("#newpasswordspan").text("✔");
                    second="true";
                }else{
                    $("#newpasswordspan").removeClass("modifypasswordfocus").addClass("errorpasswordblur");
                    $("#newpasswordspan").text("必须为6-20位数字和字母的组合");
                    second="false";
                }
            })/*新密码失去焦点事件*/
        })/*新密码事件*/

    $(function () {
            $("#confirmpassword").focus(function () {
                $("#confirmpasswordspan").removeClass("truepassword").removeClass("modifypassword").removeClass("errorpasswordblur").addClass("modifypasswordfocus");
                $("#confirmpasswordspan").text("必须与新密码一致");
                third="false";
            })/*确认密码获得焦点事件*/

            $("#confirmpassword").blur(function () {
                var confirmpassword=$("#confirmpassword").val();
                if(confirmpassword!=""&&confirmpassword==$("#newpassword").val()&&password.test(confirmpassword)){
                    $("#confirmpasswordspan").removeClass("modifypasswordfocus").addClass("truepassword");
                    $("#confirmpasswordspan").text("✔");
                    third="true";
                }else{
                    $("#confirmpasswordspan").removeClass("modifypasswordfocus").addClass("errorpasswordblur");
                    $("#confirmpasswordspan").text("必须与新密码一致");
                    third="false";
                }
            })/*确认密码失去焦点事件*/
        })/*确认密码事件*/

</script><%--修改密码表单验证--%>

<script language="javascript" defer>
    new PCAS("P1","C1");
    new PCAS("P2","C2","吉林省");
    new PCAS("P3","C3","江苏省","苏州市");

    new PCAS("province","city","area","吉林省","白城市","大安市");
    new PCAS("province1","city1","area1","吉林省","吉林市","龙潭区");
    new PCAS("province2","city2","area2","江苏省","苏州市","沧浪区");

    new PCAS("province3","city3","area3");
    new PCAS("province4","city4","area4","江苏省");
    new PCAS("province5","city5","area5","江苏省","苏州市");
    new PCAS("province6","city6","area6","江苏省","苏州市","沧浪区");
</script><%--地区--%>

<script>
    function choosetag() {
        if($("#tag").is(":hidden")){
            $("#tag").removeAttr("hidden");
        }else {
            $("#tag").prop("hidden",true);
        }
    }
</script><%--标签点击显示隐藏--%>

</body>
</html>
