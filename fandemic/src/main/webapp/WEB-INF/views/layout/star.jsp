<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>스타</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/aos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/jquery.timepicker.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/flaticon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/icomoon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesStar/css/star.css">
	<script>
		$(function() {
			var id = "${sessionScope.member.mem_id}"
			var cid = "${sessionScope.company.com_id}"
			var sid = "${sessionScope.star.st_id}"
			
			if(id != "" && id != null){
				$("#btnChannelChoose").show();
			}
			
			//메인페이지 이동 버튼
			$("#btnGoMain").on("click",function(){
				location.href = "${pageContext.request.contextPath}/"
			});
			//세션 아이디가 없을때 활동 못하게 막음
			$("body").on('click', 'a',function(e){
				if(id == null || id == ""){
					if(cid == null || cid == ""){
						if(sid == null || sid == ""){
							$("a").removeAttr("href")
							alert("로그인 후 이용해주세요");
							event.stopImmediatePropagation()
						}
					}
				}
			});
			
			//채널관리 버튼 누르면 수정/탈퇴 버튼 생성, 10초뒤에 원래 버튼으로 돌아감
			var timer;
			$("body").on('click',"#btnChannelChoose",function(e){
				var a1 = "<a href='#' id='btnChannelUpdate' data-toggle='modal' data-target='#channelUpdateModal'>닉네임수정&nbsp;</a>"
				var a2 = "<a href='#' id='btnChannelDelete' data-toggle='modal' data-target='#channelDeleteModal'>&nbsp;채널탈퇴</a>"
				$("#btnChannelChoose").replaceWith(a1+a2)
				timer = setInterval(makeAlert, 5000);
			});
			function makeAlert(){ 
				$("#btnChannelUpdate").replaceWith("<a href='#' id='btnChannelChoose' style='display:none;'>채널관리</a>")
				$("#btnChannelDelete").replaceWith("")
				console.log(":asdfasdf")
				clearInterval(timer);
			};
			
			//채널 닉네임 변경 액션
			$("body").on('click',"#channelUpdateAction",function(e){
				
			})
			
			//채널 탈퇴 액션
			$("body").on('click',"#channelDeleteAction",function(e){
				
			})
		})
		
		
//채널 닉네임 수정		
		// 닉네임 중복확인
		function FanNameCheck() {
			var st_id = "${stVo.st_id}"
			var fan_name = $("#channelNameUpdate").val()
			var regexPattern = /^[가-힣a-zA-Z0-9]{1,9}$/g;
	
			if (regexPattern.test(fan_name)) {
	
				$.ajax({
		            url :'${pageContext.request.contextPath}/star/fanNameCheck',
		            type:"GET",
		            data : {fan_name : fan_name, st_id : st_id},
		            
		            success:function(data){
		            	console.log("성공")		
		               if (data == 0) {
		            	   $("#checkFanNameUpdate").html(""); 
		            	   $("#checkFanNameUpdate").html("사용 가능한 닉네임입니다.").css("color","blue").appendTo("#divIdUpdate");
		            	   $("#fanReturnUpdate").html("T");
		            	   
		            	   
		               } else {
		            	   $("#checkFanNameUpdate").html("");
		            	   $("#checkFanNameUpdate").html("사용 중인 닉네임입니다.").css("color","red").appendTo("#divIdUpdate");
		            	   $("#fanReturnUpdate").html("F");
		               }
		
		            },error:function(){ alert("접속 실패"); }
		         });
				
			} else {
				 $("#checkFanNameUpdate").html("");
	      	     $("#checkFanNameUpdate").html("부적절한 단어입니다.").css("color","red").appendTo("#divId");
	      	     $("#fanReturnUpdate").html("F");
			}
		}
		
		//채널 닉네임 수정
		function channelJoinAction() {
			var st_id = "${stVo.st_id}";
			var st_name = "${stVo.st_name}";
			var fan_name = $("#channelNameUpdate").val();		
			$.ajax({
			    url: "${pageContext.request.contextPath}/star/fanNameUpdate/", 
			    type: 'POST', 
			    data : { st_id : st_id , fan_name : fan_name }, 
			    error:function(xhr, status, message) {
			        alert(" status: "+status+" er:"+message);
			    },
			    success: function(response) {
			    	if(response == true) {
			    		alert("닉네임이 변경되었습니다.");
			    		location.href = "${pageContext.request.contextPath}/star/" + st_id;//새로고침
			    	}
			    }
			});
		}
		
