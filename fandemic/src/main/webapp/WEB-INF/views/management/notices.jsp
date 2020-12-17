<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <div class="content-wrapper">
공지사항이라고
</div> -->
<div class="content-wrapper" style="min-height: 1367.44px;">
	<!-- 상단바 -->
	<section class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
	            <h1>공지사항</h1>
	          </div>
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">Home</a></li>
	              <li class="breadcrumb-item active">공지사항</li>
	            </ol>
	          </div>
	        </div>
	      </div><!-- /.container-fluid -->
    </section>
    
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
              	<div class="cnotices-button">
              		<button>목록</button>
              		<button>등록</button>
              	</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
</div>