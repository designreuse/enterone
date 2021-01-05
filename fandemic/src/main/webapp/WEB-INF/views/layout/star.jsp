<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
	<title>스타</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/aos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/jquery.timepicker.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/flaticon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/icomoon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/star.css">

	<script>
		 //모달 팝업 띄울 시 발생하는 이벤트  (이벤트명 : show.bs.modal) 
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var what = button.data('what');
			
			// 모달 팝업에 데이터 집어넣기 
			var modal = $(this);
			modal.find('.modal-body input').val(what)
		}); 
	</script>
</head>

<body>
	<!-- 메뉴화면 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary"
			class="js-fullmainheight text-center">
			<h1 id="colorlib-logo">
				<a href="${pageContext.request.contextPath}/star/${star.st_id}"><span class="img"
					style="background-image: url(${pageContext.request.contextPath}/images/star/${star.st_pic}"></span>${star.st_name}</a>
			</h1>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal" data-what="hello">채널가입</button>

			<br> <br>

			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="${pageContext.request.contextPath}/star/${star.st_id}">Home</a></li>
					<li><a href="#">스케줄</a></li>
					<li><a href="#">스타라이브</a></li>
					<li><a href="#">소식</a></li>
					<li><a href="${pageContext.request.contextPath}/star/board/${star.st_id}">스타게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/star/fanBoard/${star.st_id}">팬게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/star/album/${star.st_id}">사진게시판</a></li>
				</ul>
			</nav>
		</aside>
		
		
		<!-- 메뉴 제외 화면 -->
		<div id="colorlib-main">


			<!--  body 추가 부분 -->
			<tiles:insertAttribute name="body" />

			<!-- footer -->
			<footer class="ftco-footer ftco-bg-dark ftco-section">
				<div class="container px-md-5">
					<div class="row mb-5">
						<div class="col-md">
							<div class="ftco-footer-widget mb-4 ml-md-4">
								<h2 class="ftco-heading-2">Recent Photos</h2>
								<ul class="list-unstyled photo">
									<li><a href="#" class="img"
										style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_1.jpg);"></a></li>
									<li><a href="#" class="img"
										style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_2.jpg);"></a></li>
									<li><a href="#" class="img"
										style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_3.jpg);"></a></li>
									<li><a href="#" class="img"
										style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_4.jpg);"></a></li>
									<li><a href="#" class="img"
										style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_5.jpg);"></a></li>
									<li><a href="#" class="img"
										style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_6.jpg);"></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">Archives</h2>
								<ul class="list-unstyled categories">
									<li><a href="#">November 2018 <span>(105)</span></a></li>
									<li><a href="#">October 2018 <span>(212)</span></a></li>
									<li><a href="#">September 2018 <span>(150)</span></a></li>
									<li><a href="#">August 2018 <span>(100)</span></a></li>
									<li><a href="#">July 2018 <span>(200)</span></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">Have a Questions?</h2>
								<div class="block-23 mb-3">
									<ul>
										<li><span class="icon icon-map-marker"></span><span
											class="text">203 Fake St. Mountain View, San
												Francisco, California, USA</span></li>
										<li><a href="#"><span class="icon icon-phone"></span><span
												class="text">+2 392 3929 210</span></a></li>
										<li><a href="#"><span class="icon icon-envelope"></span><span
												class="text">info@yourdomain.com</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">

							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="icon-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!-- footer종료 -->
		
	</div>
	<!-- 화면 종료 -->

	<!-- 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">채널가입</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">채널 닉네임  &nbsp;:&nbsp;</label>
							<input type="text" id="recipient-name">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">가입</button>
				</div>
			</div>
		</div>
	</div>





	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>


	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/aos.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/main.js"></script>

</body>
</html>