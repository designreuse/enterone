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
		<div class = "col-xl-12 col-md-12 col-12">
			<div class="row">
				<h5>[${companyNotice.cnoc_subject}] ${companyNotice.cnoc_title}</h5>
			</div>
			
			<div class="row alignRight">
				<p>${companyNotice.cnoc_time}</p>
			</div>
			
			<br>
			<div class="row alignLeft textbox">
				${companyNotice.cnoc_content}
			</div>
			<br>
			<hr>
			<br>
			<div class="row alignLeft textbox">
				첨부파일
			</div>
		</div>
	</div>
</section>