<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加教师</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link id="themeLink" rel="stylesheet" type="text/css" />
</head>
<body>
	<form role="form" action="${pageContext.request.contextPath}/admin/teacherAdd.action" method="post">
		<div class="form-group">
			<label for="name">教师名：</label><input type="text" required="required" class="form-control" name="name" value="<s:property value="%{name}" />" id="name" />
		</div>
		<div class="form-group">
			<label for="password">密码：</label><input type="password" required="required" class="form-control" name="password" value="<s:property value="password" />" id="password" />
		</div>
		<div class="form-group">
			<label for="sex">性别：</label><input type="text" class="form-control" name="sex" value="<s:property value="sex" />" id="sex" />
		</div>
		<div class="form-group">
			<label for="birthday">出生日期：</label><input type="date" class="form-control" name="birthday" value="<s:property value="birthday" />" id="birthday" />
		</div>
		<div class="form-group">
			<label for="arrivedate">入职日期：</label><input type="date" class="form-control" name="arrivedate" value="<s:property value="arrivedate" />" id="arrivedate" />
		</div>
		<div class="form-group">
			<label for="tel">电话号码：</label><input type="tel" class="form-control" name="telephone" value="<s:property value="telphone" />" id="tel" />
		</div>
		<div class="form-group">
			<label for="memo">备注：</label>
			<textarea rows="5" cols="80" name="memo" id="memo"><s:property value="memo" /></textarea>
		</div>
		<button type="submit" class="btn btn-default">提交</button>
	</form>
</body>
</html>