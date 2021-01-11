<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<link rel="stylesheet" href="/css/owl.carousel.css">
<script src="/js/owl.carousel.min.js"></script>
<style type="text/css">
.sidebutton {
	width: 90%;
	margin: 1%;
}
</style>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="line">
						<div>내 스타 목록</div>
					</div>
					<div class="owl-carousel">
						<c:forEach items="${starlist}" var="starlis">
						<div>
							<input type="image" style="height: 150px; overflow: hidden;"
								src="${pageContext.request.contextPath}/images/star/${starlis.st_pic}">
							<br> <a>${starlis.st_name }</a>
						</div>
						</c:forEach>
					</div>
					<script>
						$(document).ready(function() {
							$('.owl-carousel').owlCarousel();
						});
					</script>
					<div class="line">
						<div>최근 구매 내역</div>
					</div>
					<div class="row">
						<div>
							<table style="width: 100%" border="1">
								<tr>
									<td colspan="2" width="70%">배송완료/배송중/배송준비중</td>
									<td width="30%" rowspan="2"><input class="sidebutton btn-primary"
										type="button" onclick="location.href='#'" value="배송조회"><br>
										<input class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="교환 신청"><br> <input
										class="sidebutton btn-primary" type="button" onclick="location.href='#'"
										value="반품 신청"><br> <input class="sidebutton btn-primary" 
										type="button" onclick="location.href='#'" value="구매후기 쓰기"><br>
									</td>
								</tr>
								<tr>
									<td><img alt="상품이미지"
										src="https://thumbnail10.coupangcdn.com/thumbnails/remote/96x96ex/image/retail/images/2020/05/07/17/3/9d59a462-8680-4bc2-8ae4-f6177cd7193e.jpg">
									</td>
									<td align="right">
										<h5 style="margin-right: 5%">던킨 딸기 듬뿍 미니도넛 (냉동)</h5> <a
										style="margin-right: 20px">6,770원 · 1개</a> <input
										style="margin-right: 5%" width="10%" type="button"
										onclick="location.href='#'" value="장바구니에 담기">
									</td>
								</tr>

							</table>
						</div>
					</div>
					<div class="line">
						<div>이벤트 참여 내역</div>
					</div>
					<div class="row">
						<h1>이벤트</h1>
					</div>
					<div class="line">
						<div>쪽지</div>
					</div>
					<div class="row">
					<table
							class="table table-striped table-dark table-hover maildetail">
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="30%">제목</th>
								<th scope="col" width="20%">아이디</th>
								<th scope="col" width="20%">받은날짜</th>
							</tr>
							<c:forEach items="${maillist}" var="mail">
								<tr style="text-align: left;" class="mailinfo"
									data-no="${mail.lett_no}">
									<td scope="col" width="5%">${mail.lett_no}</td>
									<td scope="col" width="30%">${mail.lett_title}</td>
									<td scope="col" width="20%">${mail.lett_sid}</td>
									<td scope="col" width="20%">${mail.lett_time}</td>
								</tr>

							</c:forEach>
						</table>
						<div align="center">
							<script>
								function goPage(p) {
									location.href = "${pageContext.request.contextPath}/mypagemain/"
											+ "?p=" + p
								}
							</script>

							<my:paging paging="${paging}" jsfunc="goPage" />
						</div>
						<h1>쪽지 나오는곳</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
