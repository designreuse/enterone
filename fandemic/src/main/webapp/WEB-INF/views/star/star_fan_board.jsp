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
var tag = {};
var counter = 0;

	$(function() {
		//화면 시작 시 목록 출력
		fboardListView();
		
		//말머리 별 게시글 목록 검색
		$(".subFboardList").on("click","a",function(){
		   var fbo_subject = $(this).html();
		   if(fbo_subject == "전체"){
			   fboardListView();
		   }else{
			   fboardSubListView(fbo_subject);			   
		   }
		})
		
		//태그 별 게시글 목록 검색
		$("#fbo_hashtag_array").on("click","a",function(){
			var fbo_hashtag = $(this).html();
			fboardTagListView(fbo_hashtag);			   
		})
		
		
		//tr에 제목 클릭시 해당 게시글 단건 조회
		$(".trFboardList").on("click","tr span",function(){
		//var fbo_no = $(this).parent().find("#fbo_no").html();
		   var fbo_no = $(this).parent().parent().find("#fbo_no").val();
		   fboardView(fbo_no);
		   fboardViewsUpdate(fbo_no);
		})
		 
		var checkUnload = true; //글 작성중 나가면 사라지는 것 방지
		
		//글 등록 화면으로 이동
		$(".btnInputFboardShow").on("click",function(){
		    $(window).on("beforeunload", function(){ //글 작성중 나가면 사라지는 것 방지
		        if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
		    });
		   $(".fboardListSection").hide();
		   $(".fboardInsertSection").show();
		   $("#btnInputFboardAction").show();
		});
		
		//게시물 등록버튼
		$("#btnInputFboardAction").on("click",function(){
		   checkUnload = false; //경고창 중복 제거
		   if(fboardFormCheck() == true){ //유효성검사
		      fboardInsert() //글 등록 요청 보내기
		   }
		});
		
		//게시물 수정 페이지 이동 버튼
		$("#btnUpdateFboard").on("click",function(){
		   fboardUpdateView();
		});
		
		//게시물 수정 요청 버튼
		$("#btnUpdateFboardAction").on("click",function(){
		   checkUnload = false; //경고창 중복 제거
		   if(fboardFormCheck() == true){ //유효성검사
		      fboardUpdate(); //글 등록 요청 보내기
		   }
		});
		
		//게시물 삭제 요청 버튼
		$("#btnDeleteFboardAction").on("click",function(){
		   if(confirm("정말로 글을 삭제하시겠습니까?") == true){
		      fboardDelete();            
		   }
		});
		
		//게시물 화면 취소버튼
		$(".btnCancelFboard").on("click",function(){
		   checkUnload = false; //경고창 중복 제거
		   if(confirm("작성중인 글을 종료하시겠습니까?") == true){//취소 확인받기
		      //게시물 등록 요청
		      fboardListView();
		   }
		});
		
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
		
		//댓글 등록 요청
		$(".btnFboardReplyInsert").on("click",function(){
		   checkUnload = false;//경고창 중복 제거
		   if(replyFormCheck() == true){ //유효성검사
		      replyInsert();//댓글 등록 요청 보내기
		   }
		});
      
				
	    //댓글 신고 요청
		$("body").on("click",".btnNotifyReply",function(){
			var re_no = $(this).parent().parent().parent().data("no");
			alert(re_no);
		});
		   
		//댓글 수정 화면 띄우기
		$("body").on("click",".btnUpdateReply",function(){
			var replyOrigin = $(this).parent().parent().parent();
			replyUpdateForm(replyOrigin);
			$(".btnUpdateReply").hide();//다중 수정을 막기 위해 다른 수정버튼을 가린다.
		});
		
		//댓글 수정 요청
		$("body").on("click",".btnFboardReplyUpdate",function(){
			var reply = $(this).parent().parent().children();
			replyUpdate(reply);
		});
		
		//댓글 삭제 요청
		$("body").on("click",".btnDeleteReply",function(){
			var re_no = $(this).parent().parent().parent().data("no");
			replyDelete(re_no);
		});
		
		
		
//해시태그 구현
        // 테스트용
        $("#tag-form").on("click", function (e) {
            var value = marginTag(); // return array
            $("#rdTag").val(value); 
            alert(value)
        }); 

		$("#tag").on("keypress", function (e) {
			var self = $(this);
			
			//특수문자 입력 금지  
			if((e.keyCode >= 123 && e.keyCode <= 130) || (e.keyCode >= 33 && e.keyCode <= 47) || (e.keyCode >= 58 && e.keyCode <= 64) || (e.keyCode >= 91 && e.keyCode <= 96)){ 
				e.preventDefault();
			}

            // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
            if (e.key === "Enter" || e.keyCode == 32) {
            	
                var tagValue = self.val(); // 값 가져오기
                // 값이 없으면 동작 ㄴㄴ
                if (tagValue !== "") {
                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                    var result = Object.values(tag).filter(function (word) {
                        return word === "#"+tagValue;
                    })
                
                    // 태그 중복 검사
                    if (result.length == 0) { 
                    	tagValue = "#"+tagValue;//#자동추가
                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        addTag(tagValue);
                        self.val("");
                    } else {
                        alert("이미 작성한 태그입니다.");
                    }
                }
                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            }
        });

        // 태그 삭제 버튼 
        $("body").on("click", ".del-btn", function (e) {
            var index = $(this).attr("idx");
            tag[index] = "";
            $(this).parent().remove();
        });
//해시태그 종료
	});
