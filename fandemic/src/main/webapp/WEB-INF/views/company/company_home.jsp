<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">



<section class="page">

	<div class="row">
		<div class="companySlide">
			<ul>
				<li><img class="companyBanner col-md-12 col-sm-12 col-xs-12"
					src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
					alt="company_main" /></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="nav-tabs-group">
			<ul class="nav-tabs-list">
				<li><a href="companyIntro">소 속 사 소 개</a></li>
				<li><a href="companyNotify">공 지 사 항</a></li>
				<li><a href="companyHome"><font style="color: #4176E0">스
							타</font></a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<%--<img class="companyimg col-md-12 col-sm-12 col-xs-12" src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg" alt="company_main"> --%>

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="row companySector"></div>

				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
						<span class = "companyMinIcon">
							<img
								src="${pageContext.request.contextPath}/resources/images/company/star_icon.png"
								 width="52" height="52">
						</span>
						</div>
						<div class="row">
							<h6>방탄소년단</h6>
						</div>
						<div>
							<a href="companyStarProfile"
								class="btn btn-info btn-rounded companyMinButton">프로필</a> <a
								href="starMain"
								class="btn btn-info btn-rounded companyMinButton">채널</a>
						</div>
					</div>
				</div>




			</div>

		</div>

	</div>
</section>