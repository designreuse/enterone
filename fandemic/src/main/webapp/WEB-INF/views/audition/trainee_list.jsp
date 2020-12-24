<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html>

<head>

<style>

.auditionimage {
	margin: 10px;
	height: 264px;
	width: 178px
}

.auditionunder {
	background-color: lightgrey;
	margin-top: 10px;
}

* {
	box-sizing: border-box;
}

.wrapper {
	background-color: lightgrey;
	text-align: center;
}

.card {
	display: inline-block;
	width: 200px;
	height: 316px;
	border: 0px solid;
	text-align: center;
	margin-top: 5px;
}

.card img {
	width: 180px;
	border: 0px solid;
	margin-top: 10px;
}

.btn-like {
	align: right;
	color: transparent;
	text-shadow: 0 0 2px rgba(255, 255, 255, .7), 0 0 0 #000;
	margin-right: 10px
}

.btn-like:hover {
	text-shadow: 0 0 0 #ea0;
}

.btn-like.done {
	color: inherit;
	text-shadow: 0;
}

.btn-like.done:hover {
	color: transparent;
	text-shadow: 0 0 0 #777;
}

.btn btn-primary {
	font-size: 1.5em;
	border-radius: 0.5em;
	padding: 5px;
	align: left;
	margin:6px;
	
}
</style>


</head>

<section class="page">
	<div class="container">
		<div>
			<h1 align="center"
				style="color: black; font-size: 50px; margin-top: 5px;">연습생 활동</h1>
		</div>

		<div class="wrapper">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-2 col-sm-2 col-xs-2" style="margin:20px 45px">
					<button class="btn btn-primary" type="button">TOP05/NEW05</button>

				</div>
				<div class="col-md-10 col-sm-10 col-xs-10"></div>
			</div>
			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/suzy.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>


				<script src="//code.jquery.com/jquery.min.js"></script>
				<script>
					$(".btn-like").click(function() {
						$(this).toggleClass("done");
					})
				</script>

			</div>

			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/jung.jpg"><br>
					<button class="btn-like">👍</button>
				</div>


			</div>

			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/park.jpg"><br>
					<button class="btn-like">👍</button>
				</div>


			</div>

			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/lee.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>


			</div>

			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/choi.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>
			</div>

		</div>
		<div class="auditionunder col-md-12 col-sm-12 col-xs-12">

			<div class="col-md-12 col-sm-12 col-xs-12">

				<div class="col-md-2 col-sm-2 col-xs-2" style="margin:10px;">
					<button class="btn btn-primary" type="button">전체</button>

				</div>
				<div class="col-md-2 col-sm-2 col-xs-2" style="margin:10px 10px;">
					<button class="btn btn-primary" type="button">연습생 활동</button>
				</div>

				<div class="col-md-2 col-sm-2 col-xs-2" style="margin:10px 10px"></div>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-primary" style="align: right">검색</button>
				</form>

				<div class="col-md-2 col-sm-2 col-xs-2" style="margin:10px 10px"></div>
				<div class="btn-group">
					<a class="btn btn-primary dropdown-toggle btn-select" href="#"
						data-toggle="dropdown">최신순 <span class="caret"></span></a>
					<ul class="dropdown-menu">

						<li class="divider"></li>
						<li><a href="#">인기순</a></li>
						
					</ul>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4"></div>
			</div>
			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/cha.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>
			</div>
			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/jenny.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>
			</div>
			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/jimin.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>
			</div>
			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/won0.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>
			</div>
			<div class="card">
				<div align="right">
					<img class="auditionimage"
						src="${pageContext.request.contextPath}/resources/images/audition/yeji.jpg">
					<br>
					<button class="btn-like">👍</button>
				</div>
			</div>
			<div class="col-md-12 text-center">
						<ul class="pagination">
							<li class="prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#">10</a></li>
							<li class="next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
						</ul>
					</div>
		</div>
	</div>
</section>
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    최신순/인기순
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">최신순</a></li>
    <li><a href="#">인기순</a></li>
    <li role="separator" class="divider"></li>
  </ul>
</div>
</html>
