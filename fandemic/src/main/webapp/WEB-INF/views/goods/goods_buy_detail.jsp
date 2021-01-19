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

<script>
$(document).ready(function() {
	
	$('#exampleModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); // Button that triggered the modal
		var gb_no = button.data('no'); // Extract info from data-* attributes
		var modal = $(this);
		console.log(button + ', '+ gb_no + ', '+ modal);
		modal.find('.modal-title').text('주문 상세 내역');
		modal.find('thead tr .gb_no').text(gb_no);
		
		
		$.ajax({
			url : '${pageContext.request.contextPath}/buyList/detail',
			type : 'POST',
			data : { gb_no : gb_no },
			success :function(response) {
				if(response == true) {
					alert(gb_no + ', ' + go_type + ', ' + "모달 성공적으로 출력해주라,,");
					location.reload(); //장바구니 화면 재출력
				}
			}, error : function(xhr, status){
				alert(gb_no + ', ' + go_type + ', ' + "실패! status: " + status);
			}
		});
	});
	
	
});

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
			<div class="row">
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				   <div class="modal-dialog" role="document">
				      <div class="modal-content">
				         <div class="modal-header">
				            <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;"></h5>
				         </div>
				         <div class="modal-body">
				            <div class="form-group">
				               
				               
							<table id="tblmodal">
								<thead>
									<tr>
										<th style="width: 168px; text-align: center;">주문번호</th>
										<th style="width: 800px;" class="gb_no" colspan="5"></th>
									</tr>
								</thead>
								
								<tbody>
								<c:forEach var="gbuy" items="${gbuydetail}">
								 <c:set var="goods.go_type" value="TICKET" />
									<c:choose>
										<c:when test="${goods.go_type eq 'TICKET'}">
												<tr>
													<td rowspan="3" style="text-align: center; border-bottom: 3px solid #ebebeb; border-right: 1px solid #ebebeb;">
														사진
													</td>
													<td style="letter-spacing: 7px;"><b>공연명</b></td>
													<td colspan="3">${gbuy.go_name}</td>
													<td rowspan="3" style="width: 168px; text-align: center; border-bottom: 3px solid #ebebeb; border-left: 1px solid #ebebeb;">
														<button type="button" class="btn primary-btn">입장하기</button>
													</td>
												</tr>
												<tr>
													<td><b>구매수량</b></td>
													<td>${gbuy.cart_qty} 개</td>
													<td><b>구매금액</b></td>
													<td>${gbuy.go_price} 원</td>
												</tr>
												<tr>
													<td style="border-bottom: 3px solid #ebebeb;"><b>공연기간</b></td>
													<td style="border-bottom: 3px solid #ebebeb;">${gbuy.go_untsdate} ~ ${gbuy.go_untedate}</td>
													<td style="border-bottom: 3px solid #ebebeb;"><b>공연시간</b></td>
													<td style="border-bottom: 3px solid #ebebeb;">${gbuy.go_unttime}</td>
												</tr>
										</c:when>
										<c:otherwise>

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
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</tbody>
									
								<tfoot>
									<tr>
										<td colspan="4"></td>
										<td><b>결제 합계 금액</b></td>
										<td style="text-align: right;">gb_payment 원</td>
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
   
   
		</div>
	</section>
</body>
</html>