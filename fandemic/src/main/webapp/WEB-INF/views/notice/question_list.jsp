<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style>

</style>
<script>

</script>
	<section class="page">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">

					<h1 class="page-title">1:1문의</h1>
					<div class="line thin"></div>
					<div class="page-description">
					<c:if test="${company.com_id eq 'admin' }">
						<button type="button" class="btn btn-primary" style="float: right">등록</button>
					</c:if>
					
								
						<table class="table table-striped" style="text-align: center; border: none;">
							<thead>
								<tr>
									<th>No</th>
									<th>Title</th>
									<th>작성자</th>
									<th>등록일</th>
									
								</tr>

							</thead>

						</table>
						 <div class="col-md-12 text-center">
		            <ul class="pagination">
		              <li class="prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
		              <li class="active"><a href="#">1</a></li>
		              <li><a href="#">2</a></li>
		              <li><a href="#">3</a></li>
		              <li><a href="#">...</a></li>
		              <li><a href="#">50</a></li>
		              <li class="next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
		            </ul>
		            </div>
						

					</div>
				</div>
			</div>
		</div>
	</section>

</html>