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
		}
		
	}
	
	
	function setThumbnail(event) { //event라함은 이벤트 대상을 의미하는듯
		$("#image_container img").remove();
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = $("<img>").attr("src",event.target.result);
			$("#image_container").append(img);			
			/* var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img); */
		}; // end onload
		reader.readAsDataURL(event.target.files[0]);
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
										<input type="hidden" name="com_id" value="${company.com_id }"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" width="200px" align="right" style="padding-right:10px"><label>소속사 아이디</label></td>
									<td colspan="2" align="left">								
					                    <input type="text" style="width:250px" class="com_id_ck" name="com_id_ck" value="${company.com_id }" disabled="disabled">  
					                    <input type="hidden" style="width:250px" class="com_id" name="com_id" value="${company.com_id }" readonly="readonly">    
					                    <div class="com_id_ck" style="display:none;"></div>        
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>비밀번호</label></td>
									<td colspan="2" align="left">
									<input type="password" name="com_pw" class="com_pw" style="width:250px"
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
									<td colspan="2" align="right" style="padding-right:10px"><label>소속사이름</label></td>
									<td colspan="2" align="left">
									<input type="text" name="com_name" class="com_name" style="width:250px"
										value="${company.com_name }" disabled="disabled"/><!-- maxlength는 적을수있는 최대글자수 -->
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>소속연락처</label></td>
									<td colspan="2" align="left">
									<input type="text" name="com_phone" class="com_phone" style="width:250px"
										value="${company.com_phone }" /><!-- maxlength는 적을수있는 최대글자수 -->
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>소속사주소</label></td>
									<td colspan="2" align="left">
									<input type="text" name="com_address" class="com_address" style="width:250px"
										value="${company.com_address }" ><!-- maxlength는 적을수있는 최대글자수 -->
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>소속사상세주소</label></td>
									<td colspan="2" align="left">
									<input type="text" name="com_address2" class="com_address2" style="width:250px"
										value="${company.com_address2 }" ><!-- maxlength는 적을수있는 최대글자수 -->
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>소속사이메일</label></td>
									<td colspan="2" align="left">
									<input type="text" name="com_email" class="com_email" style="width:250px"
										value="${company.com_email }" ><!-- maxlength는 적을수있는 최대글자수 -->
									</td>
									<td></td>
								</tr>
								
								<tr>
									<td colspan="2" rowspan="2" align="right" style="padding-right:10px"><label>배너사진</label></td>
									<td colspan="2" rowspan="1">
                      					<input type="file" name="uploadBanner" onchange="setThumbnail(event);">

                     				</td>
								</tr>
								<tr>
									<td colspan="2">
                      					<div id="image_container"></div>                    					
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


