<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
      <meta name="author" content="Kodinger">
      <meta name="keyword" content="magz, html5, css3, template, magazine template">
      <!-- Shareable -->
      <meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" />
      <meta property="og:type" content="article" />
      <meta property="og:url" content="http://github.com/nauvalazhar/Magz" />
      <meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" />
      <title>Enter One</title>
      <!-- Bootstrap -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/bootstrap/bootstrap.min.css">
      <!-- IonIcons -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/ionicons/css/ionicons.min.css">
      <!-- Toast -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/toast/jquery.toast.min.css">
      <!-- OwlCarousel -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
      <!-- Magnific Popup -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/magnific-popup/dist/magnific-popup.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/scripts/sweetalert/dist/sweetalert.css">
      <!-- Custom style -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/skins/all.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
      <!-- Favicon -->
      <link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
      
       <!-- JS -->
      <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/jquery.migrate.js"></script>
      <script src="${pageContext.request.contextPath}/resources/scripts/bootstrap/bootstrap.min.js"></script>
      <script>var $target_end=$(".best-of-the-week");</script>
      <script src="${pageContext.request.contextPath}/resources/scripts/jquery-number/jquery.number.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/scripts/easescroll/jquery.easeScroll.js"></script>
      <script src="${pageContext.request.contextPath}/resources/scripts/sweetalert/dist/sweetalert.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/scripts/toast/jquery.toast.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/demo.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/e-magz.js"></script>



</head>
<body>
<header class="primary">
         <div class="firstbar" style="padding: 0px">
            <div class="container">
               <div class="row">
                  <div class="col-md-3 col-sm-12">
                     <div class="brand">
                        <a href="${pageContext.request.contextPath}/">
                           <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Magz Logo">
                        </a>
                     </div>                  
                  </div>
                  <div class="col-md-6 col-sm-12">
                     <form class="search" id="search" action="${pageContext.request.contextPath}/search">
                        <div class="form-group">
                           <div class="input-group">
                              <input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어">                           
                              <div class="input-group-btn">
                                 <button class="btn btn-primary"><i class="ion-search"></i></button>
                              </div>
                           </div>
                        </div>
                        <div class="help-block">
                           <div>Popular:</div>
                           <ul>
                              <li><a href="#">소속사</a></li>
                              <li><a href="#">스타</a></li>
                           </ul>
                        </div>
                     </form>                        
                  </div>
                  <div class="col-md-3 col-sm-12 text-right">
                     <ul class="nav-icons">
                     	<c:if test="${sessionScope.member.mem_id eq null and sessionScope.company.com_id eq null and sessionScope.star.st_id eq null}" >
	                        <li><a href="${pageContext.request.contextPath}/register"><i class="ion-person-add"></i><div>회 원 가 입</div></a></li>
	                        <li><a href="${pageContext.request.contextPath}/login"><i class="ion-person"></i><div>로 그 인</div></a></li>
                        </c:if>
                        <c:if test="${sessionScope.member.mem_id ne null or sessionScope.company.com_id ne null or sessionScope.star.st_id ne null}">
                        	<!-- <li><a href="#"><i class="ion-person-add"></i><div>마 이 페 이 지</div></a></li> -->
                        	<c:if test="${sessionScope.company.com_id != null and sessionScope.company.com_class== '1'}">
                        	<li><a href="${pageContext.request.contextPath}/management"><i class="ion-person"></i><div>관리자페이지</div></a></li>
                        	</c:if>
                        	<c:if test="${sessionScope.company.com_id != null and sessionScope.company.com_class== '0'}">
                        	<li><a href="${pageContext.request.contextPath}/adminMain"><i class="ion-person"></i><div>관리자페이지</div></a></li>
                        	</c:if>
	                        <li><a href="${pageContext.request.contextPath}/logout"><i class="ion-person"></i><div>로 그 아 웃</div></a></li>
                        </c:if>
                        
                        
                        
                     </ul>
                  </div>
               </div>
            </div>
         </div>

         <!-- Start nav -->
         <nav class="menu">
            <div class="container">
               <div class="brand">
                  <a href="#">
                     <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Magz Logo">
                  </a>
               </div>
               <div class="mobile-toggle">
                  <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
               </div>
               <div class="mobile-toggle">
                  <a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
               </div>
               <div id="menu-list">
                  <ul class="nav-list">
                     <li class="for-tablet nav-title"><a>Menu</a></li>
                     <c:if test="${sessionScope.member.mem_id eq null and sessionScope.company.com_id eq null and sessionScope.star.st_id eq null}" >
                     	<li class="for-tablet"><a href="${pageContext.request.contextPath}/login">Login</a></li>
                     	<li class="for-tablet"><a href="${pageContext.request.contextPath}/register">Register</a></li>
                     </c:if>
                     <c:if test="${sessionScope.member.mem_id ne null or sessionScope.company.com_id ne null or sessionScope.star.st_id ne null}">
                     	<li class="for-tablet"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                     </c:if>
                     
                     
                     <li><a href="${pageContext.request.contextPath}/company">소 속 사</a></li>
                     
                     
                     <li><a href="${pageContext.request.contextPath}/untact">언 택 트</a></li>

                     
