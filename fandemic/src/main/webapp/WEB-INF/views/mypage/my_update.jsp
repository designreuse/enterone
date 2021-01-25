<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="cf"%>
<!DOCTYPE html>
<html>
<head>

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
.form-control{

}

.tilt {
	width: 140px;
	margin: 5%;
	    padding-left: 10px;
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
	background: #ecf0f391 !important;
}
</style>
<script>
	$(document).ready(function() {

		//비밀번호 확인
		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var mem_pw = $("#mem_pw").val();
				var pwd2 = $("#pwd2").val();
				if (mem_pw != "" || pwd2 != "") {
					if (mem_pw == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
				});
			});

		$('#btnAddr').on('click', function() {
			openDaummem_zipAddress()
		});
		
		$(".btnMemberDrop").on("click",function(){
			var ck = confirm("정말 탈퇴하시겠습니까?");
			if(ck==true){
			var mem_id = "${member.mem_id }";
				$.ajax({
					url:"${pageContext.request.contextPath}/deleteMember",
					data:{mem_id:mem_id},
					dataType:"json",
					success:function(response){
						alert("탈퇴가 완료되었습니다.");
						location.href="${pageContext.request.contextPath}/";
					},
					error:function(response){
						alert("탈퇴실패")
					}
				})
			
			}
		})

	});

	function openDaummem_zipAddress() {

		new daum.Postcode({

			oncomplete : function(data) {

				$("#mem_zipAddress").val(data.zonecode);

				$("#address").val(data.address); // 주소

			}

		}).open();
	}
