<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">

<style>
	table {font-size: 13pt;}
</style>
<script>
	$(document).ready(function() {
		
		//등록 수정
		$("#btnAdd").click(function(){
			
			$.ajax({
	            url :'${pageContext.request.contextPath}/filterAdd',
	            type:"post",
	            data : {
		            	fil_prohibited : $("#prohibited").val() ,
		            	fil_alternative : $("#alternative").val() 
	            	},
	            
	            success:function(data){
	            	
					alert("등록되었습니다.");
					$(location).attr('href','${pageContext.request.contextPath}/adminFilter');
	             	
	            },error:function(){ alert("실패"); }
	         });

	    });
		
		// 삭제
		$("#btnDel").click(function(){
			
			//링크보고 다시
			
	    });
		
		
		
		
		
		
		
		$("td").click(function(){
			var fil_prohibited =  $(this).parent().children().get(2).innerHTML;
			var fil_alternative = $(this).parent().children().get(3).innerHTML;
			
			$("#prohibited").val(fil_prohibited);
			$("#alternative").val(fil_alternative);
			$("#prohibited").attr("readonly",true);
			
			console.log(fil_prohibited,fil_alternative);
	    });
		

		
		
		// 체크박스 이벤트
		$("#allChk").click(function(){ 
			if($("#allChk").prop("checked")) {
				
				$("input[type=checkbox]").prop("checked",true); 
			
			} else { 

				$("input[type=checkbox]").prop("checked",false); 
			} 
		});


	});

</script>

<section class="content">
	<div style="padding: 30px 20px 0px 20px;">
		<h1 align="center">금칙어 지정</h1>
		<div style="padding: 30px 100px 30px 30px;">
		<table class="table table-hover" style="padding: 20px">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="allChk"></th>
					<th scope="col">No</th>
					<th scope="col">금칙어</th>
					<th scope="col">대체어</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach  var="fil" items="${filter}" varStatus="status">
				<tr>
					<td><input type="checkbox" name="del" value="${fil.fil_prohibited}"></td>
					<td scope="row">${fil.fil_no}</td>
					<td>${fil.fil_prohibited}</td>
					<td>${fil.fil_alternative}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		<div align="center" style="padding-top: 50px;">
			<table>
				<tr>
					<th><div align="center">금칙어</div></th>
					<th><div align="center">대체어</div></th>
					<th><div style="margin:30px;"></div></th>
					<th><div style="margin:30px;"></div></th>
				</tr>
				<tr>
					<th><div style="margin:10px;"><input class="form-control " type="text" id="prohibited"></div></th>
					<th><div style="margin:10px;"><input class="form-control " type="text" id="alternative"></div></th>
					<th><div style="margin:5px;"><button class="btn btn-primary" id="btnAdd"> 등록 </button></div></th>
					<th><div style="margin:5px;"><button class="btn btn-primary" id="btnDel" > 삭제 </button></div></th>
				</tr>
			</table>

		</div>
	</div>

</section>