<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
				<!-- SNS등록창 -->
				<article style="height: 180px">
					<div class="inner" style="height: 100%">
						<div class="details" style="height: 100%">
							<div class="detail">
								<div class="category"></div>
							</div>
							<div style="width: 100%; height: 100%">
								<div style="float: left; width: 30%; height: 90%"><button>사진</button></div>
								<textarea style="width: 70%; height: 90%;resize: none;"></textarea>
							</div>
							<footer>
								<a class="btn btn-primary more" href="single.html">
									<div>POST</div>
									<div>
										<i class="ion-ios-arrow-thin-right"></i>
									</div>
								</a>
							</footer>
						</div>
					</div>
				</article>
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