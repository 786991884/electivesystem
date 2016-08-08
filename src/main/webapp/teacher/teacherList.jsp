<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师列表页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<link id="themeLink" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function() {
	$("#ckSelectAll").click(function() {
		$("input[name=uid][type=checkbox]").each(function() {
			$(this).prop("checked", $("#ckSelectAll").prop("checked"));
		});
	});
	
    

	$("#linkTeacherDel").click(function(event) {
		if (!confirm("真的确定要删除？？？？")) {
			event.preventDefault();
			event.stopPropagation();
		}
	});
	// //////////
	// 对当前页修改显示
	$("a[onclick='changePage(${currentPage})']").parent().addClass("active");

	// 跳转
	$("#tiaoye").click(function() {
		if(parseInt($("#tiaozhuang").val())<=parseInt($("#tiaozhuang").attr("max"))){
		    changePage($("#tiaozhuang").val());
		}
		return;
	});

	$("#btn_clear").click(function() {
		$(':input', '#search').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
	});
	//批量删除
	$(".glyphicon-trash").click(function() {
		var valArr = new Array;
		$("input[name=uid][type=checkbox]").each(function(i) {
			if ($(this).prop("checked")) {
				valArr.push($(this).attr("value"));
			}
		});
		var vals = valArr.join(',');//转换为逗号隔开的字符串 
		console.log(vals);
		if (vals.length<=0) {
			alert("请至少选择一条记录进行删除！");
		}else{
			if (!confirm("真的确定要删除？？？？")) {
				event.preventDefault();
				event.stopPropagation();
			}else{
				//删除操作
				$.post("${pageContext.request.contextPath}/admin/teachersDel.action",{
					ids:vals
				},function(data){
					window.location.href="${pageContext.request.contextPath}/admin/teacherList.action";
				});
			}
		}
	});
});
function changePage(pageNo) {
	$("#hidderPagNo").val(pageNo);
	$("#search").submit();
};
</script>

</head>
<body>
	<form class="form-inline well-sm" id="search" action="${pageContext.request.contextPath}/admin/teacherList.action" method="post">
		<div class="form-group">
			<label for="uname">名字</label> <input type="text" class="form-control" value="${name}" name="name" id="uname" placeholder="姓名">
		</div>
		<input type="hidden" name="currentPage" id="hidderPagNo" value="1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="submit" class="form-control">
			<i class="glyphicon glyphicon-search"></i>
		</button>
		<button type="button" id="btn_clear" class="form-control">
			<i class="glyphicon glyphicon-remove-circle"></i>
		</button>
	</form>

	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th><input type="checkbox" id="ckSelectAll"></th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>入职日期</th>
				<th>电话</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<s:iterator value="#request.pageBean.recordList" var="teacher" status="rowstatus">
				<s:if test="#rowstatus.odd == true">
					<tr class="success">
						<td><input type="checkbox" value='<s:property value="#teacher.id"/>' name="uid"></td>
						<td><s:property value="#teacher.name" /></td>
						<td><s:property value="#teacher.sex" /></td>
						<td><s:property value="#teacher.birthday" /></td>
						<td><s:property value="#teacher.arrivedate" /></td>
						<td><s:property value="#teacher.telephone" /></td>
						<td><s:property value="#teacher.memo" /></td>
						<td><s:url var="teacherDelLink" action="teacherDel" namespace="/admin">
								<s:param name="id" value="#teacher.id"></s:param>
							</s:url> <s:url var="teacherViewLink" action="teacherView" namespace="/admin">
								<s:param name="id" value="#teacher.id"></s:param>
							</s:url> <s:url var="teacherEditLink" action="toTeacherEdit" namespace="/admin">
								<s:param name="id" value="#teacher.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="编辑" class="glyphicon glyphicon-edit" href="${teacherEditLink}" id='<s:property value="#teacher.id"/>'> </a> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${teacherViewLink}" target="mainContent" id='<s:property value="#teacher.id"/>'></a> &nbsp;&nbsp; <a id="linkTeacherDel" title="删除" href="${teacherDelLink}" target="mainContent"> <i
								class="glyphicon glyphicon-remove"></i></a></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td><input type="checkbox" value='<s:property value="#teacher.id"/>' name="uid"></td>
						<td><s:property value="#teacher.name" /></td>
						<td><s:property value="#teacher.sex" /></td>
						<td><s:property value="#teacher.birthday" /></td>
						<td><s:property value="#teacher.arrivedate" /></td>
						<td><s:property value="#teacher.telephone" /></td>
						<td><s:property value="#teacher.memo" /></td>
						<td><s:url var="teacherDelLink" action="teacherDel" namespace="/admin">
								<s:param name="id" value="#teacher.id"></s:param>
							</s:url> <s:url var="teacherViewLink" action="teacherView" namespace="/admin">
								<s:param name="id" value="#teacher.id"></s:param>
							</s:url> <s:url var="teacherEditLink" action="toTeacherEdit" namespace="/admin">
								<s:param name="id" value="#teacher.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="编辑" class="glyphicon glyphicon-edit" href="${teacherEditLink}" id='<s:property value="#teacher.id"/>'> </a> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${teacherViewLink}" target="mainContent" id='<s:property value="#teacher.id"/>'></a> &nbsp;&nbsp; <a id="linkTeacherDel" title="删除" href="${teacherDelLink}" target="mainContent"> <i
								class="glyphicon glyphicon-remove"></i></a></td>
					</tr>
				</s:else>
			</s:iterator>
			<td><a title="删除选中的行" class="glyphicon glyphicon-trash" href="javascript:void(0)" id=''></a>&nbsp;&nbsp;&nbsp;&nbsp; <s:url var="toTeacherAdd" action="toTeacherAdd" namespace="/admin"></s:url> <a title="增加一条数据" class="glyphicon glyphicon-plus" href="${toTeacherAdd}" id=''></a></td>
			<td colspan="7">页次：${requestScope.pageBean.currentPage}/${requestScope.pageBean.pageCount}页 &nbsp; 每页显示：${requestScope.pageBean.pageSize }条 &nbsp; 总记录数：${requestScope.pageBean.recordCount }条</td>
		</tbody>
	</table>

	<ul class="pagination">
		<!--首页-->
		<s:if test="#request.pageBean.currentPage>1">
			<li><a href="javascript:void(0)" onclick="changePage(1)">首页</a></li>
		</s:if>
		<s:if test="#request.pageBean.currentPage>1">
			<li><a href="javascript:void(0)" onclick="changePage(${currentPage-1})">上一页</a></li>
		</s:if>
		<s:iterator var="counter" begin="#request.pageBean.beginPageIndex" end="#request.pageBean.endPageIndex">
			<li><a href="javascript:void(0)" onclick="changePage(${counter})">${counter}</a></li>
		</s:iterator>
		<!-- 后一页 -->
		<s:if test="#request.pageBean.currentPage<#request.pageBean.pageCount">
			<li><a href="javascript:void(0)" onclick="changePage(${currentPage+1})">下一页</a></li>
		</s:if>
		<!-- 尾页 -->
		<s:if test="#request.pageBean.currentPage<#request.pageBean.pageCount">
			<li><a href="javascript:void(0)" onclick="changePage(${requestScope.pageBean.pageCount})">尾页</a></li>
		</s:if>
		<li><input type="number" min="1" max="${requestScope.pageBean.pageCount}" width="1px;" id="tiaozhuang"><a href="javascript:void(0)" id="tiaoye">跳转</a>
	</ul>
</body>
</html>