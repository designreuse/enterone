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
		// Summernote 출력
		$('#summernote').summernote({
			height : 500
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
		
		$(".img-print").on("click",function(){
			$(".uploadFile").click();				
				
		})
	});//end ready function
	
	/*************** 상품대표사진 첨부파일,미리보기*****************/
	function changeValue(event){
        //alert(event.target.value);//해당 이벤트 target즉 onchange이벤트가 일어난 주체의 value값      
        var reader = new FileReader();
        
        reader.onload = function(event){
        	var img = $(".gc-img");
        	//alert(event.target.result);//주소같은데..?
        	img.attr("src",event.target.result);
        	img.attr({"width":"250px","height":"250px"});
        	
        	
        	
        }
        reader.readAsDataURL(event.target.files[0]); //이거해야 src에 주소붙음.

    }

	
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
            <h1>굿즈관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">굿즈관리</li>
              <li class="breadcrumb-item">굿즈등록</li>
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
					<h3 class="card-title"><!-- 상단에 현재페이지? ex)굿즈등록 --></h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/management/noticesInsert" encType="multipart/form-data">
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
								<tr width="100%">
									<td width="10%" align="left"><label>상품명<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">								
				                        <input type="text" name="go_name" class="go_name form-control" style="width:300px; display: inline;" maxlength="250" placeholder="예시) 에코백 블랙 1020 "><label>최대 250자</label>                
									</td>
									<td width="15%"><label>소속연예인</label></td>
									<td width="20%">
										<select name="st_id" class="st_id form-control" style="width:150px;">
											<option>선택</option>
											<c:forEach items="${star }" var="star">
												<option value="${star.st_id }">${star.st_name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>상품가격<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left"><input type="text" name="go_price" class="go_price form-control" style="width:150px; display: inline;"
										maxlength="50" />원
									</td>
								</tr>
								<tr width="100%">
									<td width="10%" align="left"><label>상품카테고리<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">
										<select name="go_type" class="form-control" style="width:150px;">
											<option>카테고리 선택</option>
											<c:forEach items="${category }" var="category">
												<option>${category.gc_name }</option>
											</c:forEach>
										</select>
									</td>
									<td><label>재고<font size="2" color="blue">(필수)</font></label></td>
									<td><input type="text" name="go_stock" class="form-control" style="width:150px;"></td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>한정판여부<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left">
										<select name="go_limited" class="form-control" style="width:150px;">
											<option value="">O</option>
											<option value="">X</option>
										</select>
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>상품설명</label></td>
									<td colspan="3">
										<textarea id="summernote" name="cnoc_content" class="notice-content"></textarea>
									</td>
								</tr>
								
								<tr>
									<td colspan="1" align="left"><label>상품대표사진</label></td>
									<td colspan="3">
										<div style="width:286px; height:286px; background-color:white;" class="img-print">
										<img class="gc-img"></div>
                      					<input type="file" name="uploadFile" class="uploadFile" style="display:none;" onchange="changeValue(event)">                     					
                     				</td>
								</tr>
								<tr>
									<td colspan="1" align="left"><label>메인홍보용배너</label></td>
									<td colspan="3">
                      					<input type="file" name="uploadbanner" >                     					
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


