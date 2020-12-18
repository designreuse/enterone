<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods</title>
<style>

*, ::after, ::before {
    box-sizing: border-box;
}

/*----------------------------------------*/
/* Template default CSS
/*----------------------------------------*/

html,
body {
	height: 100%;
	font-family: "Cairo", sans-serif;
	-webkit-font-smoothing: antialiased;
	font-smoothing: antialiased;
}

h1,
h2,
h3,
h4,
h5,
h6 {
	margin: 0;
	color: #111111;
	font-weight: 400;
	font-family: "Cairo", sans-serif;
}

h1 {
	font-size: 70px;
}

h2 {
	font-size: 36px;
}

h3 {
	font-size: 30px;
}

h4 {
	font-size: 24px;
}

h5 {
	font-size: 18px;
}

h6 {
	font-size: 16px;
}

p {
	font-size: 16px;
	font-family: "Cairo", sans-serif;
	color: #6f6f6f;
	font-weight: 400;
	line-height: 26px;
	margin: 0 0 15px 0;
}

img {
	max-width: 100%;
}

input:focus,
select:focus,
button:focus,
textarea:focus {
	outline: none;
}

a:hover,
a:focus {
	text-decoration: none;
	outline: none;
	color: #ffffff;
}

ul,
ol {
	padding: 0;
	margin: 0;
}

/*---------------------
  Featured
-----------------------*/

.featured {
	padding-top: 80px;
	padding-bottom: 40px;
}

.featured__controls {
	text-align: center;
	margin-bottom: 50px;
}

.featured__controls ul li {
	list-style: none;
	font-size: 18px;
	color: #1c1c1c;
	display: inline-block;
	margin-right: 25px;
	position: relative;
	cursor: pointer;
}

.featured__controls ul li.active:after {
	opacity: 1;
}

.featured__controls ul li:after {
	position: absolute;
	left: 0;
	bottom: -2px;
	width: 100%;
	height: 2px;
	background: #7fad39;
	content: "";
	opacity: 0;
}

.featured__controls ul li:last-child {
	margin-right: 0;
}

.featured__item {
	margin-bottom: 50px;
}

.featured__item:hover .featured__item__pic .featured__item__pic__hover {
	bottom: 20px;
}

.featured__item__pic {
	height: 270px;
	position: relative;
	overflow: hidden;
	background-position: center center;
}

.featured__item__pic__hover {
	position: absolute;
	left: 0;
	bottom: -50px;
	width: 100%;
	text-align: center;
	-webkit-transition: all, 0.5s;
	-moz-transition: all, 0.5s;
	-ms-transition: all, 0.5s;
	-o-transition: all, 0.5s;
	transition: all, 0.5s;
}

.featured__item__pic__hover li {
	list-style: none;
	display: inline-block;
	margin-right: 6px;
}

.featured__item__pic__hover li:last-child {
	margin-right: 0;
}

.featured__item__pic__hover li:hover a {
	background: #7fad39;
	border-color: #7fad39;
}

.featured__item__pic__hover li:hover a i {
	color: #ffffff;
	transform: rotate(360deg);
}

.featured__item__pic__hover li a {
	font-size: 16px;
	color: #1c1c1c;
	height: 40px;
	width: 40px;
	line-height: 40px;
	text-align: center;
	border: 1px solid #ebebeb;
	background: #ffffff;
	display: block;
	border-radius: 50%;
	-webkit-transition: all, 0.5s;
	-moz-transition: all, 0.5s;
	-ms-transition: all, 0.5s;
	-o-transition: all, 0.5s;
	transition: all, 0.5s;
}

.featured__item__pic__hover li a i {
	position: relative;
	transform: rotate(0);
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.featured__item__text {
	text-align: center;
	padding-top: 15px;
}

.featured__item__text h6 {
	margin-bottom: 10px;
}

.featured__item__text h6 a {
	color: #252525;
}

.featured__item__text h5 {
	color: #252525;
	font-weight: 700;
}

</style>
</head>


<body>


    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h3>GOODS SHOP</h3>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".cheering">CHEERING</li>
                            <li data-filter=".music">MUSIC</li>
                            <li data-filter=".fasion">FASHION</li>
                            <li data-filter=".acc">ACC</li>
                            <li data-filter=".tech">TECH</li>
                            <li data-filter=".etc">ETC</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
    
</body>
</html>