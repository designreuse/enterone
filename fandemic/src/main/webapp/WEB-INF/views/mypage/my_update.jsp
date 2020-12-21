<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-8" style="margin-left: 30%">
					<div class="line">
						<div>내 스타 목록</div>
					</div>
					<div class="w3-content w3-display-container">
						<img class="mySlides" src="img_nature.jpg"> <img
							class="mySlides" src="img_snowtops.jpg"> <img
							class="mySlides" src="img_mountains.jpg">
						<h1>여기에 스타 목록</h1>
						<div class="w3-center w3-display-bottommiddle" style="width: 100%">
							<div class="w3-left" onclick="plusDivs(-1)">&#10094;</div>
							<div class="w3-right" onclick="plusDivs(1)">&#10095;</div>
							<span class="w3-badge demo w3-border" onclick="currentDiv(1)"></span>
							<span class="w3-badge demo w3-border" onclick="currentDiv(2)"></span>
							<span class="w3-badge demo w3-border" onclick="currentDiv(3)"></span>
						</div>
					</div>

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
