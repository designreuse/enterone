<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.table td{
		vertical-align: middle;
		padding : 0px;
		border : 1px solid #dddddd;
	}
	.table tr{
		background-color:rgba(0,0,0,.05);
	}
	td .abo_pic{
		width: 0;
		height: 0;
		padding: 0;
		border: 0;
	}
	td .upload-name{
		border: 2px inset rgba(0,0,0,.10);
	}
	td .filebox{
		display:inline-block;
		padding:5px;
		margin:5px;
		border: 2px inset rgba(0,0,0,.05);
		border-radius: 10px;
	}
	td.fileboxi{
		text-align:left;
	}
	td .filetext{
		background-color:rgba(0,0,0,.05);
		border: 2px inset rgba(0,0,0,.10);
		width:100%;
	}
	
	
</style>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 500
		});
		
		
		//취소버튼눌렀을경우 오디션 공지사항 목록 리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/aboard/aboard";
		});
		
		//수정버튼눌렀을경우 
		$("#btnAboard-register").on("click",function(){
			/* alert("등록버튼눌림"); */
			AboardFormCheck(); //유효성검사
		});
		/* //파일등록이벤트
		$(".uploadFile").text("${aboard.abo_pic}");
		
	 	var fileTarget = $("#file"); //input type=file
	 	fileTarget.on("change",function(){ // 값이변경되면
	 		var cur=$(".fileboxi input[type='file']").val(); //input file의 value값을 받아서
	 		$(".upload-name").val(cur); //업로드파일명 출력 
	 		
	 		
	 	});*/
	
	 	//이벤트/공지사항 분류 DB값 지정
	 	$(".custom-select option").each(function(){
	 		if($(this).val()=="${aboard.abo_subject}"){
	 			$(this).attr("selected","selected");
	 		}
	 	});
	 	/* $(".custom-select").on("change",function(){
	 		if($(".custom-select").hasAttribute("selected")){
	 			$(this).removeAttribute("selected");
	 		}
	 	}); */
	 	/*첨부파일 이름 미리보기 */
		$("#uploadFile").change(function(){
			fileList = $(this)[0].files;
			//console.log(fileList[0].name);
			$("#la").text(fileList[0].name);
			
		})
	 	
	 	
	});//end ready function
	
	function AboardFormCheck(){
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
		
		var ck=confirm("수정하시겠습니까?")
		if(ck==false){
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
              <li class="breadcrumb-item">상세보기</li>
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
					<form method="post" action="${pageContext.request.contextPath}/management/aboard/aboardUpdate" enctype="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="hidden" name="abo_no" value="${aboard.abo_no }"/>
										<input type="hidden" name="com_id" value="${aboard.com_id }"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr width="100%">
									<td width="10%" align="left"><label>분류</label></td>
									<td width="40%" align="left">								
				                        <select name="abo_subject" class="abo_subject custom-select" style="width: auto;" disabled="disabled">
				                          <option>가수</option>
				                          <option>배우</option>			                          
				                        </select>                     
				                        
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>제목</label></td>
									<td colspan="3"><input type="text" name="abo_title" class="abo_title form-control"
										placeholder="글 제목" maxlength="50" value="${aboard.abo_title}"/>
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>내용</label></td>
									<td colspan="3">
										<textarea id="summernote" name="abo_content" class="abo_content" >${aboard.abo_content}</textarea>
									</td>
								</tr>
								
								<tr>
									<td colspan="1" align="left"><label>첨부파일</label></td>
									<td colspan="3" align="left" class="fileboxi">
									<label class="btn btn-default btn-file">
									배너선택
                      					<input type="file" id="uploadFile" class="abo_pic" name="uploadFile">
                      				</label>
                      				<div style="display: inline-block; position:relative; width: 300px;"><label id="la">${aboard.abo_pic }</label></div>
                     				</td>
								</tr>
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnAboard-register" class="btn btn-primary pull-right">수정</button>
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


