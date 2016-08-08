<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息查看</title>
</head>
<body>
	<table>
		<tr class="success">
			<td>姓名:</td>
			<td><s:property value="%{name}" /></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td><s:property value="sex" /></td>
		</tr>
		<tr>
			<td>出生日期：</td>
			<td><s:property value="birthday" /></td>
		</tr>
		<tr>
			<td>入职日期：</td>
			<td><s:property value="arrivedate" /></td>
		</tr>
		<tr>
			<td>电话号码：</td>
			<td><s:property value="telephone" /></td>
		</tr>
		<tr>
			<td>备注：</td>
			<td><s:property value="memo" /></td>
		</tr>
	</table>
</body>
</html>