//버튼 액션 종료

	//게시물 목록 요청
	function fboardListView() {
		var st_id = "${star.st_id}";
		$.ajax({
		   url:'${pageContext.request.contextPath}/star/fanBoard/list',
		   type:'GET',
		   data: { st_id : st_id },
		   error:function(xhr,status,msg){
		      alert("상태값 :" + status + " Http에러메시지 :"+msg);
		   },
		   success: fboardListViewResult
		});
	}
	
	//말머리 별 목록 요청
	function fboardSubListView(fbo_subject) {
		var st_id = "${star.st_id}";
		$.ajax({
			url:'${pageContext.request.contextPath}/star/fanBoard/list/subject',
			type:'GET',
			data: { st_id : st_id, fbo_subject : fbo_subject },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
				success: fboardListViewResult
		});
	}
	
	//해시태그 별 목록 요청
	function fboardTagListView(fbo_hashtag) {
		var st_id = "${star.st_id}";
		$.ajax({
			url:'${pageContext.request.contextPath}/star/fanBoard/list/hashtag',
			type:'GET',
			data: { st_id : st_id, fbo_hashtag : fbo_hashtag },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
				success: fboardTagListViewResult
		});
	}

   //게시물 목록 요청 결과값
   function fboardListViewResult(data) {
	   formReset();//이전 입력 데이터 삭제
		pagingReset();
	
		$("tbody").empty();//이전 입력 데이터 삭제
		$.each(data,function(idx,item){
		   $('<tr>').addClass('candahar')
		   .append($('<input type=\'hidden\' id=\'fbo_no\'>').val(item.fbo_no))
		   .append($('<td>').html(item.fbo_sub_no))
		   .append($('<td>').html("[" + item.fbo_subject + "] " + "<span>" + item.fbo_title  + "</span>"))
		   .append($('<td>').html(item.fan_name))
		   .append($('<td>').html(item.fbo_time))
		   .append($('<td>').html(item.fbo_views))
		   .appendTo('tbody');
		});//each
		
		
		//페이지네이션 출력
		$('#dataTable').DataTable({
			"language": {
		        "emptyTable": "데이터가 없어요.",
		        "lengthMenu": "페이지당 _MENU_",
		        "infoEmpty": "데이터가 없습니다.",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		        "search": "검색: ",
		        "zeroRecords": "일치하는 데이터가 없습니다.",
		        "loadingRecords": "로딩중...",
		        "processing":     "잠시만 기다려 주세요...",
		        "paginate": {
		            "next": ">",
		            "previous": "<"
		        }
		    },
			info: false,
			//ordering: false,//th정렬
	  		order: [ [ 0, "desc" ] ]
			,"bDestroy": true
	  	});
				  	
		$(".fboardListSection").show();
		$(".fboardInsertSection").hide();
		$(".fboardViewSection").hide();
		$(".btnInputFboardShow").focus();
   }
   
 //게시물 해시태그 목록 요청 결과값
   function fboardTagListViewResult(data) {
	   formReset();//이전 입력 데이터 삭제
		pagingReset();
		//페이지네이션 출력
		$('#dataTable').DataTable({
			"language": {
		        "emptyTable": "데이터가 없어요.",
		        "lengthMenu": "페이지당 _MENU_",
		        "infoEmpty": "데이터가 없습니다.",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		        "search": "검색: ",
		        "zeroRecords": "일치하는 데이터가 없습니다.",
		        "loadingRecords": "로딩중...",
		        "processing":     "잠시만 기다려 주세요...",
		        "paginate": {
		            "next": ">",
		            "previous": "<"
		        }
		    },
			info: false,
			//ordering: false,//th정렬
	  		order: [ [ 0, "desc" ] ]
			,"bDestroy": true
	  	});
		$("tbody").empty();//이전 입력 데이터 삭제
		$.each(data,function(idx,item){
		   $('<tr>').addClass('candahar')
		   .append($('<input type=\'hidden\' id=\'fbo_no\'>').val(item.fbo_no))
		   .append($('<td>').html(item.fbo_sub_no))
		   .append($('<td>').html("[" + item.fbo_subject + "] " + "<span>" + item.fbo_title  + "</span>"))
		   .append($('<td>').html(item.fan_name))
		   .append($('<td>').html(item.fbo_time))
		   .append($('<td>').html(item.fbo_views))
		   .appendTo('tbody');
		});//each
				  	
		$(".fboardListSection").show();
		$(".fboardInsertSection").hide();
		$(".fboardViewSection").hide();
		$(".btnInputFboardShow").focus();
   }
   
   
   //게시글 조회 요청
   function fboardView(fbo_no) {
      replyListView(fbo_no);
      $.ajax({
         url:'${pageContext.request.contextPath}/star/fanBoard/read/',
         type:'GET',
         data: { fbo_no: fbo_no },
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:fboardViewResult
      });
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
		//해시태그
		if(data.fbo_hashtag_array !=null){
			var arr = new Array(); 
			arr=data.fbo_hashtag_array;
			for (var i = 0; i < arr.length; i++) {
				if(arr[i]!=null){
				    console.log(arr[i]);
                    $("#fbo_hashtag_array").append(" <a href='#' class='tag-cloud-link'>"+arr[i]+"</a>");
				}
			}		
		}
		
		//수정 뷰
		$("input:text[name='fbo_no']").val(data.fbo_no);
		$("input:text[name='fbo_sub_no']").val(data.fbo_sub_no);
		$("input:text[name='fbo_title']").val(data.fbo_title);
		$("select[name='fbo_subject']").val(data.fbo_subject).attr("selected", "selected");
		$('#summernote').summernote('code',data.fbo_content)
		$("input:text[name='fbo_hashtag']").val(data.fbo_hashtag);
		
		//댓글 defalut값
		$("input:text[name='sfbo_no']").val(data.fbo_no);
		
		$(".fboardListSection").hide();
		$(".fboardInsertSection").hide();
		$('#fbo_title').focus();
		$(".fboardViewSection").show();
	}
   
   
   
