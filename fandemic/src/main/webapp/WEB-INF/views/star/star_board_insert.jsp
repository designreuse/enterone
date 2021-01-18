<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script>
	var tag = {};
	var counter = 0;
	var st_id = "${stVo.st_id}";

	$(function() {
		var checkUnload = true; //글 작성중 나가면 사라지는 것 방지
		start();

		
		$(window).on("beforeunload", function(){ //글 작성중 나가면 사라지는 것 방지
			if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
		});
		
		//게시물 등록버튼
		$("#btnInputFboardAction").on("click",function(){
			checkUnload = false; //경고창 중복 제거
			if(fboardFormCheck() == true){ //유효성검사
				sboardInsert() //글 등록 요청 보내기
			}
		});
		
		//게시물 화면 취소버튼
		$(".btnCancelFboard").on("click",function(){
			checkUnload = false; //경고창 중복 제거
			if(confirm("작성중인 글을 종료하시겠습니까?") == true){//취소 확인받기
				window.history.back();
			}
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
	
	//유효성 체크
	function fboardFormCheck(){
	   if($("input:text[name='sbo_title']").val()==null || $("input:text[name='sbo_title']").val()==''){
	      alert("제목을 입력하세요.")
	      $("input:text[name='sbo_title']").focus();
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
   
	//게시글 필터링
	function boardFilter(){
		var statement = $("#summernote").val();//본문
		
		var list = ${filList};
		for(var i=0; i<list.length; i++) {
			
			var keyword = list[i].fil_prohibited;
			
			if (statement.indexOf(keyword) != -1) {
				var re = new RegExp(keyword, "g");
			    statement = statement.replace(re, list[i].fil_alternative);
			    console.log(statement);
			    $('#summernote').summernote('code',statement)
			}
		}
		
		var statement2 = $("input:text[name='sbo_title']").val();//제목
		for(var i=0; i<list.length; i++) {
			
			var keyword = list[i].fil_prohibited;
			
			if (statement2.indexOf(keyword) != -1) {
				var re = new RegExp(keyword, "g");
			    statement2 = statement2.replace(re, list[i].fil_alternative);
			    console.log(statement2);
			    $("input:text[name='sbo_title']").val(statement2)
			}
		}
	}
	

   //게시글 등록 요청
   function sboardInsert(){
		//해시태그 작성된 값 받아서 제출
		var value = marginTag();
		$("#rdTag").val(value); 
		
		boardFilter();//비속어 필터링
		
		$.ajax({
		    url: "${pageContext.request.contextPath}/star/starBoard/insert",  
		    type: 'POST',  
		    data : $("#form1").serialize(),
		    success: function(response) {
		       if(response == true) {
		         alert("작성되었습니다.")
		         //fboardListView();//목록출력
		         location.href = "${pageContext.request.contextPath}/star/starBoard/"+st_id;
		       }
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    }
		});
	}

</script>

<!-- 글쓰는 공간 -->
<section class="ftco-section-3 fboardInsertSection">
   <div class="container">
      <h3>글작성</h3>
      <hr>
      <form id="form1">
         <div class="col-xl-12 col-md-12 col-12 row">
               <input name = "sbo_title" style="width: 100%" placeholder="제목" class="inputFboardTitle" value = "${sboVo.sbo_title}"/>
         </div>
         <br>
         <textarea id="summernote" name="sbo_content"  class = "inputFboardContent">${sboVo.sbo_content}</textarea>
         <br>
         <div class="row starCenter">
            <div class="col-xl-2 col-md-3 col-4">태그</div>
            <div class="col-xl-10 col-md-9 col-8">
               	<!-- 해시태그 -->
			    <div class="content">
			        <div class = "row">
			            <input type="text" id="tag" size="7" placeholder="태그입력"/>
			           <!--  <button type="button" id = "tag-form">누르면 태그값 보임</button> -->
			        </div>
			        <div class = "row">
			        	<ul id="tag-list">
			        	<!-- 태그 추가되는곳 -->
			        	</ul>
			            <input type="hidden" type="text" value="" name="sbo_hashtag" id="rdTag" />
			        </div>
			    </div>
            </div>
         </div>
         <br>
         <hr>
         <div class="row starCenter">
            <div class = "starRight">
               <button type="button" class="btn btn-primary py-2 px-4 btnCancelFboard">취소</button>
               <button type="button" class="btn btn-primary py-2 px-4" id = "btnInputFboardAction">등록</button>
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
