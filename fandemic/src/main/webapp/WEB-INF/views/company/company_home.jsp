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
						onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'" /></li>
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

				<!-- 소속사 스타 목록 화면 출력 -->
				<c:forEach var="star" items="${companyStars}">
					<div class="col-md-3 col-sm-4 col-xs-6">
						<div class="companyContainer">
							<div class="row">
								<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
									src="${pageContext.request.contextPath}/images/star/${star.st_pic}"
									onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
									/>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12">
								<span class="companyMinIcon"> <img
									src="${pageContext.request.contextPath}/images/star/${star.st_icon}"
									onerror="this.src='${pageContext.request.contextPath}/resources/images/company/star_icon.png'"
									/>
								</span>
							</div>
							<div class="row">
								<h6>${star.st_name}</h6>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/star/${star.st_id}"
									class="btn btn-magz companyMinButton">채널</a>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 소속사 스타 목록 화면 종료 -->
			</div>
		</div>
	</div>
</section>