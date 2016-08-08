<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
div ol {
	list-style-type: none;
}
</style>
<div class="panel-group" id="panel">
	<div class="panel panel-default">
		<div class="panel-heading">
			<a class="panel-title" data-toggle="collapse" data-parent="#panel" href="#panel-element-1"><span class="glyphicon glyphicon-user">&nbsp;用户管理</span></a>
		</div>
		<div id="panel-element-1" class="panel-collapse collapse in">
			<div class="panel-body">
				<ol>
					<%-- <li><a href="${pageContext.request.contextPath}/admin/userList.action" target="mainContent"><i class="glyphicon glyphicon-user"></i>用户查看</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/admin/personalInfo.action" target="mainContent"><i class="glyphicon glyphicon-user"></i>个人信息查看</a></li>
					<li><a href="${pageContext.request.contextPath}/commons/exit.jsp"><i class="glyphicon glyphicon-off"></i>退出登录</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/toChangePwd.action" target="mainContent"><i class="glyphicon glyphicon-pencil"></i>修改密码</a></li>
				</ol>
			</div>
		</div>
	</div>
	<c:if test="${sessionScope.roleId==2 || sessionScope.roleId==3}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="#panel" href="#panel-element-2"><span class="glyphicon glyphicon-pencil">&nbsp;课程管理</span></a>
			</div>
			<div id="panel-element-2" class="panel-collapse collapse">
				<div class="panel-body">
					<ol>
						<li><a href="${pageContext.request.contextPath}/admin/courseList.action" target="mainContent"><i class="glyphicon glyphicon-user"></i>课程信息维护</a></li>
					</ol>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.roleId==1}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="#panel" href="#panel-element-3"><span class="glyphicon glyphicon-tags">&nbsp;选课管理</span></a>
			</div>
			<div id="panel-element-3" class="panel-collapse collapse">
				<div class="panel-body">
					<ol>
						<li><a href="${pageContext.request.contextPath}/admin/toSelCourse.action" target="mainContent"><i class="glyphicon glyphicon-edit"></i>学生网上选课</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/selResult.action" target="mainContent"><i class="glyphicon glyphicon-eye-open"></i>选课结果查询</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/scoreResult.action" target="mainContent"><i class="glyphicon glyphicon-eye-open"></i>课程成绩查询</a></li>
					</ol>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.roleId==3}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="#panel" href="#panel-element-4"><span class="glyphicon glyphicon-th-large">&nbsp;教师管理</span></a>
			</div>
			<div id="panel-element-4" class="panel-collapse collapse">
				<div class="panel-body">
					<ol>
						<li><a href="${pageContext.request.contextPath}/admin/teacherList.action" target="mainContent"><i class="glyphicon glyphicon-user"></i>教师信息维护</a></li>
					</ol>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="panel-title" data-toggle="collapse" data-parent="#panel" href="#panel-element-5"><span class="glyphicon glyphicon-leaf">&nbsp;学生管理</span></a>
			</div>
			<div id="panel-element-5" class="panel-collapse collapse">
				<div class="panel-body">
					<ol>
						<li><a href="${pageContext.request.contextPath}/admin/studentList.action" target="mainContent"><i class="glyphicon glyphicon-user"></i>学生信息维护</a></li>
					</ol>
				</div>
			</div>
		</div>
	</c:if>
</div>