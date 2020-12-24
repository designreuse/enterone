<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</script>
</head>
<section class="single">
	<div class="container">
		<div class="row">
			<div class="col-md-8" style="margin-left: 30%">
				<div class="line">
					<div>
						<a id="rgoods">최근 쪽지</a>
					</div>
				</div>
				<div class="row rgoods">
					<div>
						<table class="table table-striped table-dark">
							<thead>
								<tr>
									<th scope="col" width="5%">#</th>
									<th scope="col" width="30%">제목</th>
									<th scope="col" width="20%">아이디</th>
									<th scope="col" width="20%">받은날짜</th>
									<th scope="col" style="width: 10%"><button type="button"
											class="btn btn-primary" data-toggle="modal"
											data-target="#exampleModal" data-what="hello">새 쪽지
											보내기</button></th>
								</tr>
							</thead>
							</tbody>
						</table>
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
							<div class="modal-body">
								<form>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">받는사람
											ID: </label> <input type="text" class="form-control"
											id="recipient-name">
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">쪽지
											제목: </label> <input type="text" class="form-control"
											id="recipient-name">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">내용:</label>
										<textarea class="form-control" id="message-text"
											style="margin: 0px -1px 0px 0px; width: 568px; height: 250px; resize: none;"></textarea>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Send
									message</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
