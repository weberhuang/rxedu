<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>
	<title>视频列表</title>
	<script src="${pageContext.request.contextPath}/static/mui/js/mui.min.js"></script>
	<link href="${pageContext.request.contextPath}/static/mui/css/mui.min.css" rel="stylesheet"/>
	<script type="text/javascript">
	
  	 mui.init();
    </script>
    <style>
	 .video-container2{
	            width: 950px;
	            height: 520px;
	             border: solid;
	        }
	        .video2{
	            width: 100%;
	            height: 100%;
	            -webkit-background-size:cover;
	            -moz-background-size:cover;
	            -o-background-size:cover;
	            background-size:cover; 
	            z-index:999; 
	        }
</style>
</head>
<body>
	<h3>
		视频学习
	</h3>
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">${video.name }</h1>
		</header>
		<div class="mui-content">
			<div class="video-container2" style="margin:0 auto;text-align: center;">
		        <video class="video2" src="${pageContext.request.contextPath}/uploads/video/${video.videourl }" 
		         poster="${pageContext.request.contextPath}/uploads/videoImg/${video.picurl }" controls>
		        </video>
		    </div>
		</div>
</body>
</html>