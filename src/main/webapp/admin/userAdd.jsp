<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link id="themeLink" rel="stylesheet" type="text/css" />
</head>
<body>
	<s:form action="userAdd" namespace="/admin">
		<s:textfield requiredLabel="true" name="name" label="姓名" required="true" placeholder="用户名" value=""></s:textfield>
		<s:password requiredLabel="true" name="password" label="密码" required="true" placeholder="密码" value=""></s:password>
		<s:submit value="提交"></s:submit>
	</s:form>
</body>
</html>