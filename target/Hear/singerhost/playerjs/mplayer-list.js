/**
 * 播放列表
 * @type {Array}
 * 请用数组来定义总列表
 * 再用二维数组定义每个列表
 * 其中列表里的每首歌需用对象定义
 * 请在每个列表中的第一个元素定义列表信息（必须位于第一位）
 * 列表信息必须有一个basic属性，值为true
 * 还要有一个name属性，值为列表名称
 * 可选参数为singer、image，用于为定义的该属性的歌曲调用
 * 每首歌必须有name、src、lrc三个属性
 * src为歌曲相对于index.html的相对路径或绝对路径
 * 可选singer和image属性
 * 在每首歌没有定义singer或image时将使用列表的singer或image
 * 请确保一定有一个被定义
 * 其中name为歌曲名称
 * src为歌曲文件路径
 * lrc为歌词，请用\n或\r将每行歌词隔开，否则无法识别
 */
var jsbasePath=function getRealPath(){
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    var realPath=localhostPaht+projectName;
    // alert(realPath);
    return realPath;
}
var hearPath=function getHearPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var hearPath = localhostPaht + "/hearupload";
    // alert(hearPath);
    return hearPath;
}
var mplayer_song = [[
    {
        "basic":true,
        "name":"歌曲列表",
        "singer":"Singer",
        "img":"https://y.gtimg.cn/music/photo_new/T001R300x300M000000CK5xN3yZDJt.jpg"
    },
    {
        "name":"突然好想你",
        "singer":"林俊杰",
        "img":hearPath()+"/images/100singer/14.jpg",
        // "src":hearPath()+"/song/陈奕迅 -好久不见.mp3",
        // "src":"D:\\Hear\\song\\林俊杰-突然好想你.mp3",
        "src":hearPath()+"/song/林俊杰-突然好想你.mp3",
        "lrc":"[ver:v1.0]\n" +
        "[ti:突然好想你]\n" +
        "[00:00.83]突然好想你\n" +
        "[00:03.48]你会在哪里\n" +
        "[00:06.68]过得快乐或委屈\n" +
        "[00:13.26]突然好想你\n" +
        "[00:16.60]突然锋利的回忆\n" +
        "[00:19.87]突然模糊的眼睛\n" +
        "[00:27.77]我们像一首最美丽的歌曲\n" +
        "[00:33.92]变成两部悲伤的电影\n" +
        "[00:39.79]为什么你带我走过最难忘的旅行\n" +
        "[00:46.26]然后留下最痛的纪念品\n" +
        "[00:53.45]我们那么甜那么美\n" +
        "[00:56.35]那么相信\n" +
        "[00:57.62]那么疯那么热烈的曾经\n" +
        "[01:01.96]为何我们\n" +
        "[01:03.20]还是要奔向各自的幸福\n" +
        "[01:07.07]和遗憾中老去\n" +
        "[01:09.82]突然好想你\n" +
        "[01:13.12]你会在哪里\n" +
        "[01:16.70]过得快乐或委屈"

    }
    ]];
/*
{
    "name":"今年勇",
    "img":"http://imgcache.qq.com/music/photo/album_500/35/500_albumpic_1779435_0.jpg",
    "src":"http://dl.stream.qqmusic.qq.com/C400000m0VJV3g9Nvh.m4a?fromtag=38&vkey=8FA9B3953BE3D85125B78B7E153C0A26FF0DDCA060123AB1D09F3AED482C8CF2CA194905294785868F71BFE820A5973A9706493C83E98AFD&guid=1253989301",
    "lrc":"[ti:今年勇]\n[ar:许嵩]\n[al:今年勇]\n[by:]\n[offset:0]\n[00:00.22]今年勇 - 许嵩\n[00:00.42]词：许嵩\n[00:00.55]曲：许嵩\n[00:00.69]制作人：许嵩\n[00:01.10]\n[00:24.56]功名桥\n[00:26.27]世俗道\n[00:27.82]年少难免走一遭\n[00:30.86]\n[00:31.82]有人哭\n[00:33.75]有人笑\n[00:35.16]笑的也不见得逍遥\n[00:38.19]\n[00:39.15]迹晦光韬\n[00:41.34]不代表\n[00:43.22]豪情已折耗\n[00:45.32]\n[00:46.22]拿得起当年勇\n[00:47.93]\n[00:48.58]傲视群雄\n[00:50.08]\n[00:50.65]不足道\n[00:53.39]\n[00:54.53]今朝有酒醉\n[00:55.72]醉庆同袍沙场归\n[00:57.44]\n[00:58.11]天公爱作美\n[00:59.47]清风皓月任我飞\n[01:01.75]受命于临危\n[01:03.19]自揄功成身不退\n[01:05.54]神武走一回\n[01:08.64]\n[01:32.11]功名桥\n[01:33.11]\n[01:33.87]世俗道\n[01:35.31]年少难免走一遭\n[01:38.65]\n[01:39.39]有人哭\n[01:40.70]\n[01:41.31]有人笑\n[01:42.71]笑的也不见得逍遥\n[01:45.71]\n[01:46.79]迹晦光韬\n[01:48.04]\n[01:48.65]不代表\n[01:50.04]\n[01:50.59]豪情已折耗\n[01:52.99]\n[01:53.79]拿得起当年勇\n[01:55.32]\n[01:56.10]傲视群雄\n[01:57.41]\n[01:58.09]不足道\n[02:01.13]\n[02:02.00]今朝有酒醉\n[02:03.23]醉庆同袍沙场归\n[02:04.94]\n[02:05.56]天公爱作美\n[02:07.00]清风皓月任我飞\n[02:08.76]\n[02:09.29]受命于临危\n[02:10.68]自揄功成身不退\n[02:13.04]神武走一回\n[02:16.16]\n[02:16.81]今朝有酒醉\n[02:18.16]醉庆同袍沙场归\n[02:20.58]天公爱作美\n[02:21.92]清风皓月任我飞\n[02:24.31]受命于临危\n[02:25.64]自揄功成身不退\n[02:28.08]神武走一回\n[02:30.89]\n[02:46.99]今朝有酒醉\n[02:48.23]醉庆同袍沙场归\n[02:50.59]天公爱作美\n[02:51.93]清风皓月任我飞\n[02:53.85]\n[02:54.39]受命于临危\n[02:55.66]自揄功成身不退\n[02:58.09]神武走一回\n[03:01.08]\n[03:01.84]今朝有酒醉\n[03:03.24]醉庆同袍沙场归\n[03:04.99]\n[03:05.59]天公爱作美\n[03:06.94]清风皓月任我飞\n[03:09.30]受命于临危\n[03:10.63]自揄功成身不退\n[03:13.08]神武走一回\n[03:16.19]\n[03:16.88]神武走一回"
}
]];*/

