<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous" />
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	crossorigin="anonymous"></script>
<script>
var id = "${member.mem_id}"//session 일반유저 아이디 값

	$(function() {
		//화면 시작 시 목록 출력
		auditionListView();
		
	//tr 클릭시 단건 조회
	$(".trAboardList").on("click","tr",function(){		
		var abo_no =$(this).children().eq(0).text();
		//console.log(abo_no);
		//aboardView(abo_no);
		location.href='${pageContext.request.contextPath}/auditionlistDetail/'+abo_no; // 파라미터로 넘겨줌
		//변수이름안에 이름을 담는다
		
	})			
		
	});
	//목록
	function auditionListView() {
		$.ajax({
			   url:'${pageContext.request.contextPath}/auditionAboard/list',
			   type:'GET',
			   error:function(xhr,status,msg){
			      alert("상태값 :" + status + " Http에러메시지 :"+msg);
			   },
			   success: aboardListViewResult
			}); 
	}
   //게시물 목록 요청 결과값
   function aboardListViewResult(data) {
	   //var obj='<a href="${pageContext.request.contextPath}/auditionlistDetail/{no}"</a>'
		$("tbody").empty();//이전 입력 데이터 삭제
		$.each(data,function(idx,item){ //idx는 인덱스 item foreach랑 비슷한거 item 인덱스의 하나하나 값
		   $('<tr>').addClass('candahar')
		  .append($('<td id=\'abo_no\'>').html(item.abo_no))
		  .append($('<td>').html(item.abo_title))
		  //.append(obj)
		  .append($('<td>').html(item.abo_subject))
		  .append($('<td>').html(item.abo_time))
		  .appendTo('tbody');
		})
   }

/* 	//게시글 조회 요청
 	   function aboardView(abo_no) {
	      $.ajax({
	         url:'${pageContext.request.contextPath}/auditionlistDetail/{no}',
	         type:'GET',
	         data: { abo_no: abo_no },
	         error:function(xhr,status,msg){
	            alert("상태값 :" + status + " Http에러메시지 :"+msg);
	         },
	         success:aboardViewResult
	      });
	   }   */
	   //게시글 조회 응답
	 function aboardViewResult(data) {
		//게시물 뷰
		$('#abo_no').text(data.abo_no);
		$('#abo_title').text(data.abo_title);
		$('#abo_subject').text(data.abo_subject);
		$('#abo_time').text(data.abo_time );
		$('#abo_pic').text(data.abo_pic);
		$('#abo_content').html(data.abo_content);
	} 
</script>

<section class="ftco-section-3 aboardListSection">
	<div class="container">
		<div class="row d-flex">
			<div class="col-lg-12">
				<div class="sidebar-box ftco-animate"">

					<ul class="tagcloud subAboardList"
						style="font-size: 20px; margin-left: -44px;">
						<a href="#" class="tag-cloud-link">전체</a>
						<a href="#" class="tag-cloud-link">YG</a>
						<a href="#" class="tag-cloud-link">빅히트</a>
						<a href="#" class="tag-cloud-link">SM</a>
						<a href="#" class="tag-cloud-link">큐브</a>
						<a href="#" class="tag-cloud-link">JYP</a>
					</ul>
				</div>
				<br>
				<table class="table trAboardList" id="dataTable">
					<thead>
						<tr>
							<th class="thList0">번호</th>
							<th class="thList1">게시물제목</th>
							<th class="thList2">게시물말머리</th>
							<th class="thList3">게시물작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- 게시물 리스트 출력 장소 -->
					</tbody>
				</table>
				<!-- 페이지네이션 들어가는 곳 -->

				<!-- END COL -->
			</div>
		</div>
	</div>
</section>
