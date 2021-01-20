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
		
		starFanList();//스타회원 목록요청
		
		
		//스타회원 등록 버튼클릭시 이벤트
		$(".btn-register").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/star/starInsertForm";
		});
		
		/* var table = $('#dataTable');//datatable(공지사항목록)을 읽어옴
		table.on("click","tr a",function(){ //스타회원 ID값 클릭시 이벤트
			//alert($(this).parent().next().text());//
			var mem_id = $(this).parent().next().text();
			location.href="${pageContext.request.contextPath}/management/star/starFanInfoDetail?mem_id="+mem_id;	
		});//end 게시물 제목 클릭 */
		
		
		
		
		/****************************************/
		/*********** 스타 팬 블랙리스트 해제  ************/
		/****************************************/
		$("body").on("click",".btn_fanBlack",function(){
			//var mem_id = $(this).parent().prev().prev().prev().prev().text();
			var ck = confirm("해제하시겠습니까?");
			if(ck==true){
				$.ajax({
					url:"${pageContext.request.contextPath}/management/star/starFanBlack",
					type:"POST",
					data: $("#frm1").serialize(),  //from data 순서대로 읽어서 값던진다.
					dataType: 'json', //결과값 Json형태로
					success: function(response) {
				    	if(response != null && response !="") {
				    		alert("해제되었습니다.");
				    		$('#dataTable').DataTable().clear().destroy();
				    		starFanList();
				    	}  
				    }, 
				    error:function(xhr, status, message) { 
				        alert(" status: "+status+" er:"+message);
				    } 
				});//end ajax
			}
		})
		
	}); //end document ready
	
		//스타회원 목록 조회 요청
		function starFanList() {
			var st_id = "${fan.st_id}";
			$.ajax({
				url:'${pageContext.request.contextPath}/management/star/starFanList', //요청할 url
				type:'POST',
				data: {st_id:st_id},
				//contentType:'application/json;charset=utf-8',
				dataType:'json', //값이 넘어오는 형식
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:starFanListResult
			});
		}//end starMemberList
	
		function starFanListResult(data){
			/* console.log(data); */
			$("tbody").empty();
			$.each(data,function(idx,item){//idx=index, item=value
				$('<tr>').attr("class","starMemberTr")
				.append($('<td>').html('<input type="checkbox" name="fan_nos" value="'+item.fan_no+'">'))
				.append($('<td>').html(item.fan_no))
				.append($('<td>').html(item.mem_id))
				.append($('<td>').html("${star.st_name}"))
				.append($('<td>').html(item.fan_name))
				.append($('<td>').html(item.fan_block))
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
            <h1>팬현황</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">스타관리</li>
              <li class="breadcrumb-item active">팬현황</li>
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
                      <th>번호</th>
                      <th>회원ID</th>
                      <th>스타이름</th>
                      <th>회원닉네임</th>
                      <th>블랙리스트 여부</th>
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
              		<button type="button" class="btn_fanBlack">블랙리스트 해제</button>
              		<!-- <button type="button" class="btn-delete">삭제</button> -->
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
    </form>
</div>