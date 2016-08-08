
<%
	session.removeAttribute("admin");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
	response.sendRedirect(basePath + "admin/login.jsp");
%>