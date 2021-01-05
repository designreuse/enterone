<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>

$(document).ready(function() {
	
	$('#btnAddMem').on('click',function(){ 
		$("#memFrm").attr("action", "${pageContext.request.contextPath}/kakaoRegister");

	}); 
	
	$('#btnAddr').on('click',function(){ 
		openDaumZipAddress($("#mem_zipAddress"), $("#mem_address"), $("#mem_address2"));
		
	});  
	
	$('#memEmail').on('click',function(){
		memMail();
	});
	
});

function openDaumZipAddress(zipAddress, address, address2 ) {

	new daum.Postcode({

		oncomplete:function(data) {

			$(zipAddress).val(data.zonecode); 

			$(address).val(data.address); // 주소

			$(address2).css("display","");
		}

	}).open();
}

function memMail() {
	
	$.ajax({
        url :'${pageContext.request.contextPath}/memMail',
        type:"post",
        data : {mem_email : $("#mem_email").val() },
        
        success:function(data){

           if (data == 0) {
        	   $("#chkMemMail").html("");
        	   $("#chkMemMail").html("사용 가능한 메일입니다.").css("color","blue").appendTo("#divMemEmail");
        	   $('#btnAddMem').attr("disabled", false);
        	   
           } else {
        	   $("#chkMemMail").html("");
        	   $("#chkMemMail").html("중복된 메일입니다.").css("color","red").appendTo("#divMemEmail");
        	   $('#btnAddMem').attr("disabled", true);
           }

        },error:function(){ alert("실패"); }
     });
}

</script>


<section class="login first grey">

		<div class="box-wrapper">
			<div class="box box-border">
				<div class="box-body" style="border: 3px solid #A4B7D4;">
					<h4>추가정보</h4>
					<form:form id="memFrm" name="memFrm" method="post" modelAttribute="member" >
						<div class="form-group" id="divId">
							<div style="text-align: right;">
							<c:if test="${member.mem_gender eq 'male'}" >
								<form:radiobutton path="mem_gender" value="남" label="남자" id="male" checked="true"/>&nbsp;&nbsp;
								<form:radiobutton path="mem_gender" value="여" label="여자 " id="female"/>
							</c:if>
							<c:if test="${member.mem_gender eq 'female'}" >
								<form:radiobutton path="mem_gender" value="남" label="남자" id="male"/>&nbsp;&nbsp;
								<form:radiobutton path="mem_gender" value="여" label="여자 " id="female" checked="true"/>
							</c:if>
							</div>

							<label>아이디</label>
							<div style="position:relative">
								<form:input value="${member.mem_id}" type="text" path="mem_id" id="mem_id" Class="form-control" style="papadding: 50px; display: inline-block;" readonly="true" />
							</div>
						</div>
						<div class="form-group">
							<label>이름</label> 
							<form:input value="${member.mem_name}" type="text" path="mem_name" id="mem_name" class="form-control" />
						</div>

						<div class="form-group">
							<label>생년월일</label> 
							<form:input type="date" path="mem_birth" id="mem_birth" class="form-control" />
						</div>

						<div class="form-group">
							<label>연락처</label> 
							<form:input type="text" path="mem_phone" id="mem_phone" class="form-control" placeholder="ex) 000-0000-0000"/>
						</div>

						<div class="form-group" id="divMemEmail">
							
							
							<div style="position:relative">
							<label>이메일</label> <b id="chkMemMail"></b>
								<form:input value="${member.mem_email}" type="text" id="mem_email" path="mem_email" class="form-control" style="papadding: 50px; " readonly="true" placeholder="ex) xxx@xxx.xx"/>
								<form:input type="button" path="" value="중복확인" id="memEmail" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
							</div>
						</div>


						<div class="form-group">
							<label>주소</label><br>
							
							<div style="position:relative">
								<form:input type="text" id="mem_address" path="mem_address" class="form-control"  style="papadding: 50px; display: inline-block; " readonly="true"/>
								<form:input type="button" path="" value="주소검색" id="btnAddr" class="btn btn-primary btn-sm" style="position:absolute;right:10px;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-o-transform:translate(0,-50%);padding: 2px 7px;font-size:12px;cursor:pointer;" /><br>
							</div>
							
							<form:input type="text" id="mem_address2" path="mem_address2" class="form-control" style="display:none; margin: 5px 0px;" />
							<label>우편번호</label> &nbsp; &nbsp;
							<form:input type="text" id="mem_zipAddress" path="mem_zipAddress" class="form-control" style="margin: 5px; display: inline-block; width: 250px" readonly="true"/>
						</div>

						<div class="form-group text-right">
							<button class="btn btn-primary btn-block" id="btnAddMem" disabled="disabled">확인</button>
						</div>
						<div style="display: none;">
							<form:input type="text" path="mem_pic" id="mem_pic" class="form-control" value="${member.mem_pic}" />
						</div>
					</form:form>
				</div>
			</div>
		</div>



</section>
