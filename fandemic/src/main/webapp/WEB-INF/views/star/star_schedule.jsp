<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<link rel=" shortcut icon" href="${pageContext.request.contextPath}/resourcesSchedule/image/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesSchedule/vendor/css/fullcalendar.min.css" />
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesSchedule/vendor/css/bootstrap.min.css">
 --%>	<link rel="stylesheet" href='${pageContext.request.contextPath}/resourcesSchedule/vendor/css/select2.min.css' />
	<link rel="stylesheet" href='${pageContext.request.contextPath}/resourcesSchedule/vendor/css/bootstrap-datetimepicker.min.css' />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesSchedule/css/main.css">

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>
					<input type="hidden" value="${stVo.st_id}" id="sch_stId">${stVo.st_name}스케줄
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
									<table class = "table table-hover" style="text-align: center;">
										<tr>
											<td>일정명</td>
											<td>
												<p id = "edit-title"></p>
											</td>
										</tr>
										<tr>
											<td>기간</td>
											<td>
												<span id = "edit-start"></span>
												&nbsp;~&nbsp;
												<p id = "edit-end"></p>
											</td>
										</tr>
										<tr>
											<td>구분</td>
											<td>
												<p id = "edit-type"></p>
											</td>
										</tr>
										<tr>
											<td>설명</td>
											<td>
												<p id = "edit-desc"></p>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="modal-footer modalBtnContainer-modifyEvent">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
    <%-- <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/bootstrap.min.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/bootstrap-datetimepicker.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resourcesStar/js/schedule/main.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesStar/js/schedule/addEvent.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesStar/js/schedule/editEvent.js"></script>
    <script src="${pageContext.request.contextPath}/resourcesStar/js/schedule/etcSetting.js"></script>