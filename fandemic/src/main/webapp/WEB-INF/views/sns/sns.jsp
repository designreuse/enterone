<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesSns/css/sns.css">
<!-- 	슬라이드쇼 스타일 시트 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>


.mtmtitle{
min-height: 400px;}
.modal-content{
background-color: #fefefe;
    margin-top: 30%;
    padding: 20px;
    border: 1px solid #888;
    width: 100%;
} 
.drag-over {
	background-color: #ff0;
}

.thumb {
	width: 200px;
	padding: 5px;
	float: left;
}

.thumb>img {
	width: 100%;
}

.thumb>.close {
	position: unset;
	background-color: red;
	cursor: pointer;
}

.inputimg {
	margin: 10px;
	width: 80px;
	height: 80px;
	border-radius: 70%;
	object-fit: cover;
}
.outputimg {
    margin-top: -10px;
        width: 5%;
    height: 40px;
    border-radius: 100%;
    object-fit: cover;
}
.inputdiv {
	background: #FDFDFD;
	border-radius: 17px;
}

.clicktextfil {
	width: 70%;
	font-size: 19px;
	border: 0;
	border-radius: 18px;
	background-color: #A4B7D4;
	color: mintcream;
	margin: 12px;
	padding: 12px;
}
.clickcontentdetail {
    height: 40px;
    width: 94%;
    font-size: 20px;
    border: 0;
    border-radius: 11px;
    background-color: #A4B7D4;
    color: mintcream;
    padding: 5px;
}
.cinner {
border-radius: 10px;
    background-color: floralwhite;
    margin-bottom: 50px;
    height: 280px;
    border-radius: 15px;
}

/* #A4B7D4 */
</style>
<script>
	$(function() {
		var uploadFiles = [];
		var $drop = $("#drop");
		$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$(this).addClass('drag-over');
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {
			e.stopPropagation();
			e.preventDefault();
		}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
			e.preventDefault();
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var size = uploadFiles.push(file); //업로드 목록에 추가
				preview(file, size - 1); //미리보기 만들기
			}
		});
		function preview(file, idx) {
			var reader = new FileReader();
			reader.onload = (function(f, idx) {
				return function(e) {
					var div = '<div class="thumb"> \
<div class="close" data-idx="' + idx + '">X</div> \
<img src="'
							+ e.target.result
							+ '" title="'
							+ escape(f.name)
							+ '"/></div>';
					$("#thumbnails").append(div);
				};
			})(file, idx);
			reader.readAsDataURL(file);
		}
		$("#btnSubmit").on("click", function() {
			var formData = new FormData(document.getElementById('uploadForm'));
			$.each(uploadFiles, function(i, file) {
				if (file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
					formData.append('upload-file', file, file.name);
			});
			$.ajax({
				url : 'sns/snsInsert',
				data : formData,
				type : 'post',
				contentType : false,
				processData : false,
				success : function(ret) {
					alert("완료");
				}
			});
		});
		$("#thumbnails").on("click", ".close", function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			uploadFiles[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
			$target.parent().remove(); //프리뷰 삭제
		});
		$('a[href="#ex7"]').click(function(event) {
			event.preventDefault();

			$("#fade").modal({
				fadeDuration : 250
			});
		});
		$("nexttext").click(function() {
			$(ex2).css(display, none)
		});

		// sns등록 모달창 띄우기
		
		$('.clicktextfil').on('click',function(event) {
									var modal = $('#exampleModal5')
									modal.modal('show');
		})
		// SNS상세정보 모달창 띄우기
		$('.outputdiv').on('click',function(event) {
			var modal = $('#exampleModal9')
			var no = $(this).data("no");
			$.ajax({
				url : '${pageContext.request.contextPath}/onesnsselect?sns_no=' + no, //파라미터 넘기는 법
				dataType : 'json',
				success : function(result) {
					modal.find('.snstitledetail').text(result.sns_title)
					modal.find('.content').text(result.sns_content)
					modal.modal('show');
				}

			});
		})
	})
</script>


