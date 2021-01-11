<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
	$('.owl-carousel').owlCarousel({
		items : 3,
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
				<div class="col-md-12">
					<div class="line">
						<div>COMING SOON</div>
						<!-- sysdate 보다 큰 값만 출력 -->
					</div>
					<div class="owl-carousel" align="center">
					
						<div>
							<input type="image" style="width: 200px; height: 260px;"
								src="https://images.chosun.com/resizer/e_XfBvoOfR92cYym-TkRB4tsKqE=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/RSITTQF5C7LGXQXY5MZ56EGNHE.jpg">
							<br> <a>이연희</a>
						</div>
						<div>
							<input type="image" style="width: 200px; height: 260px;"
								src="https://www.bokjitimes.com/news/photo/202002/22767_15736_3416.jpg"><br>
							<a>공유</a>
						</div>
						<div>
							<input type="image" style="width: 200px; height: 260px;"
								src="https://mblogthumb-phinf.pstatic.net/MjAxOTExMTRfMTcg/MDAxNTczNzEzNDIwMzkx.NtThUWxkOC4HvPQeHiEnhifFhrP2UOFgvEf3iOg21M8g.PaBwdhsT-CI9mddL5zTFTGEWfNm2Dsql5WNl6MjbiP8g.JPEG.silverwingkj/BIMO_%EB%B9%84%EB%AA%A8.jpg?type=w800">
							<br> <a>비모</a>
						</div>
	
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
								<a href="ticket"> <img
									src="${pageContext.request.contextPath}/images/goods/${un.go_pic}"
									style="width: 100%; height: 100%;">
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
								</p>
								<div style="height: 20%; padding-top: 40px;">
									<a class="btn btn-primary more" href="#">
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
	</section>
