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
.btn-mgin{
	margin-right: 2px;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<link
   href="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
       />
   
<script
      src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
     ></script>
   <script
      src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
     ></script>
   
   <!-- 페이지네이션 날로먹는 빌드 끝 -->
<script>
	$(function() {
		
		starMemberList();//스타회원 목록요청
		
		
		//스타회원 등록 버튼클릭시 이벤트
		$(".btn-register").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/star/starInsertForm";
		});
		
		var table = $('#dataTable');//datatable(공지사항목록)을 읽어옴
		table.on("click","tr a",function(){ //스타회원 ID값 클릭시 이벤트
			//alert($(this).parent().next().text());//
			var st_id = $(this).parent().next().text();
			location.href="${pageContext.request.contextPath}/management/star/starDetail?st_id="+st_id;	
		});//end 게시물 제목 클릭
		
		/*********** 스타회원 삭제*************/
		$(".btn-delete").on("click",function(){ //체크박스 선택후 삭제버튼 클릭시 이벤트
			var ck = confirm("삭제하시겠습니까?");
			if(ck==true){
			
				 $.ajax({
					url:"${pageContext.request.contextPath}/management/star/starDelete",
					type:"POST",
					data: $("#frm1").serialize(),  //from data 순서대로 읽어서 값던진다.
					dataType: 'json', //결과값 Json형태로
					success: function(response) {
				    	if(response != null && response !="") {
				    		alert("삭제되었습니다.");
				    		$('#dataTable').DataTable().clear().destroy();
				    		starMemberList();
				    	}  
				    }, 
				    error:function(xhr, status, message) { 
				        alert(" status: "+status+" er:"+message);
				    } 
				});//end ajax
			}
		});
		
		/*********** 스타 스케줄 등록  **************/
		$("body").on("click",".btn-starSchedule",function(){
			//alert("경고"+$(this).parent().prev().prev().prev().text())
			var st_id = $(this).parent().prev().prev().prev().text();
			var st_name = $(this).parent().prev().prev().prev().prev().text();
			location.href="${pageContext.request.contextPath}/management/star/starSchedule?st_id="+st_id+"&st_name="+st_name;
		});
		
		/**********************************/
		/*********** 스타 작품 등록  ************/
		/**********************************/
		$("body").on("click",".btn-starWork",function(){
			var st_id = $(this).parent().prev().prev().prev().text();
			var st_name = $(this).parent().prev().prev().prev().prev().text();
			location.href="${pageContext.request.contextPath}/management/star/starWork?st_id="+st_id+"&st_name="+st_name;
		});
		
		/**********************************/
		/*********** 스타별팬형황 ************/
		/**********************************/
		$("body").on("click",".btn-fanInfo",function(){
			var st_id = $(this).parent().prev().prev().prev().text();
			var st_name = $(this).parent().prev().prev().prev().prev().text();
			location.href="${pageContext.request.contextPath}/management/star/starFanInfo?st_id="+st_id+"&st_name="+st_name;
		});
		
	}); //end document ready
	
		//스타회원 목록 조회 요청
		function starMemberList() {
			var com_id = "${company.com_id }";
			$.ajax({
				url:'${pageContext.request.contextPath}/management/star/starMemberList', //요청할 url
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
				.append($('<td>').html('<a href="#">'+item.st_name+'</a>'))
				.append($('<td>').html(item.st_id))
				.append($('<td>').html(item.st_pw))
				.append($('<td>').html(item.com_id))
				.append($('<td>').html('<input type="button" value="스케줄" class="btn-mgin btn-starSchedule"><input type="button" value="작품등록" class="btn-mgin btn-starWork"><input type="button" value="팬현황" class="btn-mgin btn-fanInfo">'))
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
                      <th></th>
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
              		<button type="button" class="btn-delete">삭제</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
    </form>
</div>