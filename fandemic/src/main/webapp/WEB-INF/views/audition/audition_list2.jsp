<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<head>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesMypage/css/mypageA.css">
<script>


$(function() {
	$(".AboardList").on("click",function(){	
		
		var abo_no =$(this).children().eq(0).text();
		location.href='${pageContext.request.contextPath}/auditionlistDetail/'+abo_no; // 파라미터로 넘겨줌
		//변수이름안에 이름을 담는다
		
	})	
	
});
</script>

</head>

<section class="single" style="min-height: 1200px">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="line">
					<div>
						<a id="rgoods">오디션 공고 목록</a>
					</div>
				</div>


				<div class="row rgoods" class="col-md-12">
					<div>
						<table
							class="table table-striped table-dark table-hover">
							<tr>
								<th scope="col" width="5%">번호</th>
								<th scope="col" width="30%">게시물제목</th>
								<th scope="col" width="20%">말머리</th>
								<th scope="col" width="20%">공고일</th>
							</tr>
									<c:forEach items="${auditionList}" var="list">
										<tr class="AboardList">
											<td scope="col" width="5%">${list.abo_no}</td>
											<td scope="col" width="30%" style="cursor:pointer">${list.abo_title}</td>
											<td scope="col" width="20%">${list.abo_subject}</td>
											<td scope="col" width="20%">${fn:substring(list.abo_time,0,10)}</td>
										</tr>
									</c:forEach>
						</table>
						<div align="center">
							<script>
								function goPage(p) {
									location.href = "${pageContext.request.contextPath}/mymail/"
											+ "?p=" + p
								}
							</script>

							<my:paging paging="${paging}" jsfunc="goPage" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
