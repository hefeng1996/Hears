// 歌手歌曲行tr鼠标移入移出事件
// var playimg = document.getElementById("playimg");
var $plyimg = $(".plyimg");
$plyimg.mouseover(function () {
    $(this).attr("src",jsbasePath()+"/singerhost/shimg/play2.png");
}).mouseout(function () {
    $(this).attr("src",jsbasePath()+"/singerhost/shimg/play1.png");
})
var $songtimebg = $(".songtimebg");
var $songtime = $(".songtime");
$("#tab tr").mouseover(function () {
    $(this).find($songtimebg).show();
    $(this).find($songtime).hide();
}).mouseout(function () {
    $(this).find($songtimebg).hide();
    $(this).find($songtime).show();
})