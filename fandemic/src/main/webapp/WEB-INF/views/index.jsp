<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<script>
	var maxNo=0;
	
	$(function() {

		$('ul.tabs li').click(function() {

			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		});
		
		// 실시간 sns
		$('.sscroll').scroll(function(){
	        var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
	        var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
	        var contentH = $('#divContent').height(); //문서 전체 내용을 갖는 div의 높이

	       if(scrollT + scrollH +1 >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
	    	   newSns();
	        } 
	    });
		
		// 차트
		var ctx = $('#myChart');
		var myChart = new Chart(ctx, {
				type : 'pie',
				data : {
					labels : [ '${stCnt[0].ST_NAME}', '${stCnt[1].ST_NAME}', '${stCnt[2].ST_NAME}' ],
					datasets : [ {
						label : '#',
						data : [ '${stCnt[0].CNT}', '${stCnt[1].CNT}', '${stCnt[2].CNT}' ],
						backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)", "rgba(200, 50, 255, 0.5)"]
						
					} ]
				},      
				options : {
					 title: {
		                    display: true,
		                    text: 'FAN CLUB TOP3'
	                }
				}
			});
		
		
		// 스타 top3
		var mem_id = "${sessionScope.member.mem_id}";
		if ( mem_id == null || mem_id == '') {
			
		} else {
			
			$.ajax({
	            url :'${pageContext.request.contextPath}/myStar3',
	            type:"post",
	            dataType:'json',
	            data : {mem_id : mem_id },
	            
	            success:function(data){
	            	
	            	if(data == null) { //스타가입 ㄴㄴ
	            		$("#myStar3").html($("<h5>").html("팬 가입을 하세요"));
	            		
	            	} else { // 스타가입 ㅇㅇ
	            		
	            		var last=0;
							            	
	            		if(data.length < 3) { 
	            			last = data.length; 
	            		} else { 
	            			last = 3;
	            		}
	            		
	            		console.log(last);
	            		for( var i=0 ; i < last; i++) {
	            			var stName = data[i].ST_NAME;
	            			$("#st" + (i+1)).text(data[i].ST_NAME).css("display","");	
	            		}

		            	for(var i=0; i < last; i++) { // last 만큼만 for문
		            		var img = data[i].ST_ICON;
		            		if ( img == null || img == '') {
		            			$("#stImg" + (i+1)).attr("src","${pageContext.request.contextPath}/images/member_pic/no-profile.jpg").css("display","");
		            		} else {
		            			$("#stImg" + (i+1)).attr("src","${pageContext.request.contextPath}/images/star/" + img).css("display","");
		            		}
		            	}
		            	
		            	for(var i=0; i < last; i++) {
		            		var img = data[i].CNT;
		            		$("#cnt" + (i+1)).text(data[i].CNT).css("display","");	            
		            	}
	            	}
	            },error:function(){ alert("실패"); }
	         });
		}

	}); 
	
	// sns 실시간
	function newSns() {
		
		
		var maxSnsNo = 0;
		
		if(maxNo == 0) {
			maxSnsNo = "${maxSnsNo}";
			console.log("0일 때" + maxSnsNo);
		} else {
			maxSnsNo = maxNo;
			console.log("0이 아닐 때" + maxSnsNo);
		}
		
		console.log(maxSnsNo);
		$.ajax({
	            url :'${pageContext.request.contextPath}/newSns',
	            type:"post",
	            dataType:'json',
	            data : {maxSnsNo : maxSnsNo },
	            success:function(data){

	            	if ( data != null) {
	            	$(data).each(function(index, item){
	            		
	            		if (item.mem_pic == null) { // 프로필이 null 일 때
	            			var imgs = '<img src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg" class="snsImg"><br />';
	            			
	            		} else if (item.mem_type ==0) { // 소셜 로그인 일 때
	            			var imgs = '<img src="'+ item.mem_pic + '" class="snsImg"><br />';
	            			
      					} else { // 소셜ㄴㄴ 프로필 null ㄴㄴ 일 때 
      						var imgs = '<img src="${pageContext.request.contextPath}/images/member_pic/'+ item.mem_pic + '" class="snsImg"><br />';
      					}
	            		var tr = $("<tr />");
	                	var td = $("<td />");
	                	var td2 = $("<td />");
	                	$(td).append(imgs);
	                	$(td2).append().html("<hr style='background-color: blue'>" + item.sns_time +"<br>" + item.sns_title +"<br>" + item.sns_content);
	                	tr.append(td, td2);
	                    $('#snsTbl').append(tr);
	                    
	                    maxNo = item.sns_no;
      				});

	            }
	           },error:function(){ alert("실패"); }
	         });
		
		
		
    	
    	
		
	}
</script>

<style>

