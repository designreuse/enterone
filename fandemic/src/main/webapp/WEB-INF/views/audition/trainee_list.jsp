<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html>

<head>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

nav {
	width: 100%;
	height: 100px;
}

header {
	position: relative;
	width: 100%;
	height: 300px;
	background-image: url(img/header.jpeg);
	background-attachment: fixed;
	background-size: cover;
	background-position: center center;
}

.wrapper {
	text-align: center;
}

.card {
	display: inline-block;
	width: 200px;
	height: 300px;
	border: 1px solid #cecece;
	text-align: center;
	margin-top: 5px;
}

.card img {
	width: 180px;
	border: 1px solid #cecece;
	margin-top: 10px;
}

footer {
	width: 100%;
	height: 1000px;
}
</style>

</head>

<body>

	<nav></nav>

	<header> </header>

	<div class="wrapper">

		<div class="card">

			<img src="suzy.jpg">

			<p>수지</p>

		</div>

		<div class="card">

			<img src="img/02.jpg">

			<p>title</p>

		</div>

		<div class="card">

			<img src="img/03.jpg">

			<p>title</p>

		</div>

		<div class="card">

			<img src="img/04.jpg">

			<p>title</p>

		</div>

		<div class="card">

			<img src="img/05.jpg">

			<p>title</p>

		</div>

		<div class="card">

			<img src="img/06.jpg">

			<p>title</p>

		</div>

	</div>

	<footer></footer>

</body>

</html>
