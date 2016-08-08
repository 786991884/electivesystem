<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>

	<form role="form" action="${pageContext.request.contextPath}/admin/changePwd.action" method="post">
		<input type="hidden" name="id" value="<s:property value="id" />">
		<div class="form-group">
			<label for="exampleInputEmail1">原密码：</label><input type="password" class="form-control"  name="password" required="required" value="<s:property value="%{password}" />" id="exampleInputEmail1" />
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">新密码：</label><input type="password" class="form-control" name="password2" required="required" value="<s:property value="password2" />" id="exampleInputPassword1" />
		</div>
		<div class="form-group">
			<label for="exampleInputPassword2">重复新密码：</label><input type="password" class="form-control" name="rpassword2" required="required" value="<s:property value="rpassword2" />" id="exampleInputPassword2" />
		</div>
		<s:fielderror></s:fielderror>
		<button type="submit" class="btn btn-default">提交</button>
	</form>
	
</body>
</html>