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
				<li><a href="${pageContext.request.contextPath}/company/info/${cnotice.com_id}">소 속 사 소 개</a></li>
				<li><a href="${pageContext.request.contextPath}/company/notify/${cnotice.com_id}"><font style="color:#4176E0">공 지 사 항</font></a></li>
				<li><a href="${pageContext.request.contextPath}/company/home/${cnotice.com_id}">스 타</a></li>
			</ul>
		</div>
	</div>

	<div class="container">

	
	
		<div class="row">
			<table class = "table">
				<tr>
					<td width = 5%>no</td>
					<td width = 10%>말머리</td>
					<td width = 70%>제목</td>
					<td width = 10%>작성일</td>
				</tr>
				<c:forEach var="cnoc" items="${companyNotices}">
					<tr>
						<td>${cnoc.cnoc_no}</td>
						<td>${cnoc.cnoc_subject}</td>
						<td>${cnoc.cnoc_title}</td>
						<td>${cnoc.cnoc_time}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</section>