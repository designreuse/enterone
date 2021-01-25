<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/company.css">

<section class="page">
	<hr>
	<div class="container">
		<div class = "col-xl-12 col-md-12 col-12">
			<div class="row">
				<h5>[${aboard.abo_subject}] ${aboard.abo_title}</h5>
			</div>
			<div class="row alignRight">
				<p>${aboard.abo_time}</p>
			</div>
			
			<br>
			<div class="row alignLeft textbox">
				${aboard.abo_content}
			</div>
			<br>
			<c:if test="${aboard.abo_pic ne null}">
			<hr>
			<br>
				<div class="row alignLeft textbox">
					첨부파일 다운로드 : 
					<a href="${pageContext.request.contextPath}/aboard/filedown?uFile=${aboard.abo_pic}"> ${aboard.abo_pic} </a>
				</div>
			</c:if>
			<div class="row">
				<div class="starRight">
				<c:if test="${sessionScope.member.mem_id ne null}">
					<button type="button" class="btn btn-primary py-2 px-4"
						id="btnapply" onclick="location.href='${pageContext.request.contextPath}/audition/auditionapply?no='+${aboard.abo_no}">지원하기</button>
						</c:if>
				</div>
			</div>
		</div>
	</div>
</section>