<!--                      magz-dropdown 클래스 제거 -->
                     <li class="dropdown"><a href="${pageContext.request.contextPath}/audition/auditionwork">연 습 생<i class="ion-ios-arrow-right"></i></a>
                        <ul class="dropdown-menu">
                        <c:if test="${sessionScope.member.mem_id ne null and sessionScope.trainee.mem_id eq null}">
                           <li><a href="${pageContext.request.contextPath}/audition/traineeinsert"><i class="icon ion-ios-minus-empty"></i>연습생 등록</a></li>
                        </c:if>
                           <li><a href="${pageContext.request.contextPath}/audition/auditionwork"><i class="icon ion-ios-minus-empty"></i>연습생 활동</a></li>
                           <li><a href="${pageContext.request.contextPath}/audition/auditionlist"><i class="icon ion-ios-minus-empty"></i>오디션 공고</a></li>
                           
                        </ul>
                     </li>
<!--                      magz-dropdown 클래스 제거 -->
                     <li class="dropdown "><a href="${pageContext.request.contextPath}/goods">스 토 어<i class="ion-ios-arrow-right"></i></a>
                     
                        <ul class="dropdown-menu">
                       	   <li><a href="${pageContext.request.contextPath}/goodsf?t=TICKET"><i class="icon ion-ios-minus-empty"></i>TICKET</a></li>
                           <li><a href="${pageContext.request.contextPath}/goodsf?t=CHEERING"><i class="icon ion-ios-minus-empty"></i>CHEERING</a></li>
                           <li><a href="${pageContext.request.contextPath}/goodsf?t=MUSIC"><i class="icon ion-ios-minus-empty"></i>MUSIC</a></li>
                           <li><a href="${pageContext.request.contextPath}/goodsf?t=FASHION"><i class="icon ion-ios-minus-empty"></i>FASHION</a></li>
                           <li><a href="${pageContext.request.contextPath}/goodsf?t=ACC"><i class="icon ion-ios-minus-empty"></i>ACC</a></li>
                           <li><a href="${pageContext.request.contextPath}/goodsf?t=TECH"><i class="icon ion-ios-minus-empty"></i>TECH</a></li>
                           <li><a href="${pageContext.request.contextPath}/goodsf?t=ETC"><i class="icon ion-ios-minus-empty"></i>ETC</a></li>
                           <li class="divider"></li>
						   <li><a href="${pageContext.request.contextPath}/cart"><i class="icon ion-ios-cart"></i>장바구니</a></li>
						   <li><a href="${pageContext.request.contextPath}/buyList"><i class="icon ion-ios-list"></i>구매내역</a></li>
                        </ul>
                     </li>
                     
                     <li><a href="${pageContext.request.contextPath}/sns">S N S</a></li>
                          <c:if test="${sessionScope.member.mem_id ne null or sessionScope.company.com_id ne null }">
