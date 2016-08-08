<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看课程</title>
</head>
<body>
	<table>
		<tr class="success">
			<td>课程名:</td>
			<td><s:property value="%{name}" /></td>
		</tr>
		<tr>
			<td>上课时间：</td>
			<td><s:property value="time" /></td>
		</tr>
		<tr>
			<td>上课地点：</td>
			<td><s:property value="place" /></td>
		</tr>
		<tr>
			<td>课程学分：</td>
			<td><s:property value="credit" /></td>
		</tr>
		<tr>
			<td>课程人数：</td>
			<td><s:property value="selnum" /></td>
		</tr>
		<tr>
			<td>备注：</td>
			<td><s:property value="memo" /></td>
		</tr>
		<tr>
			<td>所属老师：</td>
			<td><s:property value="teacher.name" /></td>
		</tr>
	</table>
</body>
</html>