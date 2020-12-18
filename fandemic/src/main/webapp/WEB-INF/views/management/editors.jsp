<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
  $(function () {
    // Summernote
    $('#summernote').summernote()

  })
</script>
 <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-outline card-info">
            <div class="card-header">
              <h3 class="card-title">
                Summernote
              </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
               <form method="post" action="writeAction.jsp">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"

								style="background-color: #eeeeee; text-align: center;">게시판

								글쓰기 양식</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"/></td>

						</tr>

						<tr>

							<td><textarea id="summernote" style="display: none;" placeholder="내용을 입력하세요.">
              					</textarea></td>

						</tr>

					</tbody>

				</table>	

				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

			</form>

              <textarea id="summernote" style="display: none;" placeholder="내용을 입력하세요.">
              </textarea>
              
            </div>
            <div class="card-footer">
              Visit <a href="https://github.com/summernote/summernote/">Summernote</a> documentation for more examples and information about the plugin.
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      
      <!-- ./row -->
    </section>
    