<!--  magz-dropdown 클래스 제거ㅊ -->
                     <li class="dropdown "><a href="${pageContext.request.contextPath}/mypagemain">마 이 페 이 지 <i class="ion-ios-arrow-right"></i></a>
                        <ul class="dropdown-menu">
                           	<li><a href="${pageContext.request.contextPath}/myupdate"><i class="icon ion-person"></i>
											회원정보</a></li>
							<li><a href="${pageContext.request.contextPath}/mystar"><i class="icon ion-heart"></i> 내
											스타</a></li>
							<li><a href="${pageContext.request.contextPath}/audition/traineeupdate"><i class="icon ion-thumbsup"></i>
											연습생</a></li>
							<li><a href="${pageContext.request.contextPath}/cart"><i class="icon ion-ios-cart"></i>
											장바구니</a></li>
							<li><a href="${pageContext.request.contextPath}/buyList"><i class="icon ion-ios-list"></i>
											결제내역</a></li>
							<li><a href="${pageContext.request.contextPath}/myUntact"><i class="icon ion-calendar"></i>
											언택트 티켓</a></li>
							<li class="dropdown"><a href="${pageContext.request.contextPath}/mymail"><i class="icon ion-android-chat"></i>쪽지함</a>
								 <ul class="dropdown-menu">
								 <li><a href="${pageContext.request.contextPath}/mymail"><i class="icon ion-chatbox"></i>
											받은 쪽지함</a></li>
											<li><a href="${pageContext.request.contextPath}/yourmail"><i class="icon ion-chatbox"></i>
											보낸 쪽지함</a></li>
								 </ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/my1o1"><i class="icon ion-social-tux"></i>
											1:1문의 내역</a></li>
							<li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/logout"><i class="icon ion-log-out"></i> 로그아웃</a></li>
                        </ul>
                     </li>
                                    </c:if>
                  </ul>
               </div>
            </div>
         </nav>
         <!-- End nav -->
      </header>
      
      <!--  body 추가 부분 -->
      <tiles:insertAttribute name="body"/>
      
      <!-- Start footer -->
      <footer class="footer">
         <div class="container">
            <div class="row">
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="block">
                     <h1 class="block-title">Company Info</h1>
                     <div class="block-body">
                        <figure class="foot-logo">
                           <img src="${pageContext.request.contextPath}/resources/images/logo1.png" class="img-responsive" alt="Logo">
                        </figure>
                        <p class="brand-description">
                         Project Enter-One<br>Untact-based<br>Integrated Entertainment Platform<br>Made by Fandemic
                        </p>
                        <a href="#" class="btn btn-magz white">About Us <i class="ion-ios-arrow-thin-right"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="block">
                     <h1 class="block-title">Popular Tags <div class="right"><a href="#">See All <i class="ion-ios-arrow-thin-right"></i></a></div></h1>
                     <div class="block-body">
                        <ul class="tags">
                           <li><a href="#">EnterOne</a></li>
                           <li><a href="#">Fandemic</a></li>
                           <li><a href="http://www.daeguoracle.com" target="_blank">Yedam</a></li>
                           <li><a href="#">박진규</a></li>
                           <li><a href="#">민해주</a></li>
                           <li><a href="https://www.instagram.com/hoihee00" target="_blank">김다희</a></li>
                           <li><a href="#">동광희</a></li>
                           <li><a href="https://www.instagram.com/y___p_g" target="_blank">염평강</a></li>
                           <li><a href="#">임성은</a></li>
                        </ul>
                     </div>
                  </div>

               </div>
               <div class="col-md-3 col-sm-6 col-xs-12">
                  <div class="block">
                     <h1 class="block-title">Latest News</h1>
                     <div class="block-body">
                        <article class="article-mini">
                           <div class="inner">
                              <figure>
                                 <a href="single.html">
                                    <img src="${pageContext.request.contextPath}/resources/images/news/img12.jpg" alt="Sample Article">
                                 </a>
                              </figure>
                              <div class="padding">
                                 <h1><a href="single.html">Donec consequat lorem quis augue pharetra</a></h1>
                              </div>
                           </div>
                        </article>
                        <article class="article-mini">
                           <div class="inner">
                              <figure>
                                 <a href="single.html">
                                    <img src="${pageContext.request.contextPath}/resources/images/news/img16.jpg" alt="Sample Article">
                                 </a>
                              </figure>
                              <div class="padding">
                                 <h1><a href="single.html">Proin venenatis pellentesque arcu vitae </a></h1>
                              </div>
                           </div>
                        </article>
                        <a href="#" class="btn btn-magz white btn-block">See All <i class="ion-ios-arrow-thin-right"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-md-3 col-xs-12 col-sm-6">
                  <div class="block">
                     <h1 class="block-title">Follow Us</h1>
                     <div class="block-body">
                        <p>Follow us and stay in touch to get the latest news</p>
                        <ul class="social trp">
                           <li>
                              <a href="#" class="facebook">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-facebook"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="twitter">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-twitter-outline"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="youtube">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-youtube-outline"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="googleplus">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-googleplus"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="instagram">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-instagram-outline"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="tumblr">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-tumblr"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="dribbble">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-dribbble"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="linkedin">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-linkedin"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="skype">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-skype"></i>
                              </a>
                           </li>
                           <li>
                              <a href="#" class="rss">
                                 <svg><rect width="0" height="0"/></svg>
                                 <i class="ion-social-rss"></i>
                              </a>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="line"></div>
                  <div class="block">
                     <div class="block-body no-margin">
                        <ul class="footer-nav-horizontal">
                           <li><a href="index.html">Home</a></li>
                           <li><a href="#">Partner</a></li>
                           <li><a href="contact.html">Contact</a></li>
                           <li><a href="page.html">About</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="copyright">
                     COPYRIGHT &copy; MAGZ 2017. ALL RIGHT RESERVED.
                     <div>
                        Made with <i class="ion-heart"></i> by <a href="http://kodinger.com">Kodinger</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- End Footer -->

     
</body>
</html>