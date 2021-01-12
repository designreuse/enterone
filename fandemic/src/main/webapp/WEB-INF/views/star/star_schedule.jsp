<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<link rel=" shortcut icon" href="${pageContext.request.contextPath}/resourcesSchedule/image/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesSchedule/vendor/css/fullcalendar.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesSchedule/vendor/css/bootstrap.min.css">
	<link rel="stylesheet" href='${pageContext.request.contextPath}/resourcesSchedule/vendor/css/select2.min.css' />
	<link rel="stylesheet" href='${pageContext.request.contextPath}/resourcesSchedule/vendor/css/bootstrap-datetimepicker.min.css' />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesSchedule/css/main.css">

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>
					<input type="hidden" value="${star.st_id}" id="sch_stId">${star.st_name}스케줄
				</h1>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</section>
<section class="content ftco-section-3">
	<div class="container-fluid">
		<div class="row">

			<div class="container">

				

				<div id="wrapper">
					<div id="loading"></div>
					<div id="calendar"></div>
				</div>


				<!-- 일정 추가 MODAL -->
				<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title"></h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-allDay">하루종일</label> <input
											class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-title">일정명</label> <input
											class="inputModal" type="text" name="edit-title"
											id="edit-title" required="required" />
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-start">시작</label> <input
											class="inputModal" type="text" name="edit-start"
											id="edit-start" />
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-end">끝</label> <input
											class="inputModal" type="text" name="edit-end" id="edit-end" />
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-type">구분</label> <select
											class="inputModal" type="text" name="edit-type"
											id="edit-type">
											<option value="방송출연">방송출연</option>
											<option value="콘서트">콘서트</option>
											<option value="행사">행사</option>
											<option value="사인회">사인회</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-color">색상</label> <select
											class="inputModal" name="color" id="edit-color">
											<option value="#D25565" style="color: #D25565;">빨간색</option>
											<option value="#9775fa" style="color: #9775fa;">보라색</option>
											<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
											<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
											<option value="#f06595" style="color: #f06595;">핑크색</option>
											<option value="#63e6be" style="color: #63e6be;">연두색</option>
											<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
											<option value="#4d638c" style="color: #4d638c;">남색</option>
											<option value="#495057" style="color: #495057;">검정색</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<label class="col-xs-4" for="edit-desc">설명</label>
										<textarea rows="4" cols="50" class="inputModal"
											name="edit-desc" id="edit-desc"></textarea>
									</div>
								</div>
							</div>
							<div class="modal-footer modalBtnContainer-addEvent">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="save-event">저장</button>
							</div>
							<div class="modal-footer modalBtnContainer-modifyEvent">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
								<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->


</section>
<!-- /.content -->


	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/bootstrap-datetimepicker.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resourcesStar/js/calendar.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/js/addEvent.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/js/editEvent.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/js/etcSetting.js"></script>