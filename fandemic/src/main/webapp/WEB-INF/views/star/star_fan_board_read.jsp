<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 게시물 상세보기 -->
<section class="ftco-section-3 fboardViewSection">
	<div class="container">
		<hr>
		<div class="row starCenter">
			<div class="row"><h5>[${fboView.fbo_subject}] ${fboView.fbo_title}</h5></div>
		</div>
		<div class = "fanboardDate">
			${fboView.fbo_time}
		</div>
		<br>
		<div class = "inputFboardContent">
			${fboView.fbo_content}
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
				태그
			</div>
		</div>
		<br>
		<div class="row starCenter">
			<div class="col-xl-11 col-md-10 col-8"></div>
			<div class="col-xl-1 col-md-2 col-4">
				<button type="button" class="btn btn-primary py-2 px-4 btnInputFboard" style="display:none;">등록</button>
				<button type="button"  class="btn btn-primary py-2 px-4" id="btnDeleteFboard" style="display:none;">삭제</button>
				<button type="button"  class="btn btn-primary py-2 px-4" id="btnUpdateFboard" style="display:none;">수정</button>
			</div>
		</div>
	</div>
	
	<!-- 댓글-->
	<div class="container">
		<hr>
		<div class = "row">이름 작성일</div>
		<div class = "row">댓글</div>		
		<hr>
		<form>
			<div  class = "row">
				<textarea class = "col-xl-11 col-md-10 col-12 fboardReply" rows = 3 placeholder="댓글"></textarea>
				<div class = "col-xl-1 col-md-2 col-12 btnFboardReply">
					<button type="button"  class="btnFboardReply btn btn-primary py-2 px-4" id="btnInsert">작성</button>
				</div>
			</div>
		</form>
	</div>
</section>
