$(function(){
	$(".slide_img_ul li").hide();
	$(".slide_img_ul li").eq(0).show();
	$(".slide_option li").click(function(){
		var $check_li=$(this), check_index=$(this).index();
		$check_li.addClass("check_li").siblings().removeClass("check_li");
		$(".slide_img_ul li").hide().eq(check_index).fadeToggle(500);
	})

	var ints=window.setInterval(Timers,5000);
	//window.setInterval("alert('123')",1000);
	function Timers(){
			var Allli=$(".slide_option li");
			var CheckLi=$(".slide_option .check_li"),Cindex=Allli.index($(".slide_option .check_li"));
			if(Cindex+1==Allli.length){
				Allli.eq(0).trigger('click');
			}else{
				CheckLi.next().trigger('click');
			}
		}
	$(".slide_option li").hover(function (){
			ints=window.clearInterval(ints);
	},function(){
		 ints=window.setInterval(Timers,5000);
	})
})