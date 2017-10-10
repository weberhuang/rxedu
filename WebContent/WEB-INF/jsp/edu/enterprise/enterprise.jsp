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

	<div id="enterprise_tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:$.ad.toAdd('enterprise_w',I18N.enterprise,'enterprise_add','${ctx }/enterprise/add');" class="easyui-linkbutton easyui-tooltip" 
				iconCls="icon-add" plain="true"> <s:message code='comm.add' /> </a> 
			<a href="javascript:$.ad.toUpdate('enterprise_grid','enterprise_w',I18N.user,'enterprise_add','${ctx }/enterprise/update')"
				class="easyui-linkbutton easyui-tooltip"  iconCls="icon-edit" plain="true">  <s:message code='comm.update' /> </a>
			<a href="javascript:$.ad.doDelete('enterprise_grid','${ctx }/enterprise/remove')" class="easyui-linkbutton easyui-tooltip" iconCls="icon-remove"
				plain="true">  <s:message code='comm.remove' /> </a>
		</div>
		<div>
		<form id="enterprise_query_form">
				企业简称:
				  <input class="easyui-textbox" style="width: 100px"
					name="enterpriseNameShort_like_string">
				注册地址:
			      <input class="easyui-textbox" style="width: 100px"
					name="registeredAddress_like_string">
					
				  <a href="javascript:$.ad.gridQuery('enterprise_query_form','enterprise_grid')"
					class="easyui-linkbutton" iconCls="icon-search"><s:message
						code="comm.query" />
			      </a>
			      <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('enterprise_query_form')"
						style="width: 80px"><s:message code="comm.clear" /></a>
			     <input type="hidden" name="valid" id="valid"  value ='1'/>
			     
			</form>
		</div>
	</div>

	<table class="easyui-datagrid" id="enterprise_grid" style="width: 1020px;"
		data-options="rownumbers:true,singleSelect:false,pagination:true,multiSort:true,selectOnCheck:true,
				url:'${ctx }/enterprise/list',method:'post',toolbar:'#enterprise_tb'">
		<thead>
		<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'enterpriseNameShort',width:120,sortable:'true'"><font>企业简称</font></th>
				<th data-options="field:'enterpriseNameFull',width:180,sortable:'true'"><font>企业全称 </font></th>
				<th data-options="field:'scale',width:120,sortable:'true'"><font>企业规模</font></th>
				<th data-options="field:'registeredAddress',width:150,sortable:'true'"><font>注册地址</font></th>
				<th data-options="field:'legalPerson',width:120,sortable:'true'"><font>企业法人</font></th>	
				<th data-options="field:'registeredCapital',width:120,sortable:'true'"><font>注册资本</font></th>	
			</tr>
		</thead>
	</table>

	
	<div id="enterprise_w" class="easyui-window" title='<s:message code="user.add" />'
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false"
		style="width: 400px; height: 400px; padding: 10px;">
		<div class="content">
				<form id="enterprise_add" method="post" action="${ctx }/enterprise/add">
			
					<div style="margin-bottom: 20px">
						<input class="easyui-textbox" name="enterpriseNameShort" style="width: 100%"
						    data-options="label:'<font>企业简称</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 20px">
						<input class="easyui-textbox" name="enterpriseNameFull" style="width: 100%"
							data-options="label:'<font>企业全称</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 20px">
						<input class="easyui-textbox" name="scale" style="width: 100%"
							data-options="label:'<font>企业规模</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 20px">
						<input class="easyui-textbox" name="registeredAddress" style="width: 100%"
							data-options="label:'<font>注册地址</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 20px">
						<input class="easyui-textbox" name="legalPerson" style="width: 100%"
							data-options="label:'<font>企业法人</font>:',required:true,validType:'maxLength[40]'">
					</div>
					<div style="margin-bottom: 20px">
						<input class="easyui-textbox" name="registeredCapital" style="width: 100%"
							data-options="label:'<font>注册资本</font>:',required:true,validType:'maxLength[40]'">
					</div>
                  
                    <input type="hidden" name="id" />
                    <input type="hidden" name="version" />
				</form>
				<div style="text-align: center; padding: 5px 0">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="$.ad.submitForm('enterprise_add','enterprise_grid','enterprise_w')" style="width: 80px">
						<s:message code="comm.submit" /></a> 
					<a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('enterprise_add')"
						style="width: 80px"><s:message code="comm.clear" /></a>
				</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>