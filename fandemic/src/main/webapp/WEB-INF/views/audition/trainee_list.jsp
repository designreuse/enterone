<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html>

<head>

<style>
* {
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
	height: 316px;
	border: 0px solid;
	text-align: center;
	margin-top: 5px;
}

.card img {
	width: 180px;
	border: 0px solid;
	margin-top: 10px;
}

footer {
	width: 100%;
	height: 1000px;
}

.btn-like {
  align:right;
  color: transparent;
  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
}
.btn-like:hover {
  text-shadow: 0 0 0 #ea0;
}
.btn-like.done {
  color: inherit;
  text-shadow: 0;
}
.btn-like.done:hover {
  color: transparent;
  text-shadow: 0 0 0 #777;
}
</style>


</head>

<body>
<div> <h1 align="center" style="color:black; font-size:100px;">연습생 활동</h1></div>
	<nav></nav>
 
	<header></header>



	<div class="wrapper" style="background-color:lightgrey;">
	<div><button class="btn btn-primary" type="button" style="font-size:1.5em; 
	border-radius:0.5em; align:center; padding:5px;">TOP05/NEW05</button></div>
		<div class="card">
<div align="right">
			<img src="${pageContext.request.contextPath}/resources/images/audition/suzy.jpg" style="margin:10px; height:264px; width:178px">
			<br>
			<button class="btn-like" style="margin-right:10px">👍</button>
		</div>


<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(".btn-like").click(function() {
	$(this).toggleClass("done");
})
</script>

		</div>

		<div class="card">
<div align="right">
			<img src="${pageContext.request.contextPath}/resources/images/audition/jung.jpg" style="margin:10px; height:264px; width:178px">
<br>
			<button class="btn-like" style="margin-right:10px">👍</button>
		</div>


		</div>

				<div class="card">
<div align="right">
			<img src="${pageContext.request.contextPath}/resources/images/audition/park.jpg" style="margin:10px; height:264px; width:178px">
<br>
			<button class="btn-like" style="margin-right:10px">👍</button>
		</div>


		</div>
		
		<div class="card">
<div align="right">
			<img src="${pageContext.request.contextPath}/resources/images/audition/lee.jpg" style="margin:10px; height:264px; width:178px">
<br>
			<button class="btn-like" style="margin-right:10px">👍</button>
		</div>


		</div>

		<div class="card">
<div align="right">
			<img src="${pageContext.request.contextPath}/resources/images/audition/choi.jpg" style="margin:10px; height:264px; width:178px">
<br>
			<button class="btn-like" style="margin-right:10px">👍</button>
		</div>


		</div>

	</div>
	
	<p></p>
	<br><br>
	
		<div class="wrapper" style="background-color:lightgrey;">

	

	<footer></footer>

</body>

</html>
