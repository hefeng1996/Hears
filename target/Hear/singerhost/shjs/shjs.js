var jsbasePath=function getRealPath(){
    //获取当前网址，如： http://localhost:8083/myproj/view/my.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： myproj/view/my.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/myproj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

    //得到了 http://localhost:8083/myproj
    var realPath=localhostPaht+projectName;
    return realPath;
}
window.onload = function () {
// 导航点击效果
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



    // 隔行换色
        var tab = document.getElementById("tab"); //获取id为tb的元素(table)
        var tbody = tab.getElementsByTagName("tbody")[0]; //获取表格的第一个tbody元素
        var trs = tbody.getElementsByTagName("tr"); //获取tbody元素下的所有tr元素
        for (var i = 0; i < trs.length; i++) {//循环tr元素
            if (i % 2 == 0) { //取模. (取余数.比如 0%2=0 , 1%2=1 , 2%2=0 , 3%2=1)
                trs[i].style.backgroundColor = "#f7f7f7"; // 改变 符合条件的tr元素 的背景色.
            }
        }

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
        // 歌手收藏切换
        /*$("#collectsinger_img img").toggle(
            function () {
                $(this).attr("src",jsbasePath()+"/singerhost/shimg/collectedsinger.png");},
            function(){
                $(this).attr("src",jsbasePath()+"/singerhost/shimg/colectsinger.png");}
         )*/








         document.getElementById("rightpart").style.height = document.getElementById("leftpart").offsetHeight + "px";

       /* var heightDiv1=$("#leftpart").height();
        var heightDiv2=$("#rightpart").height();
        if(heightDiv1>heightDiv2) {
            $('#rightpart').height(heightDiv1+'px');
        }else{
            $('#leftpart').height(heightDiv2+'px');
        }*/

}
