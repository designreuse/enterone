<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
<script>
	$(function() {		
		
		fboardListView();
		
		//tr클릭시 해당 게시글 상세보기
		$(".trFboardList").on("click","tr",function(){
			var fboard_no = $(this).children(".fbo_no").text();
			location.href='${pageContext.request.contextPath}/star/fanBoard/read/' + fboard_no ;
		})
		 
		//글 작성중 나가면 사라지는 것 방지
		var checkUnload = true;

		//글쓰기 화면으로 이동
		$(".btnInputFboardShow").on("click",function(){
			//글 작성중 나가면 사라지는 것 방지
		    $(window).on("beforeunload", function(){
		        if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
		    });
			//목록 가리고 글쓰기 화면 보여줌
			$(".fboardListSection").hide();
			$(".fboardSection").show();
			$(".btnInputFboard").show();
		});
		
		//글 작성 페이지 버튼
		//등록버튼
		$(".btnInputFboard").on("click",function(){
			//유효성검사
			CnoticeFormCheck(); 
			//경고창 중복 제거
			checkUnload = false;
		});
		
		//취소버튼
		$(".btnCancelFboard").on("click",function(){
			//경고창 중복 제거
			checkUnload = false;
			//취소 확인받기
			if(confirm("작성중인 글을 종료하시겠습니까?") == true){
				fboardListView();
			}
		});
		
	});

	function CnoticeFormCheck(){
		if($(".inputFboardTitle").val()==null || $(".inputFboardTitle").val()==''){
			alert("제목을 입력하세요.")
			$(".inputFboardTitle").focus();
			event.preventDefault();
		}
		else if($(".inputFboardContent").val()==null||$(".inputFboardContent").val()==''){
			alert("내용을 입력하세요.")
			$(".inputFboardContent").focus();
			event.preventDefault();
		}
		else{
			userInsert();
		}
	}
	
	//사용자 등록 요청
	function userInsert(){
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/star/fanBoard",  
		    type: 'POST',  
		    data : $("#form1").serialize(),
		    success: function(response) {
		    	if(response == true) {
		    		$(".fboardSection").hide();
					$(".fboardListSection").show();
					alert("작성되었습니다.")
		    	}
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	}//userInsert
	
	
	//게시물 목록 요청
	function fboardListView() {
		var st_id = "${star.st_id}";
		$(".fboardListSection").show();
		$(".fboardSection").hide();
		$(".btnInputFboardShow").focus();
		
		$.ajax({
			url:'${pageContext.request.contextPath}/star/fanBoard/list',
			type:'GET',
			data: { id: st_id },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success: fboardListViewResult
		});
	}//fboardListView
	
	
	
	//fboardListView결과값
	function fboardListViewResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>').addClass('candahar')
			.append($('<td class="fbo_no">').html(item.fbo_sub_no))
			.append($('<td>').html(item.fan_name))
			.append($('<td>').html(item.fbo_subject + item.fbo_title))
			.append($('<td>').html(item.fbo_time))
			.append($('<td>').html(item.fbo_views))
			.appendTo('tbody');
		});//each
	}//fboardListViewResult
	
</script>

<!-- 팬 게시판 게시글 목록 -->
<section class="ftco-section-3 fboardListSection">
	<div class="container">
		<div class="row d-flex">
			<div class="col-lg-12">
				<div class="sidebar-box ftco-animate">
					<h3 class="sidebar-heading">Tag Cloud</h3>
					<ul class="tagcloud">
						<a href="#" class="tag-cloud-link">animals</a>
						<a href="#" class="tag-cloud-link">human</a>
						<a href="#" class="tag-cloud-link">people</a>
						<a href="#" class="tag-cloud-link">cat</a>
						<a href="#" class="tag-cloud-link">dog</a>
						<a href="#" class="tag-cloud-link">nature</a>
						<a href="#" class="tag-cloud-link">leaves</a>
						<a href="#" class="tag-cloud-link">food</a>
					</ul>
				</div>
				
				<div class = "row">
					<button class="btn btn-primary py-2 px-4 btnInputFboardShow">글쓰기</button>
				</div>
				
				
				<table class = "table trFboardList">
					<thead>
						<tr>
							<th class = "col-">no</th>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th class = "col-">조회수</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				
				<!-- END-->
				<div class="row">
					<div class="col">
						<div class="block-27">
							<ul>
								<li><a href="#">&lt;</a></li>
								<li class="active"><span>1</span></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&gt;</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<!-- END COL -->
		</div>
	</div>
</section>


<!-- 글쓰는 공간 -->
<section class="ftco-section-3 fboardSection" style="display:none;">
	<div class="container">
		<h3>글작성</h3>
		<hr>
		<form id="form1">
			<input style="display:none;" name = "st_id" value="${star.st_id}"/>
			<div class="row starCenter">
				<div class="col-xl-1 col-md-3 col-4">말머리</div>
				<div class="col-xl-2 col-md-9 col-8">
					<select name = "fbo_subject" class="custom-select">
						<option>자유</option>
						<option>정보</option>
						<option>미디어</option>
						<option>유머</option>
						<option>장터</option>
					</select>
				</div>
				<div class="col-xl-1 col-md-3 col-4">제목</div>
				<div class="col-xl-8 col-md-9 col-8">
					<input name = "fbo_title" style="width: 100%" placeholder="제목" class="inputFboardTitle"/>
				</div>
			</div>
			<br>
			<textarea id="summernote" name="fbo_content"  class = "inputFboardContent"></textarea>
			<br>
			<div class="row starCenter">
				<div class="col-xl-2 col-md-3 col-4">첨부파일</div>
				<div class="col-xl-10 col-md-9 col-8">
					<!-- <input type="file" class="form-control-file"> -->
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
			
		</form>
	</div>
</section>

<!-- 서머노트 -->
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

