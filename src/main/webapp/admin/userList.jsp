<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<link id="themeLink" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function() {
	$("#ckSelectAll").click(function() {
		$("input[name=uid][type=checkbox]").each(function() {
			$(this).prop("checked", $("#ckSelectAll").prop("checked"));
		});
	});
	
    

	$("#linkUserDel").click(function(event) {
		if (!confirm("真的确定要删除？？？？")) {
			event.preventDefault();
			event.stopPropagation();
		}
	});
	// //////////
	// 对当前页修改显示
	$("a[onclick='changePage(${currentPage})']").parent().addClass("active");
	// 当查看时弹出对话框来显示用户的详细信息
	$(".glyphicon-eye-open1").click(function(event) {
		var uid = event.target.id;
		// 弹出对话框
		$('#myModal',window.parent.document).modal({
			keyboard : false,
			show : true,
			remote : "${pageContext.request.contextPath}/admin/userView.action?id=" + uid
		});

	});
	$("#myModal").on('hidden.bs.modal', function() {
		// 销毁与之关联的modal
		$(this).removeData('bs.modal');
	});

	// 跳转
	$("#tiaoye").click(function() {
		if(parseInt($("#tiaozhuang").val())<=parseInt($("#tiaozhuang").attr("max"))){
		    changePage($("#tiaozhuang").val());
		}
		return;
	});

	$("#btn_clear").click(function() {
		$(':input', '#search').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
	});
	//批量删除
	$(".glyphicon-trash").click(function() {
		var valArr = new Array;
		$("input[name=uid][type=checkbox]").each(function(i) {
			if ($(this).prop("checked")) {
				valArr.push($(this).attr("value"));
			}
		});
		var vals = valArr.join(',');//转换为逗号隔开的字符串 
		console.log(vals);
		if (vals.length<=0) {
			alert("请至少选择一条记录进行删除！");
		}else{
			if (!confirm("真的确定要删除？？？？")) {
				event.preventDefault();
				event.stopPropagation();
			}else{
				//删除操作
				$.post("${pageContext.request.contextPath}/admin/usersDel.action",{
					ids:vals
				},function(data){
					window.location.href="${pageContext.request.contextPath}/admin/userList.action";
				});
			}
		}
	});
});
function changePage(pageNo) {
	$("#hidderPagNo").val(pageNo);
	$("#search").submit();
};
</script>