//초기화 설정   
	//페이지네이션 초기화
	function pagingReset(){
		var tables = $.fn.dataTable.fnTables(true);
		$(tables).each(function () {
		  $(this).dataTable().fnClearTable();
		  $(this).dataTable().fnDestroy();
		});
	}
   
	//이전 작성글 기록 지우기
	function formReset(){
		$('#summernote').summernote('reset');
		$('#tag-list').empty();
		$('#fbo_hashtag_array').empty();
		tag = {};
		$('form').each(function() {
		   this.reset();
		});      
	}
   
//유효성 체크
	function fboardFormCheck(){
	   if($("input:text[name='fbo_title']").val()==null || $("input:text[name='fbo_title']").val()==''){
	      alert("제목을 입력하세요.")
	      $("input:text[name='fbo_title']").focus();
	      event.preventDefault();
	   }
	   else if($('#summernote').summernote('code')=="<p><br></p>"||$('#summernote').summernote('code')==''){
	      alert("내용을 입력하세요.")
	      $('#summernote').focus();
	      event.preventDefault();
	   }else{
	      return true;
	   }
	}
   
// 해시태그
	function addTag (value) {
	    tag[counter] = value; // 태그를 Object 안에 추가
	    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	}
	
	// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	function marginTag () {
	    return Object.values(tag).filter(function (word) {
	        return word !== "";
	    });
	}
   
   //게시글 등록 요청
   function fboardInsert(){
		//해시태그 작성된 값 받아서 제출
		var value = marginTag();
		$("#rdTag").val(value); 
		     
		$.ajax({
		    url: "${pageContext.request.contextPath}/star/fanBoard",  
		    type: 'POST',  
		    data : $("#form1").serialize(),
		    success: function(response) {
		       if(response == true) {
		         alert("작성되었습니다.")
		         //fboardListView();//목록출력
		         location.reload();
		       }
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    }
		});
	}
    
   //게시물 수정 조회 응답
   function fboardUpdateView() {
      $(".fboardListSection").hide();
      $(".fboardViewSection").hide();
      $(".fboardInsertSection").show();
      $(".btnUpdateFboard").show();
      $('#btnUpdateFboardAction').show();
      $('#summernote').focus();
   }
   
   //게시물 수정 요청
	function fboardUpdate() {
		var fbo_no = $("input:text[name='fbo_no']").val();
		
		//해시태그 작성된 값 받아서 제출
		var value = marginTag();
		$("#rdTag").val(value); 
			
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/star/fanBoard/update/", 
		    type: 'POST', 
		    data : $("#form1").serialize(),
		    success: function(response) {
		       if(response == true) {
		         alert("수정되었습니다.")
		         fboardView(fbo_no);
		       }
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		});
	}
   
   //게시물 삭제 요청
   function fboardDelete() {
      var fbo_no = $("input:text[name='fbo_no']").val();      
      $.ajax({ 
          url: "${pageContext.request.contextPath}/star/fanBoard/delete/", 
          type: 'POST', 
          data : { fbo_no : fbo_no },
          success: function(response) {
             if(response == true) {
               alert("삭제되었습니다.")
               fboardListView();//목록출력
             }
          }, 
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          } 
      });
   }
   
   //게시물 조회수 증가
   function fboardViewsUpdate(fbo_no) {
      $.ajax({ 
          url: "${pageContext.request.contextPath}/star/fanBoard/viewsUpdate/", 
          type: 'POST', 
          data : { fbo_no : fbo_no },
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          } 
      });
   }
   
   
   
