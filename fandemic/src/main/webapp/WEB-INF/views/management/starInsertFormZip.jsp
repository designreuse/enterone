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
			location.href="${pageContext.request.contextPath}/management/notices";
		});
		
		//등록버튼눌렀을경우 
		$("#btnCnotice-register").on("click",function(){
			/* alert("등록버튼눌림"); */
			CnoticeFormCheck(); //유효성검사
		});
	});//end ready function
	
	function CnoticeFormCheck(){
		if($("table .notice-title").val()==null || $("table .notice-title").val()==''){
			alert("제목을 입력하세요.")
			$("table .notice-title").focus();
			event.preventDefault();
		}
		else if($("table .notice-content").val()==null||$("table .notice-content").val()==''){
			alert("내용을 입력하세요.")
			$("table .notice-content").focus();
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
					<form method="post" action="${pageContext.request.contextPath}/management/noticesInsert" >
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
				                    <input type="text" style="width:250px" placeholder="아이디를 입력하세요.">     
				                    <input type="button" value="중복체크">                  
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>비밀번호</label></td>
									<td colspan="2" align="left">
									<input type="password" name="cnoc_title" style="width:250px"
										placeholder="패스워드를 입력하세요." maxlength="50" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>비밀번호 확인</label></td>
									<td colspan="2" align="left">
									<input type="password" name="cnoc_title" style="width:250px"
										placeholder="패스워드를 입력하세요." maxlength="50" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>스타이름</label></td>
									<td colspan="2" align="left">
									<input type="text" name="cnoc_title" style="width:250px"
										placeholder="이름을 입력하세요." maxlength="50" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="1" align="left"><label>첨부파일</label></td>
									<td colspan="3">
                      					<input type="file" name="uploadFile" >                     					
                     				</td>
								</tr>
								<tr >
									<td colspan="2" align="left"><label>스타소개</label></td>
									<td colspan="2">
										<textarea id="summernote" name="cnoc_content" class="notice-content"></textarea>
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


