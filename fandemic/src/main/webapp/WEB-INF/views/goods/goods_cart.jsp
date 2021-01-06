<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 장바구니 페이지</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {

		/*-------------------
		Quantity change
		--------------------- */
		var proQty = $('.pro-qty');
		proQty.prepend('<span class="dec qtybtn">-</span>');
		proQty.append('<span class="inc qtybtn">+</span>');
		proQty.on('click', '.qtybtn', function() {
			var $button = $(this);
			var oldValue = $button.parent().find('input').val();
			if ($button.hasClass('inc')) {
				var newVal = parseFloat(oldValue) + 1;
			} else {
				// Don't allow decrementing below zero
				if (oldValue > 0) {
					var newVal = parseFloat(oldValue) - 1;
				} else {
					newVal = 0;
				}
			}
			$button.parent().find('input').val(newVal);
			console.log($button.parent().find('input').val()); // 변경된 수량
		});

	});
</script>
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
							<c:forEach var="cart" items="${cartList}">
							<tbody>
								<tr>
									<td class="shoping__cart__item"><img
										src="https://ygselect.com/web/product/tiny/202011/f2287d2606d8f8b6662ac945ecfb9679.jpg"
										alt="" style="width: 100px; height: 100px;">
										<h5>${cart.cart_no}</h5>
									</td>
									<td class="shoping__cart__price">${goods.go_price}원</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty" style="width: 110px;">
												<input type="text" value="1">
											</div>
											<input type="button" value="수정" style="height: 40px; background: #f5f5f5; border: none; padding-left: 15px; padding-right: 15px;">
										</div>
									</td>
									<td class="shoping__cart__total">39,000원</td>
									<td class="shoping__cart__item__close" style="text-align: center;">
										<span class="icon_close">x</span>
									</td>
								</tr>
							</tbody>
							</c:forEach>
							
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
	
	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/resourcesGoods/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesGoods/js/main.js"></script>
	
</body>
</html>