//채널 탈퇴	
		//탈퇴 전 닉네임 체크
		function FanNameCheck() {
			var st_id = "${stVo.st_id}"
			var fan_name = $("#channelNameDelete").val()
			var regexPattern = /^[가-힣a-zA-Z0-9]{1,9}$/g;
	
			if (regexPattern.test(fan_name)) {
	
				$.ajax({
		            url :'${pageContext.request.contextPath}/star/fanNameCheck',
		            type:"GET",
		            data : {fan_name : fan_name, st_id : st_id},
		            
		            success:function(data){
		            	console.log("성공")		
		               if (data == 0) {
		            	   $("#checkFanNameDelete").html(""); 
		            	   $("#checkFanNameDelete").html("사용 가능한 닉네임입니다.").css("color","blue").appendTo("#divIdDelete");
		            	   $("#fanReturnDelete").html("T");
		            	   
		            	   
		               } else {
		            	   $("#checkFanNameDelete").html("");
		            	   $("#checkFanNameDelete").html("사용 중인 닉네임입니다.").css("color","red").appendTo("#divIdDelete");
		            	   $("#fanReturnDelete").html("F");
		               }
		
		            },error:function(){ alert("접속 실패"); }
		         });
				
			} else {
				 $("#checkFanNameDelete").html("");
	      	     $("#checkFanNameDelete").html("부적절한 단어입니다.").css("color","red").appendTo("#divIdDelete");
	      	     $("#fanReturnDelete").html("F");
			}
		}
		
		//채널 탈퇴
		function channelJoinAction() {
			var st_id = "${stVo.st_id}";
			var st_name = "${stVo.st_name}";
			var fan_name = $("#channelNameDelete").val();		
			$.ajax({
			    url: "${pageContext.request.contextPath}/star/fanOut", 
			    type: 'POST', 
			    data : { st_id : st_id , fan_name : fan_name }, 
			    error:function(xhr, status, message) {
			        alert(" status: "+status+" er:"+message);
			    },
			    success: function(response) {
			    	if(response == true) {
			    		alert("채널에서 탈퇴하셨습니다.");
			    		location.href = "${pageContext.request.contextPath}/star/" + st_id;//새로고침
			    	}
			    }
			});
		}
		
		
		
		
		
	</script>
</head>

