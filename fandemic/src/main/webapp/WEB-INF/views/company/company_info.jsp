<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/company.css">
	
	
<section class="page">
	<div class="container">
		<div class="row">
			<div class="starSlide">
			    <ul>
			    	<c:forEach var="star" items="${companyStars}" end = "3">
			      		<li><img class = "companyStarBanner col-md-12 col-sm-12 col-xs-12" src="${pageContext.request.contextPath}/images/star/${star.st_pic}"
								onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
								/>
						</li>
		   			</c:forEach>
			    </ul>
			  </div>
		</div>
	</div>
	<div class="container">
		<div class="nav-tabs-group">
			<ul class="nav-tabs-list">
				<li><a href="${pageContext.request.contextPath}/company/info/${companyInfo.com_id}"><font style="color:#4176E0">소 속 사 소 개</font></a></li>
				<li><a href="${pageContext.request.contextPath}/company/notify/${companyInfo.com_id}">공 지 사 항</a></li>
				<li><a href="${pageContext.request.contextPath}/company/home/${companyInfo.com_id}">스 타</a></li>
			</ul>
		</div>
	</div>




	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-description">
					<div>
						<img class="col-md-6 col-sm-6 col-xs-12"
							src="${pageContext.request.contextPath}/images/company/${companyInfo.com_pic}" 
							onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'">
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<h3>${companyInfo.com_name}</h3>
						<hr>
						<p>
							Phone: <span class="bold">${companyInfo.com_phone}</span> 
							
							<br> 
							
							Email: <span class="bold">${companyInfo.com_email}</span> 
							
							<br> 
							
							Address: <span class="bold">${companyInfo.com_address} ${companyInfo.com_address2}</span> 
							
							<br>
							
							${companyInfo.com_introduce}
							
							<br>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>