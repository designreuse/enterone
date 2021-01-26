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
	td .cnoc_file{
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
	
	
</style>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 500
		});
		
		
		//취소버튼눌렀을경우 공지사항리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/company/memberReport";
		});
		
		//등록버튼눌렀을경우 
		$("#btnBlack").on("click",function(){
			/* alert("등록버튼눌림"); */
			var ck = confirm("블랙리스트로 추가하겠습니까?")
			if(ck==false){
				return false;
			}
		});
	
	 	
	});//end ready function
	
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>신고상세</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">팬관리</li>
              <li class="breadcrumb-item">신고게시판</li>
              <li class="breadcrumb-item">신고상세</li>
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
					<form method="post" action="${pageContext.request.contextPath}/management/blackRegister" enctype="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="hidden" name="nof_no" value="${notifyF.nof_no }"/>
										<input type="hidden" name="com_id" value="${company.com_id}"/>
										<input type="hidden" name="mem_id" value="${notifyF.mem_id }"/>
										<input type="hidden" name="st_id" value="${notifyF.st_id }" />
									</th>
								</tr>
							</thead>
							<tbody>
								<tr width="100%">
									<td width="10%" align="left"><label>신고제목</label></td>
									<td width="40%" align="left">								
				                         <input type="text" name="nof_content" class="form-control" value="${notifyF.nof_content}" 
				                              disabled="disabled"/>                 
				                        
									</td>
									<td><label>신고대상자</label></td>
									<td colspan="3"><input type="text" name="mem_id" class="form-control" value="${notifyF.mem_id}" disabled="disabled"> 
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>신고자의스타</label></td>
									<td colspan="1"><input type="text" name="st_id" class="st_id form-control"
										value="${notifyF.st_id}" disabled="disabled"/>
									</td>
									<td><label>신고분류</label></td>
									<td colspan="1"><input type="text" name="nof_type" class="form-control" value="${notifyF.nof_type}" disabled="disabled"> 
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>신고당한내용</label></td>
									<td colspan="3">
										<div style="text-align:left; background-color:#e9ecef; height:300px;" name="fbo_content" class="fbo_content form-control">${notifyF.fbo_content } </div>
									</td>
								</tr>
								
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnBlack" class="btn btn-primary pull-right">블랙리스트</button>
									<input type="button" id="btnCancel" class="btn btn-primary pull-right" value="목록으로" /></td>
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


