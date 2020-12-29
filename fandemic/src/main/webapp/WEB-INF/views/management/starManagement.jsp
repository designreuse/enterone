<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.center {
  text-align: center;
}

.pagination {
  display: ;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: black;
  color: white;
  border: 1px solid black;
}
div #dataTable_filter{
		text-align:right;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<link
   href="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
      crossorigin="anonymous" />
   
<script
      src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
      crossorigin="anonymous"></script>
   
   <!-- 페이지네이션 날로먹는 빌드 끝 -->
<script>
	$(function() {
		
		starMemberList();//스타회원 목록요청
		
		
		//스타회원 등록 버튼클릭시 이벤트
		$(".btn-register").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/starInsertForm";
		});
		
		
		
	}); //end document ready
	
	//스타회원 목록 조회 요청
	function starMemberList() {
		var com_id = "${company.com_id }";
		$.ajax({
			url:'${pageContext.request.contextPath}/management/starMemberList', //요청할 url
			type:'POST',
			data: {com_id:com_id},
			//contentType:'application/json;charset=utf-8',
			dataType:'json', //값이 넘어오는 형식
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:starMemberListResult
		});
	}//end starMemberList
	
	function starMemberListResult(data){
		/* console.log(data); */
		$("tbody").empty();
		$.each(data,function(idx,item){//idx=index, item=value
			$('<tr>').attr("class","starMemberTr")
			.append($('<td>').html('<input type="checkbox" name="st_ids" value="'+item.st_id+'">'))
			.append($('<td>').html(item.st_name))
			.append($('<td>').html('<a href="#">'+item.st_id+'</a>'))
			.append($('<td>').html(item.st_pw))
			.append($('<td>').html(item.com_id))
			.appendTo('tbody');
			
		});//end each
		$('#dataTable').DataTable();
		
		
	}//end starMemberListResult
</script>
     <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>스타관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">스타관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!--  공지 게시판 -->
    <form method="POST" id="frm1">
    <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><!-- 공지/이벤트 --></h3>
              </div>
              <!-- ./card-header -->
              <div class="card-body">
              
                <table id="dataTable" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th></th>
                      <th>스타이름</th>
                      <th>ID</th>
                      <th>PW</th>
                      <th>소속사</th>
                    </tr>
                  </thead>
                  <tbody>
                              <!-- body 들어간데 ~ -->   
                  </tbody>
                </table>
           
              </div>
              <!-- /.card-body -->
              <div>
              	<!-- 페이지네이션 들어가는 자리-->
              	<div class="cnotices-button">
              		<button type="button" class="btn-register">등록</button>
              		<button class="btn-update">수정</button>
              		<button type="button" class="btn-delete">삭제</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
    </form>
</div>