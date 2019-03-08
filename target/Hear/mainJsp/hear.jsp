<%--
  Created by IntelliJ IDEA.
  User: 1725
  Date: 2019/3/8
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String resourcesPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/hearupload/";

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MPlayer音乐播放器</title>
    <link rel="stylesheet" href="css/mplayer.css">
    <style>
        .info {
            font-family: "Microsoft Yahei";
            text-align: center;
        }
        .info h1 {
            font-weight: 400;
        }
    </style>
</head>
<body>

<div class="container" style="height: 70px; width: 100%; margin: 0;padding: 0;">
    <nav class="nav menu menu--miranda" style="background-color:#000000;height: 70px;">
        <div class="row">
            <div class="col-md-2"><img href="#" id="logo" src="<%= basePath%>main/img/logo.png"/></div>
            <div class="col-md-1"><span class="menu__item"><a id="MainRecommend" class="menu__link menu__item_current" >推荐</a></span></div>
            <div class="col-md-1"><span class="menu__item"><a id="MainRankingList" class="menu__link" >排行榜</a></span></div>
            <div class="col-md-1"><span class="menu__item"><a id="MainSongList" class="menu__link" >歌单</a></span></div>
            <div class="col-md-1"><span class="menu__item"><a id="MainSinger" class="menu__link">歌手</a></span></div>
            <div class="col-md-1"><span class="menu__item"><a id="MainMyMusic" class="menu__link">我的音乐</a></span></div>
            <div class="col-md-1"><span class="menu__item"><a id="MainFriend" class="menu__link" style="z-index: 0">朋友</a></span></div>
            <div class="col-md-2 search d7" style="position: relative;left: 7%">
                <form action="<%=basePath%>search/searchall.action" method="get">
                    <input type="text" placeholder="Hear..." name="content">
                    <button type="submit"><img src="<%= basePath%>main/img/1.jpg" style="position: relative;left: -6px"/></button>
                </form>
            </div>
            <div class="col-md-2" style="width: 70px;position: relative;left: 5%">
				<span class="menu__item">
				<a id="MainLogin" class="menu__link"><span>登录</span></a>
				</span>
            </div>
        </div>

    </nav>
</div>

<iframe id="main_iframe" th:src="@{/index}" scrolling="auto">

</iframe>
<div class="mp">
    <div class="mp-box">
        <img src="img/mplayer_error.png" alt="music cover" class="mp-cover">
        <div class="mp-info">
            <p class="mp-name">燕归巢</p>
            <p class="mp-singer">许嵩</p>
            <p><span class="mp-time-current">00:00</span>/<span class="mp-time-all">00:00</span></p>
        </div>
        <div class="mp-btn">
            <button class="mp-prev" title="上一首"></button>
            <button class="mp-pause" title="播放"></button>
            <button class="mp-next" title="下一首"></button>
            <button class="mp-mode" title="播放模式"></button>
            <div class="mp-vol">
                <button class="mp-vol-img" title="静音"></button>
                <div class="mp-vol-range" data-range_min="0" data-range_max="100" data-cur_min="80">
                    <div class="mp-vol-current"></div>
                    <div class="mp-vol-circle"></div>
                </div>
            </div>
        </div>
        <div class="mp-pro">
            <div class="mp-pro-current"></div>
        </div>
        <div class="mp-menu">
            <button class="mp-list-toggle"></button>
            <button class="mp-lrc-toggle"></button>
        </div>
    </div>
    <button class="mp-toggle">
        <span class="mp-toggle-img"></span>
    </button>
    <div class="mp-lrc-box">
        <ul class="mp-lrc"></ul>
    </div>
    <button class="mp-lrc-close"></button>
    <div class="mp-list-box">
        <ul class="mp-list-title"></ul>
        <table class="mp-list-table">
            <thead>
            <tr>
                <th>歌名</th>
                <th>歌手</th>
                <th>时长</th>
            </tr>
            </thead>
            <tbody class="mp-list"></tbody>
        </table>
    </div>
