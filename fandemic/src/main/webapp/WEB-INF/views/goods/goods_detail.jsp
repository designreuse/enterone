<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 상세보기 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesGoods/style.css">
<!-- <script>
$(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num--;
	if(num<=0){
	alert('더이상 줄일수 없습니다.');
	num =1;
	}
	$('#numberUpDown').text(num);
	});
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num++;

	if(num>5){
	alert('더이상 늘릴수 없습니다.');
	num=5;
	}
	$('#numberUpDown').text(num);
	});
	});

</script> -->
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
								src="https://ygselect.com/web/product/extra/small/202011/8295548b9dc27357a7304086ec6b6340.jpg"
								alt="" style="width: 555px; height: 555px;">
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
						<h3>BLACKPINK OFFICIAL LIGHT STICK Ver.2 LIMITED EDITION</h3>

						<div class="product__details__price">39,000원</div>
						<p>
							제품 구성 : 응원봉 + 크래들 + 스트랩<br>* 1회 최대 구매가능 수량은 19개입니다.<br>*
							한 ID당 여러 건 주문 가능합니다.<br>* 상품은 출고일 이후 순차 출고됩니다.
						</p>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<span class="dec qtybtn">-</span> <input type="text" value="1">
									<span class="inc qtybtn">+</span>
								</div>
								
								<!-- 
								<div class="number">
									<span id="numberUpDown">1</span>
									<a href="#" id="increaseQuantity">수량 올림</a>
 									<a href="#" id="decreaseQuantity">수량 내림</a>

								</div>
								 -->
								
								
							</div>
						</div>
						<a href="goodsCart" class="primary-btn">장바구니</a>
						<a href="goodsBuy" class="primary-btn" style="background-color: #022AD5;">바로구매</a>
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
								블랙핑크 라이브스트림 콘서트 'THE SHOW' 멤버십 오픈 기념 블랙핑크 응원봉 Ver.2 LIMITED
								EDITION 추가 제작!<br> * 1회 구매당 최대 주문가능수량은 19개입니다. (한 ID당 여러 건
								주문 가능)<br> * 상품은 결제완료 기준으로 순차 출고됩니다.<br> * 상품 판매일정 :
								12월 8일(화) 이후 주문건 → 12월 21일(월) 순차 출고<br>
								<br> YG PALM STAGE - 2020 BLACKPINK: THE SHOW<br>
								▸2021.01.31 2PM (KST)<br> ▸On YouTube<br> Buy Access @
								www.youtube.com/c/BlackPinkOfficial/join<br> More info @
								https://bit.ly/THESHOWMOREINFO<br>
								<br> [NOTICE]<br> * 배터리 저전력 시, 색상이 흐려지거나 색상이 다소 다르게
								출력될 수 있습니다.<br> * 본 제품은 특정 음원에 반응하는 응원봉으로 최초 구매하신 제품에는 음원
								반응 데이터가 입력되어 있지 않습니다.<br> * 사용 전, APP을 이용하여 소프트웨어,
								공연정보(음원반응 데이터)를 업데이트를 해주세요. 업데이트 후, 재부팅 시에는 버튼을 길게 2초 동안 눌러 전원을
								켭니다.<br> * 해당하는 데이터를 다운로드 하지 않을 시, 반응이 없거나 연출이 상이할 수 있습니다.<br>
								* 응원봉에 음원을 인식하는 MIC가 내장 되어 있습니다. 인식을 방해하는 이어폰 착용이나 주변의 시끄러운 소음으로
								인하여 반응이 원활하지 않을 수 있습니다.<br> * 작동 환경에 따라 응원봉 음원 인식 반응이 원활하지
								않을 수 있으며, 이는 상품 불량이 아니므로 교환, 반품 대상이 되지 않습니다.
							</p>
							<br> <img alt="상품상세사진"
								src="https://ygselect.com/web/upload/NNEditor/20201112/detail_01_shop1_140904.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
</body>
</html>