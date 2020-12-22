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
		
		

		

		
		// 개인 중복확인
		$('#btnCheckm').on('click',function(){
			
			$.ajax({
                url :'${pageContext.request.contextPath}/checkId',
                type:"post",
                data : {mem_id : $("#mem_id").val() },
                
                success:function(data){

                   if (data == 0) {
                	   $("#checkId").html("");
                	   $("#checkId").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#divId");

                   } else {
                	   $("#checkId").html("");
                	   $("#checkId").html("중복된 아이디입니다.").css("color","red").appendTo("#divId")
                   }

                },error:function(){ alert("실패"); }
             });

			
		});
		
		// 기업 중복확인
		$('#btnCheckc').on('click',function(){
			
			$.ajax({
                url :'${pageContext.request.contextPath}/checkIdcom',
                type:"post",
                data : {com_id : $("#com_id").val() },
                
                success:function(data){

                   if (data == 0) {
                	   $("#checkIdcom").html("");
                	   $("#checkIdcom").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#comDiv");
                   } else {
                	   $("#checkIdcom").html("");
                	   $("#checkIdcom").html("중복된 아이디입니다.").css("color","red").appendTo("#comDiv")
                   }

                },error:function(){ alert("실패"); }
             });

		});
		
		
		
		
	}); //end ready function
	
	
	// 비밀번호 확인
   	function passwordChk(pw1, pw2, btn, divv) {
	      $(pw1).addClass('pw');
	      $(pw2).addClass('pw');
	      
	       $('.pw').focusout(function () {
	              var pwd1 = $(pw1).val();
	              var pwd2 = $(pw2).val();
	           
	              if ( pwd1 != '' && pwd2 == '' ) {
	                  null;
	              } else if (pwd1 != "" || pwd2 != "") {
	                  if (pwd1 == pwd2) {
	                      // 비밀번호 일치 이벤트 실행
	                      $(btn).attr("disabled", false);
	                      $("#bTag").html("").attr("id","bTag"); // 안됨
	                      $("<b>").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#comDiv");
	                  } else {
	                      // 비밀번호 불일치 이벤트 실행
	                     $(btn).attr("disabled", true);
	                     $("<b>").html("").attr("id","bTag");
	                	 $("#bTag").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#comDiv");
	                     $(pw2).focus();
	                  }
	              }
       });
}
	
	
	// 개인/기업 나누기
	function checkUser(user) {
		
		if (user == "개인회원") { 
			
			passwordChk($("#mem_pw"), $("#mem_pwCheck"), $("#btnAddMem"), $("#memPwd"));
			
			$("#memFrm").attr("action", "${pageContext.request.contextPath}/memRegister");
			
		} else { 
		
			passwordChk($("#com_pw"), $("#com_pwCheck"), $("#btnAddCom"), $("#comPwd"));
			
			$("#comFrm").attr("action", "${pageContext.request.contextPath}/comRegister");
		}
	}
</script>


<section class="login first grey">

	<div style="text-align: center;">
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">개인회원</li>
				<li class="tab-link" data-tab="tab-2" ">기업회원</li>
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
						<div class="form-group" id="memPwd">
							<label class="fw">비밀번호 확인</label> <input type="password" id="mem_pwCheck"
								name="mem_pwCheck" class="form-control">
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
						<div id="comDiv" class="form-group">

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
						
						<div class="form-group" id="comPwd">
							<label class="fw">비밀번호 확인</label> <input type="password" id="com_pwCheck"
								name="com_pwCheck" class="form-control">
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
							<button class="btn btn-primary btn-block" id="btnAddCom" disabled="disabled">가입</button>
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