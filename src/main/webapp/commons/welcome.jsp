<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.carousel').carousel({
			interval : 2000
		});
	});
</script>
<style type="text/css">
.carousel {
	width: 600px;
}
</style>
</head>
<body>
	<div class="container">
		<h3>
			<p class="text-warning">谨以此项目纪念在学校的岁月。</p>
		</h3>
	</div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${pageContext.request.contextPath}/images/bootstrap-mdo-sfmoma-01.jpg" />
				<div class="carousel-caption">
					<p class="text-success">2011年</p>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/images/bootstrap-mdo-sfmoma-02.jpg" />
				<div class="carousel-caption">
					<p class="text-success">2013年</p>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/images/bootstrap-mdo-sfmoma-03.jpg" />
				<div class="carousel-caption">
					<p class="text-success">2015年</p>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>

</body>
</html>