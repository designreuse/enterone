<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<!-- 텍스트 모달 띄우기 -->

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
				<div id="ex7" class="modal">
					<form method="post" action="${pageContext.request.contextPath}/sns/snsInsert" enctype="multipart/form-data">
					<div class="mtmtitle">
						<table style="margin: 25px">
							<tr>
							<th><input type="text" id="mem_id" name="mem_id"
									placeholder="" value="${member.mem_id }"></th>
								<th><input type="text" id="sns_title" name="sns_title"
									placeholder="제목"></th>
							</tr>
							<tr>
								<td>
									<hr>
								<td>
							</tr>
							<tr>
								<td><textarea rows="10" cols="51" placeholder="내용을 적어주세요" name="sns_content"></textarea>
								</td>
							</tr>
						</table>
						<hr>
						<a href="#" rel="modal:close">닫기</a> <button>포스팅</button>>
					</div>
					</form>
				</div>
				<script>
					$('a[href="#ex7"]').click(function(event) {
						event.preventDefault();

						$("#fade").modal({
							fadeDuration : 250
						});
					});
				</script>




				<!-- SNS등록창 모달 (사진) -->
				<div id="ex2" class="modal">
					<form action="">
						<h1>사진 등록</h1>
						<a> 글 제목</a> <input type="text" id="title"> <a>글 내용</a> <input
							type="text" id="content"> <input type="reset" value="삭제">
						<input type="submit" value="글 등록">
					</form>
				</div>




				<!-- SNS등록창 모달 (동영상) -->
				<div id="ex3" class="modal">
					<form action="">
						<h1>동영상 등록</h1>
						<a> 글 제목</a> <input type="text" id="title"> <a>글 내용</a> <input
							type="text" id="content"> <input type="reset" value="삭제">
						<input type="submit" value="글 등록">
					</form>
				</div>




				<!-- 사진과 글이 올라가는곳 -->
				<div class="line top">
					<div>Fan SnS Community</div>
				</div>
				<div class="row">
					<article class="col-md-12 article-list">
						<div class="inner">
							<figure>
								<a href="single.html"> <img src="images/news/img09.jpg"
									alt="사진이 출력되는 곳">
								</a>
							</figure>
							<div class="details">
								<div class="detail">
									<div class="category">
										<a href="#">Post Date</a>
									</div>
									<div class="time">SNS 글 날짜 출력되는곳</div>
								</div>
								<p>sns글이 출력되는 필드</p>
								<footer>
									<a href="#" class="love"><i
										class="ion-android-favorite-outline"></i>
										<div>783</div></a> <a class="btn btn-primary more"
										href="single.html">
										<div>더보기</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</footer>
							</div>
						</div>
					</article>
				</div>
			</div>



			<!-- 사이드바 구역 -->
			<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
				<div class="sidebar-title for-tablet">Sidebar</div>
				<aside>
					<div class="aside-body">
						<div class="featured-author">
							<div class="featured-a;;/uthor-inner">
								<div class="featured-author-cover"
									style="background-image: url('images/news/img15.jpg');">
									<div class="badges">
										<div class="badge-item">
											<i class="ion-star"></i> Featured
										</div>
									</div>
									<div class="featured-author-center">
										<figure class="featured-author-picture">
											<img src="images/img01.jpg" alt="Sample Article">
										</figure>
										<div class="featured-author-info">
											<h2 class="name">John Doe</h2>
											<div class="desc">@JohnDoe</div>
										</div>
									</div>
								</div>
								<div class="featured-author-body">
									<div class="featured-author-count">
										<div class="item">
											<a href="#">
												<div class="name">Posts</div>
												<div class="value">208</div>
											</a>
										</div>
										<div class="item">
											<a href="#">
												<div class="name">Stars</div>
												<div class="value">3,729</div>
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
												<li><a href="images/news/img06.jpg"
													style="background-image: url('images/news/img06.jpg');"></a></li>
												<li><a href="images/news/img07.jpg"
													style="background-image: url('images/news/img07.jpg');"></a></li>
												<li><a href="images/news/img08.jpg"
													style="background-image: url('images/news/img08.jpg');"></a></li>
												<li><a href="images/news/img09.jpg"
													style="background-image: url('images/news/img09.jpg');"></a></li>
												<li><a href="images/news/img10.jpg"
													style="background-image: url('images/news/img10.jpg');"></a></li>
												<li><a href="images/news/img11.jpg"
													style="background-image: url('images/news/img11.jpg');"></a></li>
												<li><a href="images/news/img12.jpg"
													style="background-image: url('images/news/img12.jpg');"><div
															class="more">+2</div></a></li>
												<li class="hidden"><a href="images/news/img13.jpg"
													style="background-image: url('images/news/img13.jpg');"></a></li>
												<li class="hidden"><a href="images/news/img14.jpg"
													style="background-image: url('images/news/img14.jpg');"></a></li>
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
										<a href="single.html">Fusce ullamcorper elit at felis
											cursus suscipit</a>
									</h1>
								</div>
							</div>
						</article>
						<article class="article-mini">
							<div class="inner">
								<figure>
									<a href="single.html"> <img src="images/news/img14.jpg"
										alt="Sample Article">
									</a>
								</figure>
								<div class="padding">
									<h1>
										<a href="single.html">Duis aute irure dolor in
											reprehenderit in voluptate velit</a>
									</h1>
								</div>
							</div>
						</article>
						<article class="article-mini">
							<div class="inner">
								<figure>
									<a href="single.html"> <img src="images/news/img09.jpg"
										alt="Sample Article">
									</a>
								</figure>
								<div class="padding">
									<h1>
										<a href="single.html">Aliquam et metus convallis tincidunt
											velit ut rhoncus dolor</a>
									</h1>
								</div>
							</div>
						</article>
						<article class="article-mini">
							<div class="inner">
								<figure>
									<a href="single.html"> <img src="images/news/img11.jpg"
										alt="Sample Article">
									</a>
								</figure>
								<div class="padding">
									<h1>
										<a href="single.html">dui augue facilisis lacus fringilla
											pulvinar massa felis quis velit</a>
									</h1>
								</div>
							</div>
						</article>
						<article class="article-mini">
							<div class="inner">
								<figure>
									<a href="single.html"> <img src="images/news/img06.jpg"
										alt="Sample Article">
									</a>
								</figure>
								<div class="padding">
									<h1>
										<a href="single.html">neque est semper nulla, ac elementum
											risus quam a enim</a>
									</h1>
								</div>
							</div>
						</article>
						<article class="article-mini">
							<div class="inner">
								<figure>
									<a href="single.html"> <img src="images/news/img03.jpg"
										alt="Sample Article">
									</a>
								</figure>
								<div class="padding">
									<h1>
										<a href="single.html">Morbi vitae nisl ac mi luctus
											aliquet a vitae libero</a>
									</h1>
								</div>
							</div>
						</article>
					</div>
				</aside>
				<aside>
					<div class="aside-body">
						<form class="newsletter">
							<div class="icon">
								<i class="ion-ios-email-outline"></i>
								<h1>Newsletter</h1>
							</div>
							<div class="input-group">
								<input type="email" class="form-control email"
									placeholder="Your mail">
								<div class="input-group-btn">
									<button class="btn btn-primary">
										<i class="ion-paper-airplane"></i>
									</button>
								</div>
							</div>
							<p>By subscribing you will receive new articles in your
								email.</p>
						</form>
					</div>
				</aside>
				<aside>
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li class="active"><a href="#recomended"
							aria-controls="recomended" role="tab" data-toggle="tab"> <i
								class="ion-android-star-outline"></i> Recomended
						</a></li>
						<li><a href="#comments" aria-controls="comments" role="tab"
							data-toggle="tab"> <i class="ion-ios-chatboxes-outline"></i>
								Comments
						</a></li>
					</ul>
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
											<a href="single.html">Donec congue turpis vitae mauris</a>
										</h1>
										<p>Donec congue turpis vitae mauris condimentum luctus. Ut
											dictum neque at egestas convallis.</p>
									</div>
								</div>
							</article>
							<div class="line"></div>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img05.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Lifestyle</a>
											</div>
											<div class="time">December 22, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img02.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Fusce ullamcorper elit at felis
												cursus suscipit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Travel</a>
											</div>
											<div class="time">December 21, 2016</div>
										</div>
									</div>
								</div>
							</article>
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img10.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">Duis aute irure dolor in
												reprehenderit in voluptate velit</a>
										</h1>
										<div class="detail">
											<div class="category">
												<a href="category.html">Healthy</a>
											</div>
											<div class="time">December 20, 2016</div>
										</div>
									</div>
								</div>
							</article>
						</div>
						<div class="tab-pane comments" id="comments">
							<div class="comment-list sm">
								<div class="item">
									<div class="user">
										<figure>
											<img src="images/img01.jpg" alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="user">
										<figure>
											<img src="images/img01.jpg" alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="user">
										<figure>
											<img src="images/img01.jpg" alt="User Picture">
										</figure>
										<div class="details">
											<h5 class="name">Mark Otto</h5>
											<div class="time">24 Hours</div>
											<div class="description">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</aside>
				<aside>
					<h1 class="aside-title">
						Videos
						<div class="carousel-nav" id="video-list-nav">
							<div class="prev">
								<i class="ion-ios-arrow-left"></i>
							</div>
							<div class="next">
								<i class="ion-ios-arrow-right"></i>
							</div>
						</div>
					</h1>
					<div class="aside-body">
						<ul class="video-list"
							data-youtube='"carousel":true, "nav": "#video-list-nav"'>
							<li><a data-youtube-id="SBjQ9tuuTJQ" data-action="magnific"></a></li>
							<li><a data-youtube-id="9cVJr3eQfXc" data-action="magnific"></a></li>
							<li><a data-youtube-id="DnGdoEa1tPg" data-action="magnific"></a></li>
						</ul>
					</div>
				</aside>
				<aside id="sponsored">
					<h1 class="aside-title">Sponsored</h1>
					<div class="aside-body">
						<ul class="sponsored">
							<li><a href="#"> <img src="images/sponsored.png"
									alt="Sponsored">
							</a></li>
							<li><a href="#"> <img src="images/sponsored.png"
									alt="Sponsored">
							</a></li>
							<li><a href="#"> <img src="images/sponsored.png"
									alt="Sponsored">
							</a></li>
							<li><a href="#"> <img src="images/sponsored.png"
									alt="Sponsored">
							</a></li>
						</ul>
					</div>
				</aside>
			</div>
		</div>
	</div>
