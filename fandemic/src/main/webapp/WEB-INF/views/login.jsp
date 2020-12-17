<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 25px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #4176E0;
	color: white;
}

.tab-content {
	display: none;
	padding: 15px 0;
	border-top: 3px solid #A4B7D4;
}

.tab-content.current {
	display: inherit;
}


</style>

<script>
	$(document).ready(function() {

		var user = $(this).text();

		checkUser(user);

		$('ul.tabs li').click(function() { //기업회원, 개인회원 선택클릭
			user = $(this).text();
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');

			checkUser(user);			
		});
		$(".btn.btn-primary.btn-block").on("click",function(){
			return formCheck();
		});
	}); //end ready function

	function checkUser(user) {
		if (user == "개인회원") { //개인회원선택시
			console.log(user);
			$("#memFrm").attr("action",
					"${pageContext.request.contextPath}/memberLogin");

		} else { //기업회원일때
			
			//소속사,스타체크
			var chk = $(".login:checked").val();
			console.log(chk);

			$(".login").change(function() {
				chk = $(".login:checked").val();
				console.log(chk);
				checkId(chk);
			});

			checkId(chk);

		}
	}

	function checkId(chk) {

		if (chk == "star") {

			$("#comFrm").attr("action",
					"${pageContext.request.contextPath}/starLogin");

		} else {

			$("#comFrm").attr("action",
					"${pageContext.request.contextPath}/companyLogin");
			
		}
	
	}
	
	function formCheck() { //수정중
		var frm = document.forms[2];
		console.log(document.forms[2].id);
		if(frm.id=="comFrm"){
			if(frm.comId.value==""){
				alert("개인사용자 아이디를 입력하세요.");
				frm.comId.focus();
				return false;
			}
			if(frm.comPw.value==""){
				alert("사용자 아이디를 입력하세요.");
				frm.comPw.focus();
				return false;
			}
			return true;
		}
		
		if(frm.id=="memFrm"){
			if(frm.memId.value==""){
				alert("기업사용자 아이디를 입력하세요.");
				frm.memId.focus();
				return false;
			}
			if(frm.memPw.value==""){
				alert("사용자 아이디를 입력하세요.");
				frm.memPw.focus();
				return false;
			}
			return true;
		}
		

	}
	
	
</script>

<section class="login first grey">

	<div style="text-align: center;">
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">개인회원</li>
				<li class="tab-link" data-tab="tab-2">기업회원</li>
			</ul>
		</div>
	</div>


	<div id="tab-1" class="tab-content current" style="text-align: center;">
		<div class="box-body">

			<div class="container">
				<div class="box-wrapper">
					<div class="box box-border">
						<div class="box-body">
							<h4>LOGIN</h4>
							<form id="memFrm" name="memFrm" method="post">
								<div class="form-group">
									<label class="fw" style="text-align: left;">아이디</label> <input
										type="text" id="memId" name="memId" class="form-control">
								</div>
								<div class="form-group">
									<label class="fw" style="text-align: left;">비밀번호<br></label>
									<input type="password" id="memPw" name="memPw"
										class="form-control">
									<p></p>
									<a href="forgot.html" class="pull-right">비밀번호 찾기</a><br>
								</div>
								<div class="form-group text-right">
									<button id="login" class="btn btn-primary btn-block">로그인</button>
								</div>
								<div class="form-group text-center">
									<a href="register">회원가입</a>
								</div>
								<div class="title-line">or</div>
								<a href="#" class="btn btn-social btn-block facebook"><i
									class="ion-social-facebook"></i> 소셜로그인 </a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div id="tab-2" class="tab-content" style="text-align: center;">
		<div class="box-body">
			<div class="container">
				<div class="box-wrapper">
					<div class="box box-border">
						<div class="box-body">

							<div style="text-align: right;">
								<input type="radio" class="login" name="login" value="company" checked="checked">&nbsp;소속사 &nbsp;&nbsp; 
								<input type="radio" class="login" name="login" value="star"> &nbsp;스타 &nbsp;&nbsp;
							</div>
							<h4>LOGIN</h4>
							<form id="comFrm" name="comFrm" method="post">
								<div class="form-group">
									<label class="fw" style="text-align: left;">아이디</label> <input
										type="text" id="comId" name="comId" class="form-control">
								</div>
								<div class="form-group">
									<label class="fw" style="text-align: left;">비밀번호<br></label>
									<input type="password" id="comPw" name="comPw"
										class="form-control">
									<p></p>
									<a href="forgot.html" class="pull-right">비밀번호 찾기</a><br>
								</div>
								<div class="form-group text-right">
									<button id="login" class="btn btn-primary btn-block">로그인</button>
								</div>
								<div class="form-group text-center">
									<a href="register">회원가입</a>
								</div>
								<div class="title-line">or</div>
								<a href="#" class="btn btn-social btn-block facebook"><i
									class="ion-social-facebook"></i> 소셜로그인 </a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>