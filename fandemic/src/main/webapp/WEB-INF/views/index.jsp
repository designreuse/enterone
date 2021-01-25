<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script>
	var maxNo = 0;

	$(function() {

		$('ul.tabs li').click(function() {

			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		});

		// 실시간 sns 5초마다 업데이트 (50초마다)
		/* window.setInterval(function(){
			newSns();
		}, 50000); */

		$('.sscroll').scroll(function() {
			var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
			var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
			var contentH = $('#divContent').height(); //문서 전체 내용을 갖는 div의 높이

			if (scrollT + scrollH + 1 >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
				newSns();
			}
		});

		// 차트
		var ctx = $('#myChart');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 	'${stCnt[0].ST_NAME}', '${stCnt[1].ST_NAME}',
							'${stCnt[2].ST_NAME}', '${stCnt[3].ST_NAME}',
							'${stCnt[4].ST_NAME}', '${stCnt[5].ST_NAME}',
							'${stCnt[6].ST_NAME}', '${stCnt[7].ST_NAME}',
							'${stCnt[8].ST_NAME}', '${stCnt[9].ST_NAME}'],
				datasets : [ {
					label : '팬클럽',
					data : [ '${stCnt[0].CNT}', '${stCnt[1].CNT}',
							 '${stCnt[2].CNT}', '${stCnt[3].CNT}',
							 '${stCnt[4].CNT}', '${stCnt[5].CNT}',
							 '${stCnt[6].CNT}', '${stCnt[7].CNT}',
							 '${stCnt[8].CNT}', '${stCnt[9].CNT}'],
					backgroundColor : [ "rgba(17, 23, 75, 0.6)",
										"rgba(24, 33, 107, 0.6)",
										"rgba(32, 54, 134, 0.6)",
										"rgba(42, 85, 153, 0.6)",
										"rgba(52, 116, 172, 0.6)",
										"rgba(62, 148, 192, 0.6)",
										"rgba(72, 179, 211, 0.6)",
										"rgba(120, 198, 208, 0.6)",
										"rgba(170, 218, 204, 0.6)",
										"rgba(220, 236, 201, 0.6)"]

				} ]
			},
			options : {

				legend : {
					labels : {
						fontColor : 'rgba(1, 1, 7, 1)',
						fontSize : 15
					}
				},
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : 'rgba(1, 1, 7, 1)',
							fontSize : '15'
						}
					} ],
					yAxes : [ {
						ticks : {
							beginAtZero : true,
							fontColor : 'rgba(65, 118, 224, 1)',
							fontSize : '15'
						}
					} ]
				}
			}
		});

		// 스타 top3
		var mem_id = "${sessionScope.member.mem_id}";
		if (mem_id == null || mem_id == '') {

		} else {

			$
					.ajax({
						url : '${pageContext.request.contextPath}/myStar3',
						type : "post",
						dataType : 'json',
						data : {
							mem_id : mem_id
						},

						success : function(data) {

							if (data == null) { //스타가입 ㄴㄴ
								$("#myStar3").html($("<h5>").html("팬 가입을 하세요"));

							} else { // 스타가입 ㅇㅇ

								var last = 0;

								if (data.length < 3) {
									last = data.length;
								} else {
									last = 3;
								}

								console.log(last);
								for (var i = 0; i < last; i++) {
									var stName = data[i].ST_NAME;
									$("#st" + (i + 1)).text(data[i].ST_NAME)
											.css("display", "");
								}

								for (var i = 0; i < last; i++) { // last 만큼만 for문 stA3
									var img = data[i].ST_ICON;
									if (img == null || img == '') {
										$("#stImg" + (i + 1))
												.attr("src",
														"${pageContext.request.contextPath}/images/member_pic/no-profile.jpg")
												.css("display", "");
										$("#stA" + (i + 1)).attr(
												'href',
												'${pageContext.request.contextPath}/star/'
														+ data[i].ST_ID)
									} else {
										$("#stImg" + (i + 1)).attr(
												"src",
												"${pageContext.request.contextPath}/images/star/"
														+ img).css("display",
												"");
										$("#stA" + (i + 1)).attr(
												"href",
												"${pageContext.request.contextPath}/star/"
														+ data[i].ST_ID);
									}
								}

								for (var i = 0; i < last; i++) {
									var img = data[i].CNT;
									$("#cnt" + (i + 1)).text(data[i].CNT).css(
											"display", "");
								}
							}
						},
						error : function() {
							alert("실패");
						}
					});
		}

	});

	// sns 실시간
	function newSns() {
		
		var maxSnsNo = 0;
		if (maxNo == 0) { maxSnsNo = "${maxSnsNo}"; } 
		else { maxSnsNo = maxNo; } 

		$.ajax({
			url : '${pageContext.request.contextPath}/newSns',
			type : "post",
			dataType : 'json',
			data : { maxSnsNo : maxSnsNo },
			success : function(data) {
				
				if (data != null) {
					$(data).each(function(index, item) {
						if (item.mem_pic == null) { // 프로필이 null 일 때
							var imgs = '<img src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg" class="snsImg"><br />';
						} else if (item.mem_type == 0) { // 소셜 로그인 일 때
							var imgs = '<img src="'+ item.mem_pic + '" class="snsImg"><br />';
						} else { // 프로필이 null이 아니고 소셜 로그인도 아닐 때
							var imgs = '<img src="${pageContext.request.contextPath}/images/member_pic/'+ item.mem_pic + '" class="snsImg"><br />';
						}
						var tr = $("<tr />");
						var td = $("<td />");
						var td2 = $("<td />");
						$(td).append(imgs);
						$(td2).append().html("<hr style='background-color: blue'>"+ item.sns_time + "<br>"
												+ item.sns_title + "<br>" + item.sns_content);
						tr.append(td, td2);
						$('#snsTbl').append(tr);
						maxNo = item.sns_no;
					});

				}
			},
			error : function() {alert("실패");}
		});

	}
