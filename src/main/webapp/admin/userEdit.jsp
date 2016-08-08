<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户</title>
</head>
<body>

	<form role="form" action="${pageContext.request.contextPath}/admin/userEdit.action" method="post">
		<input type="hidden" name="id" value="<s:property value="id" />">
		<div class="form-group">
			<label for="name">用户名：</label><input type="text" class="form-control" required="required" name="name" value="<s:property value="%{name}" />" id="name" />
		</div>
		<div class="form-group">
			<label for="email">邮箱：</label><input type="email" class="form-control" name="email" value="<s:property value="email" />" id="email" />
		</div>
		<button type="submit" class="btn btn-default">提交</button>
	</form>
</body>
</html>