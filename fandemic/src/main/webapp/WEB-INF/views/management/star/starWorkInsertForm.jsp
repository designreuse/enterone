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
	#art_content{
		height: 300px;
		width:100%;
	}
</style>
<script>

	$(function() {
		// Summernote 출력
		$('#summernote').summernote({
			height : 200
		});
		
		
		//취소버튼눌렀을경우 공지사항리스트로
		$("#btnCancel").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/star/starWork?st_id=${art.st_id}&st_name=${art.st_name}";
		});
		
		//등록버튼눌렀을경우 
		$("#btnStarWork-register").on("click",function(){
			/* alert("등록버튼눌림"); */
			starWorkFormCheck(); //유효성검사
		});
		
		
	});//end ready function
	
	function starWorkFormCheck(){
		if($("table .art_name").val()==null || $("table .art_name").val()==''){
			alert("작품이름을 입력하세요.")
			$("table .art_name").focus();
			event.preventDefault();
		}
		else if($("table .art_type").val()==null||$("table .art_type").val()==''){
			alert("작품분류를 입력하세요.")
			$("table .art_type").focus();
			event.preventDefault();
		}else if($("table .art_content").val()==null||$("table .art_content").val()==''){
			alert("작품소개를 입력하세요.")
			$("table .art_content").focus();
			event.preventDefault();
		}
		
	}
	
	/***********************************/
	/*********배너 미리보기 ****************/
	/***********************************/
	function setThumbnail(event) { //event라함은 이벤트 대상을 의미하는듯
		$("#image_container img").remove();
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = $("<img>").attr("src",event.target.result).css("width","250px").css("height","250px");
			$("#image_container").append(img);			
			/* var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img); */
		}; // end onload
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
 <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>스타작품등록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">스타관리</li>
              <li class="breadcrumb-item">스타작품등록</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-outline card-info">
				<div class="card-header">
				</div>
				<!-- /.card-header -->
				<div class="card-body">
					<form method="post" action="${pageContext.request.contextPath}/management/star/insertStarWork" encType="multipart/form-data">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>									
									<th colspan="4"	style="background-color: #eeeeee; text-align: center;">
										<input type="hidden" name="st_id" value="${art.st_id}"/>
										<input type="hidden" name="st_name" value="${art.st_name}"/>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" width="200px" align="right" style="padding-right:10px"><label>스타이름</label></td>
									<td colspan="2" align="left">								
					                    <input type="text" style="width:250px" class="st_name form-control" value="${art.st_name}" disabled="disabled">     
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>작품이름</label></td>
									<td colspan="2" align="left">
										<input type="text" style="width:400px" class="art_name form-control" name="art_name">
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>작품분류</label></td>
									<td colspan="2" align="left">
									<!-- <input type="text" name="art_type" class="art_type" style="width:250px"/> -->
										<select name = "art_type" class="art_type custom-select" style="width:250px">
						                  <option>앨범</option>
						                  <option>영화</option>
						                  <option>공연</option>
						                  <option>방송</option>
						               </select>
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>작품시작일</label></td>
									<td colspan="2" align="left">
									<input type="date" name="art_startTime" class="art_startTime form-control" style="width:250px" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="padding-right:10px"><label>작품종료일</label></td>
									<td colspan="2" align="left">
									<input type="date" name="art_endTime" class="art_endTime form-control" style="width:250px" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" rowspan="2" align="right" style="padding-right:10px"><label>작품사진</label></td>
									<td colspan="2" align="left">
                      					<input type="file" name="uploadImage" onchange="setThumbnail(event);">                     					
                     				</td>
								</tr>
								<tr>
									<td colspan="2" align="left">
                      					<div id="image_container"></div>                    					
                     				</td>
								</tr>
								<tr >
									<td colspan="2" align="right" style="padding-right:10px"><label>작품설명</label></td>
									<td colspan="2">
										<textarea id="art_content" name="art_content" class="art_content form-control"></textarea>
									</td>
								</tr>
								
								
								<tr >
									<td colspan="4" align="right" style="padding:5px;">
									<button type="submit" id="btnStarWork-register" class="btn btn-primary pull-right">등록</button>
									<input type="button" id="btnCancel" class="btn btn-primary pull-right" value="취소" /></td>
								</tr>
								
							</tbody>
						</table>
						
					</form>
					
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


