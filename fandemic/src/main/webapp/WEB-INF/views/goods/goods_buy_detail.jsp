<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods 구매 상세보기 페이지</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">

</head>
<body>
	<section class="home">
		<div class="container">	
			<div class="row">
			<h1>구매내역</h1>
				<ul class="buyList">
					<c:forEach items="${buyList}" var="buyList">
						<li>
							<div>
								<p><span>주문번호</span><a href="${pageContext.request.contextPath}/goodsBuyDetail?n=${buyList.gb_no}">${buyList.gb_no}</a></p>
								<p><span>수령인</span>${buyList.gb_name}</p>
								<p><span>배송지 전화번호</span>${buyList.gb_phone}</p>
								<p><span>배송지 주소</span>(${buyList.gb_zipaddress}) ${buyList.gb_address} ${buyList.gb_address2}</p>
								<p><span>결제 금액</span><fmt:formatNumber pattern="###,###,###" value="${buyList.gb_payment}" /> 원</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			
			</div>
		</div>
	</section>
</body>
</html>