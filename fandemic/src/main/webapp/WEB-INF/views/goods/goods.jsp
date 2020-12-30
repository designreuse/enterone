<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesGoods/css/style.css">
<style>
*, ::after, ::before {
	box-sizing: border-box;
}

/* ---- pagination ---- */
.pagination li {
	display: inline-block;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid gray;
	margin: 0 4px;
}

.pagination a.active {
	background-color: rgb(53, 52, 52);
	color: white;
	border: 1px solid gray;
}

.pagination a:hover:not(.active) {
	background-color: lightgray;
	color: black;
}

/* ---- star filter menu ---- */
.star_filter_menu {
	background-color: #f1f1f1;
    padding: 20px;
    margin-bottom: 50px;
}

.filterDiv {
	float: left;
	background-color: #f1f1f1;
	color: black;
	text-align: center;
	padding: 10px 15px 10px 15px;
	margin: 5px 10px 5px 10px;
	display: none;
}

.show {
	display: block;
}

.a_container {
	overflow: hidden;
	width: 75%;
	float: right;
}


.myBtnContainer {
	width: 25%;
	float: left;
	height: 140px;
	overflow: auto;
}

/* Style the buttons */
.btnCom {
	width: 100%;
	border: none;
	outline: none;
	padding: 12px 16px;
	background-color: #f1f1f1;
	cursor: pointer;
}

.btnCom:hover {
	background-color: #ddd;
}

.btnCom.active {
	background-color: #666;
	color: white;
}

.filterDiv:hover {
	background-color: #ddd;
}

.filterDiv.active {
	background-color: #666;
	color: white;
}


</style>
</head>

<body>
	<!-- Featured Section Begin -->
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h3 align="center" style="padding: 15px">GOODS SHOP</h3>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".cheering">CHEERING</li>
							<li data-filter=".music">MUSIC</li>
							<li data-filter=".fashion">FASHION</li>
							<li data-filter=".acc">ACC</li>
							<li data-filter=".tech">TECH</li>
							<li data-filter=".etc">ETC</li>
						</ul>
					</div>

					<!-- Star Filter Menu (https://www.w3schools.com/howto/howto_js_filter_elements.asp) -->
					<div class="star_filter_menu">
						<h5 align="center">Filter DIV Elements</h5>

						<div class="row">
							<div id="myBtnContainer" class="myBtnContainer">
								<button class="btnCom active" onclick="filterSelection('all')">ALL</button>
								<button class="btnCom" onclick="filterSelection('cars')">SM</button>
								<button class="btnCom" onclick="filterSelection('animals')">YG</button>
								<button class="btnCom" onclick="filterSelection('fruits')">JYP</button>
								<button class="btnCom" onclick="filterSelection('cars')">SM</button>
								<button class="btnCom" onclick="filterSelection('animals')">YG</button>
								<button class="btnCom" onclick="filterSelection('fruits')">JYP</button>
								<button class="btnCom" onclick="filterSelection('cars')">SM</button>
								<button class="btnCom" onclick="filterSelection('animals')">YG</button>
								<button class="btnCom" onclick="filterSelection('fruits')">JYP</button>
							</div>

							<div class="a_container">
								<div class="filterDiv cars">ALL</div>
								<div class="filterDiv fruits">Orange</div>
								<div class="filterDiv cars">Volvo</div>
								<div class="filterDiv animals">Mustang</div>
								<div class="filterDiv animals">Cat</div>
								<div class="filterDiv animals">Dog</div>
								<div class="filterDiv fruits">Melon</div>
								<div class="filterDiv fruits">Kiwi</div>
								<div class="filterDiv fruits">Banana</div>
								<div class="filterDiv fruits">Lemon</div>
								<div class="filterDiv animals">Cow</div>
							</div>
						</div>

					</div>

					<script>
						filterSelection("all")
						function filterSelection(c) {
							var x, i;
							x = document.getElementsByClassName("filterDiv");
							if (c == "all")
								c = "";
							for (i = 0; i < x.length; i++) {
								w3RemoveClass(x[i], "show");
								if (x[i].className.indexOf(c) > -1)
									w3AddClass(x[i], "show");
							}
						}

						function w3AddClass(element, name) {
							var i, arr1, arr2;
							arr1 = element.className.split(" ");
							arr2 = name.split(" ");
							for (i = 0; i < arr2.length; i++) {
								if (arr1.indexOf(arr2[i]) == -1) {
									element.className += " " + arr2[i];
								}
							}
						}

						function w3RemoveClass(element, name) {
							var i, arr1, arr2;
							arr1 = element.className.split(" ");
							arr2 = name.split(" ");
							for (i = 0; i < arr2.length; i++) {
								while (arr1.indexOf(arr2[i]) > -1) {
									arr1.splice(arr1.indexOf(arr2[i]), 1);
								}
							}
							element.className = arr1.join(" ");
						}

						// Add active class to the current button (highlight it)
						var btnContainer = document
								.getElementById("myBtnContainer");
						var btns = btnContainer.getElementsByClassName("btn");
						for (var i = 0; i < btns.length; i++) {
							btns[i].addEventListener("click", function() {
								var current = document
										.getElementsByClassName("active");
								current[0].className = current[0].className
										.replace(" active", "");
								this.className += " active";
							});
						}
					</script>


				</div>
			</div>

			<!-- 상품 정보 -->
			<div class="row featured__filter">
				<c:forEach var="goods" items="${goodsList}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix cheering music"
						style="padding: 0;">
						<div class="featured__item">
							<div class="featured__item__pic set-bg">

								<a
									href="${pageContext.request.contextPath}/goodsDetail/${goods.go_no}">
									<img alt="이미지"
									src="${pageContext.request.contextPath}/images/goods/${goods.go_pic}">
								</a>
							</div>
							<div class="featured__item__text">
								<h6>
									<a
										href="${pageContext.request.contextPath}/goodsDetail/${goods.go_no}">[${goods.st_id}]
										${goods.go_name}</a>
								</h6>
								<h5>
									<fmt:formatNumber value="${goods.go_price}" pattern="##,###" />
									원
								</h5>
							</div>
						</div>
					</div>
				</c:forEach>

				<!-- paging -->
				<div class="col-md-12 text-center">
					<script>
						function goPage(p) {
							location.href = "goods?p=" + p
						}
					</script>
					<my:paging paging="${paging}" jsfunc="goPage" />
				</div>

			</div>
		</div>
	</section>
	<!-- Featured Section End -->

</body>
</html>