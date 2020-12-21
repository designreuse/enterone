<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<style>

/*----------------------------------------*/
/* Template default CSS
/*----------------------------------------*/
html, body {
	height: 100%;
	font-family: "Cairo", sans-serif;
	-webkit-font-smoothing: antialiased;
	font-smoothing: antialiased;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	color: #111111;
	font-weight: 400;
	font-family: "Cairo", sans-serif;
}

h1 {
	font-size: 70px;
}

h2 {
	font-size: 36px;
}

h3 {
	font-size: 30px;
}

h4 {
	font-size: 24px;
}

h5 {
	font-size: 18px;
}

h6 {
	font-size: 16px;
}

p {
	font-size: 16px;
	font-family: "Cairo", sans-serif;
	color: #6f6f6f;
	font-weight: 400;
	line-height: 26px;
	margin: 0 0 15px 0;
}

img {
	max-width: 100%;
}

input:focus, select:focus, button:focus, textarea:focus {
	outline: none;
}

a:hover, a:focus {
	text-decoration: none;
	outline: none;
	color: #ffffff;
}

ul, ol {
	padding: 0;
	margin: 0;
}

/*---------------------
  Checkout
-----------------------*/
.checkout {
	padding-top: 80px;
	padding-bottom: 60px;
}

.checkout h6 {
	color: #999999;
	text-align: center;
	background: #f5f5f5;
	border-top: 1px solid #6AB963;
	padding: 12px 0 12px;
	margin-bottom: 75px;
}

.checkout h6 span {
	font-size: 16px;
	color: #6AB963;
	margin-right: 5px;
}

.checkout h6 a {
	text-decoration: underline;
	color: #999999;
}

.checkout__form h4 {
	color: #1c1c1c;
	font-weight: 700;
	border-bottom: 1px solid #e1e1e1;
	padding-bottom: 20px;
	margin-bottom: 25px;
}

.checkout__form p {
	column-rule: #b2b2b2;
}

.checkout__input {
	margin-bottom: 24px;
}

.checkout__input p {
	color: #1c1c1c;
	margin-bottom: 20px;
}

.checkout__input p span {
	color: #dd2222;
}

.checkout__input input {
	width: 100%;
	height: 46px;
	border: 1px solid #ebebeb;
	padding-left: 20px;
	font-size: 16px;
	color: #b2b2b2;
	border-radius: 4px;
}

.checkout__input input.checkout__input__add {
	margin-bottom: 20px;
}

.checkout__input input::placeholder {
	color: #b2b2b2;
}

.checkout__input__checkbox {
	margin-bottom: 10px;
}

.checkout__input__checkbox label {
	position: relative;
	font-size: 16px;
	color: #1c1c1c;
	padding-left: 40px;
	cursor: pointer;
}

.checkout__input__checkbox label input {
	position: absolute;
	visibility: hidden;
}

.checkout__input__checkbox label input:checked ~.checkmark {
	background: #7fad39;
	border-color: #7fad39;
}

.checkout__input__checkbox label input:checked ~.checkmark:after {
	opacity: 1;
}

.checkout__input__checkbox label .checkmark {
	position: absolute;
	left: 0;
	top: 4px;
	height: 16px;
	width: 14px;
	border: 1px solid #a6a6a6;
	content: "";
	border-radius: 4px;
}

.checkout__input__checkbox label .checkmark:after {
	position: absolute;
	left: 1px;
	top: 1px;
	width: 10px;
	height: 8px;
	border: solid white;
	border-width: 3px 3px 0px 0px;
	-webkit-transform: rotate(127deg);
	-ms-transform: rotate(127deg);
	transform: rotate(127deg);
	content: "";
	opacity: 0;
}

.checkout__order {
	background: #f5f5f5;
	padding: 40px;
	padding-top: 30px;
}

.checkout__order h4 {
	color: #1c1c1c;
	font-weight: 700;
	border-bottom: 1px solid #e1e1e1;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.checkout__order .checkout__order__products {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	margin-bottom: 10px;
}

.checkout__order .checkout__order__products span {
	float: right;
}

.checkout__order ul {
	margin-bottom: 12px;
}

.checkout__order ul li {
	font-size: 16px;
	color: #6f6f6f;
	line-height: 40px;
	list-style: none;
}

