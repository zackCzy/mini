/**
 * 
 */
$(function(){
	$(".delectDraft").click(function(){	
		send.call(this,"/myHome/user/function_removeDraft",'草稿删除失败');
	});
});

function send(url,information){
	var that=this;
	$.ajax({
		url:url,
		method : 'get',
		data : {userId:this.getAttribute("title")},
		success:function(text){
			if(text.isEmpty()=='removeDraft user log ok'){			
				$(that.parentNode).animate({
					height:0},function (){
						$(".draft_title span").html(parseInt($(this).text()-1));
						$.notice("vik提醒您！","草稿删除成功");
						$(this).remove();
					}	
				);
			}else{
				$.notice("vik提醒您！",information);
			}
		}
	});	
}

