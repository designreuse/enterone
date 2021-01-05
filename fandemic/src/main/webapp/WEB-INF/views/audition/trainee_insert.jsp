<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
$("td #btnCheckm").on("click",function(){
	var tr_name=$("#pro_name").val(); //id값
	$.ajax({
		url:"${pageContext.request.contextPath}/audition/nickCheck",
		type:"post",
		data:{tr_name:tr_name},
		dataType: 'json',
		success: function(response) {
	    	if(response != null && response !="") {
	    		$(".tr_name_ck").text("중복된 닉네임 입니다.")
	    		$(".tr_name_ck").css("display","")
	    					  .css("color","red");
	    	}else{
	    		$(".tr_name_ck").text("사용가능한 닉네임 입니다.")
	    		$(".tr_name_ck").css("display","")
	    		              .css("color","green"); 
	    	}
	    }, 
	    error:function(xhr, status, message) { 
	        alert(" status: "+status+" er:"+message);
	    } 
	});
});
$("td #btnfile").on("click",function() {
	
});

});//ID중복체크 버튼 end
</script>
</head>
<body>
	<section class="page first" style="padding-top: 308px;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="page-title">연습생 등록</h1>
					<div class="line thin"></div>
					<div class="page-description">
						<table class="table table-hover">
							<tr>
								<td class="qwe">회원ID</td>
								<td>${member.mem_id}</td>
							</tr>
							<tr>
								<td class="qwe">닉네임</td>
								<td>

									<div class="col">
										<input type="text" id="pro_name" name="pro_name"
											placeholder="닉네임을 입력하세요">

									</div>
									<div class="tr_name_ck" style="display:none;"></div>
								</td>

								<td><button value="중복확인" id="btnCheckm"
										class="btn btn-primary">중복확인</button>
								
								</td>
								

							</tr>
							<tr>
								<td class="qwe">프로필 사진</td>
								<td><div class="invalid-feedback">
										<button class="btn btn-primary" id="btnfile">파일 첨부</button>
									</div></td>
								<td><strong>과도한 보정이나 어플로 찍은 사진이 아닌 정면 사진 원본으로 첨부
										(10MB 이하)</strong></td>
								<td></td>

							</tr>
							<tr>
								<td class="qwe">연습생 소개</td>
								<td>
									<div class="col">
										<textarea rows="5" cols="30" class="introduce" type="text"
											name="introduce" placeholder="내용을 입력하세요"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td class="qwe">지원분야</td>
								<td>
									<div class="col">

										<select id="adf_idx" name="adf_idx" style="width: 80%">
											<option value="">지원분야 (1지망)</option>
											<option value="1">보컬</option>
											<option value="2">랩</option>
											<option value="3">댄스</option>
										</select> <br>
										<div class="col">
											<select id="adf_idx" name="adf_idx" style="width: 80%">
												<option value="">지원분야 (2지망)</option>
												<option value="1">보컬</option>
												<option value="2">랩</option>
												<option value="3">댄스</option>
											</select>
										</div>
									</div>
								<td><div class="col"></div></td>
							</tr>

						</table>
						<div class="question">
							<a href="#" class="btn btn-primary">등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>