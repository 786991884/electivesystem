$(function() {
	// 加载后就开始执行
	var mystyle = $.cookie("mywebstyle");
	if (mystyle) {
		$("#themeLink").attr("href", "../bootstrap/themes/bootswatch/css/bootstrap." + mystyle + ".css");
		// 切换select为cookie中保存的值
		$("#themeSel").val(mystyle);
	} else {// 用默认样式
		$("#themeLink").attr("href", "../bootstrap/themes/bootswatch/css/bootstrap.amelia.css");
	}
	// 修改Link href值？？？什么时间修改
	$("#themeSel").bind("change", function() {
		$("#themeLink").attr("href", "../bootstrap/themes/bootswatch/css/bootstrap." + $("#themeSel").val() + ".css");
		// 把选择保存起来，注意用了框架集，要想让本网站的页面都访问到，就必须设置
		$.cookie('mywebstyle', $("#themeSel").val(), {
			expires : 7
		});
	});
});