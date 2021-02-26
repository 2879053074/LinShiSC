$(document).ready(function(){
	$.ajax({
		url:'/shop/get_type',
		dataType:'json',
		success:function(data){
			if(data.type == 'success'){
				var types = data.content;
				var ul = '';
				for(var i=0;i<types.length;i++){
					ul += '<li><a href="/shop/puffingType?type='+types[i].type+'">'+types[i].snackName+'</a></li>'
				}
				if(ul != ''){
					$(".mainNav").children().remove();
					ul = '<li><a href="/shop/index">首页</a></li>' + ul + '<li><a href="/shop/puffingType?type=666">进口类</a></li><li><a href="/sorder/gotocar">购物车</a></li>';
					$(".mainNav").append(ul);
				}
			}
		}
	});
});
