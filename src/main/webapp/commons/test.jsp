<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<ul id="list">
		<li><label><input type="checkbox" value="1"> 1.我是记录来的呢</label></li>
		<li><label><input type="checkbox" value="2"> 2.哈哈，真的太天真了</label></li>
		<li><label><input type="checkbox" value="3"> 3.爱上你是我的错吗？</label></li>
		<li><label><input type="checkbox" value="4"> 4.从开始你就不应用爱上我</label></li>
		<li><label><input type="checkbox" value="5"> 5.喜欢一个人好难</label></li>
		<li><label><input type="checkbox" value="6"> 6.你在那里呢</label></li>
	</ul>
	<input type="checkbox" id="all">
	<input type="button" value="全选" class="btn" id="selectAll">
	<input type="button" value="全不选" class="btn" id="unSelect">
	<input type="button" value="反选" class="btn" id="reverse">
	<input type="button" value="获得选中的所有值" class="btn" id="getValue">
</body>
<script type="text/javascript">
	$(function() {
		//1、全选或全不选。当勾选全选按钮#selectAll旁边的复选框#all时，列表中的选项全部选中，反之取消勾选则列表中的选项全部为未选中状态。
		$("#all").click(function() {
			if ($("#all").prop('checked')) {
				$("#list :checkbox").prop("checked", true);
			} else {
				$("#list :checkbox").removeAttr("checked");
			}
		});
		//2、全选。当点击全选按钮#selectAll或者勾选全选按钮旁边的复选框#all时，列表中所有的选项都会被选中，包括全选旁边的复选框也是选中状态
		$("#selectAll").click(function() {
			$("#list :checkbox,#all").prop("checked", true);
		});
		//3、全不选。当点击全不选按钮#unSelect时，列表中所有的选项都是未选中状态，当然包括#all也是未选中状态。
		$("#unSelect").click(function() {
			$("#list :checkbox,#all").removeAttr("checked");
		});
		//4、反选。当点击反选按钮#reverse，列表中所有被选中的选项变为未选中状态，而所有未选中的选项变为已选中状态，当然也要注意#all的状态
		$("#reverse").click(function() {
			$("#list :checkbox").each(function() {
				$(this).prop("checked", !$(this).prop("checked"));
			});
			allchk();
		});
		//5、获得选中的所有值。我们要跟后台程序交互就必须获取列表中所选项的值，我们通过遍历数组，
		//将选中项的值存放在数组中，最后组成由逗号(,)隔开的字符串，开发者就可以通过获取这个字符串进行相应的操作了。
		$("#getValue").click(function() {
			var valArr = new Array;
			$("#list :checkbox").each(function(i) {
				if ($(this).prop("checked")) {
					valArr.push($(this).attr("value"));
				}
			});
			var vals = valArr.join(',');//转换为逗号隔开的字符串 
			alert(vals);
		});
		//为了完善选中选项功能，我们在单击列表中某个选项时，如果勾选的项刚好满足全部选中的条件，
		//则#all也要相应的变为选中状态，同样，如果事先所有的选项是选中状态时，当取消勾选某个选项时，那么#all也要相应的变为未选中状态。
		//设置全选复选框 
		$("#list :checkbox").click(function() {
			allchk();
		});
		//函数allchk()就是用来检测全选框#all应该是选中状态还是未选中状态的，请看代码。
		function allchk() {
			var chknum = $("#list :checkbox").size();//选项总个数 
			var chk = 0;
			$("#list :checkbox").each(function() {
				if ($(this).prop("checked")) {
					chk++;
				}
			});
			if (chknum == chk) {//全选 
				$("#all").prop("checked", true);
			} else {//不全选 
				$("#all").removeAttr("checked");
			}
		}
	});
</script>
</html>