</section>

<section class="best-of-the-week">
	<div class="container">
		<h1>
			<div class="text">Best Of The Week</div>
			<div class="carousel-nav" id="best-of-the-week-nav">
				<div class="prev">
					<i class="ion-ios-arrow-left"></i>
				</div>
				<div class="next">
					<i class="ion-ios-arrow-right"></i>
				</div>
			</div>
		</h1>
		<div class="owl-carousel owl-theme carousel-1">
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img src="images/news/img03.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 11, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">tempor interdum Praesent tincidunt</a>
						</h2>
						<p>Praesent tincidunt, leo vitae congue molestie.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img src="images/news/img16.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 09, 2016</div>
							<div class="category">
								<a href="category.html">Sport</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Maecenas porttitor sit amet turpis a
								semper</a>
						</h2>
						<p>Proin vulputate, urna id porttitor luctus, dui augue
							facilisis lacus.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img src="images/news/img15.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Lifestyle</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Fusce ac odio eu ex volutpat
								pellentesque</a>
						</h2>
						<p>Vestibulum ante ipsum primis in faucibus orci luctus</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img src="images/news/img14.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Nulla facilisis odio quis gravida
								vestibulum</a>
						</h2>
						<p>Proin venenatis pellentesque arcu, ut mattis nulla placerat
							et.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img src="images/news/img01.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Fusce Ullamcorper Elit At Felis Cursus
								Suscipit</a>
						</h2>
						<p>Proin venenatis pellentesque arcu, ut mattis nulla placerat
							et.</p>
					</div>
				</div>
			</article>
			<article class="article">
				<div class="inner">
					<figure>
						<a href="single.html"> <img src="images/news/img11.jpg"
							alt="Sample Article">
						</a>
					</figure>
					<div class="padding">
						<div class="detail">
							<div class="time">December 26, 2016</div>
							<div class="category">
								<a href="category.html">Travel</a>
							</div>
						</div>
						<h2>
							<a href="single.html">Donec consequat arcu at ultrices
								sodales</a>
						</h2>
						<p>Proin venenatis pellentesque arcu, ut mattis nulla placerat
							et.</p>
					</div>
				</div>
			</article>
		</div>
	</div>
</section>


</body>
</html>