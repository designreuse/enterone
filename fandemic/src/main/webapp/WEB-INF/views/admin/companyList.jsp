<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="content">
<div style="padding: 10px 20px 10px 20px;">
	<h1 style="padding: 10px;" align="center">기업회원 리스트</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">가입일</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">연락처</th>
				<th scope="col">메일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="com" items="${company}">
			<tr>
				<td scope="row">${com.com_no}</td>
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
</section>