<body>
	<!-- 메뉴화면 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary"
			class="js-fullmainheight text-center">
			<%-- <div class="colorlibTop">
				<div class = "brand">
					<a href="${pageContext.request.contextPath}/">
	                   <img src="${pageContext.request.contextPath}/resources/images/minLogo.png" alt="Magz Logo">
	                </a>
				</div>
			</div> --%>
			<br>
			<h1 id="colorlib-logo">
				<a href="${pageContext.request.contextPath}/star/${stVo.st_id}"><span class="img"
					style="background-image: url(${pageContext.request.contextPath}/images/star/${stVo.st_pic}"></span>${stVo.st_name}</a>
			</h1>
			<button type="button" class="btn btn-primary absoluteLeft" id = "joinModal" data-toggle="modal"
				data-target="#exampleModal" data-what="hello"  style="display:none;">채널가입</button>
			<br> <br>

			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="${pageContext.request.contextPath}/star/${stVo.st_id}">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/star/profile/${stVo.st_id}">소개</a></li>
					<li><a href="${pageContext.request.contextPath}/star/schedule/${stVo.st_id}">스케줄</a></li>
					<li><hr></li>
					<li><a href="${pageContext.request.contextPath}/star/starBoard/${stVo.st_id}">스타 게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/star/fanBoard/${stVo.st_id}">팬 게시판</a></li>
					<li><a href="${pageContext.request.contextPath}/star/album/${stVo.st_id}">팬 앨범</a></li>
					<br><br><br><br><br><br>
					<li><a href="#" id="btnChannelChoose" style="display:none;">채널관리</a></li>
				</ul>
			</nav>
			
			
			<div class="colorlib-footer">
				<button type="button"  class="btn btn-primary py-2 px-4" id = "btnGoMain">채널 나가기</button>
			</div>
		</aside>
		
		
		<!-- 메뉴 제외 화면 -->
		<div id="colorlib-main">


			<!--  body 추가 부분 -->
			<tiles:insertAttribute name="body" />

			<!-- footer -->
			<footer class="ftco-footer ftco-bg-dark ftco-section">
				<div class="container px-md-5">
				<div class="row">
					<div class="col-md">
						<div class ="ftco-footer-widget mb-12 ml-md-12">
							<h2 class="ftco-heading-2">Have a Questions?</h2>
						</div>
					</div>
				</div>
					<div class="row">
						<div class="col-md">
							<div class="ftco-footer-widget mb-4 ml-md-4">
								<div class="block-23 mb-3">
									<ul>
										<li>
											<a href="#">
												<span class="icon icon-map-marker"></span>
												<span class="text">${company.com_address} <br> ${company.com_address2}</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<div class="block-23 mb-3">
									<ul>
										<li>
											<a href="#">
												<span class="icon icon-phone"></span>
												<span class="text">${company.com_phone}</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<div class="block-23 mb-3">
									<ul>
										
										
										<li>
											<a href="#">
												<span class="icon icon-envelope"></span>
												<span class="text">${company.com_email}</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">

							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="icon-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!-- footer종료 -->
		
	</div>
	<!-- 화면 종료 -->

	<!-- 채널가입 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"  style="max-width: 400px; width: auto;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">채널가입</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
							<label for="recipient-name" class="col-form-label">채널 닉네임  &nbsp;:&nbsp;</label>
							<input type="text" id="channelName" maxlength=10 size=20>
							<input type="button" name="" value="중복확인" id="btnCheckc" class="btn btn-primary btn-sm" style="font-size:12px;cursor:pointer;" />
						<br>
						<b id="checkFanName"></b>
						<b id="fanReturn" style="display: none;">F</b>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id ="channelJoinAction">가입</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 닉네임 수정 모달창 -->
	<div class="modal fade" id="channelUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"  style="max-width: 400px; width: auto;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">채널 닉네임 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
							<label for="recipient-name" class="col-form-label">채널 닉네임  &nbsp;:&nbsp;</label>
							<input type="text" id="channelNameUpdate" maxlength=10 size=20>
							<input type="button" name="" value="중복확인" id="btnCheckcUpdate" class="btn btn-primary btn-sm" style="font-size:12px;cursor:pointer;" />
						<br>
						<b id="checkFanNameUpdate"></b>
						<b id="fanReturnUpdate" style="display: none;">F</b>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id ="channelUpdateAction">수정</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 채널 탈퇴 모달창 -->
	<div class="modal fade" id="channelDeleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"  style="max-width: 400px; width: auto;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">채널 탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
							<label for="recipient-name" class="col-form-label">채널 닉네임  &nbsp;:&nbsp;</label>
							<input type="text" id="channelNameDelete" maxlength=10 size=20>
							<input type="button" name="" value="확인" id="btnCheckcDelete" class="btn btn-primary btn-sm" style="font-size:12px;cursor:pointer;" />
						<br>
						<b id="checkFanNameDelete"></b>
						<b id="fanReturnDelete" style="display: none;">F</b>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">채널 탈퇴를 원하신다면 채널 닉네임을 입력해주세요.</label>
						<label for="recipient-name" class="col-form-label">채널 탈퇴 시 작성한 글과 댓글은 모두 삭제됩니다.</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id ="channelDeleteAction">탈퇴</button>
				</div>
			</div>
		</div>
	</div>
	


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>



	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/aos.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/jquery.timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/resourcesStar/js/main.js"></script>

</body>
</html>