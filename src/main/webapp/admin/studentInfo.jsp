<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息查看</title>
</head>
<body>
	<table>
		<tr class="success">
			<td>学号:</td>
			<td>${info.number}</td>
		</tr>
		<tr>
			<td>姓名：</td>
			<td>${info.name}</td>
		</tr>
		<tr>
			<td>性别：</td>
			<td>${info.sex }</td>
		</tr>
		<tr>
			<td>生日：</td>
			<td>${info.birthday }</td>
		</tr>
		<tr>
			<td>政治面貌：</td>
			<td>${info.state }</td>
		</tr>
		<tr>
			<td>家庭地址：</td>
			<td>${info.address }</td>
		</tr>
		<tr>
			<td>电话：</td>
			<td>${info.telephone }</td>
		</tr>
		<tr>
			<td>备注信息：</td>
			<td>${info.memo }</td>
		</tr>

	</table>
</body>
</html>