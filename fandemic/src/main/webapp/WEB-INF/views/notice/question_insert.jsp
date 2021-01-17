<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세</title>
</head>
<body>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="col-md-12">
						<h3 class="title">1:1 문의 등록하기</h3>
					</div>
					<div class="form-group col-md-12">
						<form action="sendqna" class="form-horizontal">
						
						<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
								<div class="col-sm-10">
									<input id="mem_id" name="mem_id" type="text" class="form-control"
										placeholder="Text input"  style="display: none" value="${member.mem_id}">
										<input id="q_title" name="q_title" type="text" class="form-control">
								</div>
							</div>
						
						
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input id="mem_id" name="mem_id" type="text" class="form-control"
										placeholder="Text input"  style="display: none" value="${member.mem_id}">
										<input id="q_title" name="q_title" type="text" class="form-control"
										placeholder="제목을 입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<textarea id="q_content" name="q_content" class="form-control" rows="15" placeholder="내용을 입력해주세요"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">보내기</button>
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