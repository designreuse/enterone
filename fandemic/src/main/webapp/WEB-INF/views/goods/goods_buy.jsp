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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/style.css">
</head>

<body>
	<section class="home">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h5 align="center" style="padding-top: 15px; padding-bottom: 5px;">GOODS</h3>
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
									<button type="submit" class="site-btn">결제하기</button>
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
					<h4 style="padding-top: 20px; margin-top: 25px;">배송 정보</h4>
					<label class="c_order_checkbox" style="padding-bottom: 15px;">
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