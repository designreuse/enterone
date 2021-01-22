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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 400
		});
		
		
		
		
		//등록버튼눌렀을경우 
		$("#btnCompanyInfo-update").on("click",function(){
			/* alert("등록버튼눌림"); */
			CompanyFormCheck(); //유효성검사
		});
		
				
		//비밀번호 확인
		$(".com_pw").keyup(function(){ //비밀번호 입력할때
			$(".com_pw_ck_txt").text(""); //유효성검사창 초기화
		});
		//비밀번호 확인
		$(".com_pw_ck").keyup(function(){
			if($(".com_pw").val()!=$(".com_pw_ck").val()){
				$(".com_pw_ck_txt").text("비밀번호가 일치하지 않습니다.")
				                  .css("color","red");
			}else{
				$(".com_pw_ck_txt").text("비밀번호가 일치합니다.")
                .css("color","green");
			}
		});
		
		$(".address-btn").on("click",function(){ //우편번호 api
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            $(".com_zipAddress").val(data.zonecode);//우편번호
		            $(".com_address").val(data.address);//기본주소
		            
		        }
		    }).open();
		})
	});//end ready function
	
	
	/***********************************/
	/*********유효성 검사 ****************/
	/***********************************/
	function CompanyFormCheck(){ //유효성검사(비번입력했는지안했는지.)
	
		
	    if($("table .com_introduce").val()==null||$("table .com_introduce").val()==""){
			alert("소개글을 입력하세요.")
			$("table .com_introduce").focus();
			event.preventDefault();
		}else if($(".com_pw").val()!=$(".com_pw_ck").val()){
			alert("비밀번호를 확인하세요.")
			$("table .com_pw").focus();
			event.preventDefault();
		}else {
			var ck = confirm("수정하시겠습니까?");
			if(ck==false){
				event.preventDefault();
			}
		}
		
		
	}
	
	/***********************************/
	/*********배너 미리보기 ****************/
	/***********************************/
	function setThumbnail(event) { //event라함은 이벤트 대상을 의미하는듯
		$("#image_container img").remove();
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = $("<img>").attr("src",event.target.result).css("height","300px");
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
            <h1>Mypage</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">소속사정보관리</li>
              <li class="breadcrumb-item">Mypage</li>
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
					<h3 class="card-title"></h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/management/company/updateCompanyUpdate" encType="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>									
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="hidden" name="" value="${company.com_id }"/>
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
									<input type="password" name="com_pw_ck" class="com_pw_ck" style="width:250px"
										placeholder="변경할 패스워드를 확인하세요." maxlength="50" />
									<div class="com_pw_ck_txt"></div>
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
									<td align="left">
									<input type="text" name="com_address" class="com_address" style="width:250px"
										value="${company.com_address }" >
									<input type="text" name="com_zipAddress" class="com_zipAddress" 
									  placeholder="우편번호" value="${company.com_zipAddress }"><button type="button" class="address-btn">우편번호찾기</button>
									</td>
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
                      					<div id="image_container"><img src="${pageContext.request.contextPath}/images/company/${company.com_pic}" style="height: 300px;"></div>                    					
                     				</td>
								</tr>
								<tr >
									<td colspan="2" align="right" style="padding-right:10px"><label>회사소개</label></td>
									<td colspan="2">
										<textarea id="summernote" name="com_introduce" class="com_introduce notice-content">${company.com_introduce }</textarea>
									</td>
								</tr>
								
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnCompanyInfo-update" class="btn btn-primary pull-right">수정</button>
									<!-- <input type="button" id="btnCancel" class="btn btn-primary pull-right" value="취소" /></td> -->
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


