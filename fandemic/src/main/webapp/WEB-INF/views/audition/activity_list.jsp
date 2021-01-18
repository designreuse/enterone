<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습생 활동</title>

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="resources/owlcss/owl.carousel.min.css">
<link rel="stylesheet" href="resources/owlcss/owl.theme.default.min.css">
<script src="resources/scripts/owlcarousel/dist/owl.carousel.min.js"></script>

<script>
	$(document).ready(function() {

		$('.owl-carousel').owlCarousel({
			items : "${cnt}",
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
p {
	font-size: medium;
}

.thumbnail {
	width: 80%;
	height: 80%;
}

.item {
	width: 200px;
	height: 200px;
	float: left;
	margin-right: 10px;
}

#but {
	margin-right: 1000px;
	margin-bottom: 14px;
}

.col-md-4 {
	width: 33.33333333%;
	margin-left: 440px;
	margin-top: -59px;
}

.col-md-5 {
	width: 41.66666667%;
	margin-left: 307px;
	margin-top: -12px;
}

.navbar-form {
	width: auto;
	padding-top: 0;
	padding-bottom: 0;
	margin-right: 0;
	margin-left: 142px;
	border: 0;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.text-center {
	margin-top: 50px;
}
</style>
<script>
	$(".btn-like").click(function() {
		$(this).toggleClass("done");
	})
</script>
</head>
<body>
	<section class="page">
		<div class="container">

			<div>
				<h1 align="center"
					style="color: black; font-size: 50px; margin-top: 5px;">연습생 활동</h1>
				<div>
					<button type="button" class="btn btn-primary" id="but">TOP05/NEW05</button>
					<%-- <c:if test="${trainee.mem_id ne null}"> --%>  <%--$는 컨트롤러에서 넘어오는거 --%>
						<button type="button" class="btn btn-primary" id="but2"
							style="float: right; margin-top: -58px;"
							onclick="location.href='activityinsert'">글 등록</button>
					<%--  </c:if> --%>
				</div>
				<div>
					<div class="jumbotron jumbotron-fluid">
						<div class="owl-carousel owl-theme">
							<%-- <c:forEach var="new" items="${selectnew}">
								<div>
									<input type="image" style="width: 200px; height: 260px;"
										src="${pageContext.request.contextPath}/images/audition/${new.ac_file}">
									<br>
									<p>${new.mem_id}</p>
									<p>${new.ac_likes}</p>
								</div>
							</c:forEach> --%>
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
				</div>
				<div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="col-md-3 col-sm-3 col-xs-3">
							<button type="button" class="btn btn-primary" id="but1">전체</button>
							<button type="button" class="btn btn-primary" id="but1">연습생
								활동</button>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-3"></div>


						<div class="col-md-3 col-sm-3 col-xs-3">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button"
									id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="true">
									최신순/인기순 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li><a href="#">최신순</a></li>
									<li><a href="#">인기순</a></li>
									<li role="separator" class="divider"></li>
								</ul>
							</div>

						</div>
						<div class="col-md-3 col-sm-3 col-xs-3">
							<div class="input-group">
								<input type="text" name="q" class="form-control"
									placeholder="Type something ..." value="Search">
								<div class="input-group-btn">
									<button class="btn btn-primary"></button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="row">
						<c:forEach var="activity" items="${AcworkList}">
							<div class="col-md-3 col-sm-3 col-xs-3">
								<div class="thumbnail">
									<img
										src="${pageContext.request.contextPath}/images/audition/${activity.ac_file}"
										alt="...">
									<div class="caption">
										<a
											href="${pageContext.request.contextPath}/ActivityDetail/${activity.ac_title}"><p>${sessionScope.member.mem_id}</p></a>
										<p>${activity.ac_content}</p>
										<p>${activity.ac_hits}</p>
										<p>${activity.ac_likes}</p>
										<p>
											<a href="#" class="btn btn-primary" role="button">Button</a>

										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
			<!-- paging -->
					<div align="center">
							<script>
								function goPage(p) {
									location.href = "audition/auditionwork?p=" + p
								}
							</script>

							<my:paging paging="${paging}" jsfunc="goPage" />
					</div>

	</section>
</body>

</html>