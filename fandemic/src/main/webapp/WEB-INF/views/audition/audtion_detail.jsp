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
								src="${pageContext.request.contextPath}/images/aboard/${aboard.abo_pic}"
								alt="사진" style="height: 555px;">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${aboard.abo_title}</h3>
						<div>${aboard.abo_content}</div>
						<div>${aboard.abo_subject}</div>

						<div class="row">
							<div class="starRight">
							<c:if test="${sessionScope.member.mem_id ne null}">
								<button type="button" class="btn btn-primary py-2 px-4"
									id="btnapply" onclick="location.href='${pageContext.request.contextPath}/audition/auditionapply?no='+${aboard.abo_no}">지원하기</button>
									</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>