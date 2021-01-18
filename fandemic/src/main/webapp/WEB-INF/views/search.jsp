<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/company.css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	p {
		align : center;
	}
</style>




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

<div align="center">
	<c:if test="${fn:length(activity) eq 0}">
		<b>검색된 결과가 없습니다.</b>
	</c:if>
</div>
<div class="row">
	<c:forEach var="ac" items="${activity}">
	<div class="col-md-3 col-sm-3 col-xs-6">
		<div class="thumbnail" style="width: 200px;">
			<div class="row">
				<img src="${pageContext.request.contextPath}/images/audition/${ac.TR_PIC}" style="padding-top: 10px; width: 150px; height: 150px;">
			</div>
			<div class="caption" style="padding-top: 20px;">
				<p>${ac.TR_NAME}</p>
				<p>${ac.MEM_NAME}</p>
				<c:if test="${ac.TR_BRANCH2 ne null }">
					<p>${ac.TR_BRANCH1} &nbsp;&nbsp; ${ac.TR_BRANCH2}</p>
				</c:if>
				<c:if test="${ac.TR_BRANCH2 eq null }">
					<p>${ac.TR_BRANCH1}</p>
				</c:if>
			</div>
		</div>
	</div>
	</c:forEach>

</div>

</div>
</section>