//댓글
	//댓글 목록 요청
	function replyListView(fbo_no) {
	   $.ajax({
	      url:'${pageContext.request.contextPath}/star/fanBoard/reply',
	      type:'GET',
	      data: { fbo_no : fbo_no },
	      error:function(xhr,status,msg){
	         alert("상태값 :" + status + " Http에러메시지 :"+msg);
	      },
	      success: replyListViewResult
	   });
	}
   
	//댓글 목록 응답
	function replyListViewResult(data) {
		$("#replyListView").empty();
		
		$.each(data,function(idx,re){
			var id = "${member.mem_id}"//session아이디 값
			var uls = "<ul class = 'replyUl'>";// 작성된 댓글 아래 달아주는 버튼들
			if(id == re.mem_id){//로그인 아이디와 작성자 비교 후 수정,삭제 창 보여주기
				var li1 = "<li class='btnUpdateReply'>수정</li><span>&nbsp;</span>";
				var li2 = "<li class='btnDeleteReply'>삭제</li><span>&nbsp;</span>";					
			}else{
				var li1 = "";
				var li2 = "";		
			}
			if(id != re.mem_id){//자기 글은 신고버튼 못하게 막음
				var li3 = "<li class='btnNotifyReply'>신고</li><span>&nbsp;</span>";
			}else{
				var li3 = "";	
			}
			var ule = "</ul>";
			
			var ul = uls+li1+li2+li3+ule;
			$("<div class = 'replyInfo' data-no="+re.re_no+"><hr>") 
			.append($('<div class = \'row\'>').html(re.fan_name + '&nbsp;' +re.re_time))
			.append($('<div class = \'row replyText\'>').html(re.re_content))
			.append($('<div class = \'row flex-row-reverse\'>').append(ul))
			.appendTo('#replyListView');
		});//each
	}
   

   
   
   //댓글 등록 요청
   function replyInsert(){
      var fbo_no = $("input:text[name='fbo_no']").val();   
      $.ajax({ 
          url: "${pageContext.request.contextPath}/star/fanBoard/reply",  
          type: 'POST',  
          data : $("#formReply").serialize(),
          success: function(response) {
             if(response == true) {
                fboardView(fbo_no);//게시물 재 출력
             }
          }, 
          error:function(xhr, status, message) { 
              /* alert(" status: "+status+" er:"+message); */
              alert("로그인 후 이용해주세요.");
          }
       });
   }
   
   //댓글 유효성 체크
   function replyFormCheck(){
      if($("textarea[name='re_content']").val()==null || $("textarea[name='re_content']").val()==''){
         alert("내용을 입력하세요.")
         $("textarea[name='re_content']").focus();
         event.preventDefault();
      }else{
         return true;
      }
   }
   
   
   
   
   
	//댓글 수정을 위한 기본값, 틀 형성
	function replyUpdateForm(replyOrigin) {
		var re_no = replyOrigin.data("no"); 
		var re_content = replyOrigin.find(".replyText").text() //새 textarea안에 기존 작성값 입력
		
		var textarea = "<hr><div class = 'row'><textarea class = 'col-xl-11 col-md-10 col-12 fboardReplyUpdate fboardReply' name='re_content' rows = 3 data-no="+re_no+">"
		var div = "</textarea><div class = 'col-xl-1 col-md-2 col-12 btnFboardReply'>";
		var btn = "<button type='button'  class='btnFboardReplyUpdate btn btn-primary py-2 px-4'>수정</button></div>";		
		var dib = textarea + re_content + div + btn;
		replyOrigin.replaceWith(dib);
	}

	//댓글 수정 요청 
	function replyUpdate(reply) {
		var fbo_no = $("input:text[name='fbo_no']").val();
		var re_no = reply.data("no");
		var re_content = reply.parent().find(".fboardReplyUpdate").val();
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/star/fanBoard/reply/update/", 
		    type: 'POST', 
		       data : { re_no : re_no, re_content : re_content },
		    success: function(response) {
				if(response == true) {
					alert('수정되었습니다.');
					fboardView(fbo_no);//화면 새로고침
				}
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		});
   }
   
   //댓글 삭제 요청
   function replyDelete(re_no) {
		var fbo_no = $("input:text[name='fbo_no']").val();   
		$.ajax({ 
			url: "${pageContext.request.contextPath}/star/fanBoard/reply/delete/", 
			type: 'POST', 
			data : { re_no : re_no },
			success: function(response) {
				if(response == true) {
					fboardView(fbo_no);
					alert('삭제되었습니다.');
				}
		    },
			error:function(xhr, status, message) { 
			    alert(" status: "+status+" er:"+message);
			} 
		});
   }
   
