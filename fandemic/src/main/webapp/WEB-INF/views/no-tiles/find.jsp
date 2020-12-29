<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">






<style>
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	/* background: none; */
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

		$('ul.tabs li').click(function() { 
			var user = $(this).text();
			
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
					
		});
		
		var check = $("#check").val();
		
		if(check == "member") {
			
			$('#btnId').on('click',function(){ 
				memIdFind();
			});
			
			$('#btnPw').on('click',function(){ 
				memPwFind();
			});
			
		} else {
			$('#btnId').on('click',function(){ 
				comIdFind();
			});
			
			$('#btnPw').on('click',function(){ 
				comPwFind();
			});
			
		}
		
		
		


		
	}); //end ready function
	
	function memIdFind() {
		
		$.ajax({
	        url :'${pageContext.request.contextPath}/memIdFind',
	        type:"post",
	        data : {
	        	mem_name : $("#idName").val() ,
	        	mem_email : $("#idEmail").val() ,
	        	},
	        
	        success:function(data){
	        	
	        	if(data != null && data != "") {
	        		var msg = data.substring(0,3); //앞 3글자만 보여지고
		        	
		        	for (var i=0; i<data.length-3 ; i++) {
		        		msg+= "*"; // 나머지는 *로 
		        	}

		        	$("#idResult").css("display","").html("회원님의 아이디는 " + msg + "입니다.");
	        	} else {
	        		$("#idResult").css("display","").html("아이디가 존재하지 않습니다.");
	        	}
	        	
	         
	        },error:function(){ alert("실패"); }
	     });
	} 
	
	function memPwFind() {
		
		$.ajax({
	        url :'${pageContext.request.contextPath}/memPwFind',
	        type:"post",
	        data : {
	        	mem_id : $("#pwId").val() ,
	        	mem_email : $("#pwEmail").val() ,
	        	},
	        
	        success:function(data){
	        	
	        	if(data != null && data != "") {
		        	$("#pwResult").css("display","").html("메일로 비밀번호가 전송되었습니다.");
	        	} else {
	        		$("#pwResult").css("display","").html("아이디가 존재하지 않습니다.");
	        	}
	        	
	         
	        },error:function(){ alert("실패"); }
	     });
	} 
	
	function comIdFind() {
		
		$.ajax({
	        url :'${pageContext.request.contextPath}/comIdFind',
	        type:"post",
	        data : {
	        	com_name : $("#idName").val() ,
	        	com_email : $("#idEmail").val() ,
	        	},
	        
	        success:function(data){
	        	
	        	if(data != null && data != "") {
	        		var msg = data.substring(0,3); //앞 3글자만 보여지고
		        	
		        	for (var i=0; i<data.length-3 ; i++) {
		        		msg+= "*"; // 나머지는 *로 
		        	}

		        	$("#idResult").css("display","").html("회원님의 아이디는 " + msg + "입니다.");
	        	} else {
	        		$("#idResult").css("display","").html("아이디가 존재하지 않습니다.");
	        	}
	        	
	         
	        },error:function(){ alert("실패"); }
	     });
	} 
	function comPwFind() {
		
		$.ajax({
	        url :'${pageContext.request.contextPath}/comPwFind',
	        type:"post",
	        data : {
	        	com_id : $("#pwId").val() ,
	        	com_email : $("#pwEmail").val() ,
	        	},
	        
	        success:function(data){
	        	
	        	if(data != null && data != "") {
	        		
		        	$("#pwResult").css("display","").html("메일로 비밀번호가 전송되었습니다.");
	        	} else {
	        		$("#pwResult").css("display","").html("아이디가 존재하지 않습니다.");
	        	}
	        	
	         
	        },error:function(){ alert("실패"); }
	     });
	} 
	
</script>

	

<div style=" border: 3px solid #A4B7D4; margin: 10px 20px 10px 10px;" align="center">
	
	<input id="check" value="<%=request.getParameter("check")%>" style="display: none;">
	
	<div style="text-align: center; padding-top: 20px;" >
		<div>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">아이디 찾기</li>
				<li class="tab-link" data-tab="tab-2">비밀번호 찾기</li>
			</ul>
		</div>
	</div>
	
	<div id="tab-1" class="tab-content current" style="text-align: center;">
		<div class="box-body">
			<div class="container">
				<div class="box-wrapper">
					<div class="box box-border" style="width: 500px;" align="center">
					
						<form id="idFrm" name="idFrm" method="post">
						
		                    <table class="table">
		                        <tbody align="center">
		                            <tr>
		                                <td>이름</td>
		                                <td>
		                                    <input type="text" id="idName" name="idName" class="form-control "  style="display:inline-block;width:250px;">
		                                </td>
		                            </tr>
		                            <tr>
		                                <td>이메일</td>
		                                <td>
		                                    <input type="text" id="idEmail" name="idEmail" class="form-control " style="display:inline-block;width:250px;">
		                                </td>
		                            </tr>
		                            
		                        </tbody>
		                    </table>
		                    <div style="padding-top: 15px">
								<button type="button" class="btn btn-primary" id="btnId" >찾기</button>
							</div>
  						</form>
					</div>
					
					<div style="padding-top: 15px">
						<p id="idResult" style="display: none;"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="tab-2" class="tab-content" style="text-align: center;">
		<div class="box-body">
			<div class="container">
				<div class="box-wrapper">
					<div class="box box-border" style="width: 500px;" align="center">
						<form id="pwFrm" name="pwFrm" method="post">
	                    <table class="table">
	                        <tbody align="center">
	                            <tr>
	                                <td>아이디</td>
	                                <td>
	                                    <input type="text" id="pwId" name="pwId" class="form-control "  style="display:inline-block;width:250px;">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>이메일</td>
	                                <td>
	                                    <input type="text" id="pwEmail" name="pwEmail" class="form-control " style="display:inline-block;width:250px;">
	                                </td>
	                            </tr>
	                            
                       		</tbody>
	                    </table>
	                    <div style="padding-top: 15px">
							<button type="button" class="btn btn-primary" id="btnPw">찾기</button>
						</div>
					</form>
				</div>
				<div style="padding-top: 15px">
					<p id="pwResult" style="display: none;"></p>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>

	
	
	
	
	
	
	
	
</body>
</html>