</head>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="headline">
					<div class="nav" id="headline-nav">
						<a class="left carousel-control" role="button" data-slide="prev">
							<span class="ion-ios-arrow-left" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" role="button" data-slide="next">
							<span class="ion-ios-arrow-right" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<!-- 헤더 밑 슬라이드 info -->
					<div class="owl-carousel owl-theme" id="headline">
						<div class="item">
							<a href="#"><div class="badge">Tip!</div>해쉬태그 이용방법</a>
						</div>
						<div class="item">
							<a href="#">고운말을 사용하여 소통합시다!</a>
						</div>
					</div>
				</div>
				<div class="inputdiv">
					<span> <c:if
							test="${sessionScope.member.mem_pic ne null and sessionScope.member.mem_type eq 0 }">
							<img class="inputimg" src="${sessionScope.member.mem_pic}"
								alt="member_profile">
						</c:if> <c:if
							test="${sessionScope.member.mem_pic eq null and sessionScope.company.com_pic eq null }">
							<img class="inputimg"
								src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
								alt="no-profile">
						</c:if> <c:if
							test="${sessionScope.member.mem_pic ne null and sessionScope.company.com_pic eq null and sessionScope.member.mem_type eq 1}">
							<img class="inputimg"
								src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.member.mem_pic}"
								alt="member_profile">
						</c:if> <c:if
							test="${sessionScope.company.com_pic ne null and sessionScope.member.mem_pic eq null }">
							<img class="inputimg"
								src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.company.com_pic}"
								alt="company_profile">
						</c:if> <input class="clicktextfil" value="오늘은 어떤 글을 올려볼까요?" readonly="readonly">
					</span>
				</div>
				
				
				<div class="btn-group">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Action <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>

