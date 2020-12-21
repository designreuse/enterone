<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.table td{
		vertical-align: middle;
		padding : 0px;
		border : 1px solid #dddddd;
	}
	.table tr{
		background-color:rgba(0,0,0,.05);
	}
</style>
<script>
	$(function() {
		// Summernote
		$('#summernote').summernote();

	})
</script>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title">공지사항/이벤트</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="writeAction.jsp">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;"></th>
								</tr>
							</thead>
							<tbody>
								<tr width="100%">
									<td width="10%" align="left"><label>분류</label></td>
									<td width="40%" align="left">								
				                        <select class="custom-select"  style="width: auto;">
				                          <option>공지사항</option>
				                          <option>이벤트</option>				                          
				                        </select>                     
									</td>
									<td style="display: ;"><label>인원</label></td>
									<td style="display: ;"><input type="text" class="form-control"/></td>
								</tr>
								<tr width="100%">
									<td colspan="1" align="left"><label>제목</label></td>
									<td colspan="3"><input type="text" class="form-control"
										placeholder="글 제목" name="bbsTitle" maxlength="50" />
									</td>
								</tr>
								<tr >
									<td colspan="1" align="left"><label>내용</label></td>
									<td colspan="3">
										<textarea id="summernote" placeholder="내용을 입력하세요."></textarea>
									</td>
								</tr>
								
								<tr>
									<td colspan="1" align="left"><label>첨부파일</label></td>
									<td colspan="3">
                      					<input type="file"  multiple>                     					
                     				</td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn btn-primary pull-right"
							value="글쓰기" />
					</form>
					<textarea id="summernote" style="display: none;"
						placeholder="내용을 입력하세요.">
              </textarea>
				</div>
				<div class="card-footer">
					Visit <a href="https://github.com/summernote/summernote/">Summernote</a>
					documentation for more examples and information about the plugin.
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>

	<!-- ./row -->
</section>


