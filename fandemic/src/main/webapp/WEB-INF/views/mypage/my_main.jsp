<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
<meta name="author" content="Kodinger">
<meta name="keyword"
	content="magz, html5, css3, template, magazine template">
<!-- Shareable -->
<title>EnterOne 마이페이지</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet" href="scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/skins/all.css">
<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none
}

.w3-left, .w3-right, .w3-badge {
	cursor: pointer
}

.w3-badge {
	height: 13px;
	width: 13px;
	padding: 0
}
</style>
</head>

<body>


	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-4 sidebar" id="sidebar">
					<!-- 						side bar -->
					<aside>
						<div class="aside-body" style="position: fixed">
							<h1>마이페이지</h1>
							<table>
								<tr>
									<td>회원등급</td>
									<td>vip</td>
								</tr>
								<tr>
									<td>활동포인트</td>
									<td>vip</td>
								</tr>
								<tr>
									<td><a href="myupdate">내정보 수정</a></td>
								</tr>
								<tr>
									<td><a href="mystar">내 스타 관리</a></td>
								</tr>
								<tr>
									<td><a href="mytrainee">연습생 정보 관리</a></td>
								</tr>
								<tr>
									<td><a href="mypurchase">결제내역</a></td>
								</tr>
								<tr>
									<td><a href="myevent">이벤트 참여내역</a></td>
								</tr>
								<tr>
									<td><a href="mymail">쪽지함</a></td>
								</tr>
								<tr>
									<td><a href="my1o1">1:1 문의 내역</a></td>
								</tr>
							</table>

						</div>
					</aside>
				</div>




				<div class="col-md-8" style="margin-left: 30%">

					<div class="line">
						<div>내 스타 목록</div>
					</div>
					<div class="w3-content w3-display-container">
						<img class="mySlides" src="img_nature.jpg"> <img
							class="mySlides" src="img_snowtops.jpg"> <img
							class="mySlides" src="img_mountains.jpg">
						<h1>여기에 스타 목록</h1>
						<div class="w3-center w3-display-bottommiddle" style="width: 100%">
							<div class="w3-left" onclick="plusDivs(-1)">&#10094;</div>
							<div class="w3-right" onclick="plusDivs(1)">&#10095;</div>
							<span class="w3-badge demo w3-border" onclick="currentDiv(1)"></span>
							<span class="w3-badge demo w3-border" onclick="currentDiv(2)"></span>
							<span class="w3-badge demo w3-border" onclick="currentDiv(3)"></span>
						</div>
					</div>

					<div class="line">
						<div>최근 구매 내역</div>
					</div>
					<div class="row">
						<h1>최근 구매내역 들어가는곳</h1>
					</div>
					<div class="line">
						<div>이벤트 참여 내역</div>
					</div>
					<div class="row">
						<h1>이벤트</h1>
					</div>
					<div class="line">
						<div>쪽지</div>
					</div>
					<div class="row">
						<h1>쪽지 나오는곳</h1>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- JS -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.migrate.js"></script>
	<script src="scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script src="scripts/jquery-number/jquery.number.min.js"></script>
	<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="scripts/toast/jquery.toast.min.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/e-magz.js"></script>
</body>
</html>
