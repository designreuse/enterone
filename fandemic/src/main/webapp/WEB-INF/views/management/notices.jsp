<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.center {
  text-align: center;
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
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: black;
  color: white;
  border: 1px solid black;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<script>
	$(function() {
		$(".pagination a").on("click",function(){
			$(".pagination a").removeClass("active");
			$(this).addClass("active");
		});
	});
</script>
    
    <!--  공지 게시판 -->
    <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><!-- 공지/이벤트 --></h3>
              </div>
              <!-- ./card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th></th>
                      <th>번호</th>
                      <th>제목</th>
                      <th>글쓴이</th>
                      <th>등록일</th>
                      <th>분류(이벤트/공지)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td><input type="checkbox"></td>
                      <td>1</td>
                      <td>니얼굴쩔어 !!!!!!!!!!!!!!!</td>
                      <td>YG관리자</td>
                      <td>2020-12-17</td>
                      <td>공지사항</td>
                    </tr>                   
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div>
              	<div class="center">
				  <div class="pagination">
					  <a href="#">&laquo;</a>
					  <a href="#" class="active">1</a>
					  <a href="#">2</a>
					  <a href="#">3</a>
					  <a href="#">4</a>
					  <a href="#">5</a>
					  <a href="#">&raquo;</a>
				  </div>
				</div>
              	<div class="cnotices-button">
              		<button class="btn-register">등록</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
</div>