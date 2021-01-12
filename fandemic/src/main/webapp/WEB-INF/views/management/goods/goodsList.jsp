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
.detail-align{
	text-align: -webkit-center;
	max-width:none;
}
.detail-modal{
	width:60%;
}
.btnModal-cancel{
	border:0;
	background-color:white;
}
.md-header-btn{
	text-align-last: right;
	display:block; 
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
		
		goodsList();//굿즈 목록요청
		$(".pagination a").on("click",function(){
			$(".pagination a").removeClass("active");
			$(this).addClass("active");
		});
		
		
		/***************** 상품등록페이지 이동 ******************/ 
		$(".btn-register").on("click",function(){
			var com_id = "${company.com_id }";
			location.href="${pageContext.request.contextPath}/management/goods/goodsInsertForm?com_id="+com_id;
		});
		
		/******************** 굿즈,목록 상세 페이지(수정) *****************/
		var table = $('#dataTable');//datatable(공지사항목록)을 읽어옴
		table.on("click","tr a",function(){ //게시물 tr a태그걸린거 클릭했을때 ~
			/* alert($(this).parent().prev().text());//클릭한 tr에 대한 게시물번호 */
			var modal = $("#exampleModal");
			var go_no = $(this).parent().prev().text();
			var com_id = "${company.com_id }";
			//location.href="${pageContext.request.contextPath}/management/goods/goodsDetail?go_no="+go_no;	
	/* 		$.ajax({
				  url:"${pageContext.request.contextPath}/management/goods/goodsDetail?go_no=" + go_no+"&com_id="+com_id,//클릭한 버튼의 text값을 넘김.
				  dataType : "html", //dataType 기본은 html생략가능
				  cache:false,
			      success:function(result){			    	    
					  	modal.find(".modal-body").html(result)
					  	modal.modal("show");
					  	initDetail();
			      }
			  }); */
			  var url="${pageContext.request.contextPath}/management/goods/goodsDetail?go_no=" + go_no+"&com_id="+com_id;//클릭한 버튼의 text값을 넘김.
			  modal.find(".modal-body").load(url,function(){
				  modal.modal("show");
				  initDetail();
				  
			  })
		});//end 게시물 제목 클릭
		
		
		//체크박스 클릭 이벤트
		table.on("click","input[type=checkbox]",function(){		 	
			if(!$(this).attr("checked")){
				$(this).attr("checked",true);
			}else{
				$(this).attr("checked",false)
			}
		});
		
		
		//굿즈,행사 사항 삭제
		$(".btn-delete").on("click",function(){
			 $.ajax({
				url:"${pageContext.request.contextPath}/management/goods/goodsDelete",
				type:"POST",
				data: $("#frm1").serialize(), //form 값을 순서대로 읽어서 전송, 선택한체크박스의 값도넘김
				dataType: 'json', //결과값 Json형태로
				success: function(response) {
			    	if(response != null && response !="") {
			    		$('#dataTable').DataTable().clear().destroy();
			    		goodsList();
			    	}  
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			});//end ajax
		});
		
		/* $(".btnModal-cancel").on("click",function(){
			$("#exampleModal").modal("hide");
			//window.location.reload();
		}); */
	}); //end document ready
	
	//굿즈 목록 조회 요청
	function goodsList() {
		var com_id = "${company.com_id }";
		$.ajax({
			url:'${pageContext.request.contextPath}/management/goods/goodsListAll', //요청할 url
			type:'POST',
			data: {com_id:com_id},
			//contentType:'application/json;charset=utf-8',
			dataType:'json', //값이 넘어오는 형식
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:GoodsListResult
		});
	}//end GoodsList
	
	function GoodsListResult(data){
		/* console.log(data); */
		$("tbody").empty();
		$.each(data,function(idx,item){//idx=index, item=value
			$('<tr>').attr("class","cnoticeTr")
			.append($('<td>').html('<input type="checkbox" name="go_nos" value="'+item.go_no+'">'))
			.append($('<td>').html(item.go_no))
			.append($('<td>').html('<a href="#">'+item.go_name+'</a>'))
			.append($('<td>').html(item.go_price))
			.append($('<td>').html(item.st_name))
			.append($('<td>').html(item.go_stock))
			.append($('<td>').html(item.go_type))
			.append($('<td>').html(item.go_time))
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
            <h1>굿즈관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">굿즈관리</li>
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
                      <th>상품번호</th>
                      <th>상품명</th>
                      <th>상품가격</th>
                      <th>해당연예인</th>
                      <th>재고</th>
                      <th>상품분류</th>                  
                      <th>등록일</th>
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
              		<button type="button" class="btn-register">상품등록</button>
              		<!--  <button class="btn-update">수정</button>-->
              		<button type="button" class="btn-delete">상품삭제</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
    </form>
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog detail-align">
			<div class="modal-content detail-modal">
				<div class="modal-header md-header-btn">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- <button type="button" class="btnModal-cancel">x</button> -->
				</div>
				<div class="modal-body">
					....<!-- body -->
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div> -->
			</div>
		</div>
	</div>
	<!-- end Modal -->
</div>