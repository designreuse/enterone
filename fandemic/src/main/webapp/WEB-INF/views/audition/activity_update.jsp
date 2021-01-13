<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	$(function() {
	
		$("#btnup").on("click", function(){
			UpdateFormCheck(); //유효성체크			
		});	
		
		$('#btndel').on('click', function() {
			var ac_no = $(this).data("no");
			// console.log(cart_no)
			if(confirm("삭제하시겠습니까?") == true){
				$.ajax({
					url : '${pageContext.request.contextPath}/audition/activitydelete',
					type : 'POST', 
					data : { mem_id : mem_id, ac_no : ac_no },
					success : function(response) {
						if(response == true) {
							alert("삭제되었습니다.");
							
						}
					},
					error : function(xhr, status, message){
						alert("status: " + status + ", error: " + message);
					}
				});
			} else {
				alert("삭제가 취소되었습니다.");
			}
		});
});
	function UpdateFormCheck() {
		if ($("#ac_title").val() == null || $("#ac_title").val() == '') {
			alert("제목을 입력하세요.")
			$("#ac_title").focus();
			event.preventDefault();
		} else if ($("#ac_content").val() == null
				|| $("#ac_content").val() == '') {
			alert("내용을 입력하세요.")
			$("#ac_content").focus();
			event.preventDefault();
		} else if ($("#ac_file").val() == null || $("#ac_file").val() == '') {
			alert("사진이나 동영상을 첨부하세요.")
			$("#ac_file").focus();
			event.preventDefault();
		}

	}
</script>
</head>
<body>
	<section class="single">

		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="col-md-12">
						<h3 class="title">활동지원 글 수정</h3>
					</div>
					<c:forEach var="activity" items="${AcworkList}">
						<form method="post" id="frm"
							action="${pageContext.request.contextPath}/audition/activityupdatesend" encType="multipart/form-data">
							<table class="myinfo" border="1" id="dataTable">
								<tr>
									<th class="tilt"><b>게시물번호</b></th>
									<td colspan="3" class="readolytexttd"><input type="text"
										class="readolytext form-control" readonly
										value="${activity.ac_no}" name="ac_no" id="ac_no"></td>
								</tr>


								<tr>
									<td class="tilt" rowspan="9"><img
										style="max-width: 7cm; max-height: 9cm;" id="ex2_file"
										name="ac_file"
										src="${pageContext.request.contextPath}/images/audition/${activity.ac_file}"></td>

									<th class="tilt"><b>제목</b></th>
									<td colspan="3" class="readolytexttd"><input type="text" 
										class="readolytext form-control" value="${activity.ac_title}"
										name="ac_title" id="ac_title"></td>
								</tr>

								<tr>
									<th class="tilt"><b>내용</b></th>
									<td><input type="text" name="ac_content" id="ac_content"
										value="${activity.ac_content}"
										style="width: 100%; height: 90px;" ></td>
								</tr>
								<tr>
									<th class="tilt"><b>첨부파일</b></th>
									<td class="readolytexttd"><input type="file"
										value="${activity.ac_file}" name="ex2_file" id="ac_file"
										class="form-control" required /></td>
								</tr>

								<tr>

									<td colspan="2">
									<input class="sidebutton btn-primary" id="btnup"
										style="margin-right: 5%; width: 20%; float: right;"
										type="submit" value="수정하기"> 
										<input class="sidebutton btn-primary" id="btndel"
										style="margin-right: 1%; width: 20%; float: right;"
										type="button" value="삭제"></td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
