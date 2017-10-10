<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/jsp/frame/comm_css_js.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${ctx }/js/kindeditor/plugins/code/prettify.css" />
<script language="javascript" type="text/javascript" src="${ctx }/js/kindeditor/kindeditor-all-min.js"></script>
<script language="javascript" type="text/javascript" src="${ctx }/js/kindeditor/easyui-kindeditor.js"></script>
<script charset="utf-8" src="${ctx }/js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
//简单模式初始化
	var editor;
	KindEditor.ready(function(K) {
	
	    editor = K.create('textarea[name="contentRemark",name="nextLearningGoal",name= "suggestions",name="remark"]', {
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
	
	function toUpdateW(gridId,wid,wTitle,formId,url,addAttr){
    	
    	//清除缓存记录
   		KindEditor.html(contentRemark,"");
		KindEditor.html(nextLearningGoal,"");
		KindEditor.html(suggestions,"");
		KindEditor.html(remark,"");
		
		var selRows = $("#" + gridId).datagrid("getSelections");
		if(selRows.length != 1){
			$.sm.alert(I18N.alert_select_one);
			return;
		}
		var fdata = selRows[0];
		if(addAttr){
			for(var key in addAttr){
				fdata[key] = fdata[addAttr[key]];
			}
		}
		$('#' + formId).form('load',fdata);
		
		if(url){
			$('#' + formId).form({url:url});
		}
		//初始化元素值
		KindEditor.insertHtml(contentRemark,fdata.contentRemark);
		KindEditor.insertHtml(nextLearningGoal,fdata.nextLearningGoal);
		KindEditor.insertHtml(suggestions,fdata.suggestions);
		KindEditor.insertHtml(remark,fdata.remark);
		
		$("#" + wid).window({title:I18N.update + wTitle});
		$("#" + wid).window("open");		
	}
	
	   var report = {
     			createUsers:null,
     			createUserFormatter:function(value){
    				if(!report.createUsers){
    					report.createUsers = $('#createUser').combobox("getData");
    				}
    				return $.ad.getName(value,report.createUsers);
    			}				
    	};


</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>
	
	
	<div id="report_tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
				<a href="javascript:toUpdateW('report_grid','report_w',I18N.user,'report_add','${ctx }/report/update')"
				class="easyui-linkbutton easyui-tooltip"  iconCls="icon-edit" plain="true">查看详情</a>
		</div>
		<div>
		<form id="report_query_form">
				创建人
				: <input class="easyui-textbox" style="width: 100px"
					name="createUser_like_string" >
				  <a
					href="javascript:$.ad.gridQuery('report_query_form','report_grid')"
					class="easyui-linkbutton" iconCls="icon-search"><s:message
						code="comm.query" />
			      </a>
			      <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('report_query_form')"
						style="width: 80px"><s:message code="comm.clear" /></a>
			     <input type="hidden" name="valid" id="valid"  value ='1'/>
			     
			</form>
		</div>
	</div>

	<table class="easyui-datagrid" id="report_grid" style="width: 1020px;"
		data-options="rownumbers:true,singleSelect:false,pagination:true,multiSort:true,selectOnCheck:true,
				url:'${ctx }/report/list',method:'post',toolbar:'#report_tb'">
		<thead>
		<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'createUser',width:120,sortable:'true',formatter:report.createUserFormatter"><font>创建人</font></th>
				<th data-options="field:'title',width:120,sortable:'true'"><font>周报标题</font></th>
				<th data-options="field:'contentRemark',width:120,sortable:'true'"><font>学习内容记录 </font></th>
				<th data-options="field:'nextLearningGoal',width:120,sortable:'true'"><font>下步学习目标</font></th>
				<th data-options="field:'suggestions',width:120,sortable:'true'"><font>感想与建议</font></th>
				<th data-options="field:'remark',width:120,sortable:'true'"><font>备注</font></th>	
			</tr>
		</thead>
	</table>
	<script type="text/javascript">

	</script>
	
	<div id="report_w" class="easyui-window" title='<s:message code="user.add" />'
		data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false"
		style="width: 820px; height: 500px; padding: 10px;">
		<div class="content">
				<form id="report_add" method="post" action="${ctx }/report/add">
					<div style="margin-bottom: 20px">
						周报标题： <input class="easyui-textbox" name="title" style="width: 450px"
						data-options="required:true,validType:'maxLength[200]',multiline:false">
						创建人：
						<input class="easyui-combobox" name="createUser" id="createUser" readonly="true"
						style="width: 100px"
						data-options="
		                    url:'${ctx }/user/find?type=s',
		                    method:'get',
		                    valueField:'id',
		                    textField:'name',
		                    panelHeight:'auto',
	                    	multiple:true">
					</div>
					<div style="margin-bottom: 20px">
	                 	<h4>学习内容记录：</h4><textarea class="easyui-kindeditor" id="contentRemark"  name = "contentRemark"  rows="12" style="width:100%; height:70%px;"></textarea>
					</div>				
				    <div style="margin-bottom: 20px">
	                 	<h4>下步学习目标：</h4><textarea class="easyui-kindeditor" id= "nextLearningGoal" name="nextLearningGoal" rows="12" style="width:100%; height:70%px;"></textarea>
					</div>								
				   <div style="margin-bottom: 20px">
	                   <h4>感想与建议：</h4><textarea class="easyui-kindeditor"  id= "suggestions"  name="suggestions"  rows="12" style="width:100%; height:70%px;"></textarea>
					</div>								
					<div style="margin-bottom: 20px">
	                  <h4>备注：</h4><textarea class="easyui-kindeditor"  id= "remark"  name="remark"  rows="8" style="width:100%; height:70%px;"></textarea>
					</div>                 
                  
                    <input type="hidden" name="id" />
                    <input type="hidden" name="version" />
				</form>
				<div style="text-align: center; padding: 5px 0">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="$.ad.submitForm('report_add','report_grid','report_w')" style="width: 80px">
						<s:message code="comm.submit" /></a> 
					<a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('report_add')"
						style="width: 80px"><s:message code="comm.clear" /></a>
				</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>