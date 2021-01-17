<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<span>${stVo.st_name}</span>&nbsp;Your Star. <!-- <span>I Capture Life</span> -->
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
	<br>
	<br>
  <div class="container">
    <div class="row">
      <div class="col-md-4 d-flex align-self-stretch ftco-animate">
        <div class="media block-6 services py-4 d-block">
          <div class="d-flex justify-content-start">
          	<div class="icon d-flex align-items-center justify-content-center">
          		<span class="flaticon-big-lens"></span>
          	</div>
          </div>
          <div class="media-body p-2 mt-2">
            <h3 class="heading mb-3">Pounds Of Equipment</h3>
            <p>A small river named Duden flows by their place and supplies.</p>
          </div>
        </div>      
      </div>
      <div class="col-md-4 d-flex align-self-stretch ftco-animate">
        <div class="media block-6 services py-4 d-block">
          <div class="d-flex justify-content-start">
          	<div class="icon d-flex align-items-center justify-content-center">
          		<span class="flaticon-printing-photo"></span>
          	</div>
          </div>
          <div class="media-body p-2 mt-2">
            <h3 class="heading mb-3">Photo Print</h3>
            <p>A small river named Duden flows by their place and supplies.</p>
          </div>
        </div>      
      </div>
      <div class="col-md-4 d-flex align-self-stretch ftco-animate">
        <div class="media block-6 services py-4 d-block">
          <div class="d-flex justify-content-start">
          	<div class="icon d-flex align-items-center justify-content-center">
          		<span class="flaticon-focusing-target"></span>
          	</div>
          </div>
          <div class="media-body p-2 mt-2">
            <h3 class="heading mb-3">Client Focus</h3>
            <p>A small river named Duden flows by their place and supplies.</p>
          </div>
        </div>      
      </div>
      <div class="col-md-4 d-flex align-self-stretch ftco-animate">
        <div class="media block-6 services py-4 d-block">
          <div class="d-flex justify-content-start">
          	<div class="icon d-flex align-items-center justify-content-center">
          		<span class="flaticon-camera"></span>
          	</div>
          </div>
          <div class="media-body p-2 mt-2">
            <h3 class="heading mb-3">Studio Sessions</h3>
            <p>A small river named Duden flows by their place and supplies.</p>
          </div>
        </div>    
      </div>
      <div class="col-md-4 d-flex align-sel Searchf-stretch ftco-animate">
        <div class="media block-6 services py-4 d-block">
          <div class="d-flex justify-content-start">
          	<div class="icon d-flex align-items-center justify-content-center">
          		<span class="flaticon-polaroid-pictures"></span>
          	</div>
          </div>
          <div class="media-body p-2 mt-2">
            <h3 class="heading mb-3">Polaroid Pictures</h3>
            <p>A small river named Duden flows by their place and supplies.</p>
          </div>
        </div>      
      </div>
      <div class="col-md-4 d-flex align-self-stretch ftco-animate">
        <div class="media block-6 services py-4 d-block">
          <div class="d-flex justify-content-start">
          	<div class="icon d-flex align-items-center justify-content-center">
          		<span class="flaticon-film"></span>
         	</div>
         </div>
         <div class="media-body p-2 mt-2">
           <h3 class="heading mb-3">Old Fill Roll</h3>
           <p>A small river named Duden flows by their place and supplies.</p>
         </div>
       </div>
     </div>
   </div>
  </div>
</section>