</head>
<body>
	<form class="form-inline well-sm" id="search" action="${pageContext.request.contextPath}/admin/userList.action" method="post">
		<div class="form-group">
			<label for="uname">名字</label> <input type="text" class="form-control" value="${name}" name="name" id="uname" placeholder="姓名">
		</div>

		<div class="form-group">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="edu">分数</label> <input id="edu" type="text" class="form-control" name="score" value="<s:property value="score"/>">
		</div>
		<input type="hidden" name="currentPage" id="hidderPagNo" value="1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="submit" class="form-control">
			<i class="glyphicon glyphicon-search"></i>
		</button>
		<button type="button" id="btn_clear" class="form-control">
			<i class="glyphicon glyphicon-remove-circle"></i>
		</button>
	</form>

	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th><input type="checkbox" id="ckSelectAll"></th>
				<th>用户名</th>
				<th>Email</th>
				<th>生日</th>
				<th>固定电话</th>
				<th>性别</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<s:iterator value="#request.pageBean.recordList" var="user" status="rowstatus">
				<s:if test="#rowstatus.odd == true">
					<tr class="success">
						<td><input type="checkbox" value='<s:property value="#user.id"/>' name="uid"></td>
						<td><s:property value="#user.name" /></td>
						<td><s:property value="#user.email" /></td>
						<td><s:property value="#user.birthday" /></td>
						<td><s:property value="#user.phone" /></td>
						<td><s:property value="#user.gender" /></td>
						<td><s:url var="userDelLink" action="userDel" namespace="/admin">
								<s:param name="id" value="#user.id"></s:param>
							</s:url> <s:url var="userViewLink" action="userView" namespace="/admin">
								<s:param name="id" value="#user.id"></s:param>
							</s:url> <s:url var="userEditLink" action="toUserEdit" namespace="/admin">
								<s:param name="id" value="#user.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="编辑" class="glyphicon glyphicon-edit" href="${userEditLink}" id='<s:property value="#user.id"/>'> </a> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${userViewLink}" target="mainContent" id='<s:property value="#user.id"/>'></a> &nbsp;&nbsp; <a id="linkUserDel" title="删除" href="${userDelLink}" target="mainContent"> <i
								class="glyphicon glyphicon-remove"></i></a></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td><input type="checkbox" value='<s:property value="#user.id"/>' name="uid"></td>
						<td><s:property value="#user.name" /></td>
						<td><s:property value="#user.email" /></td>
						<td><s:property value="#user.birthday" /></td>
						<td><s:property value="#user.phone" /></td>
						<td><s:property value="#user.gender" /></td>
						<td><s:url var="userDelLink" action="userDel" namespace="/admin">
								<s:param name="id" value="#user.id"></s:param>
							</s:url> <s:url var="userViewLink" action="userView" namespace="/admin">
								<s:param name="id" value="#user.id"></s:param>
							</s:url> <s:url var="userEditLink" action="toUserEdit" namespace="/admin">
								<s:param name="id" value="#user.id"></s:param>
							</s:url> &nbsp;&nbsp; <a title="编辑" class="glyphicon glyphicon-edit" href="${userEditLink}" id='<s:property value="#user.id"/>'> </a> &nbsp;&nbsp; <a title="查看" class="glyphicon glyphicon-eye-open" href="${userViewLink}" target="mainContent" id='<s:property value="#user.id"/>'></a> &nbsp;&nbsp; <a id="linkUserDel" title="删除" href="${userDelLink}" target="mainContent"> <i
								class="glyphicon glyphicon-remove"></i></a></td>
					</tr>
				</s:else>
			</s:iterator>
			<td><a title="删除选中的行" class="glyphicon glyphicon-trash" href="javascript:void(0)" id=''></a>&nbsp;&nbsp;&nbsp;&nbsp; <s:url var="toUserAdd" action="toUserAdd" namespace="/admin"></s:url> <a title="增加一条数据" class="glyphicon glyphicon-plus" href="${toUserAdd}" id=''></a></td>
			<td colspan="6">页次：${requestScope.pageBean.currentPage}/${requestScope.pageBean.pageCount}页 &nbsp; 每页显示：${requestScope.pageBean.pageSize }条 &nbsp; 总记录数：${requestScope.pageBean.recordCount }条</td>
		</tbody>
	</table>

	<ul class="pagination">
		<!--首页-->
		<s:if test="#request.pageBean.currentPage>1">
			<li><a href="javascript:void(0)" onclick="changePage(1)">首页</a></li>
		</s:if>
		<s:if test="#request.pageBean.currentPage>1">
			<li><a href="javascript:void(0)" onclick="changePage(${currentPage-1})">上一页</a></li>
		</s:if>
		<s:iterator var="counter" begin="#request.pageBean.beginPageIndex" end="#request.pageBean.endPageIndex">
			<li><a href="javascript:void(0)" onclick="changePage(${counter})">${counter}</a></li>
		</s:iterator>
		<!-- 后一页 -->
		<s:if test="#request.pageBean.currentPage<#request.pageBean.pageCount">
			<li><a href="javascript:void(0)" onclick="changePage(${currentPage+1})">下一页</a></li>
		</s:if>
		<!-- 尾页 -->
		<s:if test="#request.pageBean.currentPage<#request.pageBean.pageCount">
			<li><a href="javascript:void(0)" onclick="changePage(${requestScope.pageBean.pageCount})">尾页</a></li>
		</s:if>
		<li><input type="number" max="${requestScope.pageBean.pageCount}" min="1" width="1px;" id="tiaozhuang"><a href="javascript:void(0)" id="tiaoye">跳转</a>
	</ul>
</body>
</html>