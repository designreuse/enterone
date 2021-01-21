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
			height : 400
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
	
	function CnoticeFormCheck(){ //유효성검사(비번입력했는지안했는지.)
	    if($("table .st_introduce").val()==null||$("table .st_introduce").val()==""){
			alert("소개글을 입력하세요.")
			$("table .st_introduce").focus();
			event.preventDefault();
		}else if($("table .st_pw").val()!=$("table .st_pw_ck").val()){
			alert("비밀번호가 일치하지 않습니다.")
			$("table .st_pw").focus();
			event.preventDefault();
		}
	    else{
			var ck = confirm("수정하시겠습니까?");
		
			if(ck==false){
				event.preventDefault();
			}
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
					<form method="post" action="${pageContext.request.contextPath}/management/star/starMemberUpdate" encType="multipart/form-data">
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
					                    <input type="text" style="width:250px" class="st_id_ck" name="st_id_ck" value="${star.st_id }" disabled="disabled">  
					                    <input type="hidden" style="width:250px" class="st_id" name="st_id" value="${star.st_id }" readonly="readonly">    
					                    <div class="st_id_ck" style="display:none;"></div>        
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>비밀번호</label></td>
									<td colspan="2" align="left">
									<input type="password" name="st_pw" class="st_pw" style="width:250px"
										placeholder="변경할 패스워드를 입력하세요." maxlength="50" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label class="pw_ck">비밀번호 확인</label></td>
									<td colspan="2" align="left">
									<input type="password" name="st_pw_ck" class="st_pw_ck" style="width:250px"
										placeholder="변경할 패스워드를 확인하세요." maxlength="50" />
									<div class="st_pw_ck_txt"></div>
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>스타이름</label></td>
									<td colspan="2" align="left">
									<input type="text" name="st_name" class="st_name" style="width:250px"
										placeholder="이름을 입력하세요." maxlength="50" value="${star.st_name }" disabled="disabled"/><!-- maxlength는 적을수있는 최대글자수 -->
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
										<textarea id="summernote" name="st_introduce" class="st_introduce">${star.st_introduce }</textarea>
									</td>
								</tr>
								
								
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnCnotice-register" class="btn btn-primary pull-right">수정</button>
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


