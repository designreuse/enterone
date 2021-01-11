<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/company.css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>





<section class="page">
<div class="container">
<div class="line">
	<div>소속사</div>
</div>

<div class="col-md-12 col-sm-12 col-xs-12">
<div align="center">
<c:if test="${fn:length(company) eq 0}">
	<b>검색된 결과가 없습니다.</b>
</c:if>
</div>
<div class="row">
	<c:forEach var="com" items="${company}"> 
		<div class="col-md-3 col-sm-4 col-xs-6">
			<div class="companyContainer">
				<div class="row">
					<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
						src="${pageContext.request.contextPath}/resources/images/company/company_main.jpg"
						alt="company_main" />
				</div>
				<div class="row companyName">
					<p>${com.com_name}</p>
				</div>
				<div class="row">
					<a href="${pageContext.request.contextPath}/company/home/${com.com_id}"
						class="btn btn-magz companyMinButton">방문하기</a>
				</div>
			</div>
		</div>
	 </c:forEach>
</div>
</div>
	
<div class="line">
	<div>스타</div>
</div>

<div class="col-md-12 col-sm-12 col-xs-12">
<div align="center">
	<c:if test="${fn:length(star) eq 0}">
		<b>검색된 결과가 없습니다.</b>
	</c:if>
</div>
<div class="row">
	<c:forEach var="st" items="${star}">
		<div class="col-md-3 col-sm-4 col-xs-6" align="center">
			<div class="companyContainer">
				<div class="row">
					<img class="companyMinBanner col-md-12 col-sm-12 col-xs-12"
						src="${pageContext.request.contextPath}/images/star/${st.st_pic}"
						onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
						/>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<span class="companyMinIcon"> <img
						src="${pageContext.request.contextPath}/images/star/${st.st_icon}"
						onerror="this.src='${pageContext.request.contextPath}/resources/images/company/star_icon.png'"
						/>
					</span>
				</div>
				<div class="row">
					<h6>${st.st_name}</h6>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/star/${st.st_id}"
						class="btn btn-magz companyMinButton">채널</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>

<div class="line">
	<div>연습생</div>
</div>

<%-- <c:if test="${fn:length(star) eq 0">
	<p>검색된 결과가 없습니다.</p>
</c:if> --%>

</div>
</section>