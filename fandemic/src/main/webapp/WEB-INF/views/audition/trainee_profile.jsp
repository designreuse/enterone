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
						<h3>${activity.ac_title}</h3>
						<h5>${activity.ac_time}</h5>
						<div style="margin-top: 35px;">
						<h4>${activity.ac_content}</h4></div>
						
						<ul>
							<li><b>좋아요 수</b> <span>${activity.ac_likes}</span></li>
							<li><b>조회수</b> <span>${activity.ac_hits}</span></li>
						</ul>

						<div class="row">
							<div class="starRight" style="margin-left: 500px; margin-top: -75px;">
							<c:if test="${sessionScope.member.mem_id eq activity.mem_id}">
								<button type="button" class="btn btn-primary py-2 px-4"
									id="btnUpdateactivity" onclick="location.href='${pageContext.request.contextPath}/audition/activityupdate'">수정</button></c:if>
									<button type="button" class="btn btn-primary py-2 px-4" style="margin-top:8px;" onclick="location.href='${pageContext.request.contextPath}/audition/auditionwork'">목록</button>
									
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>