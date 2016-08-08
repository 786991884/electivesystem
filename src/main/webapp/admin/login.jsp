<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登陆</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function() {
		$("#vcodeImg").insertAfter("#vcode");
		$('#vcodeImg').click(function() {
			$(this).attr('src', '${pageContext.request.contextPath}/Kaptcha.jpg?' + Math.floor(Math.random() * 100));
		});
		$("input").attr("x-webkit-speech", "x-webkit-speech");
		/* ///使用cookie中的样式
		var mystyle = $.cookie("mywebstyle");
		if (mystyle) {
			$("#themeLink").attr("href", "${pageContext.request.contextPath}/bootstrap/themes/bootswatch/css/bootstrap." + mystyle + ".css");
		} else {//用默认样式
			$("#themeLink").attr("href", "${pageContext.request.contextPath}/bootstrap/themes/bootswatch/css/bootstrap.amelia.css");
		} */
	});
</script>
<link id="themeLink" rel="stylesheet" type="text/css" />
<style type="text/css">
#vcodeImg {
	height: 30px;
}

.container {
	width: 450px;
	position: fixed;
	left: 50%;
	top: 50%;
	margin-left: -225px;
	margin-top: -200px;
}
</style>

</head>
<body>
	<!-- bootstrap是居中的固定布局方式，默认宽度940px
css:重叠样式表，如果我们的定义的class类和已有class同名，最终的样式是两个class类重叠
    如果本地的class类的某个属性与外部的class类的某个属性相同，局部起作用；
  如果本地class木有某个属性，而外部有，最终样式里面有这个
 -->
	<div class="container">
		<div class="row clearfix">
			<div class="well well-lg">
				<s:form action="userlogin" cssClass="form-horizontal" theme="simple" namespace="/admin">
					<fieldset>
						<legend>用户登陆</legend>
						用户名：<input type="text" required="required" id="name" name="name" placeholder="输入用户名"><br> 密码：&nbsp;&nbsp;&nbsp;<input type="password" required="required" id="password" name="password" placeholder="输入密码"><br> 选择用户类型：<select name="roleId" id="roleId">
							<option value="1" selected="selected">学生</option>
							<option value="2">教师</option>
							<option value="3">管理员</option>
						</select><br>
						验证码：<s:textfield name="vcode" id="vcode" label="请输入验证码" placeholder="看不清图片，请单击换一张" required="true"></s:textfield>
						<img id="vcodeImg" style="height: 25" alt="验证码" src="${pageContext.request.contextPath}/Kaptcha.jpg">
						<s:fielderror></s:fielderror>
						<s:submit cssClass="btn btn-primary btn-block" value="登陆"></s:submit>
					</fieldset>
				</s:form>
			</div>
		</div>
	</div>


</body>
</html>