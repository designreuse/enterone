<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">

<style>
*, ::after, ::before {
	box-sizing: border-box;
}

.goods_type {
    position: absolute;
    top: 0%;
    right: 0%;
    background-color: white;
    color: #1c1c1c;
    padding: 5px;
}
/* ---- pagination ---- */
.pagination li {
	display: inline-block;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid gray;
	margin: 0 4px;
}

.pagination a.active {
	background-color: rgb(53, 52, 52);
	color: white;
	border: 1px solid gray;
}

.pagination a:hover:not(.active) {
	background-color: lightgray;
	color: black;
}
</style>
</head>

<body>
	<!-- Featured Section Begin -->
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title" style="margin-bottom: 0;">
						<h3 align="center" style="padding: 15px">GOODS SHOP</h3>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".cheering"><a href="#">TICKET</a></li>
							<li data-filter=".cheering"><a href="#">CHEERING</a></li>
							<li data-filter=".music"><a href="#">MUSIC</a></li>
							<li data-filter=".fashion"><a href="#">FASHION</a></li>
							<li data-filter=".acc"><a href="#">ACC</a></li>
							<li data-filter=".tech"><a href="#">TECH</a></li>
							<li data-filter=".etc"><a href="#">ETC</a></li>
						</ul>
					</div>

				</div>
			</div>

			<div class="row">
				<!-- star filtering -->
				<div class="col-xs-6 col-md-4 brandLeft" id="sidebar">
					<aside>
						<ul class="menu_go">
							<li class="menu_go_item menu_go_show"><a> <i
									class="tri_icon"></i>
									<h2>ALL</h2></a>
								<ul class="menu_go_item_child">
									<li><a title="HTML5"> <span>ALL</span></a></li>
								</ul></li>
							<li class="menu_go_item"><a> <i class="tri_icon"></i>
									<h2>JavaScript</h2>
							</a>
								<ul class="menu_go_item_child">
									<li><a> <span>AngularJS</span>
									</a></li>
									<li><a> <span>jQuery</span>
									</a></li>
									<li><a> <span>ReactJS</span>
									</a></li>
								</ul></li>
							<li class="menu_go_item"><a> <i class="tri_icon"></i>
									<h2>CSS</h2>
							</a>
								<ul class="menu_go_item_child">
									<li><a> <span>CSS3</span>
									</a></li>
								</ul></li>
						</ul>
					</aside>
				</div>

				<!-- 상품 정보 -->
				<div class="featured__filter">
					<c:forEach var="goods" items="${goodsList}">
						<div class="col-lg-3 col-md-4 col-sm-6 mix cheering music"
							style="padding: 0 5px 0 5px;">
							<div class="featured__item">
								<div class="featured__item__pic set-bg" style="position: relative;">
									<a
										href="${pageContext.request.contextPath}/goodsDetail/${goods.go_no}">
										<h7 class="goods_type">${goods.go_type}</h7>
										<img alt="이미지"
										src="${pageContext.request.contextPath}/images/goods/${goods.go_pic}">
									</a>
								</div>
								<div class="featured__item__text">
									<h6>
										<a
											href="${pageContext.request.contextPath}/goodsDetail/${goods.go_no}">[${goods.st_id}]
											${goods.go_name}</a>
									</h6>
									<h5>
										<fmt:formatNumber value="${goods.go_price}" pattern="##,###" />
										원
									</h5>
								</div>
							</div>
						</div>
					</c:forEach>


					<!-- paging -->
					<div class="col-md-12 text-center">
						<script>
							function goPage(p) {
								location.href = "goods?p=" + p
							}
						</script>
						<my:paging paging="${paging}" jsfunc="goPage" />
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resourcesGoods/js/index.js"></script>
</body>
</html>