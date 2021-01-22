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
			height : 500
		});
		
		
		//취소버튼눌렀을경우 오디션 공지사항 리스트로 이동
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/aboard/aboard";
		});
		
		//오디션 공지사항 등록버튼눌렀을경우 
		$("#btnAboard-register").on("click",function(){
			CnoticeFormCheck(); //유효성검사
		});
		
		/*첨부파일 이름 미리보기 */
		$("#uploadFile").change(function(){
			fileList = $(this)[0].files;
			//console.log(fileList[0].name);
			$("#la").text(fileList[0].name);
			
		})
	});//end ready function
	
	//내용 유효성검사
	function CnoticeFormCheck(){
		if($("table .abo_title").val()==null || $("table .abo_title").val()==''){
			alert("제목을 입력하세요.")
			$("table .abo_title").focus();
			event.preventDefault();
		}
		else if($("table .abo_content").val()==null||$("table .abo_content").val()==''){
			alert("내용을 입력하세요.")
			$("table .abo_content").focus();
			event.preventDefault();
		}
		
	}
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>오디션공지</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">오디션공지</li>
              <li class="breadcrumb-item">오디션공지등록</li>
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
					<h3 class="card-title">오디션공지</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/management/aboard/aboardInsert" encType="multipart/form-data">
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
								<tr width="100%">
									<td width="10%" align="left"><label>지원분류</label></td>
									<td width="40%" align="left">								
				                        <select name="abo_subject" class="abo_subject custom-select" style="width: auto;">
				                          <option>가수</option>
				                          <option>배우</option>	
				                        </select>                     
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>제목</label></td>
									<td colspan="3"><input type="text" name="abo_title" class="abo_title form-control"
										placeholder="글 제목" maxlength="50" />
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>오디션내용</label></td>
									<td colspan="3">
										<textarea id="summernote" name="abo_content" class="abo_content"></textarea>
									</td>
								</tr>
								
								<tr>
									<td colspan="1" align="left"><label>첨부파일</label></td>
									<td colspan="3" align="left">
									<label class="btn btn-default btn-file"> 
									파일선택
                      					<input type="file" id="uploadFile" name="uploadFile"> 
                      				</label>      
                      				<div style="display: inline-block; position:relative; width: 300px;"><label id="la">파일을 선택하세요.</label></div>              					
                     				</td>
								</tr>
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnAboard-register" class="btn btn-primary pull-right">등록</button>
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


