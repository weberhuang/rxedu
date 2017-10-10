<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>

		<script type="text/javascript">
		
	 	function openTopWindow(url, title, width, height) {
	 		  title = title == undefined ? ' ' : title;
	 		  width = width == undefined ? 800 : width;
	 		  height = height == undefined ? 300 : height;
	 		  if (url != undefined) {
	 		    var content = '<iframe name="eui-open-page" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:100%;"></iframe>';
	 		    parent.$('#openWindow').window({
	 		      title: '考试后台管理',
	 		      width: '100%',
	 		      height: '100%',
	 		      content: content,
	 		      modal: true,
	 		      animate: true,
	 		      minimizable: false
	 		    });
	 		  }
	 		}
		 	$(function() {
	 	  
 				openTopWindow('${credential}');
 	});
</script>
</head>
	<body>
	</body>
</html