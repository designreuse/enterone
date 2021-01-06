<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습생 활동</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="resources/owlcss/owl.carousel.min.css">
<link rel="stylesheet" href="resources/owlcss/owl.theme.default.min.css">

<script src="resources/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
<script>
	$(document).ready(function() {

		$('.owl-carousel').owlCarousel({
			loop : true,

			margin : 10,

			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 3
				},
				1000 : {
					items : 5
				}
			},
			scrollPerPage : true
		})
	});
</script>
<style>
.item {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 10px;
}

#but {
	width: 160px;
    height: 40px;
    margin-right: 1000px;
    font-size: medium;
    margin-bottom: 23px;
}
#but1 {
 margin-right:940px;
 margin-bottom: 23px;
}
</style>

</head>
<body>
	<section class="page">
		<div class="container">
			<div>
				<h1 align="center"
					style="color: black; font-size: 50px; margin-top: 5px;">연습생 활동</h1>
			</div>

			<button type="button" class="btn btn-primary" id="but">TOP05/NEW05</button>

			<div class="jumbotron jumbotron-fluid">
				<div class="owl-carousel owl-theme">
					<div class="item">
						<img class="auditionimage"
							src="${pageContext.request.contextPath}/resources/images/audition/suzy.jpg">
					</div>
					<div class="item">
						<h4>2</h4>
					</div>
					<div class="item">
						<h4>3</h4>
					</div>
					<div class="item">
						<h4>4</h4>
					</div>
					<div class="item">
						<h4>5</h4>
					</div>
					<div class="item">
						<h4>6</h4>
					</div>
					<div class="item">
						<h4>7</h4>
					</div>
					<div class="item">
						<h4>8</h4>
					</div>
					<div class="item">
						<h4>9</h4>
					</div>
					<div class="item">
						<h4>10</h4>
					</div>
				</div>
			</div>
			<div id="but1">
			<button type="button" class="btn btn-primary">전체</button>
			<button type="button" class="btn btn-primary">연습생 활동</button></div>
			
			<div class="jumbotron jumbotron-fluid">
			
		</div>
		</div>
	</section>
</body>

</html>