</script>
</head>
<body>
	<section class="single">

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-12">
						<h3 class="title">내정보 수정</h3>
					</div>
					<c:if test="${meminfo.mem_type == '1'}">
					<form id="memUpdate" name="memUpdate" method="post" action="myupdate2" enctype="multipart/form-data">
						<table class="myinfo" border="1">
							<tr>
								<td class="tilt" rowspan="9"><img style="max-width: 7cm; max-height: 9cm;" id="profileimg"
									name="profileimg" src="${pageContext.request.contextPath}/images/member_pic/${meminfo.mem_pic }"></td>

								<th class="tilt"><b>이름</b></th>
								<td colspan="3" class="readolytexttd"><input type="text"
									class="readolytext form-control" readonly="readonly"
									value="${meminfo.mem_name }" name="mem_name"></td>
							</tr>

							<tr>
								<th class="tilt"><b>아이디</b></th>
								<td colspan="3" class="readolytexttd"><input type="text"
									class="readolytext form-control" readonly="readonly"
									value="${meminfo.mem_id }" name="mem_id"></td>
							</tr>
							<tr>
								<th class="tilt"><b>새 비밀번호</b></th>
								<td class="readolytexttd"><input type="password"
									name="mem_pw" id="mem_pw" class="form-control" /></td>
							</tr>

							<tr>
								<th class="tilt"><b>비밀번호 확인</b></th>
								<td class="readolytexttd"><input type="password"
									name="reuserPwd" id="pwd2" class="form-control" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="alert alert-success" id="alert-success"
										style="margin: 0px; padding: 0px">비밀번호가 일치합니다.</div>
									<div class="alert alert-danger" id="alert-danger"
										style="margin: 0px; padding: 0px">비밀번호가 일치하지 않습니다.</div>
								</td>
							</tr>
							<tr>
								<th class="tilt"><b>생년월일</b></th>
								<td colspan="3" class="readolytexttd"><input name="mem_birth" id="mem_birth" type="date"
									class="updatetext form-control"
									value="<c:set var="cutb" value="${meminfo.mem_birth }"/>${cf:substring(cutb,0,10)}"></td>
							</tr>

							<tr>
								<th class="tilt"><b>휴대폰 번호</b></th>
								<td colspan="3" class="readolytexttd"><input name="mem_phone" id="mem_phone" type="text"
									class="updatetext form-control" value="${meminfo.mem_phone }"></td>
							</tr>

							<tr>
								<th class="tilt"><b>이메일</b></th>
								<td colspan="3" class="readolytexttd"><input name="mem_email" id="mem_email" type="text"
									class="updatetext form-control" value="${meminfo.mem_email }"></td>
							</tr>

							<tr>
								<th class="tilt"><b>우편번호</b></th>
								<td colspan="3" class="readolytexttd"><a onclick="openDaummem_zipAddress()"><input name="mem_zipAddress" type="text"
									id="mem_zipAddress" class="readolytext form-control" value="${meminfo.mem_zipAddress }"></a>
									</td>
							</tr>
							<tr>
								<td><input
									type="file" name="uploadFile" /></td>
								<th class="tilt"><b>주소</b></th>
								<td colspan="3" class="readolytexttd"><a onclick="openDaummem_zipAddress()"><input type="text"
									name="mem_address" id="address" class="readolytext form-control" value="${meminfo.mem_address }"></a>

								</td>
							</tr>
							<tr>
								<th class="tilt">가입일</th>
								<th class="tilt"><b>상세주소</b></th>
								<td colspan="3" class="readolytexttd"><input type="text"
									name="mem_address2" id="mem_address2" class="updatetext form-control"  value="${meminfo.mem_address2 }"></td>
							</tr>
							<tr>
								<td><input type="text" name="mem_time" readonly="readonly" class="readolytext form-control" value="${meminfo.mem_time }"> </td>
								<td colspan="2"><input class="sidebutton btn-primary" id="submit"
									style="margin-right: 5%; width: 20%; float: right;"
									type="submit"  value="수정하기">
									<input class="btnMemberDrop sidebutton btn-primary"
									style="margin-right: 1%; width: 20%; float: right;"
									type="button"  value="탈퇴하기"></td>
							</tr>
						</table>
					</form>
					</c:if>
					<c:if test="${meminfo.mem_type != '1'}">
					<form id="memUpdate" name="memUpdate" method="post" action="myupdate2" enctype="multipart/form-data">
						<table class="myinfo" border="1">
							<tr>
								<td class="tilt" rowspan="9"><img style="max-width: 7cm; max-height: 9cm;" id="profileimg"
									name="profileimg" src="${meminfo.mem_pic }"></td>

								<th class="tilt"><b>이름</b></th>
								<td colspan="3" class="readolytexttd"><input type="text"
									class="readolytext form-control" readonly="readonly"
									value="${meminfo.mem_name }" name="mem_name"></td>
							</tr>

							<tr>
								<th class="tilt"><b>아이디</b></th>
								<td colspan="3" class="readolytexttd"><input type="text"
									class="readolytext form-control" readonly="readonly"
									value="${meminfo.mem_id }" name="mem_id"></td>
							</tr>
							<tr>
								<th class="tilt"><b>새 비밀번호</b></th>
								<td class="readolytexttd"><input class="readolytext form-control" type="text" value="소셜 회원은 비밀번호 변경이 불가합니다." readonly="readonly" />
								<input class="readolytext form-control" type="text" name="mem_pw" value="null" readonly="readonly" style="display: none" /></td>
							</tr>

							<tr>
								<th class="tilt"><b>비밀번호 확인</b></th>
								<td class="readolytexttd">
								<input class="readolytext form-control" type="text" value="소셜 회원은 비밀번호 변경이 불가합니다." readonly="readonly" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin: 0px; padding: 0px">소셜 회원은 비밀번호 변경이 불가합니다.</div>
									
								</td>
							</tr>
							<tr>
								<th class="tilt"><b>생년월일</b></th>
								<td colspan="3" class="readolytexttd"><input name="mem_birth" id="mem_birth" type="date"
									class="updatetext form-control"
									value="<c:set var="cutb" value="${meminfo.mem_birth }"/>${cf:substring(cutb,0,10)}"></td>
							</tr>

							<tr>
								<th class="tilt"><b>휴대폰 번호</b></th>
								<td colspan="3" class="readolytexttd"><input name="mem_phone" id="mem_phone" type="text"
									class="updatetext form-control" value="${meminfo.mem_phone }"></td>
							</tr>

							<tr>
								<th class="tilt"><b>이메일</b></th>
								<td colspan="3" class="readolytexttd"><input name="mem_email" id="mem_email" type="text"
									class="updatetext form-control" value="${meminfo.mem_email }"></td>
							</tr>

							<tr>
								<th class="tilt"><b>우편번호</b></th>
								<td colspan="3" class="readolytexttd"><a onclick="openDaummem_zipAddress()"><input name="mem_zipAddress" type="text"
									id="mem_zipAddress" class="readolytext form-control" value="${meminfo.mem_zipAddress }"></a>
									</td>
							</tr>
							<tr>
								<td>
								<input type="file" name="uploadFile" style="display: none" />
								<input type="text" class="readolytext form-control" readonly="readonly" value="소셜회원은 사진 변경이 불가능합니다"/>
								
								</td>
								<th class="tilt"><b>주소</b></th>
								<td colspan="3" class="readolytexttd"><a onclick="openDaummem_zipAddress()"><input type="text"
									name="mem_address" id="address" class="updatetext form-control" value="${meminfo.mem_address }"></a>

								</td>
							</tr>
							<tr>
								<th class="tilt">가입일</th>
								<th class="tilt"><b>상세주소</b></th>
								<td colspan="3" class="readolytexttd"><input type="text"
									name="mem_address2" id="mem_address2" class="updatetext form-control"  value="${meminfo.mem_address2 }"></td>
							</tr>
							<tr>
								<td><input type="text" name="mem_time" readonly="readonly" class="readolytext form-control" value="${meminfo.mem_time }"> </td>
								<td colspan="2"><input class="sidebutton btn-primary" id="submit"
									style="margin-right: 5%; width: 20%; float: right;"
									type="submit"  value="수정하기">
									<input class="btnMemberDrop sidebutton btn-primary"
									style="margin-right: 1%; width: 20%; float: right;"
									type="button"  value="탈퇴하기"></td>
							</tr>
						</table>
					</form>
					</c:if>
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>
