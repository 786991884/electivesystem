<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程列表页面</title>
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

	// 对当前页修改显示
	$("a[onclick='changePage(${currentPage})']").parent().addClass("active");

	// 跳转
	$("#tiaoye").click(function() {
		changePage($("#tiaozhuang").val());
	});

	$("#btn_clear").click(function() {
		$(':input', '#search').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
	});
});
function changePage(pageNo) {
	$("#hidderPagNo").val(pageNo);
	$("#search").submit();
};
</script>

</head>
<body>
	<form class="form-inline well-sm" id="search" action="${pageContext.request.contextPath}/admin/toSelCourse.action" method="post">
		<div class="form-group">
			<label for="uname">课程名</label> <input type="text" class="form-control" value="${name}" name="name" id="uname" placeholder="课程名">
		</div>

		<div class="form-group">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="credit">学分</label> <input id="credit" type="text" class="form-control" name="credit" value="<s:property value="credit"/>">
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
				<th>课程名</th>
				<th>上课时间</th>
				<th>上课地点</th>
				<th>课程学分</th>
				<th>课程人数</th>
				<th>所属老师</th>
				<th>已选人数</th>
				<th>备注</th>
				<th>选课操作</th>
			</tr>
		</thead>
		<tbody>

			<s:iterator value="#request.pageBean.recordList" var="course" status="rowstatus">
				<s:if test="#rowstatus.odd == true">
					<tr class="success">
						<td><s:property value="#course.name" /></td>
						<td><s:property value="#course.time" /></td>
						<td><s:property value="#course.place" /></td>
						<td><s:property value="#course.credit" /></td>
						<td><s:property value="#course.selnum" /></td>
						<td><s:property value="#course.teacher.name" /></td>
						<td>${course.studentCourseRs.size() }</td>
						<td><s:property value="#course.memo" /></td>
						<td><s:url var="courseViewLink" action="courseView" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> <s:url var="selCourseLink" action="selCourse" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${courseViewLink}" target="mainContent" id='<s:property value="#course.id"/>'></a> &nbsp;&nbsp; <s:if test="#course.selState==0">
								<a title="选择课程" class="glyphicon glyphicon-ok" href="${selCourseLink}" target="mainContent" id='<s:property value="#course.id"/>'></a>
							</s:if>
							<s:else>
							已选择该课程
							</s:else></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td><s:property value="#course.name" /></td>
						<td><s:property value="#course.time" /></td>
						<td><s:property value="#course.place" /></td>
						<td><s:property value="#course.credit" /></td>
						<td><s:property value="#course.selnum" /></td>
						<td><s:property value="#course.teacher.name" /></td>
						<td>${course.studentCourseRs.size() }</td>
						<td><s:property value="#course.memo" /></td>
						<td><s:url var="courseViewLink" action="courseView" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> <s:url var="selCourseLink" action="selCourse" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${courseViewLink}" target="mainContent" id='<s:property value="#course.id"/>'></a> &nbsp;&nbsp; <s:if test="#course.selState==0">
								<a title="选择课程" class="glyphicon glyphicon-ok" href="${selCourseLink}" target="mainContent" id='<s:property value="#course.id"/>'></a>
							</s:if>
							<s:else>
							已选择该课程
							</s:else></td>
					</tr>
				</s:else>
			</s:iterator>
			<td colspan="8">页次：${requestScope.pageBean.currentPage}/${requestScope.pageBean.pageCount}页 &nbsp; 每页显示：${requestScope.pageBean.pageSize }条 &nbsp; 总记录数：${requestScope.pageBean.recordCount }条</td>
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
		<li><input type="number" min="1" width="1px;" id="tiaozhuang"><a href="javascript:void(0)" id="tiaoye">跳转</a>
	</ul>
</body>
</html>