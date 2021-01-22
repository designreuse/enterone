<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		if($(".starArtMusic").text() == null || $(".starArtMusic").text() == ""){
			$("#starArtMusic").text("");
		}
		if($(".starArtMovie").text() == null || $(".starArtMovie").text() == ""){
			$("#starArtMovie").text("");
		}
		if($(".starArtPerformance").text() == null || $(".starArtPerformance").text() == ""){
			$("#starArtPerformance").text("");
		}
		if($(".starArtBroadcast").text() == null || $(".starArtBroadcast").text() == ""){
			$("#starArtBroadcast").text("");
		}
	})
</script>

<section class="ftco-section-no-padding bg-light">
	<div class="hero-wrap-profile">
		<div class="overlay-profile"></div>
		<div class="d-flex align-items-center js-fullmainheight row">
			<div class="author-image text img d-flex">
				<section class="home-slider js-fullmainheight owl-carousel">
					<div class="slider-item js-fullmainheight"
						style="background-image: url(${pageContext.request.contextPath}/images/star/${stVo.st_pic});">
					</div>

					<div class="slider-item js-fullmainheight"
						style="background-image:url(${pageContext.request.contextPath}/images/star/${stVo.st_banner});">
					</div>
				</section>
			</div>
			<div class="author-info-profile text p-3 p-md-5">
				<div class="desc">
					<span class="subheading">Hello! I'm</span>
					<h1 class="big-letter">${stVo.st_name}</h1>
					<h1 class="mb-4">
						<span>${stVo.st_name}</span>&nbsp;Your Star.
						<!-- <span>I Capture Life</span> -->
					</h1>
					<p class="mb-4">${stVo.st_introduce}</p>
					<h3 class="signature h1">Enter One</h3>
					<ul class="ftco-social mt-3">
						<li class="ftco-animate"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="ftco-section">
	<div class="container">
		<div class="ftco-animate fadeInUp ftco-animated">
			<h1 class="bread">작품활동</h1>
		</div>
	</div>
	<br> <br>
	<div class="container">
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4" id ="starArtMusic">Music</h2>
			</div>
		</div>
		<div class="row">
			<c:forEach var="artVo" items="${artVoList}">
				<c:if test="${artVo.art_type eq '앨범'}">
					<div class="col-md-4 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services py-4 d-block">
							<div class="d-flex">
								<div class="ArtPic">
									<img class="col-xl-12 col-md-12 col-12"
										src="${pageContext.request.contextPath}/images/star/art/${artVo.art_pic}"
										onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
										/>
								</div>
							</div>
							<div class="media-body p-2 mt-2">
								<h3 class="heading mb-3 starArtMusic">${artVo.art_name}</h3>
								<p class ="boardColor">${artVo.art_startTime}</p>
								<p>${artVo.art_content}</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		
		
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4" id ="starArtMovie">MOVIE</h2>
			</div>
		</div>
		<div class="row">
			<c:forEach var="artVo" items="${artVoList}">
				<c:if test="${artVo.art_type eq '방송'}">
					<div class="col-md-4 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services py-4 d-block">
							<div class="d-flex">
								<div class="ArtPic">
									<img class="col-xl-12 col-md-12 col-12"
										src="${pageContext.request.contextPath}/images/star/art/${artVo.art_pic}"
										onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
										/>
								</div>
							</div>
							<div class="media-body p-2 mt-2">
								<h3 class="heading mb-3 starArtMovie">${artVo.art_name}</h3>
								<p class ="boardColor">${artVo.art_startTime} ~ ${artVo.art_endTime}</p>
								<p>${artVo.art_content}</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		
		
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4" id ="starArtPerformance">PERFORMANCE</h2>
			</div>
		</div>
		<div class="row">
			<c:forEach var="artVo" items="${artVoList}">
				<c:if test="${artVo.art_type eq '공연'}">
					<div class="col-md-4 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services py-4 d-block">
							<div class="d-flex">
								<div class="ArtPic">
									<img class="col-xl-12 col-md-12 col-12"
										src="${pageContext.request.contextPath}/images/star/art/${artVo.art_pic}"
										onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
										/>
								</div>
							</div>
							<div class="media-body p-2 mt-2">
								<h3 class="heading mb-3 starArtPerformance">${artVo.art_name}</h3>
								<p class ="boardColor">${artVo.art_startTime} ~ ${artVo.art_endTime}</p>
								<p>${artVo.art_content}</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		
		
		<div class="row justify-content-center mb-2 pb-3">
			<div
				class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
				<h2 class="mb-4" id ="starArtBroadcast">BROADCAST</h2>
			</div>
		</div>
		<div class="row">
			<c:forEach var="artVo" items="${artVoList}">
				<c:if test="${artVo.art_type eq '방송'}">
					<div class="col-md-4 d-flex align-self-stretch ftco-animate">
						<div class="media block-6 services py-4 d-block">
							<div class="d-flex">
								<div class="ArtPic">
									<img class="col-xl-12 col-md-12 col-12"
										src="${pageContext.request.contextPath}/images/star/art/${artVo.art_pic}"
										onerror="this.src='${pageContext.request.contextPath}/resources/images/company/Default.png'"
										/>
								</div>
							</div>
							<div class="media-body p-2 mt-2">
								<h3 class="heading mb-3 starArtBroadcast">${artVo.art_name}</h3>
								<p class ="boardColor">${artVo.art_startTime} ~ ${artVo.art_endTime}</p>
								<p>${artVo.art_content}</p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		
		
	</div>
</section>


