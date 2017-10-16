/*消息发送*/

$(document).ready(function(){
	$(".newsDiv").hide();
	
	$(".l-dhbianhui").click(function(){
		var flag=$(this).attr("id");
		$(".newsDiv").hide();
		$(".news_"+flag).show();
		if($(".news_"+flag).html()==""){
			
			$.ajax({
				type: "get",
				url: "/news/"+flag+"Sender",
				success: function(data) {
					for(var i=0;i<data.length;i++){
						var obj=$("<li class='menuLi'  href='' ><a target='mainPage' ></a>"+
									"<i class='iconfont'  ></i>"+
									"<span style='font-size: 12px;'>"+data[i].name+"</span></li>")
									$(".news_"+flag).append(obj);
							
						var j=i;
						obj.click(function(){
							mainPage.location.href="/news/"+flag+"Input?senderId="+data[j].id;
						
						})
						
					}
				}})
			
			
		}
	})
	
	
	
	
})