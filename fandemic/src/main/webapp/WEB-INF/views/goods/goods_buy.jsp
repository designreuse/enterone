<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Goods 구매/결제 페이지</title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<script>
$(document).ready(function() {
	// 주소검색 버튼클릭
	$('#btnAddrGo').on('click',function(){ 
		openDaumZipAddress($("#ship_zipAddress"), $("#ship_address"));
	});
	
	$('#sameControl').click(function(){
		var same = this.checked;
		$('#ship_name').val(same ? $('#mem_name').val():'');
		$('#ship_phone').val(same ? $('#mem_phone').val():'');
		$('#ship_address').val(same ? $('#mem_address').val():'');
		$('#ship_address2').val(same ? $('#mem_address2').val():'');
		$('#ship_zipAddress').val(same ? $('#mem_zipAddress').val():'');

		if(same == true){
			$('#btnAddrGo').prop("disabled", true);
			$('.checkout__form input').filter('input:text')
									  .attr('readonly',true)
									  .css('opacity', 0.5);
		} else {
			$('#btnAddrGo').prop("disabled", false);
			$('.checkout__form input').filter('input:text')
									  .attr('readonly',false)
									  .css('opacity', 1);
		}
	});
	
	$('#btnPay').click(function(){
		if($('#chkAccept').prop('checked') == false){
	    	alert('필수 약관에 동의 하셔야 합니다.');
		}		
		else {
			if ( $('#ship_name').val() == null || $('#ship_name').val() == "" ||
				 $('#ship_phone').val() == null || $('#ship_phone').val() == "" ||
				 $('#ship_address').val() == null || $('#ship_address').val() == "" ||
				 $('#ship_address2').val() == null || $('#ship_address2').val() == "" ||
				 $('#ship_zipAddress').val() == null || $('#ship_zipAddress').val() == "" ) {
				alert('배송 정보를 모두 입력해주세요.');
			} else {
				alert('결제 진행');
				//$(location).attr('href','#');
			}
		}
	});
	
});

// 주소검색
function openDaumZipAddress(ship_zipAddress, ship_address) {
	new daum.Postcode({
		oncomplete:function(data) {
			$(ship_zipAddress).val(data.zonecode); 
			$(ship_address).val(data.address); // 주소
		}
	}).open();
}

</script>
</head>

<body>
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title" style="margin-bottom: 0;">
						<h5 align="center" style="padding-top: 15px; padding-bottom: 5px;">GOODS</h5>
						<h3 align="center" style="padding-bottom: 15px">주문 / 결제</h3>
					</div>
				</div>
			</div>
			<!-- 주문자 정보 (Member 테이블에서 불러오기) -->
			
			<div class="row">
				<div class="checkout__form">
					<h4>주문자 정보</h4>
					<form action="#">
						<div class="row">
							<div class="col-lg-8 col-md-6" style="width: 60%;">
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												이름
											</p>
											<input type="text" value="${member.mem_name}" id="mem_name" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												연락처
											</p>
											<input type="text" value="${member.mem_phone}" id="mem_phone" readonly="readonly">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												이메일
											</p>
											<input type="text" value="${member.mem_email}" id="mem_email" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="checkout__input">
									<p>
										주소
									</p>
									<input type="text" value="${member.mem_address}" id="mem_address" readonly="readonly" class="checkout__input__add">
									<input type="text" value="${member.mem_address2}" id="mem_address2" readonly="readonly" class="checkout__input__add">
									<input type="text" value="${member.mem_zipAddress}" id="mem_zipAddress" readonly="readonly">
	
								</div>
								
							</div>
							<div class="col-lg-4 col-md-6" style="width: 40%;">
								<div class="checkout__order">
									<h4>결제 예정 금액</h4>
									<div class="checkout__order__products row">
										<div class = "col-md-8 col-sm-8 col-xs-8">상품</div>
										<div class = "col-md-2 col-sm-2 col-xs-2" style="text-align: left;">수량</div>
										<div class = "col-md-2 col-sm-2 col-xs-2" style="text-align: right;">금액</div>
									</div>
									<div class = "row" style="font-size: 16px; line-height: 32px; margin-bottom: 15px;">
										<c:set var="totalsum" value="0"/>
										<c:forEach var="order" items="${order}">
											<div class = "col-md-8 col-sm-8 col-xs-8">${order.go_name}</div>
											<div class = "col-md-1 col-sm-1 col-xs-1">${order.cart_qty}ea</div>
											<div class = "col-md-3 col-sm-3 col-xs-3" style="text-align: right; font-weight: 700;"><fmt:formatNumber value="${order.ptotal}" pattern="##,###" />원</div>
										<c:set var="totalsum" value="${totalsum + order.ptotal}"/>
										</c:forEach>
										
									</div>
									<div class="checkout__order__total">
										합계 <span><fmt:formatNumber var="totalsum" value="${totalsum}" pattern="##,###" /><c:out value="${totalsum}원"/></span>
									</div>
									<div class="checkout__input__checkbox">
										<input type="checkbox" class="chkAccept" id="chkAccept">
										<label for="acc-or">아래 약관을 확인하였으며 결제에 동의합니다. <span style="color: #dd2222;"> *</span></label>
									</div>
									<p>주문 상품의 상품명, 수량, 가격, 포인트 사용, 배송 정보를 확인하였으며, 구매 진행에 동의합니다.</p>
									<button type="submit" class="site-btn" id="btnPay">결제하기</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<!-- 주문자 정보 끝 -->
	
			<!-- 배송 정보 입력 -->
			<div class="row" style="padding-bottom: 20px; margin-bottom: 25px;">
				<div class="checkout__form">
					<h4 style="padding-top: 20px; margin-top: 25px;">배송 정보&nbsp;&nbsp;&nbsp;
					<label class="c_order_checkbox" style="padding-bottom: 15px;">
	                       <input type="checkbox" id="sameControl">
	                       <span style="font-size: 16px;">주문자 정보와 동일</span>
	                   </label> </h4>
					<form action="#">
						<div class="row">
							<div class="col-lg-8 col-md-6" style="width: 60%;">
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input ship">
											<p>
												이름<span>*</span>
											</p>
											<input type="text" id="ship_name" placeholder="배송받을 사람">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												연락처<span>*</span>
											</p>
											<input type="text" id="ship_phone" placeholder="배송정보를 받을 연락처">
										</div>
									</div>
								</div>
								<div class="checkout__input">
									<p>
										주소<span>*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button id="btnAddrGo" class="site-btn"
										style="padding: 5px 10px 5px 10px; border: solid 1px #4176E0; background-color: white; color: #4176E0;">주소찾기</button>
									</p>
									<input type="text" placeholder="주소" class="checkout__input__add" id="ship_address">
									<input type="text" placeholder="상세 주소 및 상세 건물명" class="checkout__input__add" id="ship_address2">
									<input type="text" placeholder="우편번호" id="ship_zipAddress">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- 배송 정보 입력 끝 -->
		</div>
	</section>
</body>
</html>