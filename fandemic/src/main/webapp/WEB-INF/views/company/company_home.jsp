<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<li><a href="${pageContext.request.contextPath}/company/info/${star.com_id}">소 속 사 소 개</a></li>
				<li><a href="${pageContext.request.contextPath}/company/notify/${star.com_id}">공 지 사 항</a></li>
				<li><a href="${pageContext.request.contextPath}/company/home/${star.com_id}"><font style="color: #4176E0">스 타</font></a></li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row">
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
							<span class="companyMinIcon"> <img
								src="${pageContext.request.contextPath}/resources/images/company/star_icon.png"
								width="52" height="52">
							</span>
						</div>
						<div class="row">
							<h6>더미소년단</h6>
						</div>
						<div>
							<a href="starProfile" class="btn btn-magz companyMinButton">프로필</a>
							<a href="${pageContext.request.contextPath}/star"
								class="btn btn-magz companyMinButton">채널</a>
						</div>
					</div>
				</div>

				<c:forEach var="star" items="${companyStars}">
					<div class="col-md-3 col-sm-4 col-xs-6">
						<div class="companyContainer">
							<div class="row">
								<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
									src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
									alt="company_main" />
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<span class="companyMinIcon"> <img
									src="${pageContext.request.contextPath}/resources/images/company/star_icon.png"
									width="52" height="52">
								</span>
							</div>
							<div class="row">
								<h6>${star.st_name}</h6>
							</div>
							<div>
								<a href="starProfile" class="btn btn-magz companyMinButton">프로필</a>
								<a href="${pageContext.request.contextPath}/star"
									class="btn btn-magz companyMinButton">채널</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>

	</div>
</section>