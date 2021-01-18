<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="cf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qhwjd {
	font-size: medium;
}

td {
	width: 25%;
}

.qwe {
	font-weight: bold;
}
</style>
<script>
	$(document).ready(function() {
	//닉네임 중복
	$("td #btnCheckm").on("click",function() {
	//if문 만들기						
	var tr_name = $("#tr_name").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/audition/nickCheck",
		type : "post",
		data : {tr_name : tr_name},
		dataType : 'json',
		success : function(response) {
		if (response != null&& response != "") {
		$(".tr_name_ck").text("중복된 닉네임 입니다.");
		$("input[name=checked_id]").val('n')
		$(".tr_name_ck").css("display","").css("color","red");
		} else {$(".tr_name_ck").text("사용가능한 닉네임 입니다.");
		$("input[name=checked_id]").val('y');
		$(".tr_name_ck").css("display","").css("color","green");
			}
		},
		error : function(xhr,status, message) {alert(" status: "+ status+ " er:"+ message);
				}
			});
		});//ID중복체크 버튼 end
		//유효성 검사 중복체크 버튼 안눌렀을 경우
		$("#subtr").on("click", function(event) {
			trinsertCheck();
						});
		
		
			});

	function trinsertCheck() {
		if ($("table #tr_content").val() == null
				|| $("table #tr_content").val() == '') {
			alert("내용을 입력하세요.")
			$("table #tr_content").focus();
			event.preventDefault();
		} else if ($("#tr_branch1").val() == null
				|| $("#tr_branch1").val() == '') {
			alert("지원분야를 선택하세요.")
			$("#tr_branch1").focus();
			event.preventDefault();
		} 
	}
	
</script>
</head>
<body>
	<section class="page first" style="padding-top: 308px;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="page-title">연습생 수정</h1>

					<div class="line thin"></div>
					<div class="page-description">
				
						<form method="post"
							action="${pageContext.request.contextPath}/audition/traineeupdatesend"
							encType="multipart/form-data">
							<table class="table table-hover">
								<tr>
									<td class="qwe">닉네임</td>
									<td>

										<div class="col">
											<input type="text" id="tr_name" name="tr_name" value="${TrList.tr_name }" readonly>
											<input style="display:none;" type="text" id="mem_id" name="mem_id" value="${TrList.mem_id }">

										</div>
										
									</td>
								</tr>
								<tr>
									<td class="qwe">프로필 사진</td>
									<td><div class="invalid-feedback">
											<input type="file" name="ex2_file" id="tr_pic" /><img
										style="max-width: 7cm; max-height: 9cm;" id="ex2_file"
										name="tr_pic"
										src="${pageContext.request.contextPath}/images/audition/${TrList.tr_pic}">
										</div>
										<div class="qhwjd">- 과도한 보정이나 어플로 찍은 사진이 아닌 정면 사진 원본으로
											첨부 (10MB 이하)</div></td>
									<td></td>
									<td></td>

								</tr>
								<tr>
									<td class="qwe">연습생 소개</td>
									<td>
										<div class="col">
											<textarea rows="5" cols="30" class="introduce"
												name="tr_content" id="tr_content">${TrList.tr_content}</textarea>
										</div>
										
									</td>
								</tr>
								<tr>
									<td class="qwe">지원분야</td>
									<td>
										<div class="col">

											<select id="tr_branch1" name="tr_branch1" style="width: 80%">
												<option value="">지원분야 (1지망)</option>
												<option value="배우" 
												<c:if test="${TrList.tr_branch1=='배우'}">selected</c:if>>배우</option>
												<option value="가수"
												<c:if test="${TrList.tr_branch1=='가수'}">selected</c:if>
												>가수</option>
												<option value="모델"
												<c:if test="${TrList.tr_branch1=='모델'}">selected</c:if>
												>모델</option>
												<option value="개그"
												<c:if test="${TrList.tr_branch1=='개그'}">selected</c:if>>개그</option>
											</select> <br>
											<div class="col">
												<select id="tr_branch2" name="tr_branch2" style="width: 80%">
													<option value="">지원분야 (2지망)</option>
													<option value="배우" 
												<c:if test="${TrList.tr_branch2=='배우'}">selected</c:if>>배우</option>
												<option value="가수"
												<c:if test="${TrList.tr_branch2=='가수'}">selected</c:if>
												>가수</option>
												<option value="모델"
												<c:if test="${TrList.tr_branch2=='모델'}">selected</c:if>
												>모델</option>
												<option value="개그"
												<c:if test="${TrList.tr_branch2=='개그'}">selected</c:if>>개그</option>
												</select>
											</div>
										</div>
									<td><div class="col"></div></td>
								</tr>
							</table>

							<div class="question">
								<button class="btn btn-primary" id=subtr type="submit">수정</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>