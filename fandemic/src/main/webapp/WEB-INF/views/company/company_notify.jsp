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
		<br>
		<br>
		<div class="row">
			<div class = "col-xl-12 col-md-12 col-12 noticesList">
				
				<div class = "col-xl-1 col-md-1 col-1">
					<h6>no</h6>
				</div>
				<div class = "col-xl-9 col-md-9 col-9">
					<h6>제목</h6>
				</div>
				<div class = "col-xl-2 col-md-2 col-2">
					<h6>작성일</h6>
				</div>
				
			</div>
		</div>
		<c:forEach var="cnoc" items="${companyNotices}">
			<div class="row">
				<div class = "col-xl-12 col-md-12 col-12 noticesList" 
					onclick="location.href='${pageContext.request.contextPath}/company/notifyDetail/${cnoc.cnoc_no}';"
					style='cursor: pointer;'>
					
					<div class = "col-xl-1 col-md-1 col-1">
						${cnoc.cnoc_no}
					</div>
					<div class = "col-xl-9 col-md-9 col-9">
						<p>[${cnoc.cnoc_subject}] ${cnoc.cnoc_title}</p>
					</div>
					<div class = "col-xl-2 col-md-2 col-2">
						${cnoc.cnoc_time}
					</div>
				</div>
			</div>	
		</c:forEach>
		</div>
	</div>
</section>