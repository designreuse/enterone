<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


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

}

.tab-content.current {
	display: inherit;
}

</style>
<script>
	$(document).ready(function() {

		checkUser("개인회원");

		$('ul.tabs li').click(function() { //기업회원, 개인회원 선택클릭
			var user = $(this).text();
			
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			
			checkUser(user);			
		});
		
		
		$('#btnCheckm').on('click',function(){
			
			$.ajax({
                url :'${pageContext.request.contextPath}/checkId',
                type:"post",
                data : {mem_id : $("#mem_id").val() },
                
                success:function(data){

                   if (data == 0) {
                	   $("#checkId").html("");
                	   $("#checkId").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#divId");
                	   $("#btnAddMem").attr("disabled", false);
                   } else {
                	   $("#checkId").html("");
                	   $("#checkId").html("중복된 아이디입니다.").css("color","red").appendTo("#divId")
                   }

                },error:function(){ alert("실패"); }
             });

			
		});
		
		
		$('#btnAddCom').on('click',function(){
			
			$.ajax({
                url :'${pageContext.request.contextPath}/checkIdcom',
                type:"post",
                data : {com_id : $("#com_id").val() },
                
                success:function(data){

                   if (data == 0) {
                	   $("#checkIdcom").html("");
                	   $("#checkIdcom").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#divId");
                	   $("#btnAddCom").attr("disabled", false);
                   } else {
                	   $("#checkIdcom").html("");
                	   $("#checkIdcom").html("중복된 아이디입니다.").css("color","red").appendTo("#divId")
                   }

                },error:function(){ alert("실패"); }
             });

			
		});
		
		
		
		
	}); //end ready function

	
	
	
	function checkUser(user) {
		
		if (user == "개인회원") { //개인회원선택시

			$("#memFrm").attr("action", "${pageContext.request.contextPath}/memRegister");
		
		} else { //기업회원일때
			
			$("#comFrm").attr("action", "${pageContext.request.contextPath}/comRegister");
			
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


	<div id="tab-1" class="tab-content current" >
		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>회원가입</h4>
					<form id="memFrm" name="memFrm" method="post">
						<div class="form-group" id="divId">
							<div style="text-align: right;">
								<input type="radio" id="gender" name="gender" value="남" class="gender" checked="checked"> &nbsp; 남 &nbsp;&nbsp;
								<input type="radio" id="gender" name="gender" value="여" class="gender"> &nbsp; 여 &nbsp;&nbsp;
							</div>
							<label>아이디</label>
							<div style="position:relative">
								<input type="text" name="mem_id" id="mem_id" Class="form-control" style="papadding: 50px; display: inline-block;">
								<input type="button" value="중복확인" id="btnCheckm" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;"><br>
								<b id="checkId"></b>
							</div>
						</div>
						<div class="form-group">
							<label>이름</label> <input type="text" name="mem_name"
								id="mem_name" class="form-control">
						</div>

						<div class="form-group">
							<label class="fw">비밀번호</label> <input type="password" id="mem_pw"
								name="mem_pw" class="form-control">
						</div>

						<div class="form-group">
							<label>생년월일</label> <input type="date" name="mem_birth"
								id="mem_birth" class="form-control">
						</div>

						<div class="form-group">
							<label>연락처</label> <input type="text" name="mem_phone"
								id="mem_phone" class="form-control">
						</div>

						<div class="form-group">
							<label>이메일</label> <input type="text" id="mem_email"
								name="mem_email" class="form-control">
						</div>

						<div class="form-group">
							<label>주소</label> <input type="text" id="mem_address"
								name="mem_address" class="form-control"> <input
								type="text" id="mem_address2" name="mem_address2"
								class="form-control">
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddMem" disabled="disabled">가입</button>
						</div>
						<div class="form-group text-right">
							<a href="login">로그인</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
		<div id="tab-2" class="tab-content" >
		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>회원가입</h4>
					<form id="comFrm" name="comFrm" method="post">
						<div class="form-group">

							<label>아이디</label>
							<div style="position:relative">
								<input type="text" name="com_id" id="com_id" Class="form-control" style="papadding: 50px; display: inline-block;">
								<input type="button" value="중복확인" id="btnCheckc" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;"><br>
								<b id="checkIdcom"></b>
							</div>
							
						</div>
						<div class="form-group">
							<label>이름</label> <input type="text" name="com_name"
								id="com_name" class="form-control">
						</div>

						<div class="form-group">
							<label class="fw">비밀번호</label> <input type="password" id="com_pw"
								name="com_pw" class="form-control">
						</div>

						<div class="form-group">
							<label>연락처</label> <input type="text" name="com_phone"
								id="com_phone" class="form-control">
						</div>

						<div class="form-group">
							<label>이메일</label> <input type="text" id="com_email"
								name="com_email" class="form-control">
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddCom">가입</button>
						</div>
						<div class="form-group text-right">
							<a href="login">로그인</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
</section>