</script>

<style>
.modal-open .modal {
	padding: 250px;
}

.sscroll {
	width: 250px;
	height: 140px;
	overflow: auto;
}

.sscroll::-webkit-scrollbar {
	width: 10px;
}

.sscroll::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
}

.sscroll::-webkit-scrollbar-track {
	background-color: grey;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.inputimg {
	margin: 10px;
	border-radius: 70%;
	object-fit: cover;
}

.snsImg {
	width: 60px;
	height: 60px;
	margin: 10px;
	border-radius: 70%;
	object-fit: cover;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block; /* 이거 다르게 주면 줄바꿈 될거같은데 */
	padding: 10px 25px;
	cursor: pointer;
	/* border : 1px solid #4176E0; */
}

ul.tabs li.current {
	border-top: 2px solid #4176E0;
	background: #FDFDFD;
}

ul.tabs li.current span {
	color: #4176E0;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: inherit;
}

.sub_area {
	margin: 14px 8px 0 4px;
}

.sc_login {
	padding: 20px 16px 30px 30px;
	background-color: #f7f9fa;
	border: 1px solid #dae1e6;
}

.look_box {
	padding: 10px 5px 5px 10px;
	float: left;
}

.link_look {
	
}

.link_join {
	float: right;
	color: #505050;
}

.ffffsf {
	background-size: auto !important;
}

hr {
	border: 0;
	height: 2px;
	background: #ccc;
}
</style>



<section class="home">

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="headline">
					<div class="nav" id="headline-nav">
						<a class="left carousel-control" role="button" data-slide="prev">
							<span class="ion-ios-arrow-left" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" role="button" data-slide="next">
							<span class="ion-ios-arrow-right" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<div class="owl-carousel owl-theme" id="headline">
						<div class="item">
							<a href="${pageContext.request.contextPath}/company"><div
									class="badge">W!TH</div> 스타와 팬이 함께하는 우리만의 공간</a>
						</div>
						<div class="item">
							<a
								href="${pageContext.request.contextPath}/audition/auditionwork"><div
									class="badge">HOT</div> 누구나 스타가 될 수 있는 e-One에서 당신의 끼를 보여주세요.</a>
						</div>
					</div>
				</div>

				<div class="owl-carousel owl-theme slide" id="featured">

					<c:forEach items="${goods}" var="gos">
						<div class="item">

							<article class="featured">
								<div class="overlay"></div>
								<figure class="ffffsf">
									<img
										src="${pageContext.request.contextPath}/images/goods/${gos.go_pic}"
										onerror="this.src='${pageContext.request.contextPath}/images/etc/ticketDefault.jpg'"
										alt="TICKET" style="width: 500px; height: 800px;">
								</figure>
								<div class="details">
									<div style="color: white;">${gos.st_id}</div>
									<h1>
										<a
											href="${pageContext.request.contextPath}/goodsDetail/${gos.go_no}">${gos.go_name}</a>
									</h1>
									<!-- 클릭한 행사 상세페이지로 이동시킬꺼야 -->
									<div style="color: white;" class="#">${fn:substring(gos.go_untsdate,0,10)}</div>
								</div>
							</article>

						</div>
					</c:forEach>

				</div>
				<div class="line">
					<div>FAN CLUB TOP 5</div>
				</div>
				<!-- 차트 -->
				<div class="row">
					<div>
						<div align="left" class="chart-container" style="padding: 20px">
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>

			</div>

			<div class="col-xs-6 col-md-4 sidebar" id="sidebar"
				style="padding-top: 56px;">
				<div class="sidebar-title for-tablet">Sidebar</div>
				<aside style="margin-bottom: 0;">
					<div class="aside-body">
						<div class="featured-author">
							<div class="featured-author-inner" style="height: 313px;">

								<!-- 로그인 -->
								<c:if
									test="${sessionScope.member.mem_id eq null and sessionScope.company.com_id eq null and sessionScope.star.st_id eq null}">
									<div class="sc_login">
										<div class="sub_area">
											<a class="btn btn-primary btn-block" id="homeLogin"
												href="${pageContext.request.contextPath}/login">로그인</a>
											<div style="padding-bottom: 20px;">
												<a href="${pageContext.request.contextPath}/register"
													class="link_join" style="padding-top: 10px;">회원가입 </a>
											</div>
										</div>
									</div>
								</c:if>

								<!-- 프로필 -->
								<c:if
									test="${sessionScope.member.mem_id ne null or sessionScope.company.com_id ne null or sessionScope.star.st_id ne null}">
									<div class="featured-author-cover"
										style="height: 200px; background-image: url('images/news/img15.jpg');">
										<!-- <div class="badges">
											<div class="badge-item">
												<i class="ion-star"></i> Featured
											</div>
										</div> -->
										<div class="featured-author-center" id="profile"
											data-toggle="modal" data-target="#exampleModal"
											data-what="hello">
											<figure class="featured-author-picture">

												<!-- 소셜로그인 -->
												<c:if test="${sessionScope.member.mem_type eq 0 }">
													<img src="${sessionScope.member.mem_pic}"
														alt="member_profile"
														onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'">
												</c:if>
												<!-- 일반로그인 -->
												<c:if test="${sessionScope.member.mem_type eq 1 }">
													<img
														src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.member.mem_pic}"
														alt="member_profile"
														onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'">
												</c:if>
												<!-- 기업로그인 -->
												<c:if test="${sessionScope.company.com_pic ne null }">
													<img
														src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.company.com_pic}"
														alt="company_profile"
														onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'">
												</c:if>
												<!-- 스타로그인 -->
												<c:if test="${sessionScope.star.st_id ne null }">
													<img
														src="${pageContext.request.contextPath}/images/star/${sessionScope.star.st_pic}"
														alt="star_profile"
														onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'">
												</c:if>
											</figure>

											<div class="featured-author-info">
												<h2 class="name" style="color: black;">${sessionScope.member.mem_name}</h2>
												<h2 class="name" style="color: black;">${sessionScope.company.com_name}</h2>
												<h2 class="name" style="color: black;">${sessionScope.star.st_name}</h2>
												<c:if test="${sessionScope.member.mem_type ne 0 }">
													<div class="desc" style="color: #f73f52;">${sessionScope.member.mem_id}</div>
												</c:if>
											</div>
										</div>


									</div>
									<!-- 내 스타목록 개인 로그인 때만 출력-->

									<c:if test="${sessionScope.member.mem_id ne null }">
										<div class="featured-author-center" align="center"
											id="myStar3">

											<table>
												<tr>
													<td align="center"><a id="stA1"><img id="stImg1"
															class="inputimg" src="" alt="member_profile"
															style="width: 50px; height: 50px; display: none;"></a></td>
													<td align="center"><a id="stA2"><img id="stImg2"
															class="inputimg" src="" alt="member_profile"
															style="width: 50px; height: 50px; display: none;"></a></td>
													<td align="center"><a id="stA3"><img id="stImg3"
															class="inputimg" src="" alt="member_profile"
															style="width: 50px; height: 50px; display: none;"></a></td>
												</tr>

												<tr>
													<td align="center"><e id="st1" class="name"
															style="color: black; display: none;"></e></td>
													<td align="center"><e id="st2" class="name"
															style="color: black; display: none;"></e></td>
													<td align="center"><e id="st3" class="name"
															style="color: black; display: none;"></e></td>
												</tr>
												<tr>
													<td align="center"><e id="cnt1" class="cnt"
															style="color: black; display: none;"></e></td>
													<td align="center"><e id="cnt2" class="cnt"
															style="color: black; display: none;"></e></td>
													<td align="center"><e id="cnt3" class="cnt"
															style="color: black; display: none;"></e></td>
												</tr>
											</table>
										</div>
									</c:if>

								</c:if>

							</div>
						</div>



					</div>
				</aside>
				<aside style="padding: 80px 0px 0px 30px;">
					<div align="center">
						<ul class="tabs" style="padding-bottom: 10px">
							<li class="tab-link current" data-tab="tab-1"><a
								style="color: black;"><span>멜론차트</span></a></li>
							<li class="tab-link" data-tab="tab-2"><a
								style="color: black;"><span>박스오피스</span></a></li>
							<li class="tab-link" data-tab="tab-3"><a
								style="color: black;"><span>시청률</span></a></li>
						</ul>
					</div>

					<!-- 멜론차트 -->
					<div id="tab-1" class="tab-content current">
									<table>
							<c:choose>
								<c:when test="${melon eq null or melon eq '[]'}">
								<div align="center" style=" padding: 116px;">
									<a href="https://www.melon.com/chart/index.htm">Melon 서버 오류</a>
									</div>
								</c:when>
								<c:otherwise>
							
									<c:forEach items="${melon}" var="mel">
										<tr style="border-bottom: 1pt solid #f2f2f2;">
											<td style="padding: 5px; width: 50px"><h6>${mel.no}</h6></td>
											<td style="padding: 5px"><img src="${mel.img}"
												alt="melon" style="width: 35px; height: 35px;"></td>
											<td style="padding: 8px"><c:if
													test="${fn:length(mel.song) > 20 }">
													<div>${fn:substring(mel.song,0,20)}...</div>
												</c:if> <c:if test="${fn:length(mel.sing) > 20 }">
													<div>${fn:substring(mel.sing,0,20)}...</div>
												</c:if> <c:if test="${fn:length(mel.song) < 20 }">
													<div>${mel.song}</div>
												</c:if> <c:if test="${fn:length(mel.sing) < 20 }">
													<div>${mel.sing}</div>
												</c:if></td>
										</tr>
									</c:forEach>
								
								</c:otherwise>
							</c:choose>

						</table>
						<div align="right" style="    margin-top: 10px;">
							<a style="color: #022AD5; font-size: small;"
								href="https://www.melon.com/chart/index.htm" target="_blank">
								<img style="vertical-align: top;
    height: 15px;" src="https://upload.wikimedia.org/wikipedia/ko/d/de/%EB%A9%9C%EB%A1%A0_%28%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8%29_%EB%A1%9C%EA%B3%A0.png"> 
								</a>
								</div>
					</div>

					<div id="tab-2" class="tab-content" style="width: 90%">
						
						
								<table style="width: 100%">
							<c:choose>
								<c:when test="${movie eq null or movie eq '[]'}">
									<div align="center" style="margin-left: 23px; margin-top: 116px;">
									<a 
										href="https://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do">Kobis
										서버 오류</a>
										</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${movie}" var="mv">
										<tr style="border-bottom: 1pt solid #f2f2f2;">
											<td style="padding: 5px; width: 50px"><h6>${mv.rank}</h6></td>
											<td style="padding: 5px;">
												<div>${mv.movieNm}</div>
												<div>${mv.openDt}</div>
											</td>
											<td style="padding: 5px;">${mv.audiCnt}명</td>

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
							<div align="right" style="    margin-top: 10px;">
							<a style="color: #022AD5; font-size: small;"
								href="http://www.nielsenkorea.co.kr/tv_terrestrial_day.asp?menu=Tit_1&sub_menu=1_1&area=01" target="_blank">
								<img style="vertical-align: bottom; height: 45px;" src="https://mn.kobiz.or.kr/cheditor/attach/UuITzXlMuiVVHjhRaglk.jpg"> 
								</a>
								</div>
					</div>

					<div id="tab-3" class="tab-content" style="width: 90%">
									<table style="width: 100%">
							<c:choose>
								<c:when test="${movie eq null or movie eq '[]'}">
									<div align="center" style="margin-left: 23px; margin-top: 116px;">
										<a
											href="http://www.nielsenkorea.co.kr/tv_terrestrial_day.asp?menu=Tit_1&sub_menu=1_1&area=01">Nielsenkorea
											서버 오류</a>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${rating}" var="ra">
										<tr style="border-bottom: 1pt solid #f2f2f2;">
											<td style="padding: 5px; width: 50px"><h6>${ra.no}</h6></td>
											<td style="padding: 5px;"><c:if
													test="${fn:length(ra.name) > 10 }">
													<div>${fn:substring(ra.name,0,10)}...</div>
												</c:if> <c:if test="${fn:length(ra.name) <= 10 }">
													<div>${ra.name}</div>
												</c:if></td>
											<td style="padding: 5px;">${ra.ct}</td>
											<td style="padding: 5px;">${ra.rat}%</td>

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
							<div align="right" style="    margin-top: 10px;">
							<a style="color: #022AD5; font-size: small;"
								href="http://www.nielsenkorea.co.kr/tv_terrestrial_day.asp?menu=Tit_1&sub_menu=1_1&area=01" target="_blank">
								<img style="height: 25px; vertical-align: inherit;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Nielsen_logo.svg/220px-Nielsen_logo.svg.png"> 
								</a>
								</div>
					</div>
				</aside>


			</div>
		</div>
		<!-- sns 뿌리기 -->
		<div class="line">
			<div>NEW SNS</div>
		</div>
		<article class="featured">
			<div class="content" style="padding-top: 20px;">
				<div class="sscroll"
					style="overflow-y: scroll; width: 100%; height: 510px; padding: 20px;">
					<div id="divContent">
						<table id="snsTbl">
							<c:forEach items="${snsList}" var="sns">
								<c:if test="${sns.no <= 15 }">
									<tr>
										<c:if test="${sns.mem_type ne 0 }">
											<td><img class="snsImg"
												src="${pageContext.request.contextPath}/images/member_pic/${sns.mem_pic}"
												onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'"
												style="width: 60px; height: 60px; margin: 20px;"></td>
											<!-- 프로필 사진 -->
										</c:if>
										<c:if test="${sns.mem_type eq 0 }">
											<td><img class="snsImg" src="${sns.mem_pic}"
												onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'"
												style="width: 60px; height: 60px; margin: 20px;"></td>
											<!-- 프로필 사진 -->
										</c:if>
										<%-- <c:if test="${sns.mem_pic eq null}">
									<td><img class="snsImg" src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"style="width: 60px; height: 60px; margin: 20px;"></td><!-- 프로필 사진 -->
								</c:if> --%>
										<td style="margin: 20px; width: 100%;">
											<hr> ${sns.sns_time} <br> ${sns.sns_title} <br>
											<c:if test="${fn:length(sns.sns_content) > 200 }">
										${fn:substring(sns.sns_content,0,200)}...
									</c:if> <c:if test="${fn:length(sns.sns_content) <= 200 }">
										${fn:substring(sns.sns_content,0,200)}
									</c:if>
										</td>
									</tr>
								</c:if>
							</c:forEach>

						</table>

					</div>

				</div>
			</div>
		</article>

		<!-- 모달창 -->
		<c:if test="${sessionScope.member.mem_type eq 1}">
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document" style="width: 300px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel" align="center">프로필
								사진 등록</h5>
						</div>
						<form action="proUpdate" method="post"
							encType="multipart/form-data">
							<div class="modal-body" align="center">
								<div class="form-group">
									<input type="file" name="profile" class="form-control">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
								<input type="submit" value="등록" class="btn btn-primary"
									id="btnAdd">
							</div>
						</form>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</section>
