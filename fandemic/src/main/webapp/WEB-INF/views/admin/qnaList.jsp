<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
<script>

$(document).ready(function() {
	
	$('td').on('click', function (event) {

		var no = $(this).parent().children().get(0).innerHTML;
	    var modal = $("#exampleModal");
	    
	    modal.find('#answer').val(""); //리셋
	    modal.find('#answerTime').text("");
		  $.ajax({
			  url: '${pageContext.request.contextPath}/qnaOne?no=' + no ,
			  success: function(result) {
				  
				  modal.find('.modal-title').text(result.q_title);
				  modal.find('#user').text(result.mem_id);
				  modal.find('#time').text(result.q_time);
				  modal.find('#content').text(result.q_content);
				  modal.find('#q_no').val(no);

				  if(result.q_answer != null && result.q_answer != "") {
					  // 답변
					  modal.find('#answer').val(result.q_answer);
					  modal.find('#answerTime').text(result.q_atime);
				  }
				  
				  

				  modal.modal('show');
			  },
			  
	  });

	}); 
	
	
	$('#btnAnswer').on('click', function (event) {
		
		var content = $("#answer").val();
		var no = $("#q_no").val();
		
		$.ajax({
			  url: '${pageContext.request.contextPath}/qnaAns' ,
			  data: {q_answer : content , q_no : no},
			  success: function(result) {
				  alert("등록되었습니다.");
				  $(location).attr('href','${pageContext.request.contextPath}/adminQna');
				
			  },
			  
	  });

	});  
	
	
});


</script>



<section class="content">
<div style="padding: 10px 150px 10px 20px;">
	<h1 style="margin-top: 30px;" align="center">문의내역</h1>
	<table class="table table-hover" style="margin: 40px 40px 0px 40px;">
		<thead>
			<tr>
				<th style="width: 10%;">등록번호</th>
				<th style="width: 15%;">등록일</th>
				<th style="width: 15%;">제목</th>
				<th style="width: 10%;">아이디</th>
				<th style="width: 10%;">답변여부</th>
				<th style="width: 20%;">답변일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="q" items="${qna}">
			<tr>
				<td>${q.q_no}</td>
				<td>${q.q_time}</td>
				<td>${q.q_title}</td>
				<td>${q.mem_id}</td>
				
				<c:if  test="${q.q_answer eq null}">
					<td>미완료</td>
					<td></td>
				</c:if>
				<c:if  test="${q.q_answer ne null}">
					<td>완료</td>
					<td>${q.q_atime}</td> 
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
        	
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnClose">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      	<div class="card" style="width: 95%;">
  			<div class="card-body">
  			<h6 class="card-subtitle text-muted mb-4" >
				<i id="user" class="far fa-user" style="margin: 7px;"></i>
                <i id="time" class="far fa-clock" style="margin: 7px;"></i>
            </h6>
    		<p id="content" class="card-text"></p>
  			</div>
		</div>
		
		<div id="divAnswer" class="card" style="width: 95%;">
  			<div class="card-body">
    			<h5><p class="card-text">답변</p></h5>
    			<p class="far fa-clock" id="answerTime"></p>
    			<input type="text" id="q_no" style="display: none;" />
    			<textarea class="form-control" id="answer" name="contents" rows="10"></textarea>
  			</div>
		</div>




      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-secondary" id="btnAnswer">답변등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div align="center" style="padding-top: 30px;">
	<script>
		function goPage(p) {
			location.href="${pageContext.request.contextPath}/adminQna?p="+p
		}
	</script>
	
	<my:paging paging="${paging}" jsfunc="goPage" /> 
</div>
	
</section>























