<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/owl.carousel.css">
<script src="/js/owl.carousel.min.js"></script>
<style type="text/css">
.sidebutton {
	width: 90%;
	margin: 1%;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	var gb_no = 0;
	
	$('#exampleModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); // Button that triggered the modal
		gb_no = button.data('no'); // Extract info from data-* attributes
		var modal = $(this);
		console.log('주문번호: ' + gb_no);
		modal.find('.modal-title').text('주문 상세 내역');
		modal.find('thead tr .gb_no').text(gb_no);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/buyList/detail',
			type : 'POST',
			data : { gb_no : gb_no },
			success : function (response) {
				$('.modalbody').empty();
				for(var i=0; i<response.length; i++){
					console.log(response[i].go_pic);
					var price = response[i].go_price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$('.modalbody').append('<tr class="tr1">'
										 + '<td class="go_pic" rowspan="2"><img style="height: 80px;" src="${pageContext.request.contextPath}/images/goods/'+response[i].go_pic+'"></td>'
										 + '<td class="go_name"><b>상품명</b></td>'
										 + '<td class="go_name2" colspan="3">'+response[i].go_name+'</td>'
										 + '<td class="reorder" rowspan="2">'
										 + '<a type="button" class="btn primary-btn" href="${pageContext.request.contextPath}/goodsDetail/'+response[i].go_no+'">재구매</button></td>'
										 + '</tr>'
										 + '<tr class="tr2">'
										 + '<td style="border-bottom: 3px solid #ebebeb;"><b>구매수량</b></td>'
										 + '<td style="border-bottom: 3px solid #ebebeb;">'+response[i].cart_qty+'개</td>'
										 + '<td style="border-bottom: 3px solid #ebebeb;"><b>구매금액</b></td>'
										 + '<td style="border-bottom: 3px solid #ebebeb;">'+price+'원</td>'
										 + '</tr>');
					
				}				
				modal.find('.pay').text(response[0].gb_payment.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원'); // 결제 합계 금액
					
					
				}, error : function(xhr, status){
				alert(gb_no + ', ' + "실패! status: " + status);
			}
		});
	});
	
	function goBuyDetail() {
		location.href = "${pageContext.request.contextPath}/goodsDetail/{no}";
	}
	
	
});
</script>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
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
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table style="width: 100%;">
							<thead>
								<tr>
									<th style="text-align: center; border-bottom: 3px solid #ebebeb;" colspan="6"></th>
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
									<td rowspan="3" style="width: 15%; text-align: center; border-bottom: 3px solid #ebebeb; border-left: 1px solid #ebebeb;">
										<button type="button" class="btn primary-btn buyDetail" data-no="${buyList.gb_no}" data-toggle="modal" data-target="#exampleModal">상세보기</button>
									</td>
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







			
			<!-- 모달창 -->
			<div class="row" >
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				   <div class="modal-dialog" role="document" style="padding-top: 303px;">
				      <div class="modal-content">
				         <div class="modal-header">
				            <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;"></h5>
				         </div>
				         <div class="modal-body" style="height: 430px;">
				            <div class="form-group">
				               
				               
							<table class="tblmodal">
								<thead>
									<tr>
										<th style="width: 168px; text-align: center;">주문번호</th>
										<th style="width: 800px;" class="gb_no" colspan="5"></th>
									</tr>
								</thead>
								
								<tbody class="modalbody">
									<tr>
										<td rowspan="2" style="text-align: center; border-bottom: 3px solid #ebebeb; border-right: 1px solid #ebebeb;">
											사진
										</td>
										<td style="letter-spacing: 7px;"><b>상품명</b></td>
										<td colspan="3">${gbuy.go_name}</td>
										<td rowspan="2" style="width: 168px; text-align: center; border-bottom: 3px solid #ebebeb; border-left: 1px solid #ebebeb;">
											<button type="button" class="btn primary-btn">재구매</button>
										</td>
									</tr>
									<tr>
										<td style="border-bottom: 3px solid #ebebeb;"><b>구매수량</b></td>
										<td style="border-bottom: 3px solid #ebebeb;">${gbuy.cart_qty} 개</td>
										<td style="border-bottom: 3px solid #ebebeb;"><b>구매금액</b></td>
										<td style="border-bottom: 3px solid #ebebeb;">${gbuy.go_price} 원</td>
									</tr>
								</tbody>

								<tfoot>
									<tr>
										<td colspan="4"></td>
										<td><b>결제 합계 금액</b></td>
										<td class="pay" style="text-align: right;"></td>
									</tr>
								</tfoot>
							</table>
							           
				               
				               
				            </div>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				         </div>
				      </div>
				   </div>
				</div>
			</div>
					<div class="line">
						<div>티켓 구매 내역</div>
					</div>
					<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table style="    width: 100%;">
							<thead>
								<tr>
									<th style="text-align: center; border-bottom: 3px solid #ebebeb;" colspan="7"></th>
								</tr>
							</thead>
							
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
							
						</table>
					</div>
				</div>
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

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