var newplaylist = [{
    "name":"突然好想你",
    "singer":"林俊杰",
    "img":hearPath()+"/images/100singer/14.jpg",
    // "src":hearPath()+"/song/陈奕迅 -好久不见.mp3",
    "src":"D:\\Hear\\song\\林俊杰-突然好想你.mp3",
    "lrc":"[ver:v1.0]\n" +
    "[ti:突然好想你]\n" +
    "[00:00.83]突然好想你\n" +
    "[00:03.48]你会在哪里\n" +
    "[00:06.68]过得快乐或委屈\n" +
    "[00:13.26]突然好想你\n" +
    "[00:16.60]突然锋利的回忆\n" +
    "[00:19.87]突然模糊的眼睛\n" +
    "[00:27.77]我们像一首最美丽的歌曲\n" +
    "[00:33.92]变成两部悲伤的电影\n" +
    "[00:39.79]为什么你带我走过最难忘的旅行\n" +
    "[00:46.26]然后留下最痛的纪念品\n" +
    "[00:53.45]我们那么甜那么美\n" +
    "[00:56.35]那么相信\n" +
    "[00:57.62]那么疯那么热烈的曾经\n" +
    "[01:01.96]为何我们\n" +
    "[01:03.20]还是要奔向各自的幸福\n" +
    "[01:07.07]和遗憾中老去\n" +
    "[01:09.82]突然好想你\n" +
    "[01:13.12]你会在哪里\n" +
    "[01:16.70]过得快乐或委屈"

}];
function getJsonObjLength(jsonObj) {
           var Length = 0;
           for (var item in jsonObj) {
               Length++;
           }
            return Length;
}
function sendSongid(id) {
    $.ajax({
        type:"get",
        url:jsbasePath()+"/songplay.action",
        data:"id="+id,
        success:function(songMessage) {
            var song = JSON.parse(songMessage);
            var obj={};
            obj["name"]=song.name;
            obj["singer"]=song.singer.name;
            obj["img"]=hearPath()+"/images/200album/"+song.album.img;
            obj["src"]=hearPath()+"/song/"+song.url;
            obj["lrc"]=song.lrc;
            var s=JSON.stringify(obj);
            newplaylist.push(obj);
            var count = getJsonObjLength(newplaylist);
            player.addSong(newplaylist[count-1]);

        }
    });
}
function playSongid(id) {
    $.ajax({
        type:"get",
        url:jsbasePath()+"/songplay.action",
        data:"id="+id,
        success:function(songMessage) {
            var song = JSON.parse(songMessage);
            var obj={};
            obj["name"]=song.name;
            obj["singer"]=song.singer.name;
            obj["img"]=hearPath()+"/images/200album/"+song.album.img;
            obj["src"]=hearPath()+"/song/"+song.url;
            obj["lrc"]=song.lyrics;
            var s=JSON.stringify(obj);
            newplaylist.push(obj);
            var count = getJsonObjLength(newplaylist);
            player.addSong(newplaylist[count-1]);
            player.play(count-1);

        }
    });
}