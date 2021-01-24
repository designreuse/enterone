<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 구매 상세보기 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<script src="${pageContext.request.contextPath}/resourcesGoods/js/index.js"></script>

<script>

</script>

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
    padding: 10px 15px 10px;
    color: #4176E0;
    background-color: white;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 2px;
}
.primary-btn:hover {
    display: inline-block;
    font-size: 14px;
    padding: 10px 15px 10px;
    color: #022AD5;
    background-color: white;
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: 2px;
}
.modal-dialog {
	width: 1000px;
	margin: 15% auto;
}
/* Important part */
.modal-content{
	overflow-y: initial !important;
}
.modal-body{
	height: 250px;
	overflow-y: auto;
}
#tblmodal tbody tr td{
	border-bottom: 1px solid #ebebeb;
	padding: 10px 25px 10px 25px; 
}
#tblmodal thead tr th {
	padding: 10px 25px 10px 25px; 
	border-bottom: 3px solid #ebebeb;
}
#tblmodal tfoot tr td {
	padding: 10px 25px 10px 25px; 
}
</style>
</head>
<body>
	
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title" style="margin-bottom: 5px;">
						<h3 align="center" style="padding: 15px;">구매내역</h3>
					</div>
					
					<div class="featured__controls" style="margin-bottom: 10px;">
						<ul>
							<li id="goods" class="cate goods"><a href="${pageContext.request.contextPath}/buyList">&nbsp;GOODS 주문 내역&nbsp;</a></li>
							<li id="ticket" class="cate ticket active"><a href="${pageContext.request.contextPath}/reservList">&nbsp;TICKET 예매 내역&nbsp;</a></li>
						</ul>
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th style="text-align: center; border-bottom: 3px solid #ebebeb;" colspan="7"></th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${empty buyList}">
									<tbody>
										<tr>
											<td style="width: 15%; text-align: center; border-bottom: 3px solid #ebebeb;">
												<b>티켓 예매 내역이 존재하지 않습니다.</b>
											</td>
										</tr>
									</tbody>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="reservList" items="${reservList}">
									<tbody data-no="${reservList.tb_no}">
										<tr>
											<td rowspan="4" style="width: 15%; text-align: center; border-bottom: 3px solid #ebebeb;">
												<a href="${pageContext.request.contextPath}/goodsDetail/${reservList.go_no}">
												<img class="product__details__pic__item--large"
													 src="${pageContext.request.contextPath}/images/goods/${reservList.go_pic}"
													 onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'" style="height: 150px;">
												</a>
											</td>
											<td style="width: 12%;"><b>예매번호</b></td>
											<td colspan="3"><a href="${pageContext.request.contextPath}/goodsDetail/${reservList.go_no}">${reservList.tb_no}</a></td>
										</tr>
										<tr>
											<td style="width: 12%; letter-spacing: 7px"><b>구매일</b></td>
											<td>
												<fmt:parseDate value="${reservList.tb_time}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="yyyy년 M월 d일 H시 m분" value="${date}" />
											</td>
											<td style="width: 12%;"><b>결제금액</b></td>
											<td><fmt:formatNumber type="number" value="${reservList.tb_payment}" pattern="##,###" />원</td>
										</tr>
										<tr>
											<td style=" letter-spacing: 27px;"><b>제목</b></td>
											<td colspan="3">${reservList.go_name}</td>
										</tr>
										<tr>
											<td style="letter-spacing: 7px; border-bottom: 3px solid #ebebeb;"><b>공연일</b></td>
											<td style="border-bottom: 3px solid #ebebeb;">
												<fmt:parseDate value="${reservList.go_untsdate}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${date}" /> ~
												<fmt:parseDate value="${reservList.go_untedate}" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${date}" />
											</td>
											<td style="letter-spacing: 7px; border-bottom: 3px solid #ebebeb;"><b>공연시간</b></td>
											<td style="width:; border-bottom: 3px solid #ebebeb;">${reservList.go_unttime}</td>
										</tr>
										
									</tbody>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</table>
					</div>
				</div>
			</div>



		</div>
	</section>
</body>
</html>