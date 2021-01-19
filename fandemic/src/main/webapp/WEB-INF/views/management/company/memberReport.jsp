<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		memberReportList();//신고 목록 요청
		$(".pagination a").on("click",function(){
			$(".pagination a").removeClass("active");
			$(this).addClass("active");
		});
		
		$(".btn-register").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/noticesInsertForm";
		});
		
		var table = $('#dataTable');//datatable(공지사항목록)을 읽어옴
		table.on("click","tr a",function(){ //게시물 tr에 제목 클릭했을때 ~
			/* alert($(this).parent().prev().text());//클릭한 tr에 대한 게시물번호 */
			var cnoc_no = $(this).parent().prev().text();
			location.href="${pageContext.request.contextPath}/management/noticesDetail?cnoc_no="+cnoc_no;	
		});//end 게시물 제목 클릭
		
		
		//체크박스 클릭 이벤트
		table.on("click","input[type=checkbox]",function(){		 	
			if(!$(this).attr("checked")){
				$(this).attr("checked",true);
			}else{
				$(this).attr("checked",false)
			}
		});
		
		
		//공지사항 삭제
		$(".btn-delete").on("click",function(){
			 $.ajax({
				url:"${pageContext.request.contextPath}/management/noticesDelete",
				type:"POST",
				data: $("#frm1").serialize(),
				dataType: 'json', //결과값 Json형태로
				success: function(response) {
			    	if(response != null && response !="") {
			    		$('#dataTable').DataTable().clear().destroy();
			    		//$('#dataTable').DataTable().destroy();
			    		cnoticeList();
			    	}  
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			});//end ajax
		});
		
	}); //end document ready
	
	
	//공지사항 목록 조회 요청
	function memberReportList() {
		var com_id = "${sessionScope.company.com_id }";
		//console.log("====="+com_id);
		$.ajax({
			url:'${pageContext.request.contextPath}/management/company/memberReportList', //요청할 url
			type:'POST',
			data: {com_id:com_id},
			//contentType:'application/json;charset=utf-8',
			dataType:'json', //값이 넘어오는 형식
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:memberReportListResult
		});
	}//end cnoticeList
	
	function memberReportListResult(data){
		/* console.log(data); */
		$("tbody").empty();
		$.each(data,function(idx,item){//idx=index, item=value
			$('<tr>').attr("class","cnoticeTr")
			.append($('<td>').html('<input type="checkbox" name="nof_nos" value="'+item.nof_no+'">'))
			.append($('<td>').html('<a href="#">'+item.nof_no+'</a>'))
			.append($('<td>').html(item.nof_content))
			.append($('<td>').html(item.st_id))
			.append($('<td>').html(item.mem_id))
			.append($('<td>').html(item.nof_type))
			.appendTo('tbody');
			
		});//end each
		$('#dataTable').DataTable();
		
		/* $("input[type=checkbox]").click(function(){
			alert("뭔데")
		}) */
	}//end cnoticeListResult
	
	
</script>
     <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>신고게시판</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">팬관리</li>
              <li class="breadcrumb-item">신고게시판</li>
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
                      <th>신고번호</th>
                      <th>신고제목</th>
                      <th>해당팬클럽</th>
                      <th>신고당한놈</th>
                      <th>신고분류</th>
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
              		<!-- <button type="button" class="btn-register">등록</button> -->
              		<!--  <button class="btn-update">수정</button>-->
              		<button type="button" class="btn-delete">삭제</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
    </form>
</div>