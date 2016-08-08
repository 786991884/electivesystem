<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看用户</title>
</head>
<body>
	<table>
		<tr class="success">
			<td>用户名:</td>
			<td><s:property value="%{name}" /></td>
		</tr>
		<tr>
			<td>Email：</td>
			<td><s:property value="email" /></td>
		</tr>
		<tr>
			<td>真实姓名：</td>
			<td><s:property value="realName" /></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td><s:property value="gender" /></td>
		</tr>
		<tr>
			<td>生日：</td>
			<td><s:property value="birthday" /></td>
		</tr>
		<tr>
			<td>地址：</td>
			<td><s:property value="address" /></td>
		</tr>
		<tr>
			<td>邮政编码：</td>
			<td><s:property value="postCode" /></td>
		</tr>
		<tr>
			<td>固定电话：</td>
			<td><s:property value="phone" /></td>
		</tr>
		<tr>
			<td>移动电话：</td>
			<td><s:property value="mobil" /></td>
		</tr>
		<tr>
			<td>积分：</td>
			<td><s:property value="score" /></td>
		</tr>
	</table>
</body>
</html>