<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<style>

.pagination li {
	display: inline-block; 
}
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid gray;
  margin: 0 4px;
}

.pagination a.active {
  background-color: rgb(53, 52, 52);
  color: white;
  border: 1px solid gray;
}

.pagination a:hover:not(.active) {
	background-color: lightgray;
	color: black;
	}
</style>



<section class="content">
<div style="padding: 10px 20px 10px 20px;">
	<h1 style="padding: 10px;" align="center">개인회원 리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>No</th>
				<th>가입일</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>메일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="mem" items="${member}">
			<tr>
				<td>${mem.mem_no}</td>
				<td>${mem.mem_time}</td>
				<td>${mem.mem_id}</td>
				<td>${mem.mem_name}</td>
				<td>${mem.mem_phone}</td>
				<td>${mem.mem_email}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div align="center">
	<script>
		function goPage(p) {
			location.href="adminMember?p="+p
		}
	</script>
	
	<my:paging paging="${paging}" jsfunc="goPage" /> 
</div>

</section>