<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
<div class="modal" id="exampleModal9" style="z-index: 1200;" >
		<div class="modal-dialog">
			<div class="modal-content" style="margin-bottom: 0px;">
				<div class="modal-header">
					<h3 class="modal-title snstitledetail" id="exampleModalLabel"></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div id="ex7">
						<div class="mtmtitle">
							<div id="ex2" style="height: 62%">
							</div>
							<a class="content"></a>
							<a></a>
							<a></a>
							<a></a>
							<a></a>
							<a></a>
						</div>
					</div>
				<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="btnSubmit">Post</button>
				</div>
			</div>
		</div>
	</div>


				
				<!-- SNS등록 모달창 -->
	<div class="modal" id="exampleModal5" style="z-index: 1200;" >
		<div class="modal-dialog">
			<div class="modal-content" style="    margin-bottom: 0px;">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">SNS 등록</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="uploadForm" id="uploadForm"
					enctype="multipart/form-data" method="post">
					<div id="ex7">
						<div class="mtmtitle">
							<div id="ex2" style="height: 62%">
							</div>
							<table class="inserttable" border="1">
								<tr style="height: 20%">
									<td><input class="snstitle" type="text" id="sns_title"
										name="sns_title" placeholder="제목"> <input
										style="display: none;" type="text" id="mem_id" name="mem_id"
										placeholder="" value="${member.mem_id }"></td>
								<tr style="height: 30%">
									<td>
										<div class="pickupld" id="drop">
											사진을 올려주세요
											<div id="thumbnails"
												style="overflow: auto; max-height: 233px; height: 88%;"></div>
											<a href="#ex7" rel="modal:open"> </a>
										</div>
									</td>
								<tr style="height: 30%">
									<td>

										<div class="form-group">
											<textarea class="form-control"
												id="exampleFormControlTextarea1" name="sns_content" rows="3"
												placeholder="내용을 적어주세요" style="border: 0"></textarea>
										</div>
									</td>
								<tr>
							</table>
						</div>
					</div>
				<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="btnSubmit">Post</button>
				</div>
				</form>
			</div>
		</div>
	</div>
				<!-- 사진과 글이 올라가는곳 -->
				<div class="line top">
					<div>Fan SnS Community</div>
				</div>
				<div class="row">
					<article class="col-md-12 article-list">

						<c:forEach items="${snslist}" var="sns">
							<c:if test="${not empty sns.sns_pic}">
							<div class="outputdiv" data-no="${sns.sns_no}">
						
						<div class="inner cinner">
						<span> <c:if
							test="${sessionScope.member.mem_pic ne null and sessionScope.member.mem_type eq 0 }">
							<img class="outputimg" src="${sessionScope.member.mem_pic}"
								alt="member_profile">
						</c:if> <c:if
							test="${sessionScope.member.mem_pic eq null and sessionScope.company.com_pic eq null }">
							<img class="outputimg"
								src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
								alt="no-profile">
						</c:if> <c:if
							test="${sessionScope.member.mem_pic ne null and sessionScope.company.com_pic eq null and sessionScope.member.mem_type eq 1}">
							<img class="outputimg"
								src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.member.mem_pic}"
								alt="member_profile">
						</c:if> <c:if
							test="${sessionScope.company.com_pic ne null and sessionScope.member.mem_pic eq null }">
							<img class="outputimg"
								src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.company.com_pic}"
								alt="company_profile">
						</c:if> <input class="clickcontentdetail" value=${sns.sns_title} readonly="readonly">
						</span>
							<figure>
								<div class="w3-content w3-section" style="max-width: 500px">
									<c:forTokens var="cutimg" items="${sns.sns_pic}" delims=",">
										<a href="single.html"> <img class="mySlides"
											src="${pageContext.request.contextPath}/images/snsimage/${cutimg}"
											alt="사진이 출력되는 곳" style="width: 100%; display: none;">
										</a>
									</c:forTokens>
								</div>
							</figure>
							
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">Post Date</a>
									</div>
									<div class="time">${sns.sns_time}</div>
								</div>
								<p style="    height: 130px; overflow: hidden">${sns.sns_content}</p>
								<footer>
									<a href="#" class="love">
										<i class="ion-android-favorite-outline"></i>
										<div>${sns.sns_likes}</div>
									</a>
								</footer>
							</div>
						</div>
						</div>
								
							</c:if>
							<c:if test="${empty sns.sns_pic}">
								<div class="inner" style="padding-bottom: 40px;">
									<div class="details" style="padding: 9px; margin: 0px;">
										<div class="detail">
											<div class="category">
												<a href="#">Post Date</a>
											</div>
											<div class="time">${sns.sns_time}</div>
										</div>
										<p>${sns.sns_content}</p>
										<footer>
											<a href="#" class="love"><i
												class="ion-android-favorite-outline"></i>
												<div>${sns.sns_likes}</div></a> <a class="btn btn-primary more"
												href="single.html">
												<div>더보기</div>
												<div>
													<i class="ion-ios-arrow-thin-right"></i>
												</div>
											</a>
										</footer>
									</div>
								</div>
							</c:if>


						</c:forEach>
						<script type="text/javascript">
							var slideIndex = [];
							var c = document.getElementsByClassName("cinner");
							for (y = 0; y < c.length; y++) {
								slideIndex[y] = 1;
							}
							carousel()
							function carousel() {
								var c = document
										.getElementsByClassName("cinner");
								var i;

								for (y = 0; y < c.length; y++) {
									var x = c[y]
											.getElementsByClassName("mySlides");
									for (i = 0; i < x.length; i++) {
										x[i].style.display = "none";
									}
									x[slideIndex[y] - 1].style.display = "block";
									slideIndex[y]++;
									if (slideIndex[y] > x.length) {
										slideIndex[y] = 1
									}
								}

								setTimeout(carousel, 2000); // Change image every 2 seconds
							}
						</script>
					</article>

				</div>
			</div>

			<!-- <!-- ㅇㄴㄹ ㅁㅇㄹ.ㅏㅜㄴㅁㄹ어ㅜㅠㅁ어나ㅠㅁㄹㅇ나ㅠㅗㄹㄴㅁ아ㅓㅗㅇㄴ머ㅜㅗㄴ아ㅓㅗㅇ누ㄹㄴㅁㄹ.ㅏㅓㄴㅁ우춘마ㅓㅠㅜ차ㅓㄴ뮤와뉴마ㅣㅓㅗㄴㅁ아ㅓㅣ롸ㅓㄴㅇㅁ롸ㅓㄴㅁㅇㄴ룀논말어ㅓㅗㄹ무ㅠㅇ니ㅏㅍㄴ머ㅠ오미나ㅣㄴㅁ아ㅗ룸ㄴㅊㅎ춞ㄷ슐챠ㅛㅂㅅㄱ츄ㅛㅑㅐㅈㅂㅅ갸슈마ㅣㅗㄴㅇㅁ라ㅓㅘㅓㅇㄴ뫈ㅇ몰ㅇ나미ㅗ라ㅓㄴ모알ㅇㄴ뫄ㅓㅇㄴ몸러 -->

			<!-- 사이드바 구역 -->
			<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
				<div class="sidebar-title for-tablet">Sidebar</div>
				<aside>
					<div class="aside-body">
						<div class="featured-author">
							<div class="featured-a;;/uthor-inner">
								<div class="featured-author-cover"
									style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxjchU3nSVmv0TUW_Df4YzVhWyWtk3nHy3g&usqp=CAU');">
									<div class="badges">
										<div class="badge-item">
											<i class="ion-star"></i> Featured
										</div>
									</div>
									<div class="featured-author-center">
										<figure class="featured-author-picture">
											<p>
												<img src="${member.mem_pic}" alt="Sample Article">
											</p>
										</figure>
										<div class="featured-author-info">
											<h2 class="name">${member.mem_id}</h2>
											<div class="desc">${member.mem_email}</div>
										</div>
									</div>
								</div>
								<div class="featured-author-body">
									<div class="featured-author-count">
										<div class="item">
											<a href="#">
												<div class="name">Posts</div>
												<div class="value">${countmysns}</div>
											</a>
										</div>
										<div class="item">
											<a href="#">
												<div class="name">Likes</div>
												<div class="value">좋아요 받은 개수</div>
											</a>
										</div>
										<div class="item">
											<a href="#">
												<div class="icon">
													<div>More</div>
													<i class="ion-chevron-right"></i>
												</div>
											</a>
										</div>
									</div>
									<div class="featured-author-quote">"Eur costrict mobsa
										undivani krusvuw blos andugus pu aklosah"</div>
									<div class="block">
										<h2 class="block-title">Photos</h2>
										<div class="block-body">
											<ul class="item-list-round" data-magnific="gallery">
												<c:forEach items="${mysnslist }" var="mySns">
													<li><a href="${mySns.sns_pic}"
														style="background-image: url('/images/snsimage/${mySns.sns_pic}');"></a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="featured-author-footer">
										<a href="#">See All Authors</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
				<aside>
					<h1 class="aside-title">
						Popular <a href="#" class="all">See All <i
							class="ion-ios-arrow-right"></i></a>
					</h1>
					<div class="aside-body">
						<article class="article-mini">
							<div class="inner">
								<figure>
									<a href="single.html"> <img src="images/news/img07.jpg"
										alt="Sample Article">
									</a>
								</figure>
								<div class="padding">
									<h1>
										<a href="single.html">좋아요 많이 받은 내글 </a>
									</h1>
								</div>
							</div>
						</article>
					</div>
				</aside>
				<aside>
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li class="active"><a href="#recomended"
							aria-controls="recomended" role="tab" data-toggle="tab"> <i
								class="ion-android-star-outline"></i> Random Post
						</a></li>
						<li><a href="#comments" aria-controls="comments" role="tab"
							data-toggle="tab"> <i class="ion-ios-chatboxes-outline"></i>
								Comments
						</a></li>
					</ul>

					<!-- Random Post --------------------------------------------------------------------------------- -->
					<div class="tab-content">
						<div class="tab-pane active" id="recomended">
							<article class="article-fw">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img16.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="details">
										<div class="detail">
											<div class="time">December 31, 2016</div>
											<div class="category">
												<a href="category.html">Sport</a>
											</div>
										</div>
										<h1>
											<a href="single.html">큰 랜덤 포스트</a>
										</h1>
										<p>랜덤 포스트 글</p>
									</div>
								</div>
							</article>
							<div class="line"></div>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img10.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">램덤 글 출력됨
												<div class="detail">
													<div class="category">
														<a href="category.html">PostDate</a>
													</div>
													<div class="time">December 20, 2016</div>
												</div>
									</div>
								</div>
							</article>
						</div>

						<!-- 댓글 확인------------------------------------------------------------------------------------------------- -->
						<div class="tab-pane comments" id="comments">
							<div class="comment-list sm">
								<div class="item">
									<div class="user">
										<figure>
											<img src="${member.mem_pic }" alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">${member.mem_id }</h5>
											<div class="description">${member.mem_email }</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>
</section>




</body>
</html>