.modal-open .modal {
	padding : 250px;
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
	display: inline-block;  /* 이거 다르게 주면 줄바꿈 될거같은데 */
	padding: 10px 25px;
	cursor: pointer;
	/* border : 1px solid #8ac121; */
}

ul.tabs li.current {
	border-top: 2px solid #8ac121;
	background: #FDFDFD;
}

ul.tabs li.current span {
	color: #8ac121;
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
							<a href="#"><div class="badge">Tip!</div> Vestibulum ante
								ipsum primis in faucibus orci</a>
						</div>
						<div class="item">
							<a href="#">Ut rutrum sodales mauris ut suscipit</a>
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
										src="${pageContext.request.contextPath}/images/goods/${gos.go_pic} "
										alt="TICKET" style="width: 500px; height: 800px;">
								</figure>
								<div class="details">
									<div style="color: white;" class="#">${gos.st_id}</div>
									<h1>
										<a href="#">${gos.go_name}</a>
									</h1>
									<!-- 클릭한 행사 상세페이지로 이동시킬꺼야 -->
									<div style="color: white;" class="#">${fn:substring(gos.go_untsdate,0,10)}</div>
								</div>
							</article>
						</div>
					</c:forEach>

				</div>
				<div class="line">
					<div>????</div>
				</div>
				<!-- 차트 -->
				<div class="row">
					<div> 
						<div align="left" class="chart-container" style=" padding: 20px">
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>

			</div>

			<div class="col-xs-6 col-md-4 sidebar" id="sidebar"
				style="padding-top: 80px;">
				<div class="sidebar-title for-tablet">Sidebar</div>
				<aside>
					<div class="aside-body">
						<div class="featured-author">
							<div class="featured-author-inner">

								<!-- 로그인 -->
								<c:if
									test="${sessionScope.member.mem_id eq null and sessionScope.company.com_id eq null }">
									<div class="sc_login" >
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
									test="${sessionScope.member.mem_id ne null or sessionScope.company.com_id ne null }">
									<div class="featured-author-cover" style="background-image: url('images/news/img15.jpg');">
										<div class="badges">
											<div class="badge-item">
												<i class="ion-star"></i> Featured
											</div>
										</div>
										<div class="featured-author-center" id="profile" data-toggle="modal" data-target="#exampleModal" data-what="hello">
											<figure class="featured-author-picture">
												
												<!-- 소셜로그인 -->
												<c:if test="${sessionScope.member.mem_type eq 0 }">
													<img src="${sessionScope.member.mem_pic}" alt="member_profile" onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'" >
												</c:if>
												<!-- 일반로그인 -->
												<c:if test="${sessionScope.member.mem_type eq 1 }">
													<img src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.member.mem_pic}" alt="member_profile" onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'">
												</c:if>
												<!-- 기업로그인 -->
												<c:if test="${sessionScope.member.mem_pic eq null }">
													<img src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.company.com_pic}" alt="company_profile" onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'" >
												</c:if>
											</figure>
											
											<div class="featured-author-info">
												<h2 class="name" style="color: black;">${sessionScope.member.mem_name}</h2>
												<h2 class="name" style="color: black;">${sessionScope.company.com_name}</h2>
												<c:if test="${sessionScope.member.mem_type ne 0 }">
													<div class="desc" style="color: #f73f52;">${sessionScope.member.mem_id}</div>
												</c:if>
											</div>
										</div>


									</div>
									<!-- 내 스타목록 개인 로그인 때만 출력-->
									
									<c:if test="${sessionScope.member.mem_id ne null }">
									<div class="featured-author-center" align="center" id="myStar3">

										<table>
											<tr>
												<td align="center"><img id="stImg1" class="inputimg" src="" alt="member_profile" style="width: 50px; height: 50px; display: none;"></td>
												<td align="center"><img id="stImg2" class="inputimg" src="" alt="member_profile" style="width: 50px; height: 50px; display: none;"></td>
												<td align="center"><img id="stImg3" class="inputimg" src="" alt="member_profile" style="width: 50px; height: 50px; display: none;"></td>
											</tr>
											
											<tr>
												<td align="center"><e id="st1" class="name" style="color: black; display: none;"></e></td> 
												<td align="center"><e id="st2" class="name" style="color: black; display: none;"></e></td>
												<td align="center"><e id="st3" class="name" style="color: black; display: none;"></e></td>
											</tr>
											<tr>
												<td align="center"><e id="cnt1" class="cnt" style="color: black; display: none;"></e></td> 
												<td align="center"><e id="cnt2" class="cnt" style="color: black; display: none;"></e></td>
												<td align="center"><e id="cnt3" class="cnt" style="color: black; display: none;"></e></td>
											</tr>
										</table>
									</div>
									</c:if>
									
								</c:if>   

							</div>
						</div>



					</div>
				</aside>
				<aside>
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
						<div align="right">
							<a style="color: #00b523;" href="https://www.melon.com/chart/index.htm" target="_blank"> >바로가기</a>
						</div>
						<table>
							<c:forEach items="${melon}" var="mel">
								<tr style="border-bottom: 1pt solid #8ac121;">
									<td style="padding: 5px; width: 50px"><h6>${mel.no}</h6></td>
									<td style="padding: 5px"><img src="${mel.img}" alt="melon"
										style="width: 35px; height: 35px;"></td>
									<td style="padding: 8px"><c:if test="${fn:length(mel.song) > 20 }">
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
						</table>
					</div>

					<div id="tab-2" class="tab-content" style="width: 90%">
						<div align="right">
							<a style="color: #00b523;" href="https://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do" target="_blank"> >바로가기</a>
						</div>
						<table style="width: 100%">
							<c:forEach items="${movie}" var="mv">
								<tr style="border-bottom: 1pt solid #8ac121;">
									<td style="padding: 5px; width: 50px"><h6>${mv.rank}</h6></td>
									<td style="padding: 5px;">
										<div>${mv.movieNm}</div>
										<div>${mv.openDt}</div>
									</td>
									<td style="padding: 5px;">${mv.audiCnt}명</td>

								</tr>
							</c:forEach>
						</table>
					</div>

					<div id="tab-3" class="tab-content" style="width: 90%">
					<div align="right">
						<a style="color: #00b523;" href="http://www.nielsenkorea.co.kr/tv_terrestrial_day.asp?menu=Tit_1&sub_menu=1_1&area=01" target="_blank"> >바로가기</a>
					</div>
						<table style="width: 100%">
							<c:forEach items="${rating}" var="ra">
								<tr style="border-bottom: 1pt solid #8ac121;">
									<td style="padding: 5px; width: 50px"><h6>${ra.no}</h6></td>
									<td style="padding: 5px;">
										<c:if test="${fn:length(ra.name) > 10 }">
											<div>${fn:substring(ra.name,0,10)}...</div>
										</c:if> 
										<c:if test="${fn:length(ra.name) <= 10 }">
											<div>${ra.name}</div>
										</c:if>
									</td>
									<td style="padding: 5px;">${ra.ct}</td>
									<td style="padding: 5px;">${ra.rat}%</td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</aside>

				
			</div>
		</div>
		<!-- sns 뿌리기 -->
		<div class="line">
			<div>???</div>
		</div>
		<div class="content" style="padding-top: 20px; " >
			<div class="sscroll" style="overflow-y:scroll; width:100%; height:500px; padding: 20px;">
					<div id="divContent" > 
						<table id="snsTbl">
						<c:forEach items="${snsList}" var="sns">
							<tr > 
								<c:if test="${sns.mem_type ne 0 }">
									<td><img class="snsImg" src="${pageContext.request.contextPath}/images/member_pic/${sns.mem_pic}" onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'" style="width: 60px; height: 60px; margin: 20px;"></td><!-- 프로필 사진 -->
								</c:if>
								<c:if test="${sns.mem_type eq 0 }">
									<td><img class="snsImg" src="${sns.mem_pic}" onerror="this.src='${pageContext.request.contextPath}/images/member_pic/no-profile.jpg'" style="width: 60px; height: 60px; margin: 20px;"></td><!-- 프로필 사진 -->
								</c:if>
								<%-- <c:if test="${sns.mem_pic eq null}">
									<td><img class="snsImg" src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"style="width: 60px; height: 60px; margin: 20px;"></td><!-- 프로필 사진 -->
								</c:if> --%>
								<td style="margin: 20px; width: 100%;">
									<hr>
									${sns.sns_time} <br>
									${sns.sns_title} <br>
									<c:if test="${fn:length(sns.sns_content) > 200 }">
										${fn:substring(sns.sns_content,0,200)}...
									</c:if>
									<c:if test="${fn:length(sns.sns_content) <= 200 }">
										${fn:substring(sns.sns_content,0,200)}
									</c:if>
								</td>
							</tr>
							
						</c:forEach>
							
						</table>
						
					</div>
				
				</div>
		</div>
	</div><!-- 카드 -->

	<!-- 모달창 -->
	<c:if test="${sessionScope.member.mem_type eq 1}">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog" role="document" style="width: 300px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">프로필 사진 등록</h5>
				</div>
				<form action="proUpdate" method="post" encType="multipart/form-data">
				<div class="modal-body" align="center" >
					<div class="form-group">
						<input type="file" name="profile" class="form-control">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<input type="submit" value="등록" class="btn btn-primary" id ="btnAdd">
				</div>
				</form>
			</div>
		</div>
	</div>
	</c:if>
	
</section>
