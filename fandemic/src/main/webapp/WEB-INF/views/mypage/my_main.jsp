<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>owl.carousel</title>
<link rel="stylesheet" href="/css/owl.carousel.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>

</head>

<body>

	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-8" style="margin-left: 30%">
					<div class="line">
						<div>내 스타 목록</div>
					</div>
					<div class="owl-carousel">
						<div>
							<input type="image" style="width: 100px; height: 150px"
								src="https://images.chosun.com/resizer/e_XfBvoOfR92cYym-TkRB4tsKqE=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/RSITTQF5C7LGXQXY5MZ56EGNHE.jpg">
							<br> <a>이연희</a>
						</div>
						<div>
							<input type="image" style="width: 100px; height: 150px"
								src="https://www.bokjitimes.com/news/photo/202002/22767_15736_3416.jpg"><br>
							<a>공유</a>
						</div>
							<div>
							<input type="image" style="width: 100px; height: 150px"
								src="https://mblogthumb-phinf.pstatic.net/MjAxOTExMTRfMTcg/MDAxNTczNzEzNDIwMzkx.NtThUWxkOC4HvPQeHiEnhifFhrP2UOFgvEf3iOg21M8g.PaBwdhsT-CI9mddL5zTFTGEWfNm2Dsql5WNl6MjbiP8g.JPEG.silverwingkj/BIMO_%EB%B9%84%EB%AA%A8.jpg?type=w800">
							<br> <a>비모</a>
						</div>
						<div>
							<input type="image" style="width: 100px; height: 150px"
								src="https://yt3.ggpht.com/ytc/AAUvwngdItBeJzifilSfidCPWExEVX7p4cSmr9hceh9_RA=s900-c-k-c0x00ffffff-no-rj"><br>
							<a>우주하마</a>
						</div>
								
							<div>
							<input type="image" style="width: 100px; height: 150px"
								src="https://i.pinimg.com/originals/a1/59/80/a159805c1f7af920c60758d0eb6420e1.png">
							<br> <a>장승조</a>
						</div>
						<div>
							<input type="image" style="width: 100px; height: 150px"
								src="https://www.backhug.co.kr/shopimages/showroom1/0120070003322.jpg?1526467660"><br>
							<a>엘모</a>
						</div>
					</div>
					<script>
						$(document).ready(function() {
							$('.owl-carousel').owlCarousel();
						});
					</script>
					<div class="line">
						<div>최근 구매 내역</div>
					</div>
					<div class="row">
						<h1>최근 구매내역 들어가는곳</h1>
					</div>
					<div class="line">
						<div>이벤트 참여 내역</div>
					</div>
					<div class="row">
						<h1>이벤트</h1>
					</div>
					<div class="line">
						<div>쪽지</div>
					</div>
					<div class="row">
						<h1>쪽지 나오는곳</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