</script>

<!-- 팬 게시판 게시글 목록 -->
<section class="ftco-section-3 fboardListSection">
   <div class="container">
      <div class="row d-flex">
         <div class="col-lg-12">
            <div class="sidebar-box ftco-animate">
               <h3 class="sidebar-heading">Tag Cloud</h3>
               <ul class="tagcloud subFboardList">
               		<a href="#" class="tag-cloud-link">전체</a>
					<a href="#" class="tag-cloud-link">자유</a>
					<a href="#" class="tag-cloud-link">정보</a>
					<a href="#" class="tag-cloud-link">미디어</a>
					<a href="#" class="tag-cloud-link">유머</a>
					<a href="#" class="tag-cloud-link">장터</a>
               </ul>
               <button class="btn btn-primary py-2 px-4 btnInputFboardShow">글쓰기</button>
            </div>

            <br>
            
            <table class = "table trFboardList" id="dataTable">
               <thead>
                  <tr>
                     <th class = "thList0">#</th>
                     <th class = "thList1">제목</th>
                     <th class = "thList2">작성자</th>
                     <th class = "thList3">작성일</th>
                     <th class = "thList4">조회수</th>
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
	      <div class="row ">
         	<ul id="fbo_hashtag_array" class="tagcloud">
        	<!-- 태그 추가되는곳 -->
        	</ul>
	      </div>
      <br>
      <div class="row">
         <div class = "starRight">
            <button type="button"  class="btn btn-primary py-2 px-4" id="btnDeleteFboardAction">삭제</button>
            <button type="button"  class="btn btn-primary py-2 px-4" id="btnUpdateFboard">수정</button>
         </div>
      </div>
   </div>
   
   <!-- 댓글-->
   <div class="container">
      <div id = "replyListView">
         <!-- 댓글 출력 장소 -->  
      </div>
      <hr>
      <form id="formReply">
         <div class = "row">
            <input style="display:none;" name = "sfbo_no" />
            <textarea class = "col-xl-11 col-md-10 col-12 fboardReply" name="re_content" rows = 3 placeholder="댓글"></textarea>
            <div class = "col-xl-1 col-md-2 col-12 btnFboardReply">
               <button type="button"  class="btnFboardReplyInsert btn btn-primary py-2 px-4">작성</button>
            </div>
         </div>
      </form>
      <br>
      <div class ="row">
         <div class = "starRight">
            <button type="button" class="btn btn-primary py-2 px-4 btnFboardListView">목록</button>
         </div>
      </div>
   </div>
