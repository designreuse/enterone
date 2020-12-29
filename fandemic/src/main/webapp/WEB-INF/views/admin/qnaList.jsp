<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function() {
		
		
		$("td").click(function(){
			var no = $(this).parent().children().get(0).innerHTML; // 글번호
			$(location).attr('href','${pageContext.request.contextPath}/qnaInsert?no=' + no);

	    });
		
		
		
	});


</script>













<section class="content">
<div style="padding: 10px 20px 10px 20px;">
	<h1 style="margin-top: 30px;" align="center">문의내역</h1>
	<table class="table table-hover" style="margin: 40px 40px 0px 40px;">
		<thead>
			<tr>
				<th style="width: 10%;">등록번호</th>
				<th style="width: 15%;">등록일</th>
				<th style="width: 15%;">제목</th>
				<th style="width: 10%;">아이디</th>
				<th style="width: 10%;">답변여부</th>
				<c:if  test="${s.q_answer ne null}">
					<th style="width: 20%;">답변일</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="q" items="${qna}">
			<tr>
				<td>${q.q_no}</td>
				<td>${q.q_time}</td>
				<td>${q.q_title}</td>
				<td>${q.mem_id}</td>
				
				<c:if  test="${s.q_answer eq null}">
					<td>미완료</td>
				</c:if>
				<c:if  test="${s.q_answer ne null}">
					<td>완료</td>
					<td>${q.q_atime}</td> 
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>
	
</section>























