<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Goods 장바구니 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/style.css">

<style>
*, ::after, ::before {
	box-sizing: border-box;
}
</style>
</head>
<body>
	<!-- Shopping Cart Section Begin -->
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h3 align="center" style="padding: 15px">SHOPPING CART</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">상품명</th>
									<th class="shoping__product">가격</th>
									<th class="shoping__product">수량</th>
									<th class="shoping__product">합계금액</th>
									<th class="shoping__product">삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="shoping__cart__item"><img
										src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"
										alt="" style="width: 100px; height: 100px;">
										<h5>BLACKPINK OFFICIAL LIGHT STICK Ver.2 LIMITED EDITION</h5>
									</td>
									<td class="shoping__cart__price">39,000원</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<span class="dec qtybtn">-</span> <input type="text"
													value="1"> <span class="inc qtybtn">+</span>
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">39,000원</td>
									<td class="shoping__cart__item__close" style="text-align: center;"><span
										class="icon_close">x</span></td>
								</tr>
								<tr>
									<td class="shoping__cart__item"><img
										src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"
										alt="" style="width: 100px; height: 100px;">
										<h5>[iDECIDE] iKON SLOGAN TOWEL</h5></td>
									<td class="shoping__cart__price">39,000원</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<span class="dec qtybtn">-</span> <input type="text"
													value="1"> <span class="inc qtybtn">+</span>
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">39,000원</td>
									<td class="shoping__cart__item__close" style="text-align: center;"><span
										class="icon_close">x</span></td>
								</tr>
								<tr>
									<td class="shoping__cart__item"><img
										src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"
										alt="" style="width: 100px; height: 100px;">
										<h5>[SAILING] AKMU SAILING LIGHT STICK VER.2</h5></td>
									<td class="shoping__cart__price">39,000원</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<span class="dec qtybtn">-</span> <input type="text"
													value="1"> <span class="inc qtybtn">+</span>
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">39,000원</td>
									<td class="shoping__cart__item__close" style="text-align: center;"><span
										class="icon_close">x</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6" style="width: 40%; float: right;">
					<div class="shoping__checkout">
						<ul>
							<li>결제 예정 금액 <span>39,000 원</span></li>
						</ul>
						<a href="#" class="primary-btn">결제하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->
</body>
</html>