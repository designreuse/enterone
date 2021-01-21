<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<script>
	$('document')
			.ready(
					function() {

						var ctx = document.getElementById('cnt').getContext(
								'2d');
						var chart = new Chart(
								ctx,
								{ // The type of chart we want to create 
									type : 'bar', // The data for our dataset 
									data : {
										labels : [ '개인회원', '기업회원', '스타회원' ],
										datasets : [ {
											label : '회원 별 인원 수',
											backgroundColor : [
													'rgba(255, 99, 132, 0.5)',
													'rgba(54, 162, 235, 0.5)',
													'rgba(255, 206, 86, 0.5)' ],
											borderColor : [
													'rgb(255, 99, 132,1.5)',
													'rgba(54, 162, 235, 1.5)',
													'rgba(255, 206, 86, 1.5)' ],
											data : [ "${cnt.memCnt}",
													"${cnt.comCnt}",
													"${cnt.stCnt}" ]
										} ]
									}, // Configuration options go here 
									options : {
										title : {
											display : true,
											text : '회원 정보',
											fontSize : 30,
											fontColor : 'rgba(46, 49, 49, 1)'
										},
										legend : {
											labels : {
												fontColor : 'rgba(83, 51, 237, 1)',
												fontSize : 15
											}
										},
										scales : {
											xAxes : [ {
												ticks : {
													fontColor : 'rgba(27, 163, 156, 1)',
													fontSize : '15'
												}
											} ],
											yAxes : [ {
												ticks : {
													beginAtZero : true,
													fontColor : 'rgba(246, 36, 89, 1)',
													fontSize : '15'
												}
											} ]
										}
									}
								});

						$('td').on('click', function(event) {
							$(location).attr('href','${pageContext.request.contextPath}/adminQna');});
					});
</script>
<style>
.pagination li {
	display: inline-block;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid gray;
	margin: 0 4px;
}

.pagination a.active {
	background-color: rgb(53, 52, 52);
	color: white;
	border: 1px solid gray;
}

.pagination a:hover:not(.active) {
	background-color: lightgray;
	color: black;
}
</style>

<!-- Main content -->
<section class="content">

	<!-- Main row -->
	<div class="row" style="padding: 50px 15px 0px 15px;">
		<!-- Left col -->
		<section class="col-lg-6 connectedSortable">

			<div class="card">
				<div class="card-body">
					<div class="chart-container"
						style="position: relative; height: auto; width: auto;"
						align="center">
						<canvas id="cnt"></canvas>
					</div>
				</div>
			</div>

		</section>

		<section class="col-lg-6 connectedSortable">

			<div class="card" style="height: 450px;">
				<div class="card-header">
					<h3 class="card-title">
						<i class="fas fa-chart-pie mr-1"></i> QnA 답변
					</h3>
				</div>


				<div class="card-body">
					<table class="table table-hover" style="padding: 20px">
						<tr>
							<th style="width: 200px;">등록일</th>
							<th style="width: 200px;">제목</th>
							<th style="width: 100px;">답변 여부</th>
						</tr>
						<c:forEach var="qna" items="${qnaList}">
							<tr>
								<td>${qna.q_time}</td>
								<td>${qna.q_title}</td>
								<td>미완료</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="card-footer">
					<div align="center">
							<script>
								function goPage(p) {
									location.href = "${pageContext.request.contextPath}/adminMain?p=" + p
								}
							</script>

							<my:paging paging="${paging}" jsfunc="goPage" />
					</div>
				</div>
			</div>

		</section>
	</div>

</section>
