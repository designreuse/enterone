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
	<h1 style="padding: 10px;" align="center">기업회원 리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 5%;">No</th>
				<th style="width: 15%;">가입일</th>
				<th style="width: 15%;">아이디</th>
				<th style="width: 15%;">이름</th>
				<th style="width: 15%;">연락처</th>
				<th style="width: 20%;">메일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="com" items="${company}">
			<tr>
				<td>${com.com_no}</td>
				<td>${com.com_time}</td>
				<td>${com.com_id}</td>
				<td>${com.com_name}</td>
				<td>${com.com_phone}</td>
				<td>${com.com_email}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>

<div align="center">
	<script>
		function goPage(p) {
			location.href="adminCompany?p="+p
		}
	</script>
	
	<my:paging paging="${paging}" jsfunc="goPage" /> 
</div>

</section>

