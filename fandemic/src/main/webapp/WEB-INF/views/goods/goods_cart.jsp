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
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resourcesGoods/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resourcesGoods/js/main.js"></script>
<script>
	$(function() {
		
		/*-------------------
		합계 금액 계산, 결제 예정 금액
		--------------------- */
		var amount = 0;
		var total = 0;
		var ttotal=0;
		/*-------------------
		Quantity change
		--------------------- */
		var proQty = $('.pro-qty');
		proQty.prepend('<span class="dec qtybtn">-</span>');
		proQty.append('<span class="inc qtybtn">+</span>');
		
		proQty.on('click', '.qtybtn', function() {
			var $button = $(this);
			var oldValue = $button.parent().find('input').val();
			var tr = $button.parent().parent().parent().parent();
			var price = tr.find('.shoping__cart__price').children().val();
			// + 버튼 클릭시 수량 증가
			if ($button.hasClass('inc')) {
				var newVal = parseFloat(oldValue) + 1;
			// - 버튼 클릭시 수량 감소 (최소값 1)
			} else {
				if (oldValue > 1) {
					var newVal = parseFloat(oldValue) - 1;
				} else {
					newVal = 1;
				}
			}
			$button.parent().find('input').val(newVal); // 변경된 수량
			amount = newVal;
			ttotal+=total = price * amount;
			tr.find('.ptotal').val(total+'원'); // 변경된 수량에 따른 합계 금액 변경
			tr.find('.totalSum').val(30000+'원');
			// console.log("수량: " + newVal);
		});
		
		//천단위 콤마 함수
/* 		function addComma(value){
		     value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		     return value; 
		 } */
		

		/*-------------------
		수량 Update
		--------------------- */
		$('.btnCartUpdate').on('click', function() {
			var cart_no = $(this).data("no");

			$.ajax({
				url : '${pageContext.request.contextPath}/cart/update',
				type : 'POST',
				data : { cart_no : cart_no , cart_qty : amount },
				success :function(response) {
					if(response == true) {
						alert("수량이 변경되었습니다.");
						location.reload(); //장바구니 화면 재출력
					}
				}, error : function(xhr, status){
					alert("status: " + status);
				}
			});
		});
		
			
		/*-------------------
		Cart Delete
		--------------------- */
		$('.btnCartDelete').on('click', function() {
			var cart_no = $(this).data("no");
			// console.log(cart_no)
			if(confirm("선택한 항목을 장바구니에서 삭제하시겠습니까?") == true){
				$.ajax({
					url : '${pageContext.request.contextPath}/cart/delete',
					type : 'POST',
					data : { cart_no : cart_no },
					success : function(response) {
						if(response == true) {
							alert("삭제되었습니다.");
							location.reload(); //장바구니 화면 재출력
						}
					},
					error : function(xhr, status, message){
						alert("status: " + status + ", error: " + message);
					}
				});
			} else {
				alert("삭제가 취소되었습니다.");
			}
		});
 

	});
</script>
<style>
*, ::after, ::before {
	box-sizing: border-box;
}

.ptotal {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	width: 100px;
	border: none;
	text-align: right;
}

.totalSum {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	width: 100px;
	border: none;
	text-align: right;
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
							<c:forEach var="cart" items="${cart}">
							<tbody data-no="${cart.cart_no}">
								<tr>
									<td class="shoping__cart__item">
									<a href="${pageContext.request.contextPath}/goodsDetail/${cart.go_no}">
									<img
										src="${pageContext.request.contextPath}/images/goods/${cart.go_pic}"
										alt="이미지" style="width: 100px; height: 100px;"></a>
										<a href="${pageContext.request.contextPath}/goodsDetail/${cart.go_no}"><h5>${cart.go_name}</h5></a>
									</td>
									<td class="shoping__cart__price"><fmt:formatNumber type="number" value="${cart.go_price}" pattern="##,###" />원<button value="${cart.go_price}" style="display: none;"></button></td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty" style="width: 110px;">
												<input type="text" value="${cart.cart_qty}">
											</div>
											<input type="button" class="btn btnCartUpdate" value="수정" data-no="${cart.cart_no}" style="height: 40px; background: #f5f5f5; border: none; padding-left: 15px; padding-right: 15px;">
										</div>
									</td>
									<td class="shoping__cart__total"><fmt:formatNumber var="pt" value="${cart.ptotal}" pattern="##,###" /><input type="text" value="${pt}원" class="ptotal"></td>
									<td class="shoping__cart__item__close" style="text-align: center;">
										<span class="icon_close"><button type="button" class="btn btnCartDelete" data-no="${cart.cart_no}" style="background-color: transparent;">x</button></span>
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
							<li>결제 예정 금액 <span><input type="text" value="${ttotal}" class="totalSum"></span></li>
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