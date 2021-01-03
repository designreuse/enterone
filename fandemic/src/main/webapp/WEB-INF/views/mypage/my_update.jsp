<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="cf" %>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 주소검색 -->
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">

/* 수정 테이블 스타일 */
.myinfo {
	width: 100%;
}

/* readonly 스타일 */
.readolytexttd {
	
}

.tilt {
	width: 140px;
	margin: 5%
}

/*수정가능한 text필드*/
.updatetext {
	float: left;
	border: 1px;
}
/*수정불가능한 text필드*/
.readolytext {
	float: left;
	border: none;
	background: lightgray;
}
</style>
<script>
$(document).ready(function() {

	function checkUser(user) {

			passwordChk($("#mem_pw"), $("#mem_pwCheck"), $("#btnAddMem"), $("#memPwd"), $("#membTag"));

			$("#memFrm").attr("action", "${pageContext.request.contextPath}/memRegister");
			
		}
	
	
//비밀번호 확인
function passwordChk(pw1, pw2, btn, div1, bTag) {
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
	                      $(bTag).html(""); 
	                      $(bTag).html("일치합니다.").css("color","blue");
	                      $(div1).css("display", "none");
	                  } else {
	                      // 비밀번호 불일치 이벤트 실행
	                     $(bTag).html("");
	                	 $(bTag).html("일치하지 않습니다.").css("color","red");
	                     $(pw2).focus();
	                     $(div1).css("display", "");
	                  }
	              }
       });
	}


</script>
</head>
<body>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-8" style="margin-left: 30%">
					<div class="line">
						<div>내정보 수정</div>
					</div>
					<form:form id="memUpdate" name="memUpdate" method="post" modelAttribute="member">
					<table class="myinfo" border="1">
						<tr>
							<td class="tilt" rowspan="7"><img id="profileimg"
								name="profileimg"
								src=""></td>

							<th class="tilt"><b>이름</b></th>
							<td colspan="3" class="readolytexttd"><input type="text"
								class="readolytext" readonly="readonly" value="${member.mem_name }"></td>
						</tr>

						<tr>
							<th class="tilt"><b>아이디</b></th>
							<td colspan="3" class="readolytexttd"><input type="text"
								class="readolytext" readonly="readonly" value="${member.mem_id }
								">
							</td>
						</tr>

						<tr>
							<th class="tilt"><b>새 비밀번호</b></th>
							<td class="readolytexttd"><form:password type="text" id="mem_pw" path="mem_pw"
								class="updatetext" />
								<form:errors path="mem_pw" cssClass="error" htmlEscape="false"/>
								</td>
							<th class="tilt"><b>확인</b></th>
							<td class="readolytexttd"><form:password id="mem_pwCheck" path="" class="form-control" 
								class="updatetext" /></td>
						</tr>

						<tr>
							<th class="tilt"><b>생년월일</b></th>
							<td colspan="3" class="readolytexttd"><input type="date"
								class="updatetext" value="<c:set var="cutb" value="${member.mem_birth }"/>${cf:substring(cutb,0,10)}"></td>
						</tr>

						<tr>
							<th class="tilt"><b>휴대폰 번호</b></th>
							<td colspan="3" class="readolytexttd"><input type="text"
								class="updatetext" value="${member.mem_phone }"></td>
						</tr>

						<tr>
							<th class="tilt"><b>이메일</b></th>
							<td colspan="3" class="readolytexttd"><input type="text"
								class="updatetext" value="${member.mem_email }"></td>
						</tr>

						<tr>
							<th class="tilt"><b>우편번호</b></th>
							<td colspan="3" class="readolytexttd"></td>
						</tr>
						<tr>
							<th class="readolytexttd"><b>첨부파일</b></th>
							<th class="tilt"><b>주소</b></th>
							<td colspan="3" class="readolytexttd"></td>
						</tr>
						<tr>
							<td><input type="text" class="updatetext"> <input
								type="file" name="uploadFile" /></td>
							<th class="tilt"><b>가입일</b></th>
							<td colspan="3" class="readolytexttd"><input type="text"
								class="readolytext" readonly="readonly" value="${member.mem_time }"></td>
						</tr>
						<tr>
							<td colspan="5"><input class="sidebutton btn-primary"
								style="margin-right: 5%; width: 10%; float: right;"
								type="button" onclick="location.href='#'" value="수정하기">
								<input class="sidebutton btn-primary"
								style="margin-right: 1%; width: 10%; float: right;"
								type="button" onclick="location.href='#'" value="탈퇴하기"></td>
						</tr>
					</table>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
