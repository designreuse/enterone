<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 상세보기 페이지</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function () {
		
	/*-------------------
	Quantity change
	--------------------- */
	var proQty = $('.pro-qty');
	proQty.prepend('<span class="dec qtybtn">-</span>');
	proQty.append('<span class="inc qtybtn">+</span>');
	proQty.on('click', '.qtybtn', function () {
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
	});

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

						<div class="product__details__price"><fmt:formatNumber value="${goods.go_price}" pattern="##,###"/>원</div>
						<ul>
							<li><b>카테고리</b> <span>${goods.go_type}</span></li>
							<li><b>소속사</b> <span>${goods.com_id}</span></li>
							<li><b>스타</b> <span>${goods.st_id}</span></li>
							<li><b>등록일</b>
								<span> <fmt:parseDate value="${goods.go_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${date}"/></span>
							</li>
							<li><b>주문 가능 수량</b> <span>${goods.go_stock}</span></li>
						</ul>
						<div class="product__details_orderform">
	 						<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</div>
							<a href="goodsCart" class="primary-btn">장바구니</a>
							<a href="goodsBuy" class="primary-btn" style="background-color: #022AD5;">바로구매</a>
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
						<div class="product__details__tab__desc" style="text-align: center;">
							<p>
								${goods.go_content}
							</p>
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
	
	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/resourcesGoods/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesGoods/js/main.js"></script>
    
</body>
</html>