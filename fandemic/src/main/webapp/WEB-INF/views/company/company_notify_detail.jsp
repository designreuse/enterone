<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">


<section class="page">
	<div class="container">
		<div class="row">
			<div class="companySlide">
				<ul>
					<li><img class="companyBanner col-md-12 col-sm-12 col-xs-12"
						src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
						alt="company_main" /></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="nav-tabs-group">
			<ul class="nav-tabs-list">
				<li><a
					href="${pageContext.request.contextPath}/company/info/${star.com_id}">소
						속 사 소 개</a></li>
				<li><a
					href="${pageContext.request.contextPath}/company/notify/${star.com_id}">공
						지 사 항</a></li>
				<li><a
					href="${pageContext.request.contextPath}/company/home/${star.com_id}"><font
						style="color: #4176E0">스 타</font></a></li>
			</ul>
		</div>
	</div>
	
	<hr>
	<div class="container">
		<div class = "col-xl-1 col-md-1 col-1"></div>
		<div class = "col-xl-10 col-md-10 col-12">
			<div class="row">
				<h6>제목이라고!!!</h6>
			</div>
			
			<div class="row alignRight">
				<p>날짜라고 !!!!!</p>
			</div>
			
			<br>
			<div class="row alignLeft textbox">
			안녕 난 내용이야
			</div>
		</div>
		<div class = "col-xl-1 col-md-1 col-1"></div>
	</div>
</section>