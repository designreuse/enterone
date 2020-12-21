<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">
<section class="page">

	<div class="row">
		<div class="slide">
			<input type="radio" name="pos" id="pos1" checked> <input
				type="radio" name="pos" id="pos2"> <input type="radio"
				name="pos" id="pos3"> <input type="radio" name="pos"
				id="pos4">
			<ul>
				<li>
				<img class="companyBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
				</li>
				<li>
				<img class="companyBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
				</li>
				<li>
				<img class="companyBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
				</li>
				
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
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="row">
							<p>빅히트 엔터테인먼트</p>
						</div>
						<div class="row">
							<a href="companyHome" class="btn btn-info btn-rounded companyMinButton">방문하기</a>
						</div>
					</div>
				</div>
				
				
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="row">
							<p>빅히트 엔터테인먼트</p>
						</div>
						<div class="row">
							<a href="companyHome" class="btn btn-info btn-rounded companyMinButton">방문하기</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="row">
							<a href class="btn btn-info btn-rounded companyMinButton">SM</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="row">
							<a href class="btn btn-info btn-rounded companyMinButton">SM</a>
						</div>
					</div>
				</div>
				
				<div class="col-md-3 col-sm-4 col-xs-6">
					<div class="companyContainer">
						<div class="row">
							<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
								src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
								alt="company_main" />
						</div>
						<div class="row">
							<a href class="btn btn-info btn-rounded companyMinButton">SM</a>
						</div>
					</div>
				</div>
				
				
				
			</div>

		</div>

	</div>
</section>