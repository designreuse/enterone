<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<head>
<script>
	function popup() {
		var url = "newmail";
		var name = "popup test";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);

		// 모달 팝업 띄울 시 발생하는 이벤트 (이벤트명 : show.bs.modal) 
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var what = button.data('what');
			// 모달 팝업에 데이터 집어넣기 
			var modal = $(this);
			modal.find('.modal-title').text('New message to ' + what)
			modal.find('.modal-body input').val(what)
		})

	}
	$(function() {
		$('.mailinfo')
				.on(
						'click',
						function(event) {
							var modal = $('#exampleModal2')
							var no = $(this).data("no");
							$
									.ajax({
										url : '${pageContext.request.contextPath}/onemailselect?lett_no='
												+ no,
										success : function(result) {
											modal.find('.mem_id').val(result.mem_id) //받는 회원
											modal.find('.lett_sid').val(result.lett_sid) // 보낸회원
											modal.find('.title').val(
													result.lett_title)
											modal.find('.content').val(
													result.lett_content)
													modal.find('.no').val(
													result.lett_no)
											modal.modal('show');
										}
									})
						})
	})
	
// 	답장기능
		$(function() {
		$('#mailreply').on('click',	function(event) {
							var modal = $('#exampleModal3')
							$('#recipient-rename').val($('#recipient-mname').val())
							modal.modal('show');
							$('#member-name').val($('#mamber-name').val())
													})
		})
</script>
</head>
<section class="single">
	<div class="container">
		<div class="row">
			<div style="width: 75%">
				<div class="line">
					<div>
						<a id="rgoods">최근 쪽지</a>
					</div>
				</div>
				<div class="row rgoods">
					<div>
						<button style="float: right;" type="button"
							class="btn btn-primary" data-toggle="modal"
							data-target="#exampleModal" data-what="hello">새 쪽지 보내기</button>
						<table
							class="table table-striped table-dark table-hover maildetail">
							<tr>
								<th scope="col" width="5%">#</th>
								<th scope="col" width="30%">제목</th>
								<th scope="col" width="20%">아이디</th>
								<th scope="col" width="20%">받은날짜</th>
							</tr>
							<c:forEach items="${mymaillist}" var="mail">
								<tr style="text-align: left;" class="mailinfo"
									data-no="${mail.lett_no}">
									<td scope="col" width="5%">${mail.lett_no}</td>
									<td scope="col" width="30%">${mail.lett_title}</td>
									<td scope="col" width="20%">${mail.lett_sid}</td>
									<td scope="col" width="20%">${mail.lett_time}</td>
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
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document" style="padding-top: 10%;">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">새 쪽지 작성</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form id="sendmail" name="sendmail" action="sendmail">
								<div class="modal-body">
									<input type="text" class="form-control" id="recipient-name"
										name="lett_sid" value="${member.mem_id}"
										style="display: none">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">받는사람
											ID: </label> <input type="text" class="form-control"
											id="recipient-name" name="mem_id">
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">쪽지
											제목: </label> <input type="text" class="form-control"
											id="recipient-name" name="lett_title">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">내용:</label>
										<textarea class="form-control" id="message-text"
											name="lett_content"
											style="margin: 0px -1px 0px 0px; width: 568px; height: 250px; resize: none;"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									<button class="btn btn-primary">쪽지 보내기</button>
								</div>
							</form>

						</div>
					</div>
				</div>
<!-- 				받은쪽지=============받은쪽지=============받은쪽지=============받은쪽지=============            -->
				<div class="modal fade" id="exampleModal2" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document" style="padding-top: 10%;">
						<div class="modal-content">
							<form action="deletemail">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">받은 쪽지 확인</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<input type="text" class="form-control mem_id" id="mamber-name"
										name="mem_id" style="display: none"><!-- 받은회원, 내 아이디 -->
									<div class="form-group">
										<label for="recipient-name" class="col-form-label ">보낸회원
											ID: </label> <input type="text" class="form-control lett_sid"
											id="recipient-mname" name="lett_sid">
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label ">쪽지
											제목: </label> <input type="text" class="form-control title"
											id="recipient-title" name="lett_title">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label ">내용:</label>
										<textarea class="form-control content" id="message-text"
											name="lett_content"
											style="margin: 0px -1px 0px 0px; width: 568px; height: 250px; resize: none;"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="mailreply">답장</button>
									<button class="btn btn-primary">삭제</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal fade" id="exampleModal3" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document" style="padding-top: 10%;">
						<div class="modal-content">
						
<!-- 						답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장답장 -->
						
							<form name="replymail"  action="sendmail">
							<input class="no" name="lett_no" id="lett_no" data-no="lett_no" style="display: none" >
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">답장 하기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<input type="text" class="form-control mid" id="member-name"
										name="lett_sid" style="display: none"> 
									<div class="form-group">
										<label for="recipient-name"  class="col-form-label lett_sid">받는사람
											ID: </label> <input type="text" class="form-control rid"
											id="recipient-rename" name="mem_id" readonly="readonly">
									</div> 
									<div class="form-group">
										<label for="recipient-name" class="col-form-label ">쪽지
											제목: </label> <input type="text" class="form-control title"
											id="recipient-name" name="lett_title">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label ">내용:</label>
										<textarea class="form-control content" id="message-text"
											name="lett_content"
											style="margin: 0px -1px 0px 0px; width: 568px; height: 250px; resize: none;"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button class="btn btn-primary">답장 보내기</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
