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
var id = "${sessionScope.member.mem_id}"//session아이디 값
var ssid = "${sessionScope.star.st_id}"//session아이디 값
var st_id = '${sboard.st_id}';
var sbo_no = '${sboard.sbo_no}';
var st_name = "${stVo.st_name}";
	$(function() {
		sboardView(sbo_no);
		
		//게시물 수정 페이지 이동 버튼
		$("#btnUpdateFboard").on("click",function(){
			location.href = "${pageContext.request.contextPath}/star/starBoard/updateView/" + sbo_no;
		});
		
		//게시물 삭제 요청 버튼
		$("#btnDeleteFboardAction").on("click",function(){
		   if(confirm("정말로 글을 삭제하시겠습니까?") == true){
		      sboardDelete(sbo_no);            
		   }
		});
		
		//목록보기
		$(".btnFboardListView").on("click",function(){
			location.href ="${pageContext.request.contextPath}/star/starBoard/"+st_id
		});
		
		//댓글 등록 요청
		$(".btnFboardReplyInsert").on("click",function(){
		   checkUnload = false;//경고창 중복 제거
		   if(replyFormCheck() == true){ //유효성검사
		      replyInsert(sbo_no);//댓글 등록 요청 보내기
		   }
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
		
		 //댓글 신고에 디폴트값 등록
		$("body").on("click",".btnNotifyReply",function(){
			var noti = $(this).parent().parent();
			replyNotifyView(noti);
		});
		
		 //댓글 신고 요청
		$("body").on("click","#notifyInsertAction",function(){
			replyNotifyAction();
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
	
	//해시태그 별 목록 요청
	function sboardTagListView(sbo_hashtag) {
		$.ajax({
			url:'${pageContext.request.contextPath}/star/starBoard/list/hashtag',
			type:'GET',
			data: { st_id : st_id, sbo_hashtag : sbo_hashtag },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
				success: sboardTagListViewResult
		});
	}
   
   //게시글 조회 요청
   function sboardView(sbo_no) {
      replyListView(sbo_no);
      $.ajax({
         url:'${pageContext.request.contextPath}/star/starBoard/read/',
         type:'GET',
         data: { sbo_no: sbo_no },
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:sboardViewResult
      });
   }
   
   //게시글 조회 응답
	function sboardViewResult(data) {
		formReset();//이전 입력 데이터 삭제
		
		//게시물 뷰
		$('#sbo_title').text(data.sbo_title);
		$('#st_name').text(st_name + " | ");
		$('#sbo_time').text(data.sbo_time + " | 조회");
		$('#sbo_views').text(data.sbo_views);
		$('#sbo_content').html(data.sbo_content);
		//해시태그
		if(data.sbo_hashtag_array !=null){
			var arr = new Array(); 
			arr=data.sbo_hashtag_array;
			for (var i = 0; i < arr.length; i++) {
				if(arr[i]!=null){
				    console.log(arr[i]);
                    $("#sbo_hashtag_array").append(" <a href='#' class='tag-cloud-link'>"+arr[i]+"</a>");
				}
			}		
		}
		
		if(ssid == data.st_id && ssid != null){
			$("#btnDeleteFboardAction").show()
			$("#btnUpdateFboard").show()			
		}

		//수정 뷰
		$("input:text[name='sbo_no']").val(data.sbo_no);

		//댓글 defalut값
		$("input:text[name='sfbo_no']").val(data.sbo_no);
		$('#sbo_title').focus();
	}
   
	//게시물 삭제 요청
	function sboardDelete(sbo_no) {
		location.href ="${pageContext.request.contextPath}/star/starBoard/"+st_id
	   $.ajax({ 
	       url: "${pageContext.request.contextPath}/star/starBoard/delete/", 
	       type: 'POST', 
	       data : { sbo_no : sbo_no },
	       success: function(response) {
	          if(response == true) {
	            alert("삭제되었습니다.")
	          }
	       }, 
	       error:function(xhr, status, message) { 
	           alert(" status: "+status+" er:"+message);
	       } 
	   });
	}

	//이전 작성글 기록 지우기
	function formReset(){
		$('#summernote').summernote('reset');
		$('#tag-list').empty();
		$('#sbo_hashtag_array').empty();
		tag = {};
		$('form').each(function() {
		   this.reset();
		});      
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
   

  
   
//댓글
	//댓글 목록 요청
	function replyListView(sbo_no) {
	   $.ajax({
	      url:'${pageContext.request.contextPath}/star/starBoard/reply',
	      type:'GET',
	      data: { sbo_no : sbo_no },
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
			
			var uls = "<ul class = 'replyUl'>";// 작성된 댓글 아래 달아주는 버튼들
			var li0 = "<li class='hideId' style='display:none;'>"+ re.mem_id +"</li>";
			//로그인 아이디와 작성자 비교 후 수정,삭제 창 보여주기
			if(id == re.mem_id || ssid == re.st_id){//세션아이디 / 작성자 아이디 비교
				if(id != null){//아이디 null체크
					var li1 = "<li class='btnUpdateReply'>수정</li><span>&nbsp;</span>";
					var li2 = "<li class='btnDeleteReply'>삭제</li><span>&nbsp;</span>";
				}else{
					var li1 = "";
					var li2 = "";		
				}
				if(ssid != null){//아이디 null체크
					var li1 = "<li class='btnUpdateReply'>수정</li><span>&nbsp;</span>";
					var li2 = "<li class='btnDeleteReply'>삭제</li><span>&nbsp;</span>";
				}else{
					var li1 = "";
					var li2 = "";		
				}
			}else{
				var li1 = "";
				var li2 = "";		
			}
			
			/* 신고가 보이는 경우 : 다른 '유저'가 쓴글
			신고가 안보이는 경우 : 내가 쓴글, 스타가 쓴글, 비로그인 */
			var li3 = "";
			if(id != null && id != ""){
				if(id != re.mem_id){
					if(re.st_id != null && re.st_id != ""){
						li3 = "";
					}else {
						console.log(ssid + re.st_id + re.mem_id+"====="+id)
						li3 = "<li class='btnNotifyReply' data-toggle='modal' data-target='#notifyModal'>신고</li><span>&nbsp;</span>";																					
					}
				}
			}else if(ssid !=null && ssid !=""){
				if(ssid != re.st_id){
					li3 = "<li class='btnNotifyReply' data-toggle='modal' data-target='#notifyModal'>신고</li><span>&nbsp;</span>";
				}
			}
			
			
			
			var ule = "</ul>";
			
			var ul = uls+li0+li1+li2+li3+ule;
			
			if(re.fan_name == null || re.fan_name == ""){//스타이름
				var name = "<i class='icon-star'></i>&nbsp;<span class = 'replyStarName'>" + re.st_name + "</span>"; 
			}else{//유저 닉네임
				var name = "<span class = 'replyFanName'>" + re.fan_name +"</span>";
			}
			
			$("<div class = 'replyInfo' data-no="+re.re_no+"><hr>") 
			.append($('<div class = \'row\'>').html(name + '&nbsp;&nbsp;&nbsp;' + "<span class = 'boardColor'>" +re.re_time +"</span>"))
			.append($('<div class = \'row replyText\'>').html(re.re_content))
			.append($('<div class = \'row flex-row-reverse\'>').append(ul))
			.appendTo('#replyListView');
		});//each
	}
   

   
   
   //댓글 등록 요청
   function replyInsert(sbo_no){
      $.ajax({ 
          url: "${pageContext.request.contextPath}/star/fanBoard/reply",  
          type: 'POST',  
          data : $("#formReply").serialize(),
          success: function(response) {
             if(response == true) {
                sboardView(sbo_no);//게시물 재 출력
             }
          }, 
          error:function(xhr, status, message) { 
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
		var sbo_no = $("input:text[name='sbo_no']").val();
		var re_no = reply.data("no");
		var re_content = reply.parent().find(".fboardReplyUpdate").val();
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/star/fanBoard/reply/update/", 
		    type: 'POST', 
		       data : { re_no : re_no, re_content : re_content },
		    success: function(response) {
				if(response == true) {
					alert('수정되었습니다.');
					sboardView(sbo_no);//화면 새로고침
				}
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		});
	}
   
   //댓글 삭제 요청
   function replyDelete(re_no) {
		var sbo_no = $("input:text[name='sbo_no']").val();   
		$.ajax({ 
			url: "${pageContext.request.contextPath}/star/fanBoard/reply/delete/", 
			type: 'POST', 
			data : { re_no : re_no },
			success: function(response) {
				if(response == true) {
					sboardView(sbo_no);
					alert('삭제되었습니다.');
				}
		    },
			error:function(xhr, status, message) { 
			    alert(" status: "+status+" er:"+message);
			} 
		});
   }
   
 //댓글 신고 버튼 시 모달에 값 담음
	function replyNotifyView(noti) {
		var re_no = noti.parent().data("no");
		var mem_id = noti.find(".hideId").html();
		$("#modalNotifyDefault").find("input:text[name='re_no']").val(re_no)
		$("#modalNotifyDefault").find("input:text[name='mem_id']").val(mem_id)
	}
	
	//댓글 신고 요청
	function replyNotifyAction(){
	   $.ajax({ 
	       url: "${pageContext.request.contextPath}/star/fanBoard/reply/notify/",  
	       type: 'POST',  
	       data : $("#formNotify").serialize(),
	       success: function(response) {
	          if(response == true) {
	        	  alert("신고가 접수 되었습니다.");
	        	  $('#notifyModal').modal("hide");
	          }
	       }, 
	       error:function(xhr, status, message) { 
	           /* alert(" status: "+status+" er:"+message); */
	           alert("로그인 후 이용해주세요.");
	       }
	    });
	}
</script>


<!-- 게시물 상세보기 -->
<section class="ftco-section-3 fboardViewSection">
   <input style="display:none;" name = "sbo_no"/>
   <div class="container">
      <hr>
         <div class="row"><h5 id = "sbo_title"></h5></div>
      <div class="row">
         <ul class = "fboardUl">
             <li><span id ="st_name"></span></li>
             <li><span id ="sbo_time"></span></li>
             <li><span id ="sbo_views"></span></li>
         </ul>
      </div>
      <br>
      <div class = "inputFboardContent" id ="sbo_content">
         
      </div>
      <br>
	      <div class="row ">
         	<ul id="sbo_hashtag_array" class="tagcloud">
        	<!-- 태그 추가되는곳 -->
        	</ul>
	      </div>
      <br>
      <div class="row">
         <div class = "starRight">
            <button type="button"  class="btn btn-primary py-2 px-4" id="btnDeleteFboardAction" style="display:none;" >삭제</button>
            <button type="button"  class="btn btn-primary py-2 px-4" id="btnUpdateFboard" style="display:none;">수정</button>
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



<!-- 모달창 -->
	<div class="modal fade" id="notifyModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="formNotify">
						<div id = "modalNotifyDefault" style="display:none;">
							<input name = "re_no" />
							<input name = "fbo_no" />
							<input name = "mem_id" />
						</div>
						<div class = " form-group">
							<label for="recipient-name" class="col-form-label">신고 이유</label>
							<select name = "nof_type">
								<option>욕설,비방</option>
								<option>광고</option>
								<option>허위정보</option>
								<option>음란물</option>
								<option>기타</option>
							</select>
						</div>
						
						<div class = " form-group">
							<label for="recipient-name" class="col-form-label">신고 내용</label>
							<textarea name="nof_content" style = "width:100%" rows = 7></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="notifyInsertAction">신고</button>
				</div>
			</div>
		</div>
	</div>
