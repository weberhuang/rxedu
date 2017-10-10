<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
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
<c:choose>
	<c:when test="${not empty resumeInfo }">
		<script type="text/javascript">
			function submitOk(data) {
				var data = eval('(' + data + ')');
				$.sm.handleResult(data, function(data) {
				});
			}
			$(function() {
				var data = ${resumeData	};
				$('#resume_add').form('load', data);
				//初始化KindEditor的值
	       		KindEditor.html(projectDesc,data.projectDesc);
	    		KindEditor.html(post,data.post);
	    		KindEditor.html(selfEvaluation, data.selfEvaluation);
	    		KindEditor.html(skills,data.skills );
			});
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			function submitOk(data) {
				$("#resume_w").panel("close");
			}
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/frame/header.jsp"%>

	<c:if test="${not empty data.sex }">
		<h3>
			<s:message code="student.tip.audit" />
		</h3>
	</c:if>
	<c:if test="${empty data.sex }">
		<c:choose>
			<c:when test="${not empty resumeInfo }">
				<h3>
					简历信息
				</h3>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
		<div id="resume_w" class="easyui-panel"
			style="width: 1050px; height: 600px; padding: 10px;">

			<form id="resume_add" method="post" action="${ctx }/resume/add">
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
						<td><input class="easyui-combobox" name="sex"
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
						<td><input class="easyui-combobox" name="clazz"
							style="width: 120px" value="${data.clazz }"
							data-options="url:'${ctx }/clazz/registGet',
				                    method:'get',
				                    valueField:'id',
				                    textField:'name',
				                    required:true">
						</td>
						<td><s:message code="p.major" />:</td>
						<td><input class="easyui-combobox" name="learnMajor"
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
					   	<td><input class="easyui-datebox" name="startTime"
							style="width: 120px" value="${data.projectStartTime}"</td>				   
				       <td>结束时间:</td>
					  <td><input class="easyui-datebox" name="arrivalTime"
							style="width: 120px" value="${data.projectFinishTime}"</td>					   
				  </tr>		
				  <tr>
					  <td>项目名称:</td>
						<td><input class="easyui-textbox"  name= "projectName" value="${data.projectName}"
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
					    <textarea class="easyui-kindeditor"   name = "projectDesc" value= "${data.projectDesc}"  rows="12" style="width:100%; height:70%px;"></textarea>				
				    </td>
				  </tr>				
		        </table>
		        
		       <!-- 岗位职能 -->
				岗位职能:
				<table style="width: 100%; border: 1px solid #ccc;">
				  <tr>
				  	<td>						
						<textarea class="easyui-kindeditor"   name = "responsibilities"  value= "${data.responsibilities}" rows="12"   style="width:100%; height:70%px;"></textarea>									
				    </td>
				  </tr>				
		        </table>
		  		<input type="hidden" name="resumeId" value="${data.id }" /> 
		  			
				<input type="hidden" name="id" value="${data.id }" /> 
				<input type="hidden" name="version" value="${data.version }" />
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
	</c:if>
	<%@ include file="/WEB-INF/jsp/frame/footer.jsp"%>
</body>
</html>