<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">


<section class="page">
	<div class="container">
		<div class="row">
			<div class="starSlide">
			    <ul>
			    	<c:forEach var="comBa" items="${comBanner}" end = "3">
			      		<li><img class = "companyStarBanner col-md-12 col-sm-12 col-xs-12" src="${pageContext.request.contextPath}/images/cnotice/${comBa.conc_banner}"
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
				<li><a href="${pageContext.request.contextPath}/company/info/${companyNotice.com_id}">소 속 사 소 개</a></li>
				<li><a href="${pageContext.request.contextPath}/company/notify/${companyNotice.com_id}"><font style="color:#4176E0">공 지 사 항</font></a></li>
				<li><a href="${pageContext.request.contextPath}/company/home/${companyNotice.com_id}">스 타</a></li>
			</ul>
		</div>
	</div>
	
	<hr>
	<div class="container">
		<div class = "col-xl-12 col-md-12 col-12">
			<div class="row">
				<h5>[${companyNotice.cnoc_subject}] ${companyNotice.cnoc_title}</h5>
			</div>
			
			<div class="row alignRight">
				<p>${companyNotice.cnoc_time}</p>
			</div>
			
			<br>
			<div class="row alignLeft textbox">
				${companyNotice.cnoc_content}
			</div>
			<br>
			<c:if test="${companyNotice.cnoc_file ne null}">
				<hr>
				<br>
				<div class="row alignLeft textbox">
					첨부파일 다운로드 : 
					<a href="${pageContext.request.contextPath}/cnotice/filedown?uFile=${companyNotice.cnoc_file}"> ${companyNotice.cnoc_file} </a>
				</div>
			</c:if>
		</div>
	</div>
</section>