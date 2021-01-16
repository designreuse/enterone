<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {

	});
</script>

<section class="ftco-section-3">
	
	<div class="container">
		<div class="row d-flex">
			<div class="row">
				<div class="sidebar-box ftco-animate">
					<button class="btn btn-primary py-2 px-4 btnInputSboardShow"
					onclick="location.href = '${pageContext.request.contextPath}/star/starBoard/insertView'">글쓰기</button>
				</div>
			</div>	
			<div class="row">
				<c:forEach var="sboard" items="${sbolist}">
					<div class="col-md-12">
						<div class="blog-entry ftco-animate d-md-flex">
							<%-- <img class="img img-2"  id='${sboard.sbo_no}' src="" alt="대표 사진이 없습니다"
							onerror="this.src='${pageContext.request.contextPath}/images/star/${stVo.st_icon}'"> --%>
							<a href="${pageContext.request.contextPath}/star/starBoard/view/${sboard.sbo_no}" class="img img-2" id="${sboard.sbo_no}"></a>
							<div class="text text-2 p-4">
								<h3 class="mb-2">
									<a href="${pageContext.request.contextPath}/star/starBoard/view/${sboard.sbo_no}">${sboard.sbo_title}</a>
								</h3>
								<div class="meta-wrap">
									<p class="meta">
										<span>${sboard.sbo_time}</span><span>5 Comment</span>
									</p>
								</div>
									<div class="mb-4 sboardPrev" id = "sbo_content" >
										${sboard.sbo_content}
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
						}
						imgView();
	        		</script>
					
				</c:forEach>
				<!-- END-->
				<div class="row">
					<div class="col">
						<div class="block-27">
							<ul>
								<li><a href="#">&lt;</a></li>
								<li class="active"><span>1</span></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&gt;</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- END COL -->
		</div>
	</div>
</section>