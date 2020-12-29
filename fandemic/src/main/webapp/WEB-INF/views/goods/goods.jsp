<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<style>
*, ::after, ::before {
	box-sizing: border-box;
}
</style>
</head>

<body>
	<!-- Featured Section Begin -->
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h3 align="center" style="padding: 15px">GOODS SHOP</h3>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".cheering">CHEERING</li>
							<li data-filter=".music">MUSIC</li>
							<li data-filter=".fashion">FASHION</li>
							<li data-filter=".acc">ACC</li>
							<li data-filter=".tech">TECH</li>
							<li data-filter=".etc">ETC</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="row featured__filter">
			
				<c:forEach var="goods" items="${goodsList}">
				<div class="col-lg-3 col-md-4 col-sm-6 mix cheering music">
					<div class="featured__item">
						<div class="featured__item__pic set-bg">
							
							<a href="${pageContext.request.contextPath}/goodsDetail/${goods.go_no}">
							<img alt="이미지" src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"></a>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="${pageContext.request.contextPath}/goodsDetail/${goods.go_no}">${goods.go_name}</a>
							</h6>
							<h5>
							<fmt:formatNumber value="${goods.go_price}" pattern="##,###"/>원</h5>
						</div>
					</div>
				</div>
				</c:forEach>
				
				<div class="col-md-12 text-center">
					<ul class="pagination">
						<li class="prev"><a href="#"><i
								class="ion-ios-arrow-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">...</a></li>
						<li><a href="#">97</a></li>
						<li class="next"><a href="#"><i
								class="ion-ios-arrow-right"></i></a></li>
					</ul>
				</div>

			</div>
		</div>
	</section>
	<!-- Featured Section End -->

</body>
</html>