<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>
	<title>视频列表</title>
	<script src="${pageContext.request.contextPath}/static/mui/js/mui.min.js"></script>
	<script type="text/javascript">
	
  	 mui.init();
    </script>
   
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>
	<h3>
		视频列表
	</h3>
	<div id="report_tb" style="padding: 5px; height: auto">
		<div>
		<form id="video_query_form">
				
				         视频名称:
				 <input class="easyui-textbox" style="width: 100px"
					name="name_like_string">						
	            	课程名称:
				  <input class="easyui-textbox" style="width: 100px"
					name="name_like_string">
				  <a
					href="javascript:$.ad.gridQuery('video_query_form','video_grid')"
					class="easyui-linkbutton" iconCls="icon-search"><s:message
						code="comm.query" />
			      </a>
			     <input type="hidden" name="valid" id="valid"  value ='1'/>
			     
			</form>
		</div>
	</div>
		<c:forEach items="${videoList}" var="video" varStatus="status">
		<div>
		    <span class = "box1"> <img  height="200" width="200"  src="${pageContext.request.contextPath}/uploads/videoImg/${video.picurl}" alt="">  </span>
		    <span class = "box2"><a href="${pageContext.request.contextPath}/video/muivodetail.do?id=${video.id}"><p> 视频名称：${video.name} &nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 视频描述：${video.descr}</p></a></span>
		</div>
 	    </c:forEach>
 	    
 
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>