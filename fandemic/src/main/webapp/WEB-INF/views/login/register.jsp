<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style>
c {
	color: red;
}
.error {
	color: red;
	font-weight: bold;
}
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
		
 		// 유효성 검사 후 텝 고정
 		var tblId = "${tab}";
 		if(tblId != "") {
 			console.log(tblId);
 			
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current'); 
			
			$("#li2").addClass('current');
			$("#" + tblId).addClass('current');
			if (tblId == 'tab-2') {
				checkUser("기업회원");				
			}
			
		} 
		 

		$('ul.tabs li').click(function() { //기업회원, 개인회원 선택클릭
			var user = $(this).text();
			
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
			
			checkUser(user);			
		});
		
		
		
		// 아이디 중복확인
		$('#btnCheckm').on('click',function(){
			
			if($("#mem_id").val() == null || $("#mem_id").val() == '' ) {
				alert("아이디를 입력하세요");
			} else {
				memIdCheck();
			}
			
			
		});
		$('#btnCheckc').on('click',function(){
			
			if($("#com_id").val() == null || $("#com_id").val() == '' ) {
				alert("아이디를 입력하세요");
			} else {
				comIdCheck();
			}
		});
		
		
		// 메일 인증
		$('#mem_email').on('click',function(){
			$("#memModal").modal('show');
		});
		$('#com_email').on('click',function(){
			$("#comModal").modal('show');
		});

		
		//메일 중복확인
		$("#btnMemMail").on('click', function () {
			memMail();

		});
		
		$("#btnComMail").on('click', function () {
			comMail();
			
		});

		
		// 개인 유효성
		$('#btnAddMem').on('click',function(){ 
			
			var memRe = $("#memReturn").text();
			var memPw2 = $("#memPw2").text();
			if ($(':radio[name="mem_gender"]:checked').length < 1) {
				alert("성별을 선택하세요");
				event.preventDefault();
			} else if (memRe == 'F') {
				alert("아이디 중복확인을 해주세요");
				event.preventDefault();
			} else if (memPw2 == 'F') {
				alert("비밀번호 확인을 해주세요");
				event.preventDefault();
			}

		}); 
		
		// 기업 유효성
		$('#btnAddCom').on('click',function(){ 
			
			var comRe = $("#comReturn").text();
			var comPw2 = $("#comPw2").text();
			
			if (comRe == 'F') {
				alert("아이디 중복확인을 해주세요");
				event.preventDefault();
			} else if (comPw2 == 'F') {
				alert("비밀번호 확인을 해주세요");
				event.preventDefault();
			}

		}); 
		
	}); //end ready function
	
	//메일 중복확인
	function memMail() {
		
		var mem_email = $("#modalMemMail").val(); 
		var regexPattern = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;
		
		if (regexPattern.test(mem_email)) {
			$.ajax({
	            url :'${pageContext.request.contextPath}/memMail',
	            type:"post",
	            data : {mem_email : mem_email },
	            
	            success:function(data){
	            	
	               if (data == 0) {
	            	   $("#chkMemMail").html("");
	            	   $("#chkMemMail").html("사용 가능한 메일입니다. <br> 인증번호가 전송됩니다.").css({"color":"blue"},{"display" : ""});
	            	   $('#btnMemEnd').attr("disabled", false);
	            	   // 중복확인 되면 바로 인증번호 전송
	            	   mailCode("m",$("#modalMemMail").val(), $("#chkMemMail"), $("#btnMemEnd") );

	               } else if (data == 1){
	            	   $("#chkMemMail").html("");
	            	   $("#chkMemMail").html("중복된 메일입니다.").css({"color":"red"},{"display" : ""});
	            	   $('#btnMemEnd').attr("disabled", true);
	               } 

	            },error:function(){ alert("실패"); }
	         });
		} else {
			$("#chkMemMail").html("");
     	    $("#chkMemMail").html("형식을 확인하세요.").css({"color":"red"},{"display" : ""});
     	    $('#btnMemEnd').attr("disabled", true);
		}
	}


	function comMail() {
		
		var com_email = $("#modalComMail").val(); 
		var regexPattern = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;

		if (regexPattern.test(com_email)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/comMail',
	            type:"post",
	            data : {com_email : com_email },
	            
	            success:function(data){
	
	               if (data == 0) {
	            	   $("#chkComMail").html("");
	            	   $("#chkComMail").html("사용 가능한 메일입니다. <br> 인증번호가 전송됩니다.").css({"color":"blue"},{"display" : ""});
	            	   $('#btnComEnd').attr("disabled", false);
	            	   // 중복확인 되면 바로 인증번호 전송
	            	   mailCode("c",$("#modalComMail").val(), $("#chkComMail"), $("#btnComEnd") );
	            	   
	               } else if (data == 1){
	            	   $("#chkComMail").html("");
	            	   $("#chkComMail").html("중복된 메일입니다.").css({"color":"red"},{"display" : ""});
	            	   $('#btnComEnd').attr("disabled", true);
	               } 
	
	            },error:function(){ alert("실패"); }
	         });
		} else {
			$("#chkComMail").html("");
     	    $("#chkComMail").html("형식을 확인하세요.").css({"color":"red"},{"display" : ""});
     	    $('#btnComEnd').attr("disabled", true);
		}
	}
	
	// 메일전송 
	function mailCode(memor, email, tag, btnEnd) {
		
		$.ajax({
	        url :'${pageContext.request.contextPath}/mailCode',
	        type:"post",
	        data : {email : email },
	        
	        success:function(data){

	        	if(memor == "m") {
	        		memEnd(data); // 인증번호 비교하기
	        	} else {
	        		comEnd(data);
	        	}
				//$("#resultCode").html(data);
				$(tag).html("");
	     	    $(tag).html("인증번호가 발급되었습니다.").css({"color":"blue"},{"display" : ""});
	     	    
	        },error:function(){ alert("실패"); }
	     });
	}

	
	// 비밀번호 확인
   	function passwordChk(pw1, pw2, bTag, pw22) {
		
	      $(pw1).addClass('pw');
	      $(pw2).addClass('pw');
	      
	       $('.pw').focusout(function () {
	              var pwd1 = $(pw1).val();
	              var pwd2 = $(pw2).val();
	           
           if (pwd1 != "" || pwd2 != "") {
        	   
               if (pwd1 == pwd2) {
                   // 비밀번호 일치 이벤트 실행
                   $(bTag).html(""); 
                   $(bTag).html("일치합니다.").css("color","blue");
                   $(pw22).html("T");

               } else {
                   // 비밀번호 불일치 이벤트 실행
                  $(bTag).html("");
             	  $(bTag).html("일치하지 않습니다.").css("color","red");
             	  $(pw2).html("F");
                  $(pw22).focus();

               }
               
           }
       });
	}
	
	
	
	// 개인/기업 나누기
	function checkUser(user) {
		
		if (user == "개인회원") { 
			
			passwordChk($("#mem_pw"), $("#mem_pwCheck"),  $("#membTag"), $("#memPw2"));

			$("#memFrm").attr("action", "${pageContext.request.contextPath}/memRegister");
			
		} else { 
			
			passwordChk($("#com_pw"), $("#com_pwCheck"),  $("#combTag"), $("#comPw2"));	

			$("#comFrm").attr("action", "${pageContext.request.contextPath}/comRegister");
		}
	}
	
	
	// 아이디 중복확인
	function memIdCheck() {
		
		var mem_id = $("#mem_id").val()
		var regexPattern = /^[a-z]+[a-z0-9]{5,19}$/g;

		if (regexPattern.test(mem_id)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/checkId',
	            type:"post",
	            data : {mem_id : mem_id },
	            
	            success:function(data){
	            	console.log("성공")		
	               if (data == 0) {
	            	   $("#checkId").html(""); 
	            	   $("#checkId").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#divId");
	            	   $("#memReturn").html("T");
	            	   
	            	   
	               } else {
	            	   $("#checkId").html("");
	            	   $("#checkId").html("중복된 아이디입니다.").css("color","red").appendTo("#divId");
	            	   $("#memReturn").html("F");
	               }
	
	            },error:function(){ alert("실패"); }
	         });
			
		} else {
			 $("#checkId").html("");
      	     $("#checkId").html("영문자로 시작하는 6자 이상의 영문자 또는 숫자이어야 합니다.").css("color","red").appendTo("#divId");
      	     $("#memReturn").html("F");
		}
	}
	
	function comIdCheck() {
		
		var com_id = $("#com_id").val()
		var regexPattern = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if (regexPattern.test(com_id)) {

			$.ajax({
	            url :'${pageContext.request.contextPath}/checkIdcom',
	            type:"post",
	            data : {com_id : com_id },
	            
	            success:function(data){
	
	               if (data == 0) {
	            	   $("#checkIdcom").html("");
	            	   $("#checkIdcom").html("사용 가능한 아이디입니다.").css("color","blue").appendTo("#comDiv");
	            	   $("#comReturn").html("T");
	            	   
	               } else {
	            	   $("#checkIdcom").html("");
	            	   $("#checkIdcom").html("중복된 아이디입니다.").css("color","red").appendTo("#comDiv");
	            	   $("#comReturn").html("F");
	               }
	
	            },error:function(){ alert("실패"); }
	         });
		}else {
			$("#checkIdcom").html("");
     	    $("#checkIdcom").html("영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.").css("color","red").appendTo("#comDiv")
     	   $("#comReturn").html("F");
		} 
	}

