<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生选课系统</title>
</head>
<body>
	<div class="container-fluid">
		<!-- 顶部 -->
		<%@include file="/commons/top.jsp"%>
		<div class="row clearfix">
			<!-- 左边导航 -->
			<div class="col-md-3 column">
				<%@include file="/commons/menu.jsp"%>
			</div>
			<!-- 右侧内容区 -->
			<div class="col-sm-9 col-md-9 column">
				<iframe src="${pageContext.request.contextPath}/commons/welcome.jsp" scrolling="no" frameborder="0" name="mainContent" width="100%" class="autoHeight" id="mainContent"></iframe>
			</div>
		</div>
		<!-- 底部 -->
		<%@include file="/commons/buttom.jsp"%>
	</div>
</body>
</html>