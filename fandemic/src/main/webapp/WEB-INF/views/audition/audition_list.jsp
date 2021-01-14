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
				
		//tr에 제목 클릭시 해당 게시글 단건 조회
		$(".trFboardList").on("click","tr span",function(){
		
		   var abo_no = $(this).parent().parent().find("#abo_no").val();
		   fboardView(abo_no);
		   fboardViewsUpdate(abo_no);
		})

		//목록보기
		$(".btnFboardListView").on("click",function(){
		   checkUnload = false;//경고창 중복 제거
		   //목록보기 요청
		   formReset();
			$(".fboardListSection").show();
			$(".fboardInsertSection").hide();
			$(".fboardViewSection").hide();
			$(".btnInputFboardShow").focus();
		   //fboardListView();
		});

	});
//버튼 액션 종료

	//게시물 목록 요청
	function auditionListView() {
		var com_id = "${com_id}";
		$.ajax({
		   url:'${pageContext.request.contextPath}/audition/auditionlist',
		   type:'GET',
		   data: { com_id : com_id },
		   error:function(xhr,status,msg){
		      alert("상태값 :" + status + " Http에러메시지 :"+msg);
		   },
		   success: auditionListViewResult
		});
	}
	
	//말머리 별 목록 요청
	/*function aboardSubListView(fbo_subject) {
		var com_id = "${com_id}";
		$.ajax({
			url:'${pageContext.request.contextPath}/star/fanBoard/list/subject',
			type:'GET',
			data: { st_id : st_id, fbo_subject : fbo_subject },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
				success: fboardListViewResult
		});
	}*/
   //게시물 목록 요청 결과값
   function auditionListViewResult(data) {
	   formReset();//이전 입력 데이터 삭제
		pagingReset();
	
		$("tbody").empty();//이전 입력 데이터 삭제
		$.each(data,function(idx,item){
		   $('<tr>').addClass('candahar')
		   .append($('<input type=\'hidden\' id=\'abo_no\'>').val(item.abo_no))
		   .append($('<td>').html(item.fbo_sub_no))
		   .append($('<td>').html("[" + item.abo_subject + "] " + "<span>" + item.fbo_title  + "</span>"))
		   .append($('<td>').html(item.fan_name))
		   .append($('<td>').html(item.fbo_time))
		   .append($('<td>').html(item.fbo_views))
		   .appendTo('tbody');
		});//each
		
		
		//페이지네이션 출력
		$('#dataTable').DataTable({
			"emptyTable": "데이터가 없어요.",
	        "lengthMenu": "페이지당 _MENU_",
	        "infoEmpty": "데이터가 없습니다.",
	        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	        "zeroRecords": "일치하는 데이터가 없습니다.",
	        "loadingRecords": "로딩중...",
	        "processing":     "잠시만 기다려 주세요...",
	        "paginate": {
	            "next": ">",
	            "previous": "<"
		        }
		    },
			info: false,
			filter:false,
			//ordering: false,//th정렬
	  		order: [ [ 0, "desc" ] ]
			,"bDestroy": true
	  	});
				  	
		$(".fboardListSection").show();
		$(".fboardInsertSection").hide();
		$(".fboardViewSection").hide();
		$(".btnInputFboardShow").focus();
   }   
   
   
   //게시글 조회 응답
	function fboardViewResult(data) {
		formReset();//이전 입력 데이터 삭제
		
		//게시물 뷰
		$('#fbo_title').text("[" + data.fbo_subject + "] " + data.fbo_title);
		$('#fbo_sub_no').text(data.fbo_sub_no+ " | ");
		$('#fan_name').text(data.fan_name + " | ");
		$('#fbo_time').text(data.fbo_time + " | 조회");
		$('#fbo_views').text(data.fbo_views);
		$('#fbo_content').html(data.fbo_content);
//초기화 설정   
	//페이지네이션 초기화
	function pagingReset(){
		var tables = $.fn.dataTable.fnTables(true);
		$(tables).each(function () {
		  $(this).dataTable().fnClearTable();
		  $(this).dataTable().fnDestroy();
		});
	}

</script>

<!-- 팬 게시판 게시글 목록 -->
<section class="ftco-section-3 fboardListSection">
   <div class="container">
      <div class="row d-flex">
         <div class="col-lg-12">
            <div class="sidebar-box ftco-animate" ">

               <ul class="tagcloud subFboardList" style="font-size:20px; margin-left: -44px;">
               		<a href="#" class="tag-cloud-link">전체</a>
					<a href="#" class="tag-cloud-link">YG</a>
					<a href="#" class="tag-cloud-link">빅히트</a>
					<a href="#" class="tag-cloud-link">SM</a>
					<a href="#" class="tag-cloud-link">큐브</a>
					<a href="#" class="tag-cloud-link">JYP</a>
               </ul>
            </div>

            <br>
            
            <table class = "table trFboardList" id="dataTable">
               <thead>
                  <tr>
                     <th class = "thList0">번호</th>
                     <th class = "thList1">게시물제목</th>
                     <th class = "thList2">게시물말머리</th>
                     <th class = "thList3">게시물작성일</th>
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
</section>

<!-- 게시물 상세보기 -->
<section class="ftco-section-3 fboardViewSection"  style="display:none;">
   <div class="container">
      <hr>
      <div class="row starCenter">
         <div class="row"><h5 id = "fbo_title"></h5></div>
      </div>
      <div class="row">
         <ul class = "fboardUl">
             <li><span id ="fbo_sub_no"></span></li>
             <li><span id ="fan_name"></span></li>
             <li><span id ="fbo_time"></span></li>
             <li><span id ="fbo_views"></span></li>
         </ul>
      </div>
      <br>
      <div class = "inputFboardContent" id ="fbo_content">
         
      </div>
      <br>
      <br>
      <div class="row">
         <div class = "starRight">
            <button type="button"  class="btn btn-primary py-2 px-4" id="btnDeleteFboardAction">삭제</button>
            <button type="button"  class="btn btn-primary py-2 px-4" id="btnUpdateFboard">수정</button>
         </div>
      </div>
   </div>
   
</section>
