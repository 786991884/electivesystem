<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑学生</title>
</head>
<body>

	<form role="form" action="${pageContext.request.contextPath}/admin/studentEdit.action" method="post">
		<input type="hidden" name="id" value="<s:property value="id" />">
		<div class="form-group">
			<label for="number">学号：</label><input type="text" class="form-control" name="number" value="<s:property value="number" />" id="number" />
		</div>
		<div class="form-group">
			<label for="name">姓名：</label><input type="text" class="form-control" name="name" value="<s:property value="%{name}" />" id="name" />
		</div>
		<div class="form-group">
			<label for="password">密码：</label><input type="password" class="form-control" name="password" value="<s:property value="password" />" id="password" />
		</div>
		<div class="form-group">
			<label for="sex">性别：</label><input type="text" class="form-control" name="sex" value="<s:property value="sex" />" id="sex" />
		</div>
		<div class="form-group">
			<label for="birthday">出生日期：</label><input type="date" class="form-control" name="birthday" value="<s:property value="birthday" />" id="birthday" />
		</div>
		<div class="form-group">
			<label for="state">政治面貌：</label><input type="text" class="form-control" name="state" value="<s:property value="state" />" id="state" />
		</div>
		<div class="form-group">
			<label for="telephone">电话：</label><input type="tel" class="form-control" name="telephone" value="<s:property value="telephone" />" id="telephone" />
		</div>
		<div class="form-group">
			<label for="address">家庭住址：</label><input type="text" class="form-control" name="address" value="<s:property value="address" />" id="address" />
		</div>
		<div class="form-group">
			<label for="memo">备注：</label><input type="text" class="form-control" name="memo" value="<s:property value="memo" />" id="memo" />
		</div>
		<button type="submit" class="btn btn-default">提交</button>
	</form>
</body>
</html>