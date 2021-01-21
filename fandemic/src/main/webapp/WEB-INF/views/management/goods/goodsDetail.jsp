<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<style>
	.detail td{
		vertical-align: middle;
		padding : 0px;
		border : 1px solid #dddddd;
	}
	.detail tr{
		background-color:rgba(0,0,0,.05);
	}
	.title-detail{
		text-align: left;
	}
	
	
</style>
<script>
		
	function initDetail() {
		
		// Summernote 출력
		$('#summernote').summernote({
			height : 500
		});
		
		
		//취소버튼눌렀을경우 굿즈 리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/goods/goodsList";
		});
		
		//등록버튼눌렀을경우 
		$("#btnGoods-update").on("click",function(){
			if($(".go_type").val()=="TICKET"){
				UntactFormCheck();
			}else{
				GoodsFormCheck(); //유효성검사
			}
		});
		
		//첨부파일(대표) div클릭했을시
		$(".img-print").off();
		$(".img-print").on("click",function(){ //on 하면 이벤트가 추가되는거라고함 !!!!!!
			$(".uploadFile").click();				
				
		});
		
		//첨부파일(상세) div클릭했을시
		$(".img-print1").off();
		$(".img-print1").on("click",function(){
			$(".uploadDetailImg").click();
		});
		
		ckTicket();
		
		//카테고리 변경시 이벤트 처리
		$(".go_type").on("change",function(){
				/* if($(".go_type").hasAttribute("selected")){
		 			$(this).removeAttribute("selected");
				};
		 		*/
			ckTicket();
		});
	
	};//end ready function
	
	function ckTicket(){
		var font = $("<font>").attr("size","2").css("color","blue").text("(필수)");
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
	}
	
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
    	for(var image of event.target.files){
    		var reader = new FileReader();
    		
    		reader.onload = function(event){
            	var img = $("<img>");
            	//alert(event.target.result);//주소같은데..?
            	img.attr("src",event.target.result);
            	img.attr({"width":"100px","height":"100px"});
            	$(".img-print1").append(img);
            }
    		console.log(image); 
    		reader.readAsDataURL(image);
    	}
    	$(".img-print1").css("display","inline");
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
		}else{
			var ck = confirm("수정하시겠습니까?")
			if(ck==false){
				event.preventDefault();
			}
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
		}else{
			var ck = confirm("수정하시겠습니까?")
			if(ck==false){
				event.preventDefault();
			}
		}
	}//end 유효성검사
	
	
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6 title-detail">
            <h1>스토어관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">스토어관리</li>
              <li class="breadcrumb-item">상품수정</li>
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
					<form method="post" action="${pageContext.request.contextPath}/management/goods/updateGoods" encType="multipart/form-data">
						<table class="table table-striped detail"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="text" name="com_id" value="${company.com_id }"/>
										<input type="text" name="go_no" value="${goods.go_no }">
									</th>
								</tr>
							</thead>
							<tbody>
								<tr width="100%">
									<td width="15%" align="left"><label>상품명<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">								
				                        <input type="text" name="go_name" class="go_name form-control" style="width:300px; display: inline;" maxlength="250" placeholder="예시) 에코백 블랙 1020 " value="${goods.go_name }"><label>최대 250자</label>                
									</td>
									<td width="15%"><label>소속연예인</label></td>
									<td width="20%">
										<select name="st_id" class="st_id form-control" style="width:150px;" disabled="disabled">
											<option value="">선택</option>
											<c:forEach items="${star }" var="star">
												<option value="${star.st_id}" <c:if test="${star.st_id==goods.st_id}">selected</c:if> >${star.st_name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>상품가격<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left"><input type="text" name="go_price" class="go_price form-control" style="width:150px; display: inline;"
										maxlength="50" value="${goods.go_price }"/>원
									</td>
								</tr>
								<tr width="100%">
									<td width="10%" align="left"><label>상품카테고리<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">
										<select name="go_type" class="go_type form-control" style="width:150px;" disabled="disabled">
											<option></option>
											<c:forEach items="${category }" var="category">
												<option <c:if test="${category.gc_name==goods.go_type}">selected</c:if>>${category.gc_name }</option>
											</c:forEach>
										</select>
									</td>
									<td><label>재고<font size="2" color="blue">(필수)</font></label></td>
									<td><input type="text" name="go_stock" class="go_stock form-control" style="width:150px;" value="${goods.go_stock }"></td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>한정판여부<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left">
										<select name="go_limited" class="go_limited form-control" style="width:150px;" disabled="disabled">
											<option value="1" <c:if test="${goods.go_limited==1}">selected</c:if>>O</option>
											<option value="0" <c:if test="${goods.go_limited==0}">selected</c:if>>X</option>
										</select>
									</td>
								</tr>
								<tr style="display:none;" class="hangsa">
									<td width="10%" align="left"><label>행사시작일<font size="2" color="blue">(필수)</font></label></td>
									<td width="40%" align="left">
										<fmt:parseDate value="${goods.go_untsdate }" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="yyyy-MM-dd" value="${date}" var="go_untsdate"/>
										<input type="date" name="go_untsdate" class="go_untsdate form-control" style="width:200px;" value="${go_untsdate }">
									</td>
									<td><label>행사종료일<font size="2" color="blue">(필수)</font></label></td>
									<td><fmt:parseDate value="${goods.go_untedate }" var="date" pattern="yyyy-MM-dd HH:mm:ss" /><fmt:formatDate pattern="yyyy-MM-dd" value="${date}" var="go_untedate"/>
									<input type="date" name="go_untedate" class="go_untedate form-control" style="width:200px;" value="${go_untedate }">
								</tr>
								<tr style="display:none;" class="hangsa">
									<td colspan="1" align="left"><label>행사진행시간<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3" align="left"><input type="text" name="go_unttime" class="go_unttime form-control" style="width:150px; display: inline;"
										maxlength="50" value="${goods.go_unttime }"/>
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>상품설명<font size="2" color="blue">(필수)</font></label></td>
									<td colspan="3">
										<textarea id="summernote" name="go_content" class="go_content notice-content">${goods.go_content }</textarea>
									</td>
								</tr>
								
								<tr>
									<td width="10%" align="left"><label>상품대표사진</label></td>
									<td width="15%">
										<div style="width:286px; height:286px; background-color:white;" class="img-print">
										<img src="${pageContext.request.contextPath}/images/goods/${goods.go_pic}" class="gc-img" style="width:250px; height:250px;" alt="사진이없어요"></div>
                      					<input type="file" name="uploadFile" class="uploadFile" style="display:none;" onchange="changeValue(event)">                     					
                     				</td>
                     				<td width="10%"><label>상품상세사진</label></td>
                     				<td width="40%" align="left"; style="vertical-align:top;">
                     					<div style="width:100px; height:100px; background-color:white;" class="img-print1"></div>
                     					<input type="file" name="uploadDetailImg" class="uploadDetailImg" style="display:none;" onchange="changeDetail(event)" multiple>  
                     				</td>
								</tr>
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnGoods-update" class="btn btn-primary pull-right">수정</button>
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


