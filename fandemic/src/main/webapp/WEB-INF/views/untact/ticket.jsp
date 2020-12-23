<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언택트 행사 상세내용</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/style.css">
<style>
*, ::after, ::before {
	box-sizing: border-box;
}
.product__details__text ul {
    border-top: 1px solid #ebebeb;
    padding-top: 30px;
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
								src="http://tkfile.yes24.com/upload2/PerfBlog/202012/20201214/20201214-38170.jpg"
								alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel">
							<img data-imgbigurl="img/product/details/product-details-2.jpg"
								src="img/product/details/thumb-1.jpg" alt=""> <img
								data-imgbigurl="img/product/details/product-details-3.jpg"
								src="img/product/details/thumb-2.jpg" alt=""> <img
								data-imgbigurl="img/product/details/product-details-5.jpg"
								src="img/product/details/thumb-3.jpg" alt=""> <img
								data-imgbigurl="img/product/details/product-details-4.jpg"
								src="img/product/details/thumb-4.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>뮤지컬 [노트르담 드 파리] 프렌치 오리지널 내한</h3>

						<div class="product__details__price">66,000원</div>
						<p>
							예매일 : 2020년 12월 24일<br>
							공연일 : 2021년 1월 24일<br>
							공연시간 : 화~금 8시 / 토~일 2시, 6시 30분 / 월 공연없음
						</p>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<span class="dec qtybtn">-</span> <input type="text" value="1">
									<span class="inc qtybtn">+</span>
								</div>
							</div>
						</div>
						<a href="goodsCart" class="primary-btn">ADD TO CART</a>
						<ul>
							<li><b>카테고리</b> <span>CHEERING</span></li>
							<li><b>소속사</b> <span>YG Entertainment</span></li>
							<li><b>스타</b> <span>BLACK PINK</span></li>
							<li><b>등록일</b> <span>2020년 12월 24일</span></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="line">
						<div>상품정보</div>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="product__details__tab__desc">
							<p>
								예매일 : 2020년 12월 24일<br>
								공연일 : 2021년 1월 24일<br>
								공연시간 : 화~금 8시 / 토~일 2시, 6시 30분 / 월 공연없음
							</p>
							<br> <img alt="상품상세사진"
								src="http://ticketimage.interpark.com/Play/image/etc/20/20007700-03.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
</body>
</html>