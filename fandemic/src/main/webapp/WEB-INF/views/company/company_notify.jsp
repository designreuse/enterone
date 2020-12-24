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
				<li><a href="company/info">소 속 사 소 개</a></li>

				<li><a href="company/notify"><font style="color:#4176E0">공 지 사 항</font></a></li>

				<li><a href="company/home">스 타</a></li>
			</ul>
		</div>
	</div>

	<div class="container">
	
		<div class="row">
			<table class = "table">
				<tr>
					<td width = 5%>no</td>
					<td width = 70%>제목</td>
					<td width = 10%>작성일</td>
					<td width = 10%>조회수</td>
				</tr>
			</table>
		</div>
	</div>
</section>