<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑课程</title>
<script type="text/javascript">
$(function(){
	$("#teacherId").val($("#tid").val());
});
</script>
</head>
<body>
	<form role="form" action="${pageContext.request.contextPath}/admin/courseEdit.action" method="post">
		<input type="hidden" name="id" value="<s:property value="id" />">
		<input type="hidden" name="tid" id="tid" value="<s:property value="teacher.id" />">
		<div class="form-group">
			<label for="name">课程名：</label><input type="text" required="required" class="form-control" name="name" value="<s:property value="%{name}" />" id="name" />
		</div>
		<div class="form-group">
			<label for="time">上课时间：</label><input type="datetime" class="form-control" name="time" value="<s:property value="time" />" id="time" />
		</div>
		<div class="form-group">
			<label for="place">上课地点：</label><input type="text" class="form-control" name="place" value="<s:property value="place" />" id="place" />
		</div>
		<div class="form-group">
			<label for="credit">课程学分：</label><input type="number" max="5" min="0" class="form-control" name="credit" value="<s:property value="credit" />" id="credit" />
		</div>
		<div class="form-group">
			<label for="selnum">课程人数：</label> <input type="number" step="1" class="form-control" name="selnum" value="<s:property value="selnum" />" id="selnum" />
		</div>
		<div class="form-group">
			<label for="memo">备注：</label>
			<textarea rows="3" cols="25" class="form-control" name="memo" id="memo"><s:property value="memo" /></textarea>
		</div>
		<div class="form-group">
			<label for="teacher">所属老师：</label>
			<s:select list="#teacherList" name="teacherId" id="teacherId" value="" listKey="id" listValue="name" headerKey="" headerValue="请选择老师"></s:select>
		</div>
		<button type="submit" class="btn btn-default">提交</button>
	</form>
</body>
</html>