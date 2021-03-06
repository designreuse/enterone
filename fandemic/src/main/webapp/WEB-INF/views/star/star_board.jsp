<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<section class="ftco-section-3">
	<script>
		$(function() {
			var sid = "${sessionScope.star.st_id}"
			var ssid = "${stVo.st_id}"
			//스타회원이 아니라면 글쓰기 막음

			if(sid != null && sid != ""){
				if(sid == ssid){
					$(".btnInputSboardShow").show()
				}
			}

		})
	</script>
	
	<div class="container">
		<div class="d-flex flex-row-reverse">
			<div class="row">
				<div class="sidebar-box ftco-animate">
					<button class="btn btn-primary py-2 px-4 btnInputSboardShow"
					onclick="location.href = '${pageContext.request.contextPath}/star/starBoard/insertView'" style="display:none;">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row d-flex">
			<div class="row">
				<c:forEach var="sboard" items="${sbolist}">
					<div class="col-md-12">
						<div class="blog-entry ftco-animate d-md-flex col-xl-12 col-md-12 col-12">
							<a href="${pageContext.request.contextPath}/star/starBoard/view/${sboard.sbo_no}" class="img img-2 starBoardimg" id="${sboard.sbo_no}"></a>
							<div class="text text-2 p-4">
								<h3 class="mb-2">
									<a href="${pageContext.request.contextPath}/star/starBoard/view/${sboard.sbo_no}">${sboard.sbo_title}</a>
								</h3>
								<div class="meta-wrap">
									<p class="meta">
										<span>${sboard.sbo_time}</span><!-- <span>5 Comment</span> -->
									</p>
								</div>
									<div class="mb-4 sboardPrev" id = "sbo_content" >
										<div>
											${sboard.sbo_content}										
										</div>
									</div>
								<p>
									<a href="${pageContext.request.contextPath}/star/starBoard/view/${sboard.sbo_no}" class="btn-custom">Read More <span
										class="ion-ios-arrow-forward"></span></a>
								</p>
							</div>
						</div>
					</div>
					
					<script>					
						var imgView = function() {
							var sentence = '${sboard.sbo_content}';
							var start = sentence.indexOf('src="');
							var end = sentence.indexOf('"', start+5);
							var list = sentence.substring(start+5, end);

							if(list.length < 130){//이미지 없을때 대체 이미지로 해당 스타의 아이콘 출력
								var icon = '${stVo.st_icon}';
								var depa = '${pageContext.request.contextPath}/images/star/'+ icon ;
								$("#${sboard.sbo_no}").css("background-image" , "url("+depa+")");
							}else if(list != null){
								$("#${sboard.sbo_no}").css("background-image" , "url("+list+")");								
							}
							$("#sbo_content p img").remove("")//게시글 미리 보기에서 이미지 삭제 
							$("#sbo_content br").remove("")
							$("#sbo_content a").remove("")
							$("#sbo_content span").removeAttr("style")
							$("#sbo_content p").removeAttr("style")
						}
						imgView();
	        		</script>
					
				</c:forEach>
				<!-- END-->
				
			</div>
			<!-- END COL -->
		</div>
	</div>
	<div class="container">
		
			<div class="col">
				<div class="block-27 paginationCenter">
					<script>
						function goPage(p) {
							location.href="${pageContext.request.contextPath}/star/starBoard/${stVo.st_id}?p="+p
						}
					</script>
					<my:paging paging="${paging}" jsfunc="goPage" />
				</div>
			</div>
		
	</div>
	
</section>