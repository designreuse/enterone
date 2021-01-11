<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습생 활동 글 등록</title>
<style>
.Qkf {
	font-size: large;
	color: blue;
}

body {
	margin: 10px
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox {
	display: inline-block;
	margin-right: 10px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

.filebox.bs3-success label {
	color: #fff;
	background-color: #5cb85c;
	border-color: #4cae4c;
}
</style>
<script>
$(function() {
	//유효성 검사
	$("#sub").on("click",function() {
		WriteFormCheck();
	});
});
	function WriteFormCheck(){
		if($("#ac_title").val()==null || $("#ac_title").val()==''){
			alert("제목을 입력하세요.")
			$("#ac_title").focus();
			event.preventDefault();
		}
		else if($("#ac_content").val()==null||$("#ac_content").val()==''){
			alert("내용을 입력하세요.")
			$("#ac_content").focus();
			event.preventDefault();
		}
		
	}
</script>

</head>
<body>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-4">
						<h3 class="title">연습생 활동 등록</h3>
					</div>
					<div class="form-group col-md-8">
						<form action="sendactivity" class="form-horizontal">
							
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">회원ID</label>
								<div class="col-sm-10">
									<input id="mem_id" name="mem_id" type="text"
										class="form-control" value="${sessionScope.member.mem_id}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">작성일</label>
								<div class="col-sm-10">
									<input id="ac_time" name="ac_time" type="text"
										class="form-control" value="${activity.ac_time}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input id="ac_title" name="ac_title" type="text"
										class="form-control" placeholder="제목을 입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<textarea id="ac_content" name="ac_content"
										class="form-control" rows="15" placeholder="내용을 입력해주세요"></textarea>
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">업로드</label>

								<div class="filebox bs3-primary">
									<label for="ex_file2">업로드</label> <input type="file"
										id="ex_file2">
									<div class="Qkf" style="float: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-사진이나
										동영상을 첨부하세요</div>
								</div>

							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary" id="sub">등록</button>
									<button type="cancel" class="btn btn-primary"
										style="float: right">취소</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>