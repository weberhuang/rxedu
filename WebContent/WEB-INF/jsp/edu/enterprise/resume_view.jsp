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
	
	function toUpdateW(gridId,wid,wTitle,formId,url,addAttr){	
		//清除缓存记录
		KindEditor.html(projectDesc,"");
		KindEditor.html(post,"");
		KindEditor.html(selfEvaluation, "");
		KindEditor.html(skills,"");
		
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
			KindEditor.html(projectDesc,fdata.projectDesc);
    		KindEditor.html(post,fdata.post);
    		KindEditor.html(selfEvaluation, fdata.selfEvaluation);
    		KindEditor.html(skills,fdata.skills );
		
		$("#" + wid).window({title:I18N.update + wTitle});
		$("#" + wid).window("open");		
	}
	
	var resume = {
			majors:false,
			majorFormatter:function(value,row,index){
				if(!resume.majors){
					resume.majors = $('#learnMajor').combobox("getData");
				}
				return $.ad.getName(value,resume.majors,'id');
			},
			clazz:false,
			clazzFormatter:function(value,row,index){ 
				if(!resume.clazz){
					resume.clazz = $('#clazz').combobox("getData");
				}
				return $.ad.getName(value,resume.clazz);
			}
			
	};
	
	function submitOk(data) {
		var data = eval('(' + data + ')');
		$.sm.handleResult(data, function(data) {
		});
		$("#resume_w").panel("close");

	}
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>

	
	<div id="resume_tb" style="padding: 5px; height: auto;width:auto " >
		<div style="margin-bottom: 5px">
			<a href="javascript:toUpdateW('resume_grid','resume_w',I18N.user,'resume_add','${ctx }/resume/update')"
				class="easyui-linkbutton easyui-tooltip"  iconCls="icon-edit" plain="true">  <s:message code='comm.update' /></a>
			<a href="javascript:$.ad.doDelete('resume_grid','${ctx }/resume/remove')" class="easyui-linkbutton easyui-tooltip"  iconCls="icon-remove"
				plain="true"> <s:message code='comm.remove' /> </a>
		</div>
		<div>
		<form id="resume_query_form">
				<s:message code="p.name" />
				: <input class="easyui-textbox" style="width: 100px"
					name="name_like_string">
						
	                 <s:message code="clazz.major"/>:
						<input class="easyui-combobox" name="learnMajor_in_string" 
						style="width: 100px"
						data-options="
		                    url:'${ctx }/major/list?sort=ordno&order=asc',
		                    method:'get',
		                    valueField:'id',
		                    textField:'name',
		                    panelHeight:'auto',
	                    	multiple:true
	                    ">	
				  <a
					href="javascript:$.ad.gridQuery('resume_query_form','resume_grid')"
					class="easyui-linkbutton" iconCls="icon-search"><s:message
						code="comm.query" />
			      </a>
			       <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="$.ad.clearForm('resume_query_form')"
						style="width: 80px"><s:message code="comm.clear" /></a>
			     <input type="hidden" name="valid" id="valid"  value ='1'/>
			     
			</form>
		</div>
	</div>

	<table class="easyui-datagrid" id="resume_grid" style="width: 1020px;"
		data-options="rownumbers:true,singleSelect:false,pagination:true,multiSort:true,selectOnCheck:true,
				url:'${ctx }/resume/list',method:'post',toolbar:'#resume_tb'">
		<thead>
		<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',width:100,sortable:'true'"><font>姓名</font></th>
				<th data-options="field:'clazz',width:100,sortable:'true',formatter:resume.clazzFormatter"><s:message
						code="clazz" /></th>
				<th data-options="field:'learnMajor',width:100,sortable:'true',formatter:resume.majorFormatter"><s:message
						code="p.major" /></th>
				<th data-options="field:'phone',width:100,sortable:'true'"><font>手机号码</font></th>
				<th data-options="field:'address',width:100,sortable:'true'"><font>居住地</font></th>
				<th data-options="field:'education',width:100,sortable:'true'"><font>学历</font></th>
				<th data-options="field:'homePhone',width:100,sortable:'true'"><font>家庭联系电话</font></th>
				<th data-options="field:'startTime',width:100"><s:message code="student.startTime" /></th>
				<th data-options="field:'graduateTime',width:100"><s:message code="p.graduateTime" /></th>			

			</tr>
		</thead>
	</table>
	<script type="text/javascript">

	</script>
	
		<div id="resume_w" class="easyui-window" title='<s:message code="user.add" />'
		data-options="modal:true,closed:true,minimizable:true,maximizable:true,collapsible:true"
		style="width: 90%; height: 600px; padding: 10px;">

				<form id="resume_add" method="post" action="${ctx }/resume/update">
				<h5>
					<s:message code="p.base" />:
				</h5>
				<table style="width: 100%; border: 1px solid #ccc;">
					<tr>
						<td><s:message code="p.name" />:</td>
						<td><input class="easyui-textbox" name="name"
							style="width: 120px" value="${data.name }"
							data-options="required:true,
								validType:{length:[1,30]}">
						</td>

						<td><s:message code="p.sex" />:</td>
						<td><input class="easyui-combobox" name="sex" ,id= "sex"
							style="width: 120px"
							data-options="
				                    url:'${ctx }/dict/get?pvalue=sex',
				                    method:'get',
				                    valueField:'value',
				                    textField:'name',
				                    panelHeight:'auto',
				                    required:true
			                    ">
						</td>

						<td><s:message code="p.birthday" />:</td>
						<td><input class="easyui-datebox" name="birthday"
							style="width: 120px" data-options="required:true" value="${data.birthday}"></td>
					</tr>
					<tr>
						<td><s:message code="p.phone" />:</td>
						<td><input class="easyui-textbox" name="phone"
							style="width: 120px" value="${data.phone}"
							data-options="required:true,validType:'maxLength[30]'" ></td>

						<td>QQ:</td>
						<td><input class="easyui-textbox" name="qq"
							style="width: 120px" value="${data.qq}"
							data-options="required:true,validType:'maxLength[20]'"></td>

						<td>Email:</td>
						<td><input class="easyui-textbox" name="email" 
							style="width: 120px"  value="${data.email}"
							data-options="required:true,validType:['email','maxLength[30]']">
						</td>
					</tr>
					<tr>

						<td><s:message code="clazz" />:</td>
						<td><input class="easyui-combobox" name="clazz" id ="clazz"
							style="width: 120px" value="${data.clazz }"
							data-options="url:'${ctx }/clazz/registGet',
				                    method:'get',
				                    valueField:'id',
				                    textField:'name',
				                    required:true">
						</td>
						<td><s:message code="p.major" />:</td>
						<td><input class="easyui-combobox" name="learnMajor" id ="learnMajor"
							value="${data.learnMajor}" style="width: 120px;"
							data-options="
					                    url:'${ctx }/major/list?sort=ordno&order=asc',
					                    method:'get',
					                    valueField:'id',
					                    textField:'name',
					                    panelHeight:'auto',
					                    required:true
				                    ">
						</td>

						<td><s:message code="student.startTime" />:</td>
						<td><input class="easyui-datebox" name="startTime"
							style="width: 120px" value="${data.startTime}"
							data-options="required:true"></td>

					</tr>
					<tr>
						<td><s:message code="p.address" />:</td>
						<td colspan="3"><input class="easyui-textbox" name="address"
							style="width: 300px"  value="${data.address}"
							data-options="required:true,validType:'maxLength[50]'"></td>
						<td><s:message code="p.secondContact" />:</td>
						<td><input class="easyui-textbox" name=secondContact
							style="width: 120px"    value="${data.secondContact}"
							data-options="required:true,validType:'maxLength[50]'"></td>
					</tr>
				</table>

				<!-- 学历信息 -->
				<h5>
					<s:message code="p.eduInfo" />
					:
				</h5>
				<table style="width: 100%; border: 1px solid #ccc;">
					<tr>
						<td><s:message code="p.education" />:</td>
						<td><input class="easyui-combobox" name="education"
							style="width: 120px"
							data-options="
				                    url:'${ctx }/dict/get?pvalue=education',
				                    method:'get',
				                    valueField:'value',
				                    textField:'name',
				                    panelHeight:'auto',
				                    required:true
			                    ">
						</td>

						<td><s:message code="p.school" />:</td>
						<td><input class="easyui-textbox" name="school" value="${data.school}"
							style="width: 120px"
							data-options="required:true,validType:'maxLength[60]'"></td>

						<td><s:message code="p.major" />:</td>
						<td><input class="easyui-textbox" name="major"
							style="width: 120px" value="${data.major}"
							data-options="required:true,validType:'maxLength[30]'"></td>
						<td><s:message code="p.graduateTime" />:</td>
						<td><input class="easyui-datebox" name="graduateTime"  value="${data.graduateTime}"
							style="width: 120px" data-options="required:true"></td>
					</tr>
				</table>

				<!-- 求职意向 -->
				<h5>求职意向</h5>
				<table style="width: 100%; border: 1px solid #ccc;">
					<tr>
						<td>期望薪资:</td>
						<td><input class="easyui-textbox" name="parent"
							style="width: 140px"  value="${data.expectedSalary}"
							data-options="required:true,
								validType:'maxLength[40]'">
						</td>
						<td>地点:</td>
						<td><input class="easyui-textbox" name="homePhone"
							style="width: 140px"  value="${data.workplace}"
							data-options="required:true,
								validType:'maxLength[40]'">
						</td>

					</tr>
					<tr>
						<td>职能:</td>
						<td><input class="easyui-textbox" name="home"
							style="width: 300px"  value="${data.post}"
							data-options="required:true,
								validType:'maxLength[80]'">
						</td>
						<td>行业:</td>
						<td><input class="easyui-textbox" name="industry"
							style="width: 300px"  value="${data.industry}"
							data-options="required:true,
								validType:'maxLength[80]'">
						</td>
					</tr>
				  <tr>
					  <td>到岗时间:</td>
					   	<td><input class="easyui-datebox" name="arrivalTime"
							style="width: 120px" value="${data.startTime}"
							data-options="required:true"></td>
				       <td>工作类型:</td>
						<td><input class="easyui-textbox" name="workType"
							style="width: 300px"  value="${data.workType}">
					   </td>
				  </tr>			
				</table>
				<!--技能特长 -->
				<h5>
					技能特长 （包括IT技能、语言能力、证书、成绩、培训经历、社会经历等）
				</h5>
				<table style="width: 100%; border: 1px solid #ccc;">
				  <tr>
				  	<td>						
						<textarea class="easyui-kindeditor" id="skills"  name = "skills"  rows="12" style="width:100%; height:70%px;"></textarea>
				    </td>
				  </tr>					
		        </table>
				<!-- 自我评价 -->
				<h5>
					自我评价:
				</h5>
				<table style="width: 100%; border: 1px solid #ccc;">
				  <tr>
				  	<td>						
					    <textarea class="easyui-kindeditor" id="selfEvaluation"  name = "selfEvaluation"  rows="12" style="width:100%; height:70%px;"></textarea>				
				    </td>
				  </tr>				
		        </table>
		        
		        <!-- 项目经验 -->
				<h5>
					项目经验:
				</h5>
				<table style="width: 100%; border: 1px solid #ccc;">
				   <tr>
					  <td>开始时间:</td>
					   	<td><input class="easyui-datebox" name="arrivalTime"
							style="width: 120px" value="${data.arrivalTime}"</td>				   
				       <td>结束时间:</td>
					  <td><input class="easyui-datebox" name="arrivalTime"
							style="width: 120px" value="${data.arrivalTime}"</td>					   
				  </tr>		
				  <tr>
					  <td>项目名称:</td>
						<td><input class="easyui-textbox" name="projectName"
							style="width: 300px"
							data-options="
								validType:'maxLength[80]'">
					   </td>
				  </tr>		
		        </table>
		        <!-- 项目描述 -->				
				项目描述:			
				<table style="width: 100%; border: 1px solid #ccc;">
				  <tr>
				  	<td>						
					    <textarea class="easyui-kindeditor" id="projectDesc"  name = "projectDesc"  rows="12" style="width:100%; height:70%px;"></textarea>				
				    </td>
				  </tr>				
		        </table>
		        
		       <!-- 岗位职能 -->
				岗位职能:
				<table style="width: 100%; border: 1px solid #ccc;">
				  <tr>
				  	<td>						
						<textarea class="easyui-kindeditor" id="post"  name = "post"  rows="12" style="width:100%; height:70%px;"></textarea>									
				    </td>
				  </tr>				
		        </table>
		        
				
				<input type="hidden" name="id" value="${data.id }" /> <input
					type="hidden" name="version" value="${data.version }" />
				<c:if test="${not empty personInfo}">
					<input type="hidden" name="status" />
				</c:if>
			</form>
			<div style="text-align: center; padding: 5px 0">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="$.ad.submitForm('resume_add',null,null,submitOk)"
					style="width: 80px"> <s:message code="comm.submit" /></a>
			</div>
		</div>
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>