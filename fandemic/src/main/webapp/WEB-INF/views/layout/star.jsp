<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Louie - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

    <link rel="stylesheet" href="resourcesStar/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resourcesStar/css/animate.css">
    
    <link rel="stylesheet" href="resourcesStar/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resourcesStar/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resourcesStar/css/magnific-popup.css">

    <link rel="stylesheet" href="resourcesStar/css/aos.css">

    <link rel="stylesheet" href="resourcesStar/css/ionicons.min.css">

    <link rel="stylesheet" href="resourcesStar/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resourcesStar/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="resourcesStar/css/flaticon.css">
    <link rel="stylesheet" href="resourcesStar/css/icomoon.css">
    <link rel="stylesheet" href="resourcesStar/css/style.css">
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<h1 id="colorlib-logo"><a href="index.html"><span class="img" style="background-image: url(resourcesStar/images/author.jpg);"></span>스타이름</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="starMain">Home</a></li>
					<li><a href="#">스케줄</a></li>
					<li><a href="#">스타라이브</a></li>
					<li><a href="#">소식</a></li>
					<li><a href="#">스타게시판</a></li>
					<li><a href="#">팬게시판</a></li>
					<li><a href="#">사진게시판</a></li>
				</ul>
			</nav>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<!--  body 추가 부분 -->
			<tiles:insertAttribute name="body"/>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
	
	
  <script src="resourcesStar/js/jquery.min.js"></script>
  <script src="resourcesStar/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resourcesStar/js/popper.min.js"></script>
  <script src="resourcesStar/js/bootstrap.min.js"></script>
  <script src="resourcesStar/js/jquery.easing.1.3.js"></script>
  <script src="resourcesStar/js/jquery.waypoints.min.js"></script>
  <script src="resourcesStar/js/jquery.stellar.min.js"></script>
  <script src="resourcesStar/js/owl.carousel.min.js"></script>
  <script src="resourcesStar/js/jquery.magnific-popup.min.js"></script>
  <script src="resourcesStar/js/aos.js"></script>
  <script src="resourcesStar/js/jquery.animateNumber.min.js"></script>
  <script src="resourcesStar/js/bootstrap-datepicker.js"></script>
  <script src="resourcesStar/js/jquery.timepicker.min.js"></script>
  <script src="resourcesStar/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resourcesStar/js/google-map.js"></script>
  <script src="resourcesStar/js/main.js"></script>
    
  </body>
</html>