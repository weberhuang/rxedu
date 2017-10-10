<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>
	<h3>视频列表</h3>

	<div id="coursevideo_tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:$.ad.toAdd('coursevideo_w',I18N.coursevideo,'coursevideo_add','${ctx }/video/add');"
				class="easyui-linkbutton easyui-tooltip" iconCls="icon-add"
				plain="true"> <s:message code='comm.add' /></a>
			<a href="javascript:$.ad.toUpdate('enterprise_grid','enterprise_w',I18N.user,'enterprise_add','${ctx }/enterprise/update')"
				class="easyui-linkbutton easyui-tooltip"  iconCls="icon-edit" plain="true">  <s:message code='comm.update' /> </a>	
			 <a href="javascript:$.ad.doDelete('coursevideo_grid','${ctx }/video/remove')"
				class="easyui-linkbutton easyui-tooltip" iconCls="icon-remove" plain="true"> <s:message code='comm.remove' />
			</a>
		</div>
		<div>
			<form id="coursevideo_query_form">
				
				视频名称: <input class="easyui-textbox" style="width: 100px"
					name="name_like_string">

				<a
					href="javascript:$.ad.gridQuery('coursevideo_query_form','coursevideo_grid')"
					class="easyui-linkbutton" iconCls="icon-search"><s:message
						code="comm.query" /> </a>
				 <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('coursevideo_query_form')"
						style="width: 80px"><s:message code="comm.clear" /></a> 
			    <input type="hidden" name="valid" id="valid" value='1' />

			</form>
		</div>
	</div>

	<table class="easyui-datagrid" id="coursevideo_grid"
		style="width: 1020px;"
		data-options="rownumbers:true,singleSelect:false,pagination:true,multiSort:true,selectOnCheck:true,
				url:'${ctx }/video/list',method:'post',toolbar:'#coursevideo_tb'">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',width:150,sortable:'true'"><font>视频名称</font></th>
				<th data-options="field:'descr',width:200,sortable:'true'"><font>视频描述 </font></th>
				<th data-options="field:'picurl',width:200,sortable:'true'"><font>封面图片 </font></th>
				<th data-options="field:'videourl',width:200,sortable:'true'"><font>视频名称</font></th>
				<th data-options="field:'createTime',width:200,sortable:'true'"><font>创建时间</font></th>

			</tr>
		</thead>
	</table>
	<script type="text/javascript">
		
	</script>


	<div id="coursevideo_w" class="easyui-window"
		title='<s:message code="user.add" />'
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false"
		style="width: 400px; height: 400px; padding: 10px;">
		<div class="content">
			<form id="coursevideo_add" method="post"
				enctype="multipart/form-data" action="${ctx }/video/add">

				<div style="margin-bottom: 20px">
						   <input class="easyui-textbox" name="name" style="width: 300px"
						   data-options="label:'<font>视频标题</font>:',required:true,validType:'maxLength[100]'">
				</div>
				<div style="margin-bottom: 20px">
							<input class="easyui-textbox" name="descr" style="width: 300px"
						    data-options="label:'<font>视频描述</font>:',required:true,validType:'maxLength[100]',multiline:true">
				</div>
				<div style="margin-bottom: 20px">
					视频封页图： <input type="file" name="picurl" class="easyui-validatebox" />
				</div>
				<div style="margin-bottom: 20px">
					      视频上传： <input type="file" name="videourl" class="easyui-validatebox" />
				</div>

				<input type="hidden" name="id" /> <input type="hidden"
					name="version" />
			</form>
			<div style="text-align: center; padding: 5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$.ad.submitForm('coursevideo_add','coursevideo_grid','coursevideo_w')"
					style="width: 80px"> <s:message code="comm.submit" /></a> <a
					href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$.ad.clearForm('coursevideo_add')" style="width: 80px"><s:message
						code="comm.clear" /></a>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>