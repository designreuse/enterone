<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 구매 상세보기 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script
	src="${pageContext.request.contextPath}/resourcesGoods/js/index.js"></script>
<style>
*, ::after, ::before {
	box-sizing: border-box;
}
.shoping__cart__table table {
	text-align: left;
}
.shoping__cart__table table tbody tr td {
    padding: 15px 25px 15px 25px;
    border-bottom: 1px solid #ebebeb;
}
.primary-btn {
    display: inline-block;
    font-size: 14px;
    padding: 10px 28px 10px;
    color: #4176E0;
    background-color: white;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 2px;
}
.primary-btn:hover {
    display: inline-block;
    font-size: 14px;
    padding: 10px 28px 10px;
    color: #022AD5;
    background-color: white;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 2px;
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
						<h3 align="center" style="padding: 15px">구매내역</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th style="text-align: center; border-bottom: 3px solid #ebebeb;">주문일자</th>
									<th style="text-align: center; border-bottom: 3px solid #ebebeb;" colspan="5">주문내역</th>
								</tr>
							</thead>
							
							<c:forEach var="buyList" items="${buyList}">
							<tbody data-no="${buyList.gb_no}">
								<tr>
									<td rowspan="3" style="width: 15%; text-align: center; border-bottom: 3px solid #ebebeb; border-right: 1px solid #ebebeb;">
										<fmt:parseDate value="${buyList.gb_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="yyyy.MM.dd" value="${date}" /><br>
										<fmt:parseDate value="${buyList.gb_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="HH시 mm분" value="${date}" />
									</td>
									<td style="width: 13%;"><b>주문번호</b></td>
									<td style="width: 22%;">${buyList.gb_no}</td>
									<td style="width: 13%;"><b>결제금액</b></td>
									<td style="width: 22%;"><fmt:formatNumber type="number" value="${buyList.gb_payment}" pattern="##,###" />원</td>
									<td rowspan="3" style="width: 15%; text-align: center; border-bottom: 3px solid #ebebeb; border-left: 1px solid #ebebeb;"><a href="#" class="primary-btn">상세보기</a></td>
								</tr>
								<tr>
									<td style="letter-spacing: 7px;"><b>수령인</b></td>
									<td>${buyList.gb_name}</td>
									<td style="letter-spacing: 7px;"><b>연락처</b></td>
									<td>${buyList.gb_phone}</td>
								</tr>
								<tr>
									<td style="border-bottom: 3px solid #ebebeb; letter-spacing: 27px;"><b>주소</b></td>
									<td colspan="3" style="border-bottom: 3px solid #ebebeb;">(${buyList.gb_zipaddress}) ${buyList.gb_address} ${buyList.gb_address2}</td>
								</tr>
							</tbody>
							</c:forEach>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->
	

<%-- 
<style>
.tit_month {
	width: 100%;
	height: 39px;
	margin: -9px 0;
	text-align: center;
}

.goods_pay_item .goods_item .goods_thumb {
	overflow: hidden;
	position: absolute;
	left: 9px;
	top: 50%;
	width: 90px;
	height: 90px;
	margin-top: -45px;
	text-align: center;
}
</style>
</head>
<body>
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title" style="margin-bottom: 0;">
						<h3 align="center" style="padding-bottom: 15px">구매내역</h3>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="buyList" items="${buyList}">
						<div>
						<p><span>주문번호</span><a href="${pageContext.request.contextPath}/goodsBuyDetail?n=${buyList.gb_no}">${buyList.gb_no}</a></p>
						<p><span>수령인</span>${buyList.gb_name}</p>
						<p><span>배송지 전화번호</span>${buyList.gb_phone}</p>
						<p><span>배송지 주소</span>(${buyList.gb_zipaddress}) ${buyList.gb_address} ${buyList.gb_address2}</p>
						<p><span>결제 금액</span><fmt:formatNumber pattern="###,###,###" value="${buyList.gb_payment}" /> 원</p>
					</div>
					


					<div class="tit_month">
						<h4>2021.01</h4>
					</div>


					<div class="goods_pay_section ">
						<div class="goods_group">
							<ul class="goods_group_list">

								<li id="_rowLi20210102182128CHK2021010248182101"
									class="goods_pay_item ">
									<div class="goods_item">
										<a href="#" class="goods_thumb"></a>
										<div class="goods_info">
											<a href="#" class="goods">
												<p class="name">주문번호 : ${buyList.gb_no}</p>
												<ul class="info">
													<li><span class="blind">상품금액 </span>
													<fmt:formatNumber pattern="###,###,###"
															value="${buyList.gb_payment}" /> 원</li>
													<li class="date"><span class="blind">상품구매날짜</span>
														${buyList.gb_time}</li>
												</ul>
											</a>
											<!--N=a:lst.detail-->

											<p class="guide">구매가 완료되었습니다. 이용해주셔서 감사합니다.</p>
										</div>
									</div>
									<div class="seller_item">
										<div class="inner">
											<span class="seller">보따리스토어</span> <span class="tel">010-4792-2530</span>
										</div>
									</div>
									<div class="button_item">
										<div class="area_layer">
											<a href="#" class="#">재구매</a>
										</div>
									</div> <input type="hidden" id="_lastId0"
									value="20201213100018CHK2020121331855751"> <input
									type="hidden" id="_hasMore0" value="true"> <input
									type="hidden" id="_interlockNosForDeliveryTracking0" value="">
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section> --%>
</body>
</html>