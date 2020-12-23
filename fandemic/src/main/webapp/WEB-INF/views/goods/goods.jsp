<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resourcesGoods/style.css">
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
				<div class="col-lg-3 col-md-4 col-sm-6 mix cheering music">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/resources/images/featured/feature-1.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">BLACKPINK OFFICIAL LIGHT STICK Ver.2 LIMITED EDITION</a>
							</h6>
							<h5>39,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fashion acc">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/featured/feature-2.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/shop1_c33729a601d62f88e2a44bb41dcabf3a.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">[iDECIDE] iKON SLOGAN TOWEL</a>
							</h6>
							<h5>18,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fashion music">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/featured/feature-3.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/shop1_2c000855bae1eedc46bbd4e3a7d70ee5.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">[SAILING] AKMU SAILING LIGHT STICK VER.2</a>
							</h6>
							<h5>12,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix acc cheering">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/featured/feature-4.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/shop1_58a00de68f7fad7aa67de3f4a827bd3f.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">[CROSS] WINNER LIGHT STICK POUCH</a>
							</h6>
							<h5>25,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix cheering music">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/resources/images/featured/feature-1.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">BLACKPINK OFFICIAL LIGHT STICK Ver.2 LIMITED EDITION</a>
							</h6>
							<h5>39,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fashion acc">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/featured/feature-2.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/shop1_c33729a601d62f88e2a44bb41dcabf3a.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">[iDECIDE] iKON SLOGAN TOWEL</a>
							</h6>
							<h5>18,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fashion music">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/featured/feature-3.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/shop1_2c000855bae1eedc46bbd4e3a7d70ee5.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">[SAILING] AKMU SAILING LIGHT STICK VER.2</a>
							</h6>
							<h5>12,000원</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix acc cheering">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/featured/feature-4.jpg">
							<a href="goodsDetail">
							<img alt="" src="https://ygselect.com/web/product/tiny/shop1_58a00de68f7fad7aa67de3f4a827bd3f.jpg"></a>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">[CROSS] WINNER LIGHT STICK POUCH</a>
							</h6>
							<h5>25,000원</h5>
						</div>
					</div>
				</div>


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