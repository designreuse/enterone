<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesSns/css/sns.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
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
	position: absolute;
	background-color: red;
	cursor: pointer;
}
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
							+ '"/> \
</div>';
					$("#thumbnails").append(div);
				};
			})(file, idx);
			reader.readAsDataURL(file);
		}
		$("#btnSubmit").on("click", function() {
			var formData = new FormData();
			$.each(uploadFiles, function(i, file) {
				if (file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
					formData.append('upload-file', file, file.name);
			});
			$.ajax({
				url : '/api/etc/file/upload',
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
	});
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
				<!-- SNS등록창 (선택) -->
				<article style="height: 80px">
					<div class="_1PcJ1">
						<div class="_1xqFV">
							<div class="_6FocL">
								<span class="_1xyZl"><span class="_1xyZl"></span></span>
							</div>
						</div>
						<ul class="uiuiint">
							<li><p>
									<a href="#ex7" rel="modal:open"><button type="button"
											class="_1gkvT" aria-label="텍스트" data-target="#modalText">
											<span class="_1jl5V"><svg viewBox="0 0 20.8 13"
													width="40" height="35" fill="var(--black)">
											<path
														d="M.1 13h2.8l.9-3h4.7l.8 3h2.9L7.7 0h-3L.1 13zm6-10.1l2 5.1H4.2l1.9-5.1zM20 10V6c0-1.1-.2-1.9-1-2.3-.7-.5-1.7-.7-2.7-.7-1.6 0-2.7.4-3.4 1.2-.4.5-.6 1.2-.7 2h2.4c.1-.4.2-.6.4-.8.2-.3.6-.4 1.2-.4.5 0 .9.1 1.2.2.3.1.4.4.4.8 0 .3-.2.5-.5.7-.2.1-.5.2-1 .2l-.9.1c-1 .1-1.7.3-2.2.6-.9.5-1.4 1.3-1.4 2.5 0 .9.3 1.6.8 2 .6.5 1.3.9 2.2.9.7 0 1.2-.3 1.7-.6.4-.2.8-.6 1.2-.9 0 .2 0 .4.1.6 0 .2.1.8.2 1h2.7v-.8c-.1-.1-.3-.2-.4-.3.1-.3-.3-1.7-.3-2zm-2.2-1.1c0 .8-.3 1.4-.7 1.7-.4.3-1 .5-1.5.5-.3 0-.6-.1-.9-.3-.2-.2-.4-.5-.4-.9 0-.5.2-.8.6-1 .2-.1.6-.2 1.1-.3l.6-.1c.3-.1.5-.1.7-.2.2-.1.3-.1.5-.2v.8z"></path></svg></span>텍스트
										</button></a>
								</p></li>
							<li><p>
									<a href="#ex2" rel="modal:open"><button class="_1gkvT"
											aria-label="사진">
											<span class="_1jl5V"><svg viewBox="0 0 17 15"
													width="40" height="35" fill="var(--red)">
												<path
														d="M14.6 1h-2.7l-.6-1h-6l-.6 1H2.4C1.1 1 0 2 0 3.3v9.3C0 13.9 1.1 15 2.4 15h12.2c1.3 0 2.4-1.1 2.4-2.4V3.3C17 2 15.9 1 14.6 1zM8.3 13.1c-2.9 0-5.2-2.3-5.2-5.1s2.3-5.1 5.2-5.1c2.9 0 5.2 2.3 5.2 5.1s-2.3 5.1-5.2 5.1zm5.9-8.3c-.6 0-1.1-.5-1.1-1.1 0-.6.5-1.1 1.1-1.1s1.1.5 1.1 1.1c0 .6-.5 1.1-1.1 1.1zm-10 3.1c0 1.2.5 2.2 1.3 3 0-.2 0-.4-.1-.6 0-2.2 1.8-4 4.1-4 1.1 0 2 .4 2.8 1.1-.3-2-2-3.4-4-3.4-2.2-.1-4.1 1.7-4.1 3.9z"></path></svg></span>사진
										</button></a>
								</p></li>
							<li><p>
									<a href="#ex3" rel="modal:open"><button class="_1gkvT"
											aria-label="동영상">
											<span class="_1jl5V"><svg viewBox="0 0 16 15"
													width="40" height="35" fill="var(--pink)">
												<path
														d="M15.7 7.8c-.2-.1-.5 0-.6.1l-2.9 2.2c-.1.1-.1.1-.2.1V8H0v3h2v3.2c0 .4.3.8.8.8h8.4c.5 0 .8-.4.8-.8V12c0 .1.1.2.2.2l2.9 2.2c.2.2.4.2.6.1.2-.1.3-.3.3-.5V8.4c0-.2-.1-.5-.3-.6zM2.8 6.9c.3 0 .8.1 1.1.1h5.5c.3 0 .8-.1 1-.1 1.6-.3 2.8-1.7 2.8-3.4 0-1.9-1.6-3.5-3.5-3.5-1.2 0-2.4.6-3 1.7h-.1C5.9.6 4.8 0 3.6 0 1.6 0 0 1.6 0 3.5c0 1.7 1.2 3 2.8 3.4zM9 4.2c1 0 1.8-.8 1.8-1.8v-.3c.4.3.6.8.6 1.4 0 1-.8 1.8-1.8 1.8-.9 0-1.6-.6-1.8-1.5.3.3.7.4 1.2.4zm-6.2.1c1 0 1.8-.8 1.8-1.8v-.3c.4.2.6.7.6 1.3 0 1-.8 1.8-1.8 1.8-.9 0-1.6-.6-1.8-1.5.3.3.7.5 1.2.5z"></path></svg></span>동영상
										</button></a>
								</p></li>
						</ul>
					</div>
				</article>

				<!-- SNS등록창 모달 (텍스트) -->
				<form method="post"
					action="${pageContext.request.contextPath}/sns/snsInsert">
					<div id="ex7" class="modal">
						<div class="mtmtitle">
							<table style="margin: 25px">
								<tr>
									<th hidden="true"><input type="text" id="mem_id"
										name="mem_id" placeholder="" value="${member.mem_id }"></th>
									<th><input type="text" id="sns_title" name="sns_title"
										placeholder="제목"></th>
								</tr>
								<tr>
									<td>
										<hr>
									<td>
								</tr>
								<tr>
									<td><textarea rows="10" cols="51" placeholder="내용을 적어주세요"
											name="sns_content"></textarea></td>
								</tr>
							</table>
							<hr>
							<a href="#" rel="modal:close">닫기</a>
							<button>포스팅</button>

						</div>
					</div>

					<!-- SNS등록창 모달 (사진) -->
					<div id="ex2" class="modal" style="height: 62%">
						<h1>사진 등록</h1>
						<div id="drop"
							style="border: 1px solid black; width: 100%; height: 67%; padding: 3px">
							사진을 올려주세요
							<div id="thumbnails"
								style="overflow: auto; width: 100%; height: 94%;"></div>
							<hr>
								<a href="#ex7" rel="modal:open">
									<button style="height: 29px;" type="button"
										id="nexttext" class="_1gkvT" data-target="#modalText">글쓰기</button>
								</a>
						</div>
					</div>




					<!-- SNS등록창 모달 (동영상) -->
					<div id="ex3" class="modal">
						<h1>동영상 등록</h1>
						<a> 글 제목</a> <input type="text" id="title"> <a>글 내용</a> <input
							type="text" id="content"> <input type="reset" value="삭제">
						<input type="submit" value="글 등록">
					</div>
				</form>




				<!-- 사진과 글이 올라가는곳 -->
				<div class="line top">
					<div>Fan SnS Community</div>
				</div>
				<div class="row">
					<article class="col-md-12 article-list">
						<c:forEach items="${snslist}" var="sns">
							<c:if test="${not empty sns.sns_pic}">
								<div class="inner" style="padding-bottom: 40px;">
									<figure>
										<a href="single.html"> <img src="${sns.sns_pic}"
											alt="사진이 출력되는 곳">
										</a>
									</figure>
									<div class="details">
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
														style="background-image: url('${mySns.sns_pic}');"></a></li>
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