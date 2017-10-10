<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>
     <!-- 防止IE8,7进入怪异模式 -->
    <meta http-equiv="Content-Type" content="IE=Edge,chrome=1" />
	<title>jQuery视频点击切换，滚动条美化代码</title>      
    <!-- js通用样式 -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<!-- js通用样式 -->
	<!-- 滚动条主要样式 -->
	<script type="text/javascript" src="js/jquery.nicescroll.js"></script>
	<!-- 滚动条主要样式 -->
	<style type="text/css">
	/*格式化样式*/
	body {margin: 0;padding: 0;font-family:Microsoft YaHei!important;background-color: #F5F5F5;}
	ul,dl,dt,dd,h1,h2,h3,h4,h5,h6,form { padding:0; margin:0;}
	ul { list-style:none;}
	img { border:0px;}

	a{text-decoration: none;outline: none;color:#444;}
	a:visited{text-decoration: none;}
	a:hover{cursor: pointer;text-decoration: none; color:#3C97D6;}
	a:focus{-moz-outline-style: none;text-decoration: none;}
	img{border: 0;}
	.clear{clear: both;}
	/*格式化样式*/
	/*播放器样式*/
	.video_player{height:393px;}
    .video_list_area{width: 700px;}
		ul.video_list{margin: 7px 0px 0px 0;height: 107px; list-style:none;border-bottom: 10px solid #dcdcdc;}
		ul.video_list li{float: left;font-size: 14px;font-weight: bold;line-height: 24px;}
		ul.video_list li a{display:inline-block;padding: 14px 15px;margin-right:7px;width: 140px;height:72px;color: #fff;background-color: #7e2d2d;}
		ul.video_list li.last a{margin-right:0;}
		ul.video_list li a:hover,ul.video_list li a.on{color: #fff;background-color: #c12e2e;}
		#ascrail2000-hr div{margin-left:0;}
	.center{width: 700px;margin: 20px auto;}
	/*播放器样式*/
	</style>
	<!--- iframe切换停止播放js -->
	<script type="text/javascript">
	$(function() {
		var iframe = $("div.video_player iframe");//播放页面
		$('ul.video_list li a').click(function(){
			iframe.attr("src",$(this).attr("name"));//更改iframe src
			$('ul.video_list li a').removeClass('on');
			$(this).addClass('on');//给点击的元素添加正在播放标识
		});
		
	});
    </script>
    <!-- iframe切换停止播放js -->
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>
	<h3>
		视频播放列表
	</h3>
	<div class="center">
		<!-- 播放器 -->
		<div class="video_player">
			<iframe src='${ctx }/videos/1505703840833FO9KSL.mp4' width="700px" height="393px" frameborder="0" scrolling="No"></iframe>
		</div>

		<!-- 播放器 -->
	</div>
	<!-- 美化滚动条js -->
	<script type="text/javascript">
		var video_list_lenght=$("ul.video_list li").length;
		$("ul.video_list").css("width",$("ul.video_list li").width()*video_list_lenght-7);// 减去margin-right的7px长度
		$(".video_list_area").niceScroll({  
			cursorcolor:" #c12e2e",  //#FF6666滚动条光标颜色
			cursoropacitymax:1,      //改变不透明度，光标处于活动状态（scrollabar“可见”状态），范围从1到0
			touchbehavior:false,     //使光标拖动滚动像在台式电脑触摸设备
			autohidemode:false,      //是否隐藏滚动条
			cursorwidth:"10px",      //像素光标的宽度
			cursorborder:"0",        //游标边框css定义
			cursorborderradius:"0px" //以像素为光标边界半径 
		}); 
	</script>
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>