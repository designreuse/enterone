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
		
		//취소버튼눌렀을경우 굿즈 리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/goods/goodsList";
		});
		
		//등록버튼눌렀을경우 
		$("#btnGoods-register").on("click",function(){
			if($(".go_type").val()=="TICKET"){
				UntactFormCheck();
			}else{
				GoodsFormCheck(); //유효성검사
			}
		});
		
		//첨부파일(대표) div클릭했을시
		$(".img-print").on("click",function(){
			$(".uploadFile").click();				
				
		});
		
		//첨부파일(상세) div클릭했을시
		$(".img-print1").on("click",function(){
			$(".uploadDetailImg").click();
		});
		
		//카테고리 변경시 이벤트 처리
		$(".go_type").on("change",function(){
				var font = $("<font>").attr("size","2").css("color","blue").text("(필수)")
			if($(".go_type").val()=="TICKET"){ //카테고리선택이 TICKET(예매관련) 일경우
				$(".go_name").parent().prev().children().text("행사제목").append(font.clone());
				$(".go_name").attr("placeholder","")
				$(".go_price").parent().prev().children().text("행사가격").append(font.clone());
				$(".go_stock").parent().prev().children().text("행사제한인원").append(font.clone());
				$(".go_content").parent().prev().children().text("행사설명").append(font.clone());
				$(".uploadFile").parent().prev().children().text("행사대표사진");
				$(".uploadDetailImg").parent().prev().children().text("행사상세사진");
				$(".go_limited").parent().css("display","none");
				$(".go_limited").parent().prev().css("display","none");
				$(".hangsa").css("display","");
			}else{
				$(".go_name").parent().prev().children().text("상품명").append(font.clone());
				$(".go_name").attr("placeholder","예시)에코백 블랙 1020")
				$(".go_price").parent().prev().children().text("상품가격").append(font.clone());
				$(".go_stock").parent().prev().children().text("재고").append(font.clone());
				$(".go_content").parent().prev().children().text("상품설명").append(font.clone());
				$(".uploadFile").parent().prev().children().text("상품대표사진");
				$(".uploadDetailImg").parent().prev().children().text("상품상세사진");
				$(".go_limited").parent().css("display","");
				$(".go_limited").parent().prev().css("display","");
				$(".hangsa").css("display","none");
			}
		});
	
		$("body").on("click",".imgDel",function(){
			console.log($(this).parent());
			$(this).parent().remove();
		});
		
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
        reader.readAsDataURL(event.target.files[0]);


    }//end 업로드 대표사진 미리보기
    /*************** 상품상세사진 첨부파일,미리보기*****************/
    function changeDetail(event){
var reader = new FileReader();
        
        reader.onload = function(event){
        	var img = $(".gc-img2");
        	//alert(event.target.result);//주소같은데..?
        	img.attr("src",event.target.result);
        	img.attr({"width":"250px","height":"250px"});

        }
        reader.readAsDataURL(event.target.files[0]);

    }

	/************굿즈 등록 폼 유효성체크**************/
	function GoodsFormCheck(){
		if($("table .go_name").val()==null || $("table .go_name").val()==''){
			alert("상품명을 입력하세요.")
			$("table .go_name").focus();
			event.preventDefault();
		}
		else if($("table .go_price").val()==null||$("table .go_price").val()==''){
			alert("상품가격을 입력하세요.")
			$("table .go_price").focus();
			event.preventDefault();
		}
		else if($("table .go_type").val()==null||$("table .go_type").val()==''){
			alert("상품 카테고리를 선택하세요.")
			$("table .go_type").focus();
			event.preventDefault();
		}
		else if($("table .go_stock").val()==null||$("table .go_stock").val()==''){
			alert("상품 재고를 입력하세요.")
			$("table .go_stock").focus();
			event.preventDefault();
		}
		else if($("table .go_limited").val()==null||$("table .go_limited").val()==''){
			alert("한정판 여부를 선택하세요.")
			$("table .go_limited").focus();
			event.preventDefault();
		}
		else if($("table .go_content").val()==null||$("table .go_content").val()==''){
			alert("상품 설명을 입력하세요.")
			$("table .go_content").focus();
			event.preventDefault();
		}
	}//end 유효성검사
	
	/************행사 등록 폼 유효성체크**************/
	function UntactFormCheck(){
		if($("table .go_name").val()==null || $("table .go_name").val()==''){
			alert("행사명을 입력하세요.")
			$("table .go_name").focus();
			event.preventDefault();
		}
		else if($("table .go_price").val()==null||$("table .go_price").val()==''){
			alert("행사가격을 입력하세요.")
			$("table .go_price").focus();
			event.preventDefault();
		}
		else if($("table .go_stock").val()==null||$("table .go_stock").val()==''){
			alert("행사 인원을 입력하세요.")
			$("table .go_stock").focus();
			event.preventDefault();
		}
		else if($("table .go_untsdate").val()==null||$("table .go_untsdate").val()==''){
			alert("행사시작일을 선택하세요.")
			$("table .go_untsdate").focus();
			event.preventDefault();
		}
		else if($("table .go_untedate").val()==null||$("table .go_untedate").val()==''){
			alert("행사종료일 선택하세요.")
			$("table .go_untedate").focus();
			event.preventDefault();
		}
		else if($("table .go_unttime").val()==null||$("table .go_unttime").val()==''){
			alert("행사 시간을 입력하세요.")
			$("table .go_unttime").focus();
			event.preventDefault();
		}
		else if($("table .go_content").val()==null||$("table .go_content").val()==''){
			alert("행사 설명을 입력하세요.")
			$("table .go_content").focus();
			event.preventDefault();
		}
	}//end 유효성검사
	
	
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>상품등록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">스토어관리</li>
              <li class="breadcrumb-item">상품등록</li>
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
					<form method="post" action="${pageContext.request.contextPath}/management/goods/InsertGoods" encType="multipart/form-data">
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
									<td width="10%" align="left"><label>상품명<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">								
				                        <input type="text" name="go_name" class="go_name form-control" style="width:300px; display: inline;" maxlength="250" placeholder="예시) 에코백 블랙 1020 "><label>최대 250자</label>                
									</td>
									<td width="15%"><label>소속연예인</label></td>
									<td width="20%">
										<select name="st_id" class="st_id form-control" style="width:150px;">
											<option value="">선택</option>
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
										<select name="go_type" class="go_type form-control" style="width:150px;" >
											<option></option>
											<c:forEach items="${category }" var="category">
												<option>${category.gc_name }</option>
											</c:forEach>
										</select>
									</td>
									<td><label>재고<font size="2" color="blue">(필수)</font></label></td>
									<td><input type="text" name="go_stock" class="go_stock form-control" style="width:150px;"></td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>한정판여부<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left">
										<select name="go_limited" class="go_limited form-control" style="width:150px;">
											<option value="1">O</option>
											<option value="0">X</option>
										</select>
									</td>
								</tr>
								<tr style="display:none;" class="hangsa">
									<td width="10%" align="left"><label>행사시작일<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">
										<input type="date" name="go_untsdate" class="go_untsdate form-control" style="width:200px;">
									</td>
									<td><label>행사종료일<font size="2" color="blue">(필수)</font></label></td>
									<td><input type="date" name="go_untedate" class="go_untedate form-control" style="width:200px;"></td>
								</tr>
								<tr style="display:none;" class="hangsa">
									<td colspan="1" align="left"><label>행사진행시간<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left"><input type="text" name="go_unttime" class="go_unttime form-control" style="width:150px; display: inline;"
										maxlength="50" />
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>상품설명<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3">
										<textarea id="summernote" name="go_content" class="go_content notice-content"></textarea>
									</td>
								</tr>
								
								<tr>
									<td width="10%" align="left"><label>상품대표사진</label></td>
									<td width="15%">
										<div style="width:286px; height:286px; background-color:white;" class="img-print">
										<img class="gc-img"></div>
                      					<input type="file" name="uploadFile" class="uploadFile" style="display:none;" onchange="changeValue(event)">                     					
                     				</td>
                     				<td width="10%"><label>상품상세사진</label></td>
                     				<td width="40%" align="left"; style="vertical-align:top;">
                     					<div style="width:286px; height:286px; background-color:white;" class="img-print1">
                     					<img class="gc-img2">
                     					</div>
                     					<input type="file" name="uploadDetailImg" class="uploadDetailImg" style="display:none;" onchange="changeDetail(event)">  
                     				</td>
								</tr>
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnGoods-register" class="btn btn-primary pull-right">등록</button>
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


