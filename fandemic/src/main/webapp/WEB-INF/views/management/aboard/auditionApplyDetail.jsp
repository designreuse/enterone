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
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
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
	.aud_file, .aud_pic{
		padding:10px;
	}
	
</style>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 500
		});
		
		
		/* //취소버튼눌렀을경우 오디션 공지사항 목록 리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/aboard/aboard";
		});
		 */
		//수정버튼눌렀을경우 
		$("#btnAuditionDetail-back").on("click",function(){
			/* alert("등록버튼눌림"); */
			location.href="${pageContext.request.contextPath}/management/aboard/auditionApply?abo_no=${audition.abo_no}&com_id=${audition.com_id}"
		});
	
	 	//이벤트/공지사항 분류 DB값 지정
	 	$(".aud_type option").each(function(){
	 		if($(this).val()=="${audition.aud_type}"){
	 			$(this).attr("selected","selected");
	 		}
	 	});
	 	/* $(".custom-select").on("change",function(){
	 		if($(".custom-select").hasAttribute("selected")){
	 			$(this).removeAttribute("selected");
	 		}
	 	}); */
	 	
	 	
	 	
	});//end ready function
	
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>오디션 공지</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">오디션공지</li>
              <li class="breadcrumb-item">지원자 정보</li>
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
					<h3 class="card-title">지원자 정보보기</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="" enctype="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="hidden" name="abo_no" value="${audition.abo_no }"/>
										<input type="hidden" name="com_id" value="${audition.com_id }"/>
										<input type="hidden" name="mem_id" value="${audition.mem_id }"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr width="100%">
									<td colspan="1" align="left"><label>분류</label></td>
									<td colspan="3" align="left">								
				                        <select name="aud_type" class="aud_type custom-select" style="width: auto;" disabled="disabled">
				                          <option>가수</option>
				                          <option>배우</option>			                          
				                        </select>                     
				                        
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>지원자이름</label></td>
									<td colspan="3"><input type="text" name="mem_name" class="mem_name form-control"
										 maxlength="50" style="width:150px;" value="${audition.mem_name}" disabled="disabled"/>
									</td>
								</tr>
								<tr width="100%">
									<td align="left"><label>지원자나이</label></td>
									<td><input type="text" name="mem_name" class="mem_name form-control"
										 maxlength="50" style="width:150px;" value="${audition.aud_age}" disabled="disabled"/>
									</td>
									<td align="left"><label>취미/특기</label></td>
									<td><input type="text" name="mem_name" class="mem_name form-control"
										 maxlength="50" style="width:150px;" value="${audition.aud_hobby}" disabled="disabled"/>
									</td>
								</tr>
								<tr width="100%">
									<td align="left"><label>몸무게</label></td>
									<td style="text-align:left;"><input type="text" name="mem_name" class="mem_name form-control"
										 maxlength="50" style="width:100px; display:inline;" value="${audition.aud_weight}" disabled="disabled"/>kg
									</td>
									<td align="left"><label>키</label></td>
									<td style="text-align:left;"><input type="text" name="mem_name" class="mem_name form-control"
										 maxlength="50" style="width:100px; display:inline;" value="${audition.aud_height}" disabled="disabled"/>cm
									</td>
								</tr>
								<!-- 이 밑쪽은 지원자가업로드한 영상이나 이미지 출력 -->
								<tr >
									<td colspan="1" align="left"><label>영상</label></td>
									<td colspan="3">
										<div class="aud_file">
										<c:if test="${audition.aud_file != null}">
											<video autoplay controls loop muted poster="aaa" preload="auto">
											  <source src="${pageContext.request.contextPath}/media/${audition.aud_file}" type="video/mp4">
											  
											</video>
										</c:if>
										</div>
									</td>
									
								</tr>
								<tr>
									<td colspan="1" align="left"><label>사진</label></td>
									<td colspan="3">
										<div class="aud_pic"><img src="${pageContext.request.contextPath}/images/audition/${audition.aud_pic }" alt="등록된 사진이 없습니다."></div>
									</td>
								</tr>
								
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="button" id="btnAuditionDetail-back" class="btn btn-primary pull-right">목록으로</button>
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


