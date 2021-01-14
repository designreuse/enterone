<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<section class="ftco-section-no-padding bg-light">
	<div class="hero-wrap">
		<!-- <div class="overlay"></div> -->
		<div class="d-flex align-items-center js-fullheight">
			<div class="author-image text img d-flex">
				<section class="home-slider js-fullheight owl-carousel">
		      <div class="slider-item js-fullheight" style="background-image: url(${pageContext.request.contextPath}/images/star/${stVo.st_banner});">
		      </div>

		      <div class="slider-item js-fullheight" style="background-image:url(${pageContext.request.contextPath}/images/star/${stVo.st_banner});">
		      </div>
		    </section>
			</div>
		</div>
	</div>
</section>
<section class="ftco-section-number ftco-counter img" id="section-counter" style="background-image: url(resourcesStar/images/bg_1.jpg);">
  	<div class="container">
  		<div class="row justify-content-start">
  			<div class="col-md-10">
    		<div class="row">
          <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${countFan}">0</strong>
                <span>채널 팬</span>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${countFboard}">0</strong>
                <span>팬 게시물</span>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${countReply}">0</strong>
                <span>댓글</span>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${countSboard}">0</strong>
                <span>스타 게시물</span>
              </div>
            </div>
          </div>
        </div>
       </div>
      </div>
  	</div>
  </section>
<section class="ftco-section instagram">
	<div class="container">
		<div class="row justify-content-center mb-2 pb-3">
        <div class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
          <h2 class="mb-4">Follow me on Channel</h2>
        </div>
      </div>  
		<div class="row no-gutters">
       <div class="col-sm-12 col-md ftco-animate">
         <a href="${pageContext.request.contextPath}/resourcesStar/images/image_1.jpg" class="insta-img image-popup" style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_1.jpg);">
           <div class="icon d-flex justify-content-center">
             <span class="icon-instagram align-self-center"></span>
           </div>
         </a>
       </div>
       <div class="col-sm-12 col-md ftco-animate">
         <a href="${pageContext.request.contextPath}/resourcesStar/images/image_2.jpg" class="insta-img image-popup" style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_2.jpg);">
           <div class="icon d-flex justify-content-center">
             <span class="icon-instagram align-self-center"></span>
           </div>
         </a>
       </div>
       <div class="col-sm-12 col-md ftco-animate">
         <a href="${pageContext.request.contextPath}/resourcesStar/images/image_3.jpg" class="insta-img image-popup" style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_3.jpg);">
           <div class="icon d-flex justify-content-center">
             <span class="icon-instagram align-self-center"></span>
           </div>
         </a>
       </div>
       <div class="col-sm-12 col-md ftco-animate">
         <a href="${pageContext.request.contextPath}/resourcesStar/images/image_4.jpg" class="insta-img image-popup" style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_4.jpg);">
           <div class="icon d-flex justify-content-center">
             <span class="icon-instagram align-self-center"></span>
           </div>
         </a>
       </div>
       <div class="col-sm-12 col-md ftco-animate">
         <a href="${pageContext.request.contextPath}/resourcesStar/images/image_5.jpg" class="insta-img image-popup" style="background-image: url(${pageContext.request.contextPath}/resourcesStar/images/image_5.jpg);">
           <div class="icon d-flex justify-content-center">
             <span class="icon-instagram align-self-center"></span>
           </div>
         </a>
       </div>
     </div>
	</div>
</section>