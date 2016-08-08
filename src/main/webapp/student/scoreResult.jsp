<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩列表页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<link id="themeLink" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
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

	<h1>成绩结果：</h1>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>课程名</th>
				<th>课程学分</th>
				<th>课程人数</th>
				<th>所属老师</th>
				<th>课程成绩</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="#request.scr" var="scr" status="rowstatus">
				<s:if test="#rowstatus.odd == true">
					<tr class="success">
						<td><s:property value="#scr.course.name" /></td>
						<td><s:property value="#scr.course.credit" /></td>
						<td><s:property value="#scr.course.selnum" /></td>
						<td><s:property value="#scr.course.teacher.name" /></td>
						<td><s:property value="#scr.score" /></td>
						<td><s:property value="#scr.course.memo" /></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td><s:property value="#scr.course.name" /></td>
						<td><s:property value="#scr.course.credit" /></td>
						<td><s:property value="#scr.course.selnum" /></td>
						<td><s:property value="#scr.course.teacher.name" /></td>
						<td><s:property value="#scr.score" /></td>
						<td><s:property value="#scr.course.memo" /></td>
					</tr>
				</s:else>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>