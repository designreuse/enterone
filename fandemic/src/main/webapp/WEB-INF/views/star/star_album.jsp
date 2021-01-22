<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<section class="ftco-section-3">
	<div class="photograhy">
		<div class="row">
		
			<c:forEach var="fboPic" items="${fbVoPicList}">
				
				<div class="col-md-4 ftco-animate">
					<a href="" id="${fboPic.fbo_no}"
					 class="photography-entry img image-popup d-flex justify-content-start align-items-end">
						<div class="overlay"></div>
						<div class="text ml-4 mb-4">
							<h3>${fboPic.fbo_title}</h3>
							<span class="tag">${fboPic.fan_name}</span>
						</div>
					</a>
				</div>
				
				<script>
					var imgView = function() {
						var sentence = '${fboPic.fbo_content}';
						var start = sentence.indexOf('src="');
						var end = sentence.indexOf('"', start + 5);
						var list = sentence.substring(start + 5, end);
						
						$("#${fboPic.fbo_no}").css("background-image", "url(" + list + ")");
						$("#${fboPic.fbo_no}").attr("href", list);
					}
					imgView();
				</script>
			</c:forEach>
			
			
			
			
			
		</div>
	</div>
</section>