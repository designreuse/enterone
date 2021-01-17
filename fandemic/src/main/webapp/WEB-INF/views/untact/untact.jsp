<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<style>
.modal-open .modal {
	padding : 250px;
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

.btn-primary {
	background-color: transparent;
	border-color: #111726;
	color: #111726;
}
</style>
<script>
$(document).ready(function() {
	
	
	var go_no = '';
	
	$(".btnDetail").on('click', function () {
		go_no = $(this).parent().find("b").text(); // code 조회용 go_no 넘기기
	});

	// 커밍순 슬라이드
	
	$('.owl-carousel').owlCarousel({
		items : "${cnt}" , 
		loop : true,
		autoplay : true,
		autoplayTimeout : 3000,
		autoplayHoverPause : true
	});
	
	$("#btnIn").on('click', function () {
		
		var id = '${sessionScope.member.mem_id}';
		
		if( id == null || id == '') {
			alert("로그인 후 이용 할 수 있으며 일반 회원만 이용가능 합니다.");
		} else {
			$.ajax({
	            url :'${pageContext.request.contextPath}/untactCode',
	            type:"post",
	            data : { code : $("#inCode").val() , go_no : go_no}, //go_no 넘겨서 controller에서 비교 후
	            success:function(data){
	            	if(data == null || data == '' ) {
	            		alert("코드가 일치하지 않습니다.");
	            	} else {
	            		alert("입장합니다.");
	            		$(location).attr('href','${pageContext.request.contextPath}/unDetail');
	            		
	            	}
	             	
	            },error:function(){ alert("실패"); }
	         });
		}
	});
});
</script>

	<section class="home">
		<div class="container">
			<div class="row">
				<div class="section-title">
					<h3 align="center" style="padding: 15px">TICKETING</h3>
				</div>
				<div class="col-md-12">
					<div class="line">
						<div>COMING SOON</div>
						<!-- sysdate 보다 큰 값만 출력 -->
					</div>
					<div class="owl-carousel" align="center">
					<c:forEach var="coming" items="${comingList}">
						<div>
							<input type="image" style="width: 200px; height: 260px;" src="${pageContext.request.contextPath}/images/goods/${coming.GO_PIC}"> <br> 
							<p>${coming.ST_NAME}</p>
							<p>${coming.GO_UNTSDATE}</p>
						</div>
					</c:forEach>
	
					</div>
					
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="line">
							<div>ALL</div>
						</div>
					</div>
					<!-- 여기에 forEach -->
			<c:forEach var="un" items="${unList}">
				<c:if test="${un.dday > 0 }">
					<article class="col-md-12 article-list">
						<div class="inner" style="width: 50%; float: left;">
							<figure style="width: 200px; height: 260px;">
								<a href="ticket"> 
									<img src="${pageContext.request.contextPath}/images/goods/${un.go_pic}" style="width: 100%; height: 100%;">
								</a>
							</figure>
							<div class="details" style="margin-left: 210px;">
								<div class="detail">
								
									<div class="category" style="font-size: 25px;">
										<a href="ticket">D - ${un.dday}</a>
									</div>
								
								</div>
								<h1 style="height: 23%">
									<a href="ticket">${un.st_id }</a>
								</h1>
								<p style="height: 44%">
									${un.go_name}<br> 
									${un.go_untsdate} ~ ${un.go_untedate}<br> 
									${un.go_unttime}
									<b style="display: none;">${un.go_no}</b>
								</p>
								
								<div style="height: 20%; padding-top: 20%;" class="btnDetail">
									<a class="btn btn-primary more" data-toggle="modal" data-target="#exampleModal" data-what="hello">
										<div>입장</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
										
									</a>
								</div>
							</div>
						</div>	
					</article>
				</c:if>
			</c:forEach>
					
					

					<div class="col-md-12 text-center">
						<ul class="pagination">
							<li class="prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#">97</a></li>
							<li class="next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		
	<!-- 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog" role="document" style="width: 300px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">입장하기</h5>
				</div>
				<div class="modal-body" align="center" >
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">코드입력</label>
						<input type="text" id="inCode" class="form-control" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id ="btnIn">입장</button>
				</div>
			</div>
		</div>
	</div>
		

	</section>