.checkout__order ul li span {
	font-weight: 700;
	float: right;
}

.checkout__order .checkout__order__subtotal {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	border-bottom: 1px solid #e1e1e1;
	border-top: 1px solid #e1e1e1;
	padding-bottom: 15px;
	margin-bottom: 15px;
	padding-top: 15px;
}

.checkout__order .checkout__order__subtotal span {
	float: right;
}

.checkout__order .checkout__input__checkbox label {
	padding-left: 20px;
}

.checkout__order .checkout__order__total {
	font-size: 18px;
	color: #1c1c1c;
	font-weight: 700;
	border-bottom: 1px solid #e1e1e1;
	padding-bottom: 15px;
	margin-bottom: 25px;
}

.checkout__order .checkout__order__total span {
	float: right;
	color: #dd2222;
}

.checkout__order button {
	font-size: 18px;
	letter-spacing: 2px;
	width: 100%;
	margin-top: 10px;
}

</style>
</head>
<body>
	<section class="home">

		<!-- Breadcrumb Section Begin -->
		<section class="breadcrumb-section set-bg"
			data-setbg="img/breadcrumb.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<h2>주문결제</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Breadcrumb Section End -->

		<div class="container">
			<!-- 주문자 정보 (Member 테이블에서 불러오기) -->
			<div class="row">
				<div class="checkout__form">
					<h4>주문자 정보</h4>
					<form action="#">
						<div class="row">
							<div class="col-lg-8 col-md-6">
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												이름<span>*</span>
											</p>
											<input type="text">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												연락처<span>*</span>
											</p>
											<input type="text" placeholder="숫자만 입력">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												이메일<span>*</span>
											</p>
											<input type="text">
										</div>
									</div>
								</div>
								<div class="checkout__input">
									<p>
										주소<span>*</span>
									</p>
									<input type="text" placeholder="주소"
										class="checkout__input__add"> <input type="text"
										placeholder="상세 주소 및 상세 건물명" class="checkout__input__add">
									<input type="text" placeholder="우편번호">

								</div>
								
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="checkout__order">
									<h4>결제 예정 금액</h4>
									<div class="checkout__order__products">
										상품 <span>금액</span>
									</div>
									<ul>
										<li>트와이스 응원봉 <span>20,900원</span></li>
										<li>엑소 다이어리(한정) <span>30,500원</span></li>
										<li>포인트 결제 <span>-30,500원</span></li>
									</ul>
									<div class="checkout__order__total">
										합계 <span>51,400원</span>
									</div>
									<div class="checkout__input__checkbox">
										<label for="acc-or">아래 필수약관을 확인하였으며<br>결제에 동의합니다.
											<input type="checkbox" id="acc-or"> <span
											class="checkmark"></span>
										</label>
									</div>
									<p>주문 상품의 상품명, 수량, 가격, 포인트 사용, 배송 정보에 동의합니다.</p>
									<div class="checkout__input__checkbox">
										<label for="payment"> Check Payment <input
											type="checkbox" id="payment"> <span class="checkmark"></span>
										</label>
									</div>
									<button type="submit" class="site-btn">결제하기</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- 주문자 정보 끝 -->

			<!-- 배송 정보 입력 -->
			<div class="row">
				<div class="checkout__form">
					<h4>배송 정보</h4>
					<label class="c_order_checkbox">
                        <input type="checkbox" onclick="javascript:copyOrgInfo(true);">
                        <span>주문자 정보와 동일</span>
                    </label>
					<form action="#">
						<div class="row">
							<div class="col-lg-8 col-md-6">
								<div class="row">
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												이름<span>*</span>
											</p>
											<input type="text" placeholder="배송받을 사람">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="checkout__input">
											<p>
												연락처<span>*</span>
											</p>
											<input type="text" placeholder="숫자만 입력">
										</div>
									</div>
								</div>
								<div class="checkout__input">
									<p>
										주소<span>*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button>주소찾기</button>
									</p>
									<input type="text" placeholder="주소"
										class="checkout__input__add"> <input type="text"
										placeholder="상세 주소 및 상세 건물명" class="checkout__input__add">
									<input type="text" placeholder="우편번호">
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