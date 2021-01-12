<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습생 상세프로필</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- Js Plugins -->
<script
	src="${pageContext.request.contextPath}/resourcesGoods/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resourcesGoods/js/main.js"></script>

<script>
	
</script>

<style>
*, ::after, ::before {
	box-sizing: border-box;
}

.product__details__text ul {
	border-top: 1px solid #ebebeb;
	padding-top: 40px;
	margin-top: 36px;
}

.product__details_orderform {
	border-top: 1px solid #ebebeb;
	padding-top: 40px;
	margin-top: 36px;
}
</style>
</head>
<body>
	<!-- Product Details Section Begin -->
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${pageContext.request.contextPath}/images/audition/${activity.ac_file}"
								alt="사진" style="height: 555px;">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>제목</h3>
						<div>내용</div>
						<ul>
							<li><b>좋아요 수</b> <span>${goods.go_type}</span></li>
							<li><b>조회수</b> <span>${goods.com_id}</span></li>
						</ul>
						<div class="product__details_orderform">
							<div class="product__details__quantity"></div>
							<button type="button" class="primary-btn" id="like">좋아요</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>