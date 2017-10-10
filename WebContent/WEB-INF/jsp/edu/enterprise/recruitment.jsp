<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>
<link rel="stylesheet" href="${ctx }/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${ctx }/js/kindeditor/plugins/code/prettify.css" />
<script language="javascript" type="text/javascript" src="${ctx }/js/kindeditor/kindeditor-all-min.js"></script>
<script language="javascript" type="text/javascript" src="${ctx }/js/kindeditor/easyui-kindeditor.js"></script>
<script charset="utf-8" src="${ctx }/js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
	//简单模式初始化
	var editor;
	KindEditor.ready(function(K) {
		    editor = K.create('textarea[name="projectDesc",name="post",name= "selfEvaluation",name="skills"]', {
		        resizeType : 1,
		        allowPreviewEmoticons : false,
		        allowImageUpload : false,
		        items : [
		            'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
		            'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
		            'insertunorderedlist'],
		        //下面这行代码就是关键的所在，当失去焦点时执行 this.sync();
		        afterBlur: function(){this.sync();}
		    });
		    prettyPrint();
		
		});
	
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>
	
	
	<div id="recruitment_tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:$.ad.toAdd('recruitment_w',I18N.recruitment,'recruitment_add','${ctx }/recruitment/add');" class="easyui-linkbutton easyui-tooltip" 
				iconCls="icon-add" plain="true"> <s:message code='comm.add' /> </a> 
			<a href="javascript:$.ad.toUpdate('recruitment_grid','recruitment_w','招聘信息','recruitment_add','${ctx }/recruitment/update')"
				class="easyui-linkbutton easyui-tooltip"  iconCls="icon-edit" plain="true"> <s:message code='comm.update' /> </a>
			<a href="javascript:$.ad.doDelete('recruitment_grid','${ctx }/recruitment/remove')" class="easyui-linkbutton easyui-tooltip"  iconCls="icon-remove"
				plain="true"> <s:message code='comm.remove' />  </a>
		</div>
		<div>
		<form id="recruitment_query_form">
				
				招聘岗位: 
				     <input class="easyui-textbox" style="width: 100px"
					name="hiringJob_like_string">
			         工作地点: 
			         <input class="easyui-textbox" style="width: 100px"
					name="workingPlace_like_string">
					  <a
					href="javascript:$.ad.gridQuery('recruitment_query_form','recruitment_grid')"
					class="easyui-linkbutton" iconCls="icon-search"><s:message
						code="comm.query" />
			      </a>
			      <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('recruitment_query_form')"
						style="width: 80px"><s:message code="comm.clear" /></a>
			     <input type="hidden" name="valid" id="valid"  value ='1'/>
			     
			</form>
		</div>
	</div>

	<table class="easyui-datagrid" id="recruitment_grid" style="width: 1020px;"
		data-options="rownumbers:true,singleSelect:false,pagination:true,multiSort:true,selectOnCheck:true,
				url:'${ctx }/recruitment/list',method:'post',toolbar:'#recruitment_tb'">
		<thead>
		<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'hiringJob',width:120,sortable:'true'"><font>招聘岗位</font></th>
				<th data-options="field:'hiringNumber',width:60,sortable:'true'"><font>招聘人数 </font></th>
				<th data-options="field:'companyName',width:120,sortable:'true'"><font>公司名称</font></th>
				<th data-options="field:'recruitingDirector',width:120,sortable:'true'"><font>招聘负责人</font></th>
				<th data-options="field:'postRequirements',width:180,sortable:'true'"><font>岗位要求</font></th>
				<th data-options="field:'wages',width:60,sortable:'true'"><font>工资待遇</font></th>
				<th data-options="field:'workExperience',width:80,sortable:'true'"><font>工作经验</font></th>
				<th data-options="field:'workingPlace',width:100,sortable:'true'"><font>工作地点</font></th>
				<th data-options="field:'businessTrip',width:110,sortable:'true'"><font>是否出差</font></th>	
			</tr>
		</thead>
	</table>
	<script type="text/javascript">

	</script>
	
	<div id="recruitment_w" class="easyui-window" title='招聘信息详情'
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false"
		style="width: 45%; height:500px; padding: 10px;">
		<div class="content">
				<form id="recruitment_add" method="post" action="${ctx }/recruitment/add">
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="hiringJob" style="width: 400px"
						    data-options="label:'<font>招聘岗位</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="hiringNumber" style="width: 400px"
							data-options="label:'<font>招聘人数 </font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="companyName" style="width: 400px"
							data-options="label:'<font>公司名称</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="recruitingDirector" style="width: 400px"
							data-options="label:'<font>招聘负责人</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="wages" style="width: 400px"
							data-options="label:'<font>工资待遇</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="workExperience" style="width: 400px"
							data-options="label:'<font>工作经验</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="workingPlace" style="width: 400px"
							data-options="label:'<font>工作地点</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="businessTrip" style="width: 400px"
							data-options="label:'<font>是否出差</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 5px">
						<input class="easyui-textbox" name="postRequirements" style="width: 400px"
							data-options="label:'<font>岗位要求</font>:',required:true,validType:'maxLength[40]',multiline:true">
					</div>
                  
                    <input type="hidden" name="id" />
                    <input type="hidden" name="version" />
				</form>
				<div style="text-align: center; padding: 5px 0">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="$.ad.submitForm('recruitment_add','recruitment_grid','recruitment_w')" style="width: 80px">
						<s:message code="comm.submit" /></a> 
					<a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('recruitment_add')"
						style="width: 80px"><s:message code="comm.clear" /></a>
				</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>