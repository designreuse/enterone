<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   
<script>   
   $(function() {      
      //화면 시작 시 목록 출력
      fboardListView();
      
      //tr클릭시 해당 게시글 조회
      $(".trFboardList").on("click","tr",function(){
         var fbo_no = $(this).children("#fbo_no").val();
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
      
      //등록버튼
      $("#btnInputFboardAction").on("click",function(){
         checkUnload = false; //경고창 중복 제거
         if(fboardFormCheck() == true){ //유효성검사
            fboardInsert() //글 등록 요청 보내기
         }
      });
      
      //수정 페이지 이동 버튼
      $("#btnUpdateFboard").on("click",function(){
         fboardUpdateView();
      });
      
      //수정 페이지 이동 버튼
      $("#btnUpdateFboardAction").on("click",function(){
         checkUnload = false; //경고창 중복 제거
         if(fboardFormCheck() == true){ //유효성검사
            fboardUpdate(); //글 등록 요청 보내기
         }
      });
      
      //삭제 요청 버튼
      $("#btnDeleteFboardAction").on("click",function(){
         if(confirm("정말로 글을 삭제하시겠습니까?") == true){
            fboardDelete();            
         }
      });
      
      //취소버튼
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
         fboardListView();
      });
      
      //댓글 등록 요청
      $(".btnFboardReplyInsert").on("click",function(){
         checkUnload = false;//경고창 중복 제거
         if(replyFormCheck() == true){ //유효성검사
            replyInsert();//댓글 등록 요청 보내기
         }
      });
      
   });//버튼 액션 종료

   
   
   
   //게시물 목록 요청
   function fboardListView() {
      var st_id = "${star.st_id}";
      $(".fboardListSection").show();
      $(".fboardInsertSection").hide();
      $(".fboardViewSection").hide();
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
   }

   //게시물 목록 요청 결과값
   function fboardListViewResult(data) {
      formReset();//이전 입력 데이터 삭제
      $("tbody").empty();
      $.each(data,function(idx,item){
         $('<tr>').addClass('candahar')
         .append($('<input type=\'hidden\' id=\'fbo_no\'>').val(item.fbo_no))
         .append($('<td>').html(item.fbo_sub_no))
         .append($('<td>').html("[" + item.fbo_subject + "] " + item.fbo_title))
         .append($('<td>').html(item.fan_name))
         .append($('<td>').html(item.fbo_time))
         .append($('<td>').html(item.fbo_views))
         .appendTo('tbody');
      });//each
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
      $('#fbo_hashtag').text(data.fbo_hashtag);
      
      //수정 뷰
      $("input:text[name='fbo_no']").val(data.fbo_no);
      $("input:text[name='fbo_sub_no']").val(data.fbo_sub_no);
      $("input:text[name='fbo_title']").val(data.fbo_title);
      $("select[name='fbo_subject']").val(data.fbo_subject).attr("selected", "selected");
      $('#summernote').summernote('code',data.fbo_content)
      $("input:text[name='fbo_hashtag']").val(data.fbo_hashtag);
      
      //댓글 defalut값
      $("input:text[name='sfbo_no']").val(data.fbo_no);
      $("input:text[name='st_id']").val(data.st_id);
      
      $(".fboardListSection").hide();
      $(".fboardInsertSection").hide();
      $('#fbo_title').focus();
      $(".fboardViewSection").show();
   }
   
   
   
   
   
   
   //이전 작성글 기록 지우기
   function formReset(){
      $('#summernote').summernote('reset');
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
   
   //게시글 등록 요청
   function fboardInsert(){
      $.ajax({ 
          url: "${pageContext.request.contextPath}/star/fanBoard",  
          type: 'POST',  
          data : $("#form1").serialize(),
          success: function(response) {
             if(response == true) {
               alert("작성되었습니다.")
               fboardListView();//목록출력
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
         $('<div><hr>')
         .append($('<input type=\'hidden\' id=\'sfbo_no\'>').val(re.sfbo_no))
         .append($('<div class = \'row\'>').html(re.fan_name + '&nbsp;' +re.re_time))
         .append($('<div class = \'row\'>').html(re.re_content))
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
              alert(" status: "+status+" er:"+message);
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
            <br>
            
            <table class = "table trFboardList">
               <thead>
                  <tr>
                     <th scope="col">#</th>
                     <th scope="col">제목</th>
                     <th scope="col">작성자</th>
                     <th scope="col">작성일</th>
                     <th scope="col">조회수</th>
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
      <div class="row starCenter">
         <div class="col-xl-2 col-md-3 col-4">태그</div>
         <div class="col-xl-10 col-md-9 col-8" id ="fbo_hashtag">
            
         </div>
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
            <input style="display:none;" name = "st_id" />
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
               <input name ="fbo_hashtag" style="width: 100%" placeholder="#태그" />
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
