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
			<td>用户名:</td>
			<td>${info.name }</td>
		</tr>
		<tr>
			<td>邮箱：</td>
			<td>${info.email }</td>
		</tr>
		<tr>
			<td>真实姓名：</td>
			<td>${info.realName}</td>
		</tr>
		<tr>
			<td>性别：</td>
			<td>${info.gender }</td>
		</tr>
		<tr>
			<td>家庭地址：</td>
			<td>${info.address }</td>
		</tr>
		<tr>
			<td>电话：</td>
			<td>${info.phone }</td>
		</tr>
		<tr>
			<td>邮编：</td>
			<td>${info.postCode }</td>
		</tr>
		<tr>
			<td>手机号码：</td>
			<td>${info.birthday }</td>
		</tr>
		
	</table>
</body>
</html>