$(document).ready(function(){ 
	var li=$(".vertical_nav .vertical_nav_body>ul").children("li");	
	var float_box_c=$(".float_box").children();
	$(".vertical_nav").mouseover(
		function(){
			$(li).mouseover(function(){
				index=$(this).index();				
				})
		$(".float_box").css("display","block");
		$(float_box_c[index]).css("display","block").siblings().hide()
		}
	)
	$(".vertical_nav").mouseout(
		function(){
		$(".float_box").hide()
		}
	)

}); 
function tab(a,b,c,d){
	$("."+a).children(""+b).mouseover(function(){
			var i=$(this).index();
			$(this).addClass(""+c).siblings().removeClass(""+c);
			$("."+d+[i]).css("display","block").siblings("."+d).hide()
		})
	}