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
.go_pic {
	text-align: center;
	border-bottom: 3px solid #ebebeb !important;
	border-right: 1px solid #ebebeb;
}
.go_name {
	letter-spacing: 7px;
}
.reorder{
	width: 168px;
	text-align: center;
	border-bottom: 3px solid #ebebeb !important;
	border-left: 1px solid #ebebeb;
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
.tblmodal tbody tr td{
	border-bottom: 1px solid #ebebeb;
	padding: 10px 25px 10px 25px; 
}
.tblmodal thead tr th {
	padding: 10px 25px 10px 25px; 
	border-bottom: 3px solid #ebebeb;
}
.tblmodal tfoot tr td {
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
							<li id="goods" class="cate goods active"><a href="${pageContext.request.contextPath}/buyList">&nbsp;GOODS 주문 내역&nbsp;</a></li>
							<li id="ticket" class="cate ticket"><a href="${pageContext.request.contextPath}/reservList">&nbsp;TICKET 예매 내역&nbsp;</a></li>
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
			<div class="row">
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				   <div class="modal-dialog" role="document">
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
   
   
		</div>
	</section>
</body>
</html>