<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<section class="ftco-section-no-padding bg-light">
	<div class="hero-wrap-profile">
		<div class="overlay-profile"></div>
		<div class="d-flex align-items-center js-fullmainheight row">
			<div class="author-image text img d-flex">
				<section class="home-slider js-fullmainheight owl-carousel">
					<div class="slider-item js-fullmainheight"
						style="background-image: url(${pageContext.request.contextPath}/images/star/${star.st_pic});">
					</div>

					<div class="slider-item js-fullmainheight"
						style="background-image:url(${pageContext.request.contextPath}/images/star/${star.st_banner});">
					</div>
				</section>
			</div>
			<div class="author-info-profile text p-3 p-md-5">
				<div class="desc">
					<span class="subheading">Hello! I'm</span>
					<h1 class="big-letter">${star.st_name}</h1>
					<h1 class="mb-4">
						<span>${star.st_name}</span>&nbsp;Your Star. <!-- <span>I Capture Life</span> -->
					</h1>
					<p class="mb-4">${star.st_introduce}</p>
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

