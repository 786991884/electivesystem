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

		$("#linkCourseDel").click(function(event) {
			if (!confirm("真的确定要删除？？？？")) {
				event.preventDefault();
				event.stopPropagation();
			}
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

	<h1>选课结果：</h1>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>课程名</th>
				<th>上课时间</th>
				<th>上课地点</th>
				<th>课程学分</th>
				<th>课程人数</th>
				<th>所属老师</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<s:iterator value="#request.courses" var="course" status="rowstatus">
				<s:if test="#rowstatus.odd == true">
					<tr class="success">
						<td><s:property value="#course.name" /></td>
						<td><s:property value="#course.time" /></td>
						<td><s:property value="#course.place" /></td>
						<td><s:property value="#course.credit" /></td>
						<td><s:property value="#course.selnum" /></td>
						<td><s:property value="#course.teacher.name" /></td>
						<td><s:property value="#course.memo" /></td>
						<td><s:url var="selCourseDelLink" action="selCourseDel" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> <s:url var="courseViewLink" action="courseView" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${courseViewLink}" target="mainContent" id='<s:property value="#course.id"/>'></a> &nbsp;&nbsp; <a id="linkCourseDel" title="删除" href="${selCourseDelLink}" target="mainContent"> <i class="glyphicon glyphicon-remove"></i></a></td>
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
						<td><s:property value="#course.memo" /></td>
						<td><s:url var="selCourseDelLink" action="selCourseDel" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> <s:url var="courseViewLink" action="courseView" namespace="/admin">
								<s:param name="id" value="#course.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${courseViewLink}" target="mainContent" id='<s:property value="#course.id"/>'></a> &nbsp;&nbsp; <a id="linkCourseDel" title="删除" href="${selCourseDelLink}" target="mainContent"> <i class="glyphicon glyphicon-remove"></i></a></td>
					</tr>
				</s:else>
			</s:iterator>
		</tbody>
	</table>


</body>
</html>