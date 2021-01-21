<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.table td{
		vertical-align: middle;
		padding : 0px;
		border : 1px solid #dddddd;
	}
	.table tr{
		background-color:rgba(0,0,0,.05);
	}
</style>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 200
		});
		
		//공지사항/이벤트 분류에 따라 이벤트인원 칼럼 출력
		$(".custom-select").on("change",function(){
			if($(this).val()=="이벤트"){
				$("table .event").css("display","");
			}else{
				$("table .event").css("display","none");
			}
		});
		
		//취소버튼눌렀을경우 공지사항리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/star/starList";
		});
		
		//등록버튼눌렀을경우 
		$("#btnCnotice-register").on("click",function(){
			/* alert("등록버튼눌림"); */
			CnoticeFormCheck(); //유효성검사
		});
		
		$("td .st_id").keyup(function(){
			$(".st_id_ck").text("");
		})
		//ID중복체크 버튼
		$("td .st_id_ck_btn").on("click",function(){
			var st_id=$(".st_id").val(); //id값
			$.ajax({
				url:"${pageContext.request.contextPath}/management/star/starIdCheck",
				type:"post",
				data:{st_id:st_id},
				dataType: 'json',
				success: function(response) {
			    	if(response != null && response !="") {
			    		$(".st_id_ck").text("중복된 아이디값이 있습니다.")
			    		$(".st_id_ck").css("display","")
			    					  .css("color","red");
			    	}else{
			    		$(".st_id_ck").text("사용가능한 아이디 입니다.")
			    		$(".st_id_ck").css("display","")
			    		              .css("color","green"); 
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			}); //ajax end
		});//ID중복체크 버튼 end
		
		
		//비밀번호 확인
		$(".st_pw").keyup(function(){ //비밀번호 입력할때
			$(".st_pw_ck_txt").text(""); //유효성검사창 초기화
		});
		//비밀번호 확인
		$(".st_pw_ck").keyup(function(){
			if($(".st_pw").val()!=$(".st_pw_ck").val()){
				$(".st_pw_ck_txt").text("비밀번호가 일치하지 않습니다.")
				                  .css("color","red");
			}else{
				$(".st_pw_ck_txt").text("비밀번호가 일치합니다.")
                .css("color","green");
			}
		});
	});//end ready function
	
	function CnoticeFormCheck(){
		if($("table .st_id").val()==null || $("table .st_id").val()==''){
			alert("아이디를 입력하세요.")
			$("table .st_id").focus();
			event.preventDefault();
		}
		else if($("table .st_pw").val()==null||$("table .st_pw").val()==''){
			alert("비밀번호를 입력하세요.")
			$("table .st_pw").focus();
			event.preventDefault();
		}else if($("table .st_name").val()==null||$("table .st_name").val()==''){
			alert("이름을 입력하세요.")
			$("table .st_name").focus();
			event.preventDefault();
		}else if($("table .st_pw").val() != $("table .st_pw_ck").val()){
			alert("비밀번호가 일치하지 않습니다.")
			$("table .st_pw").focus();
			event.preventDefault();
		}else if($(".st_id_ck").text()!="사용가능한 아이디 입니다."){
			alert("아이디를 확인하세요.")
			$("table .st_id").focus();
			event.preventDefault();
		}
		
	}
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>스타관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">스타관리</li>
              <li class="breadcrumb-item">스타회원등록</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title">스타회원등록</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/management/star/starMemberInsert" encType="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>									
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="text" name="com_id" value="${company.com_id }"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" width="200px" align="right" style="padding-right:10px"><label>아이디</label></td>
									<td colspan="2" align="left">								
					                    <input type="text" style="width:250px" class="st_id" name="st_id" placeholder="아이디를 입력하세요.">     
					                    <button type="button" class="st_id_ck_btn" value="중복체크">중복체크 </button>  
					                    <div class="st_id_ck" style="display:none;"></div>        
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>비밀번호</label></td>
									<td colspan="2" align="left">
									<input type="password" name="st_pw" class="st_pw" style="width:250px"
										placeholder="패스워드를 입력하세요." maxlength="50" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label class="pw_ck">비밀번호 확인</label></td>
									<td colspan="2" align="left">
									<input type="password" name="st_pw_ck" class="st_pw_ck" style="width:250px"
										placeholder="패스워드를 확인하세요." maxlength="50" />
									<div class="st_pw_ck_txt"></div>
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>스타이름</label></td>
									<td colspan="2" align="left">
									<input type="text" name="st_name" class="st_name" style="width:250px"
										placeholder="이름을 입력하세요." maxlength="50" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>아이콘사진</label></td>
									<td colspan="2">
                      					<input type="file" name="uploadIcon" >                     					
                     				</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>프로필사진</label></td>
									<td colspan="2">
                      					<input type="file" name="uploadProfile" >                     					
                     				</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>배너사진</label></td>
									<td colspan="2">
                      					<input type="file" name="uploadBanner" >                     					
                     				</td>
								</tr>
								<tr >
									<td colspan="2" align="left"><label>스타소개</label></td>
									<td colspan="2">
										<textarea id="summernote" name="st_introduce" class="notice-content"></textarea>
									</td>
								</tr>
								
								
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnCnotice-register" class="btn btn-primary pull-right">등록</button>
									<input type="button" id="btnCancel" class="btn btn-primary pull-right" value="취소" /></td>
								</tr>
								
							</tbody>
						</table>
						
					</form>
					
				</div>
				<div class="card-footer">
					Visit <a href="https://github.com/summernote/summernote/">Summernote</a>
					documentation for more examples and information about the plugin.
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>

	<!-- ./row -->
</section>


