<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>



<section class="ftco-section-3">
	<div class="container">


		<h3>글작성</h3>

		<hr>
		<form>
			<div class="row starCenter">
				<div class="col-xl-1 col-md-3 col-4">말머리</div>
				<div class="col-xl-2 col-md-9 col-8">
					<select class="custom-select">
						<option>자유</option>
						<option>정보</option>
						<option>미디어</option>
						<option>유머</option>
						<option>장터</option>
					</select>
				</div>
				<div class="col-xl-1 col-md-3 col-4">제목</div>
				<div class="col-xl-8 col-md-9 col-8">
					<input style="width: 100%" placeholder="제목" />
				</div>
			</div>
			<br>
			<textarea id="summernote" name="editordata"></textarea>
			<br>
			<div class="row starCenter">
				<div class="col-xl-2 col-md-3 col-4">첨부파일</div>
				<div class="col-xl-10 col-md-9 col-8">
					<input type="file" class="form-control-file">
				</div>
			</div>
			<br>
			<div class="row starCenter">
				<div class="col-xl-2 col-md-3 col-4">해시태그</div>
				<div class="col-xl-10 col-md-9 col-8">
					<input style="width: 100%" placeholder="#태그" />
				</div>
			</div>
			<br>
			<hr>
			<div class="row starCenter">
				<div class="col-xl-11 col-md-10 col-8"></div>
				<div class="col-xl-1 col-md-2 col-4">
					<input type="submit" value="등록" class="btn btn-primary py-2 px-4">
				</div>
			</div>
			
		</form>
	</div>
</section>





<script>
	$('#summernote').summernote(
			{
				placeholder : '내용을 입력하세요.',
				tabsize : 2,
				height : 600,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>

