<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

$(document).ready(function() {
	
	$('td').on('click', function (event) {

		var no = $(this).parent().children().get(0).innerHTML;
	    var modal = $("#exampleModal");
	    
		  $.ajax({
			  url: '${pageContext.request.contextPath}/qnaInsert?no=' + no ,
			  success: function(result) {
				  
				  console.log(result.q_title)
				  
				  modal.find('.modal-title').text(result.q_title);
				  modal.find('#user').text(result.mem_id);
				  modal.find('#time').text(result.q_time);
				  modal.find('#content').text(result.q_content);
				  
				  // 답변
				  modal.find('#answer').text(result.q_answer);
				  modal.find('#answerTime').text(result.q_atime);

				  modal.modal('show');
			  },
			  
	  });

	}); 
	
	
	$('#btnAnswer').on('click', function (event) {
		
		var content = $("#answer").val();
		
		$.ajax({
			  url: '${pageContext.request.contextPath}/qnaAns' ,
			  data: {q_answer : content},
			  success: function(result) {
				  
				
			  },
			  
	  });
		
		
		
		
		
		
		
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
        	
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
    			<p class="card-text">답변내용</p>
    			<p class="far fa-clock" id="answerTime">답변시간</p>
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


	
</section>























