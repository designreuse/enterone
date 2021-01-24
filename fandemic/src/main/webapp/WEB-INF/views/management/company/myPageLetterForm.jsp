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
</style>
<script>

	$(function() {
		$("td .member_check").on("click",function(){
			var mem_id = $(".mem_id").val();//회원ID존재하는지 확인
			$.ajax({
				url:"${pageContext.request.contextPath}/management/company/memberCheck",
				dataType:"json",
				data:{mem_id:mem_id},
				success:function(response){
					if(response != null && response != ""){
						$(".member_check_result").text("존재하는 회원입니다.").css("color","green");
					}else{
						$(".member_check_result").text("존재하지 않는 회원입니다.").css("color","red");
					}
				},
				error:function(response){
					alert("에러")
				}
			})
		})		
		
		
		//등록버튼눌렀을경우 
		$("#btnLetter-register").on("click",function(){
			/* alert("등록버튼눌림"); */
			CnoticeFormCheck(); //유효성검사
		});
	});//end ready function
	
	function CnoticeFormCheck(){
		if($("table .mem_id").val()==null || $("table .mem_id").val()==''){
			alert("쪽지 보낼 회원을 입력하세요.");
			$("table .mem_id").focus();
			event.preventDefault();
		}
		else if($("table .lett_title").val()==null || $("table .lett_title").val()==''){
			alert("제목을 입력하세요.")
			$("table .lett_title").focus();
			event.preventDefault();
		}
		else if($("table .lett_content").val()==null||$("table .lett_content").val()==''){
			alert("내용을 입력하세요.")
			$("table .lett_content").focus();
			event.preventDefault();
		}else if($(".member_check_result").text()!="존재하는 회원입니다."){
			alert("존재하지 않는 회원에게 쪽지를 보낼 수 없습니다.")
			$("table .mem_id").focus();
			event.preventDefault();
		}
		
	}
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>쪽지보내기</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">소속사정보관리</li>
              <li class="breadcrumb-item">쪽지보내기</li>
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
					<form method="post" action="${pageContext.request.contextPath}/management/company/letterTrans" encType="multipart/form-data">
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
									<td colspan="1" align="left"><label>받는회원</label></td>
									<td style="text-align:left">	
										<input type="text" name="mem_id" class="mem_id form-control" style="width:500px; display:inline" >
										<button type="button" class="member_check">회원여부확인</button>
										<div class="member_check_result"></div>
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>제목</label></td>
									<td><input type="text" name="lett_title" class="lett_title form-control"
										placeholder="쪽지 제목" style="width:500px;"/>
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>내용</label></td>
									<td>
										<textarea name="lett_content" class="lett_content form-control" style="width:500px; height:500px"></textarea>
									</td>
								</tr>
								
								<tr >
									<td colspan="4" align="left" style="padding:5px;">
									<button type="submit" id="btnLetter-register" class="btn btn-primary pull-right">보내기</button>
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


