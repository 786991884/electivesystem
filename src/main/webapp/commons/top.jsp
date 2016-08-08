<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.autoheight.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script src="../js/changeTheme.js"></script>
<div class="row clearfix" style="height: 55px;">
	<div class="col-md-12 column">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:void(0)"><span class="glyphicon glyphicon-home">欢迎使用学生选课系统</span></a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" />
					</div>
					<button type="button" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a id="userinfo"><c:if test="${sessionScope.admin.name != null}">
								<strong>${sessionScope.admin.name}</strong>&nbsp;欢迎你！</c:if></a></li>
					<li class=""><a href="${pageContext.request.contextPath}/commons/exit.jsp"><span class="glyphicon glyphicon-off">注销</span></a></li>
					<li><a href="javascript:void(0)"><span id="timerLi"><script type="text/javascript">
						function printTime() {
							var objD = new Date();
							var str, colorfoot;
							var colorhead = undefined;
							var yy = objD.getYear();
							if (yy < 1900)
								yy = yy + 1900;
							var MM = objD.getMonth() + 1;
							if (MM < 10)
								MM = '0' + MM;
							var dd = objD.getDate();
							if (dd < 10)
								dd = '0' + dd;
							var hh = objD.getHours();
							if (hh < 10)
								hh = '0' + hh;
							var mm = objD.getMinutes();
							if (mm < 10)
								mm = '0' + mm;
							var ss = objD.getSeconds();
							if (ss < 10)
								ss = '0' + ss;
							var ww = objD.getDay();
							if (ww == 0)
								colorhead = "<font color=\"#FF0000\">";
							if (ww > 0 && ww < 6)
								colorhead = "<font color=\"#373737\">";
							if (ww == 6)
								colorhead = "<font color=\"#008000\">";
							if (ww == 0)
								ww = "星期日";
							if (ww == 1)
								ww = "星期一";
							if (ww == 2)
								ww = "星期二";
							if (ww == 3)
								ww = "星期三";
							if (ww == 4)
								ww = "星期四";
							if (ww == 5)
								ww = "星期五";
							if (ww == 6)
								ww = "星期六";
							colorfoot = "</font>";
							str = colorhead + yy + "年" + MM + "月" + dd + "日 " + hh + ":" + mm + ":" + ss + "  " + ww + colorfoot;
							$("#timerLi").empty().append(str);

						}
						printTime();
						setInterval(printTime, 1000);
					</script></span>&nbsp;&nbsp;&nbsp;</a></li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<!-- 对话框 -->

<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">查看用户详细信息</h4>
			</div>
			<div class="modal-body">
				<p>内容加载中 ...…</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>
