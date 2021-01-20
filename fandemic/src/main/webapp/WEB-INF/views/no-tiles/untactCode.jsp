<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

$(document).ready(function() {
$("#btnIn").on('click', function () {
	
	var id = '${sessionScope.member.mem_id}';
	var go_no = "${go_no}";
	
	if( id == null || id == '') {
		alert("로그인 후 이용 할 수 있으며 일반 회원만 이용가능 합니다.");
	} else {
		console.log("ajax 들어옴", go_no);
		
		$.ajax({
            url :'${pageContext.request.contextPath}/untactCode',
            type:"post",
            data : { code : $("#inCode").val() , go_no : go_no}, //go_no 넘겨서 controller에서 비교 후
            success:function(data){
            	if(data == null || data == '' ) {
            		alert("코드가 일치하지 않습니다.");
            	} else {
            		alert("입장합니다.");
            		$(location).attr('href','https://192.168.1.66:18/caller.html');
            		
            	}
             	
            },error:function(){ alert("실패"); }
         });
	}
});

});

</script>
    
<section class="home">

<div align="center" style="padding: 30px 10px 10px 10px;">
<div class="card">
  	<div class="card-header">입장하기 </div>
  	<div class="card-body">
		<label for="recipient-name" class="col-form-label">코드입력</label>
		<input type="text" id="inCode" class="form-control" >
 	</div>
  	<div class="card-footer">
		<button type="button" class="btn btn-primary" id ="btnIn">입장</button>
	</div>
</div>
</div>
	
</section>