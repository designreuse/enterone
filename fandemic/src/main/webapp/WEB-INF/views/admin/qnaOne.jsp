<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<style>
	table {
	font-size: 13pt;
	margin: 30px 20px 30px 20px;
	}
	
	div {
	margin: 30px 20px 30px 20px;
	}
	
	td {
	margin: 30px 20px 30px 20px;
	}
	
</style>
    
<section class="content">
<div>
	<h1>문의내용</h1>
	<table>
		<tr>
			<td style="width: 10%"><div align="center">등록일</div></td>
			<td>${qna.q_time}</td>
			<td style="width: 10%"><div align="center">아이디</div></td>
			<td>${qna.mem_id}</td>
			<td style="width: 15%"><div align="center">연락처</div></td>
			<td>${qna.mem_phone}</td>
		</tr>

		<tr>
			<td><div align="center">제목</div></td>
			<td><div align="center">${qna.q_title}</div></td>
			
		</tr>
		<tr>
			<td><div align="center">내용</div></td>
			<td><div>${qna.q_content}</div></td>
		</tr>
		
	</table>
</div>
<div>
	<h1>답변</h1>
</div>
</section>