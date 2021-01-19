<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
  $(document).ready(function(){
	  var mySlider = $('.slider').bxSlider({
		  auto: true,
		  //pager: false,
		  //controls: true,
		  responsive: true
    });
  });
  
/*   
  $( function () {
	  var mySlider = $( '#slide_banner' ).bxSlider( {
	   mode: 'horizontal',// 가로 방향 수평 슬라이드
	   speed: 500,        // 이동 속도를 설정
	   pager: false,      // 현재 위치 페이징 표시 여부 설정
	   moveSlides: 1,     // 슬라이드 이동시 개수
	   slideWidth: 100,   // 슬라이드 너비
	   minSlides: 4,      // 최소 노출 개수
	   maxSlides: 4,      // 최대 노출 개수
	   slideMargin: 5,    // 슬라이드간의 간격
	   auto: true,        // 자동 실행 여부
	   autoHover: true,   // 마우스 호버시 정지 여부
	   controls: false    // 이전 다음 버튼 노출 여부
	  } ); */

  
</script>
</head>
<body>

<section class="page">
	<div class="container">
		<div class="slide">
			<input type="radio" name="pos" id="pos1" checked> <input
				type="radio" name="pos" id="pos2"> <input type="radio"
				name="pos" id="pos3"> <input type="radio" name="pos"
				id="pos4">

					<div class="slider">
				<c:forEach var="company" items="${companyList}" end ="4"> 
					    <div><img class="companyBanner col-md-12 col-sm-12 col-xs-12"
						src="${pageContext.request.contextPath}/images/company/${company.com_pic}"
						onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'" /></div>
				</c:forEach>
					  </div>

			
		</div>
	</div>




	<div class="container">
		<div class="row">
			<%--<img class="companyimg col-md-12 col-sm-12 col-xs-12" src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg" alt="company_main"> --%>

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="row companySector"></div>

				<!-- 소속사 목록 출력 -->
				<c:forEach var="company" items="${companyList}"> 
					<div class="col-md-3 col-sm-4 col-xs-6">
						<div class="companyContainer">
							<div class="row">
								<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
									src="${pageContext.request.contextPath}/images/company/${company.com_pic}"
									onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'" />
							</div>
							<div class="row companyName">
								<p>${company.com_name}</p>
							</div>
							<div class="row">
								<a href="${pageContext.request.contextPath}/company/home/${company.com_id}"
									class="btn btn-magz companyMinButton">방문하기</a>
							</div>
						</div>
					</div>
				 </c:forEach> 




			</div>
		</div>
	</div>
</section>
</body>
</html>