<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">
<style type="text/css">
a{
}

</style>
</head>

<body>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="line">
						<div>최애 스타 목록</div>
					</div>




					<div class="col-md-3 col-sm-4 col-xs-6">
						<div class="companyContainer">
							<div class="row">
								<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
									src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
									alt="company_main" />
							</div>
							<div class="row companyName">
								<p>빅히트 엔터테인먼트</p>
							</div>
							<div class="row">
								<a href="companyHome" class="btn btn-magz companyMinButton">방문하기</a>
							</div>
						</div>
					</div>



					<!-- 활동이 많은 스타 끝 3개만 띄우기 -->

					<div class="line">
						<div>내가 가입한 스타</div>
					</div>
					<!-- 내 스타 다 띄우기 -->
					<div class="col-xs-12">
					<c:forEach items="${starlist}" var="star">
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
					</div>
					<div align="center">
						<script>
							function goPage(p) {
								location.href = "${pageContext.request.contextPath}/mystar/"
										+ "?p=" + p
							}
						</script>

						<my:paging paging="${paging}" jsfunc="goPage" />
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
