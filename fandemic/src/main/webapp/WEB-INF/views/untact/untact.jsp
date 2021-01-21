<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
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

.btn-primary {
	background-color: transparent;
	border-color: #111726;
	color: #111726;
}
.pagination li {
	display: inline-block;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid gray;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4176E0 ;
	color: white;
	border: 1px solid #4176E0 ;
}

.pagination a:hover:not(.active) {
	background-color: lightgray;
	color: black;
}
</style>

<script>
$(document).ready(function() {
	
	$(".btnDetail").on('click', function () {
				
 		var id = '${sessionScope.member.mem_id}';
		var mem_id = $(this).parent().parent().parent().find("q").text();
		
		if (id != mem_id ) {
			alert("구입한 회원만 이용가능 합니다.");
		} else {
			alert("입장합니다.");
			$(location).attr('href','https://192.168.0.58:18/caller.html');
		} 
	});

	// 커밍순 슬라이드
	
	$('.owl-carousel').owlCarousel({
		items : "${cnt}" , 
		loop : true,
		autoplay : true,
		autoplayTimeout : 3000,
		autoplayHoverPause : true
	});
	

});
</script>

	<section class="home">
		<div class="container">
			<div class="row">
				<div class="section-title">
					<h3 align="center" style="padding: 15px">TICKETING</h3>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 xs-12">
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
					<div class="col-lg-12 col-md-12 col-sm-12 xs-12">
						<div class="line">
							<div>ALL</div>
						</div>
					</div>
					<!-- 여기에 forEach -->
			<div class="col-lg-12 col-md-12 col-sm-12 xs-12">
			<c:forEach var="un" items="${unList}">
				<c:if test="${un.DDAY > 0 }">
					<article class="col-md-12 col-sm-12 col-xs-12 article-list">
					
						<div class="inner" style="width: 100%; float: left;">
							<figure style="width: 200px; height: 260px;">
								<a href="ticket"> 
									<img src="${pageContext.request.contextPath}/images/goods/${un.GO_PIC}" style="width: 100%; height: 100%;">
								</a>
							</figure>
							<div class="details" style="margin-left: 210px;">
								<div class="detail">
								
									<div class="category" style="font-size: 25px;">
										<a href="ticket">D - ${un.DDAY}</a>
									</div>
								
								</div>
								<h1 style="height: 23%">
									<a href="ticket">${un.ST_ID }</a>
								</h1>
								<p style="height: 44%">
									${un.GO_NAME}<br> 
									${un.GO_UNTSDATE}<br> 
									${un.GO_UNTTIME}
									<q style="display: none;">${un.MEM_ID}</q>
								</p>
								
								<div style="height: 20%; padding-top: 5%;" >
									<a class="btn btn-primary more" >
										<div>입장</div>
										<div class="btnDetail">
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</div>
							</div>
						</div>	
					</article>
				</c:if>
			</c:forEach>
			</div>		
			<div class="card-footer">
				<div align="center">
					<script>
						function goPage(p) {
							location.href = "adminMain?p=" + p
						}
					</script>

					<my:paging paging="${paging}" jsfunc="goPage" />
				</div>
			</div>
			
			
			
			
		</div>
	</div>
</div>

	

	</section>
