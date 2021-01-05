<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 글쓰는 공간 -->
<section class="ftco-section-3 fboardSection">
	<div class="container">
		<hr>
		<div class="row starCenter">
			<div class="row"><h4>[${fboInfo.fbo_subject}] ${fboInfo.fbo_title}</h4></div>
		</div>
		<div class = "fanboardDate">
			${fboInfo.fbo_time}
		</div>
		<br>
		<div class = "inputFboardContent">
			${fboInfo.fbo_content}
		</div>
		<br>
		<div class="row starCenter">
			<div class="col-xl-2 col-md-3 col-4">첨부파일</div>
			<div class="col-xl-10 col-md-9 col-8">
				첨부파일이라네
			</div>
		</div>
		<br>
		<div class="row starCenter">
			<div class="col-xl-2 col-md-3 col-4">해시태그</div>
			<div class="col-xl-10 col-md-9 col-8">
				<input name ="fbo_hashtag" style="width: 100%" placeholder="#태그" />
			</div>
		</div>
		<br>
		<hr>
		<div class="row starCenter">
			<div class="col-xl-11 col-md-10 col-8"></div>
			<div class="col-xl-1 col-md-2 col-4">
				<button type="button" class="btn btn-primary py-2 px-4 btnCancelFboard">취소</button>
				<button type="button" class="btn btn-primary py-2 px-4 btnInputFboard" style="display:none;">등록</button>
				<button type="button"  class="btn btn-primary py-2 px-4" id="btnDeleteFboard" style="display:none;">삭제</button>
				<button type="button"  class="btn btn-primary py-2 px-4" id="btnUpdateFboard" style="display:none;">수정</button>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section-3 fboardSection">
	<div class="container">
		<hr>
		<div class = "row">이름</div>
		<div class = "row">댓글</div>
		<div class = "row">작성일</div>
		
		<hr>
		<form>
			<textarea rows = 3 style="width: 100%" placeholder="댓글"></textarea> 
		</form>
	</div>
</section>
