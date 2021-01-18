<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesMypage/css/mypageA.css">
<script>
	$(
			function() {
				$('.qnainfo')
						.on(
								'click',
								function(event) {
									var modal = $('#exampleModal2')
									var no = $(this).data("no");
									$
											.ajax({
												url : '${pageContext.request.contextPath}/oneqnaselect?q_no='
														+ no,
												success : function(result) {
													modal.find('.no').val(
															result.q_no)
													modal.find('.title').val(
															result.q_title)
													modal.find('.content').val(
															result.q_content)
													modal.find('.answer').val(
															result.q_answer)
													modal.find('.time').val(
															result.q_time)
													modal.find('.atime').val(
															result.q_atime)
													modal.modal('show');
												}
											})
								})
			})
</script>

<body>
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" style="padding-top: 10%;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">새 쪽지 작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="deleteqna">
					<input class="no" name="q_no" style="display: none">
					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label ">문의
								제목: </label> <input type="text" class="form-control title">

							<div class="form-group">
								<label for="recipient-name" class="col-form-label ">문의
									내용:</label>
								<textarea class="form-control content" id="message-text"
									name="lett_content"
									style="margin: 0px -1px 0px 0px; width: 568px; height: 250px; resize: none;"></textarea>
							</div>

							<div class="form-group">
								<label for="recipient-name" class="col-form-label">답변:</label>
								<textarea class="form-control answer" id="message-text"
									name="lett_content"
									style="margin: 0px -1px 0px 0px; width: 568px; height: 250px; resize: none;"></textarea>
							</div>

							<div class="form-group aadaa">
								<label for="recipient-name" class="col-form-label ">보낸
									시간:</label> <input type="text" class="form-control time"
									id="recipient-name" name="lett_sid">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="col-form-label ">답변
									시간</label> <input type="text" class="form-control atime"
									id="recipient-name" name="lett_sid">
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary">삭제</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<section class="single">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-12">

						<div class="headline">
							<img alt="" src="">
							<div class="nav" id="headline-nav">
								<a class="left carousel-control" role="button" data-slide="prev">
									<span class="ion-ios-arrow-left" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="right carousel-control" role="button"
									data-slide="next"> <span class="ion-ios-arrow-right"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
							<!-- 헤더 밑 슬라이드 info -->
							<div class="owl-carousel owl-theme" style="margin-top: -20px;"
								id="headline">
								<div class="item">
									<a href="#"><div class="badge">Tip!</div>페이지 관련 문의입니다.</a>
								</div>
								<div class="item">
									<a href="#"><div class="badge">prom</div>스타, 소속사, 굿즈관련 문의는
										소속사에 문의해주세요! </a>
								</div>
							</div>
						</div>





						<h3 class="title">1:1 문의 내역</h3>
					</div>
					<div class="form-group col-md-12">
						<button type="button" style="padding-bottom: 10px; float: right;"
							class="btn btn-primary" onclick="location.href='my1o1ask'">문의등록하기</button>
						<table style="width: 100%"
							class="table table-striped table-dark table-hover">
							<tr>
								<td width="5%">#</td>
								<td width="15%">보낸날짜</td>
								<td width="30%">제목</td>
								<td width="35%">내용</td>
								<td width="5%">읽음</td>
							</tr>
							<c:forEach items="${qnalist}" var="qna">
								<tr class="qnainfo" data-no="${qna.q_no }">
									<td width="5%">${qna.q_no }</td>
									<td width="20%">${qna.q_time }</td>
									<td width="30%">${qna.q_title }</td>
									<td
										style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 100px; width: 35%">${qna.q_content }</td>
									<td width="10%"><c:if test="${!empty qna.q_answer}">
    										   &#128236;
       								</c:if> <c:if test="${empty qna.q_answer}">
								   				&#128235;
								    </c:if></td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
							<script>
								function goPage(p) {
									location.href = "${pageContext.request.contextPath}/mymail/"
											+ "?p=" + p
								}
							</script>

							<my:paging paging="${paging}" jsfunc="goPage" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
