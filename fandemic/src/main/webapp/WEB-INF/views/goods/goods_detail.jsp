<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 상세보기 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resourcesGoods/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resourcesGoods/js/main.js"></script>

<script>

	$(function() {
		var amount = $('.pro-qty').children('input').val();
		console.log(amount);
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
				if (oldValue > 1) {
					var newVal = parseFloat(oldValue) - 1;
				} else {
					newVal = 1;
				}
			}
			$button.parent().find('input').val(newVal); // 변경된 수량
			amount = newVal;
			console.log("수량: " + newVal);
		});
	
		/*-------------------
		Cart Insert
		--------------------- */
		$('#cart').on('click', function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/goodsDetail',
				type : 'GET',
				data : { go_no : '${goods.go_no}', cart_qty : amount },
				success :
					alert("장바구니에 추가되었습니다.")
					
			})
		})
		
	});

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
								src="${pageContext.request.contextPath}/images/goods/${goods.go_pic}"
								alt="사진" style="height: 555px;">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
							<h3>${goods.go_name}</h3>
							<div class="product__details__price">
								<fmt:formatNumber value="${goods.go_price}" pattern="##,###" />
								원
							</div>

							<c:choose>
								<%-- 예매 상세 --%>
								<c:when test="${goods.go_type eq 'TICKET'}">
									<ul>
										<li><b>공연 기간</b> <span> <fmt:parseDate
													value="${goods.go_untsdate}" var="date"
													pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
													pattern="yyyy년 MM월 dd일" value="${date}" /> ~
										</span> <span> <fmt:parseDate value="${goods.go_untedate}"
													var="date" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
													pattern="yyyy년 MM월 dd일" value="${date}" /></span></li>
										<li><b>공연 시간</b> <span>${goods.go_unttime}</span></li>
										<li><b>제한 인원</b> <span>${goods.go_stock}명</span></li>
										<li><b>주최</b> <span>${goods.com_id}</span></li>
										<li
											style="font-size: 15px; line-height: 25px; margin-top: 20px;">
											<span>※ 본 콘텐츠는 생중계 프로그램으로 정확한 시작 및 종료 시각은 연결 상황에 따라
												변동될 수 있으며, 통신 환경에 따라 음향 및 화면 중계가 고르지 않을 수 있는 점 양해 부탁드립니다.</span>
										</li>
									</ul>
								</c:when>

								<%-- 굿즈 상세 --%>
								<c:otherwise>
									<ul>
										<li><b>카테고리</b> <span>${goods.go_type}</span></li>
										<li><b>소속사</b> <span>${goods.com_id}</span></li>
										<li><b>스타</b> <span>${goods.st_id}</span></li>
										<li><b>등록일</b> <span> <fmt:parseDate
													value="${goods.go_time}" var="date"
													pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
													pattern="yyyy년 MM월 dd일" value="${date}" /></span></li>
										<li><b>주문 가능 수량</b> <span>${goods.go_stock}</span></li>
									</ul>
								</c:otherwise>
							</c:choose>

							<div class="product__details_orderform">
								<div class="product__details__quantity">
									<div class="quantity">
										<div class="pro-qty">
										
											<input type="text" value="1" id="go_qty">
										</div>
									</div>
								</div>
								<a href="#" class="primary-btn" id="cart">장바구니</a>
								<a href="#" class="primary-btn" id="buy" style="background-color: #022AD5;">바로구매</a>
							</div>
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
						<div class="product__details__tab__desc"
							style="text-align: center;">
							<p>${goods.go_content}</p>
							<br> <img alt="상품상세사진"
								src="${pageContext.request.contextPath}/images/goods/${goods.go_detail}"
								style="width: 80%;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	
</body>
</html>