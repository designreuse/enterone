<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">





<section class="home">
	<div class="container">
		<nav class="menu">
				<div>
					<ul class="nav-list">

						<li><a href="#">공 지 사 항</a></li>

						<li><a href="#">소 속 사 소 개</a></li>

						<li><a href="#">스 타</a></li>
					</ul>
				</div>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<%--<img class="companyimg col-md-12 col-sm-12 col-xs-12" src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg" alt="company_main"> --%>

			<div class="companyBannerImg col-md-12 col-sm-12 col-xs-12">
				<div class="row companySector"></div>

				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="row">
							<a href class="btn btn-info btn-rounded companyMinButton">소개</a>
							<a href="starMain" class="btn btn-info btn-rounded companyMinButton">채널</a>
						</div>
					</div>
				</div>




			</div>

		</div>

	</div>
</section>