</div>
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="<%= basePath%>js/jquery.js"></script>
<script src="<%= basePath%>js/mplayer.js"></script>
<script src="<%= basePath%>js/mplayer-list.js"></script>
<script src="<%= basePath%>js/mplayer-functions.js"></script>
<script src="//cdn.bootcss.com/jquery-nstslider/1.0.13/jquery.nstSlider.min.js"></script>
<script>
    var modeText = ['顺序播放','单曲循环','随机播放','列表循环'];
    var player = new MPlayer({
        // 容器选择器名称
        containerSelector: '.mp',
        // 播放列表
        songList: mplayer_song,
        // 专辑图片错误时显示的图片
        defaultImg: 'img/mplayer_error.png',
        // 自动播放
        autoPlay: true,
        // 播放模式(0->顺序播放,1->单曲循环,2->随机播放,3->列表循环(默认))
        playMode:0,
        playList:0,
        playSong:0,
        // 当前歌词距离顶部的距离
        lrcTopPos: 34,
        // 列表模板，用${变量名}$插入模板变量
        listFormat: '<tr><td>${name}$</td><td>${singer}$</td><td>${time}$</td></tr>',
        // 音量滑块改变事件名称
        volSlideEventName:'change',
        // 初始音量
        defaultVolume:80
    }, function () {
        // 绑定事件
        this.on('afterInit', function () {
            console.log('播放器初始化完成，正在准备播放');
        }).on('beforePlay', function () {
            var $this = this;
            var song = $this.getCurrentSong(true);
            var songName = song.name + ' - ' + song.singer;
            console.log('即将播放'+songName+'，return false;可以取消播放');
        }).on('timeUpdate', function () {
            var $this = this;
            console.log('当前歌词：' + $this.getLrc());
        }).on('end', function () {
            var $this = this;
            var song = $this.getCurrentSong(true);
            var songName = song.name + ' - ' + song.singer;
            console.log(songName+'播放完毕，return false;可以取消播放下一曲');
        }).on('mute', function () {
            var status = this.getIsMuted() ? '已静音' : '未静音';
            console.log('当前静音状态：' + status);
        }).on('changeMode', function () {
            var $this = this;
            var mode = modeText[$this.getPlayMode()];
            $this.dom.container.find('.mp-mode').attr('title',mode);
            console.log('播放模式已切换为：' + mode);
        });
    });


    $(document.body).append(player.audio); // 测试用

    setEffects(player);


</script>
<script>//导航跳转
var pre=0;
var ind=["MainRecommend","MainRankingList","MainSongList","MainSinger","MainMyMusic","MainFriend"];
jQuery(function () {
    /*var test = function f(next) {
         if(pre!==next){
             var premain=ind.get(pre);
             var nextmain=ind.get(next);
             $("'#"+premain+"'").removeClass("menu__item_current");
             $("'#"+nextmain+"'").addClass("menu__item_current");
             $("#main_iframe").attr(src,contextPath+"/test/index1")
         }
     }*/
    jQuery("#MainRecommend").click(function () {
        if(pre!==0){
            var premain=ind[pre];
            var nextmain=ind[0];
            jQuery("#"+premain).removeClass("menu__item_current");
            jQuery("#"+nextmain).addClass("menu__item_current");
            console.log(pre);
            $("#main_iframe").attr("src",contextPath+"/index");
            pre=0;
        }
    });
    jQuery("#MainRankingList").click(function () {
        if(pre!==1){
            var premain=ind[pre];
            var nextmain=ind[1];
            jQuery("#"+premain).removeClass("menu__item_current");
            jQuery("#"+nextmain).addClass("menu__item_current");
            $("#main_iframe").attr("src",contextPath+"/bangdan");
            console.log(pre);
            pre=1;
        }
    });
    jQuery("#MainSongList").click(function () {
        if(pre!==2){
            var premain=ind[pre];
            var nextmain=ind[2];
            jQuery("#"+premain).removeClass("menu__item_current");
            jQuery("#"+nextmain).addClass("menu__item_current");
            $("#main_iframe").attr("src",contextPath+"/songList");
            console.log(pre);
            pre=2;
        }
    });
    jQuery("#MainSinger").click(function () {
        if(pre!==3){
            var premain=ind[pre];
            var nextmain=ind[3];
            jQuery("#"+premain).removeClass("menu__item_current");
            jQuery("#"+nextmain).addClass("menu__item_current");
            $("#main_iframe").attr("src",contextPath+"/test/index1");
            console.log(pre);
            pre=3;
        }
    });
    jQuery("#MainMyMusic").click(function () {
        if(pre!==4){
            var premain=ind[pre];
            var nextmain=ind[4];
            jQuery("#"+premain).removeClass("menu__item_current");
            jQuery("#"+nextmain).addClass("menu__item_current");
            $("#main_iframe").attr("src",contextPath+"/test/index1");
            console.log(pre);
            pre=4;
        }
    });
    jQuery("#MainFriend").click(function () {
        if(pre!==5){
            var premain=ind[pre];
            var nextmain=ind[5];
            jQuery("#"+premain).removeClass("menu__item_current");
            jQuery("#"+nextmain).addClass("menu__item_current");
            $("#main_iframe").attr("src",contextPath+"/test/index1");
            console.log(pre);
            pre=5;
        }
    });
    jQuery("#MainLogin").click(function () {
        // $("#main_iframe").attr("src",contextPath+"/test/login");
        window.parent.location.href=contextPath+"/login";
        // $("#main_iframe").attr("src",);
    });

});



</script>
</body>
</html>