function memEnd(data) {
	
	$("#btnMemEnd").on('click', function () {
		
		if ( data == $("#memCode").val() ) {
			$("#mem_email").val( $("#modalMemMail").val() );
			alert("인증되었습니다.");
			$('#memModal').modal("hide"); 
			
		} else {
			alert("코드가 일치하지 않습니다.");
		}
	});
}
	
function comEnd(data) {
	
	$("#btnComEnd").on('click', function () {
		
		if ( data == $("#comCode").val() ) {
			alert("인증되었습니다.");
			$("#com_email").val( $("#modalComMail").val() );
			
			$('#comModal').modal("hide"); 
			
		} else {
			alert("코드가 일치하지 않습니다.");
		}
	});
}
	
</script>


<section class="login first grey">

	<div style="text-align: center;">
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">개인회원</li>
				<li id="li2" class="tab-link" data-tab="tab-2" >기업회원</li>
			</ul>
		</div>
	</div>


	<div id="tab-1" class="tab-content current" >
		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>회원가입</h4>
					<form:form id="memFrm" name="memFrm" method="post" modelAttribute="member" >
						<div class="form-group" id="divId">
							<div style="text-align: right;">
								<form:radiobutton path="mem_gender" value="남" label="남자"/>&nbsp;&nbsp;
								<form:radiobutton path="mem_gender" value="여" label="여자"/>
								
								
							</div>
							<label>아이디</label><c>*</c>
							<div style="position:relative">
								<form:input type="text" path="mem_id" id="mem_id" Class="form-control" style="papadding: 50px; display: inline-block;" />
								<form:input type="button" path="" value="중복확인" id="btnCheckm" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:30%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
								<b id="checkId"></b>
								<form:errors path="mem_id" cssClass="error" htmlEscape="false"/> <br>
								<b id="memReturn" style="display: none;">F</b>
							</div>
						</div>
						<div class="form-group">
							<label>이름</label><c>*</c>
							<form:input type="text" path="mem_name" id="mem_name" class="form-control" />
							<form:errors path="mem_name" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group" id="mem_pw1" >
							<label class="fw">비밀번호<c>*</c></label>
							<form:input type="password" id="mem_pw" path="mem_pw" class="form-control" />
							<b id="membTag"></b><br>
							<form:errors path="mem_pw" cssClass="error" htmlEscape="false"/> <br>
						</div>
						<div class="form-group" id="memPwd" >
							<label class="fw">비밀번호 확인<c>*</c></label> 
							<form:input type="password" id="mem_pwCheck" path="" class="form-control" />
							<p id="memPw2" style="display: none;">F</p>
						</div>

						<div class="form-group">
							<label>생년월일</label> <c>*</c>
							<form:input type="date" path="mem_birth" id="mem_birth" class="form-control" />
							<form:errors path="mem_birth" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group">
							<label>연락처</label> <c>*</c>
							<form:input type="text" path="mem_phone" id="mem_phone" class="form-control" placeholder="ex) 000-0000-0000"/>
							<form:errors path="mem_phone" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group" id="divMemEmail">
							
							
							<div style="position:relative">
							<label>이메일</label><c>*</c>
								<form:input type="email" id="mem_email" path="mem_email" class="form-control" style="papadding: 50px; " placeholder="ex) xxx@xxx.xx" readonly="true" />
							<br><form:errors path="mem_email" cssClass="error" htmlEscape="false"/> 
							</div>
	
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddMem" >가입</button>
						</div>
						<div class="form-group text-right">
							<a href="login">로그인</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	
		<div id="tab-2" class="tab-content" >
		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>회원가입</h4>
					<form:form id="comFrm" name="comFrm" method="post" modelAttribute="company" >
						<div id="comDiv" class="form-group">

							<label>아이디</label><c>*</c>
							<div style="position:relative">
								<form:input type="text" path="com_id" id="com_id" class="form-control" style="papadding: 50px; display: inline-block;" />
								<form:input path="" type="button" value="중복확인" id="btnCheckc" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:30%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
								<b id="checkIdcom"></b>
								<form:errors path="com_id" cssClass="error" htmlEscape="false"/> <br>
								<b id="comReturn" style="display: none;">F</b>
							</div>
							
						</div>
						<div class="form-group">
							<label>이름</label> <c>*</c>
							<form:input type="text" path="com_name" id="com_name" class="form-control" />
							<form:errors path="com_name" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group"  >
							<label class="fw">비밀번호<c>*</c></label> 
							<form:input type="password" id="com_pw" path="com_pw" class="form-control" />
							<b id="combTag"></b><br>
							<form:errors path="com_pw" cssClass="error" htmlEscape="false"/> <br>
						</div>
						
						<div class="form-group" id="comPwd" >
							<label class="fw">비밀번호 확인<c>*</c></label> 
							<form:input type="password" id="com_pwCheck" path="" class="form-control" />
							<p id="comPw2" style="display: none;">F</p>
						</div>

						<div class="form-group">
							<label>연락처</label> <c>*</c>
							<form:input type="text" path="com_phone" id="com_phone" class="form-control" placeholder="ex) 000-0000-0000"/>
							<form:errors path="com_phone" cssClass="error" htmlEscape="false"/> <br>
						</div>

						<div class="form-group" id="divComEmail">

							<div style="position:relative">
								<label>이메일</label> <c>*</c>
								<form:input type="email" id="com_email" path="com_email" class="form-control" placeholder="ex) xxx@xxx.xx" readonly="true" />
								<br><form:errors path="com_email" cssClass="error" htmlEscape="false"/> 
							</div>
							
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddCom" >가입</button>
						</div>
						<div class="form-group text-right">
							<a href="login">로그인</a>
						</div>
					</form:form>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달창 -->
	<div class="modal fade" id="memModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" style="padding-top: 350px;">
		<div class="modal-dialog" role="document" style="width: 300px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">이메일 인증</h5>
				</div>
				<div class="modal-body" align="center" >
					<div class="form-group">
						<input type="text" id="modalMemMail" class="form-control" placeholder="메일 주소 입력">
						<input type="button" value="중복확인" id="btnMemMail" class="btn btn-primary btn-sm" style="position:absolute;right:20px;top:25%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 5px 7px;font-size:12px;cursor:pointer;" />
						<p></p>
						<input type="text" id="memCode" class="form-control" placeholder="인증번호 입력">
						
					</div>
					
				</div>
				<div class="modal-footer">
					<div align="center">
						<p><b id="chkMemMail"></b></p>
					</div>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id ="btnMemEnd" disabled="disabled">인증</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달창 -->
	<div class="modal fade" id="comModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" style="padding-top: 350px;">
		<div class="modal-dialog" role="document" style="width: 300px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" align="center">이메일 인증</h5>
				</div>
				<div class="modal-body" align="center" >
					<div class="form-group">
						<input type="text" id="modalComMail" class="form-control" placeholder="메일 주소 입력">
						<input type="button" name="" value="중복확인" id="btnComMail" class="btn btn-primary btn-sm" style="position:absolute;right:20px;top:25%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 5px 7px;font-size:12px;cursor:pointer;" />
						<p></p>
						<input type="text" id="comCode" class="form-control" placeholder="인증번호 입력">
						
					</div>
					
				</div>
				<div class="modal-footer">
					<div align="center">
						<p><b id="chkComMail"></b></p>
					</div>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id ="btnComEnd" disabled="disabled">인증</button>
				</div>
			</div>
		</div>
	</div>
	
</section>