</section>



<!-- 글쓰는 공간 -->
<section class="ftco-section-3 fboardInsertSection" style="display:none;">
   <div class="container">
      <h3>글작성</h3>
      <hr>
      <form id="form1">
         <input style="display:none;" name = "st_id" value="${star.st_id}"/>
         <input style="display:none;" name = "fbo_no" />
         <input style="display:none;" name = "fbo_sub_no" />
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
            <div class="col-xl-2 col-md-3 col-4">태그</div>
            <div class="col-xl-10 col-md-9 col-8">
               	<!-- 해시태그 -->
			    <div class="content">
			        <div class = "row">
			            <input type="text" id="tag" size="7" placeholder="태그입력" />
			            <button type="button" id = "tag-form">누르면 태그값 보임</button>
			        </div>
			        <div class = "row">
			        	<ul id="tag-list">
			        	<!-- 태그 추가되는곳 -->
			        	</ul>
			            <input type="hidden" type="text" value="" name="fbo_hashtag" id="rdTag" />
			        </div>
			
			    </div>
               
            </div>
         </div>
         <br>
         <hr>
         <div class="row starCenter">
            <div class = "starRight">
               <button type="button" class="btn btn-primary py-2 px-4 btnCancelFboard">취소</button>
               <button type="button" class="btn btn-primary py-2 px-4" id = "btnInputFboardAction" style="display:none;">등록</button>
               <button type="button" class="btn btn-primary py-2 px-4" id = "btnUpdateFboardAction" style="display:none;">수정</button>
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
