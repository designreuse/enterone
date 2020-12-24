<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">


<section class="page">
	<div class="container">
		<div class="slide">
			<input type="radio" name="pos" id="pos1" checked> <input
				type="radio" name="pos" id="pos2"> <input type="radio"
				name="pos" id="pos3"> <input type="radio" name="pos"
				id="pos4">
			<ul>
				<li><img class="companyBanner col-md-12 col-sm-12 col-xs-12"
					src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
					alt="company_main" /></li>
				<li><img class="companyBanner col-md-12 col-sm-12 col-xs-12"
					src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
					alt="company_main" /></li>
				<li><img class="companyBanner col-md-12 col-sm-12 col-xs-12"
					src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
					alt="company_main" /></li>

			</ul>

			<p class="bullet">
				<label for="pos1">1</label> <label for="pos2">2</label> <label
					for="pos3">3</label> <label for="pos4">4</label>
			</p>
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
									src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
									alt="company_main" />
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