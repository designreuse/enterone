<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 페이지</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/summernote/summernote-bs4.min.css">
  <style>
  	.cnotices-button{
  		float:right;	
  		padding:5px;
  	}
  </style>
  <!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
  <!-- jQuery -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jquery/jquery.min.js"></script>	
  <script type="text/javascript">
		
	$(function(){
		$(".btn-register").on("click",function(){
			location.href="${pageContext.request.contextPath}/management/editors";
		});
		
	});
	
  </script>	
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${pageContext.request.contextPath}/adminMain" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${pageContext.request.contextPath}/index" class="nav-link" >Main Page</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${pageContext.request.contextPath}/logout" class="nav-link">Logout</a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown"></li>
      <li class="nav-item dropdown"></li>
    </ul>
  </nav>
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath}/adminMain" class="brand-link">
      <img src="${pageContext.request.contextPath}/resourcesAdmin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">${sessionScope.company.com_id}</span>
    </a>

    <!-- 왼쪽메뉴 바  -->
    <div class="sidebar">
      
      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- 왼쪽메뉴들 -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/adminQna" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>1:1문의
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/adminCompany" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>기업회원
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/adminMember" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>개인회원
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/adminFilter" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>금칙어 관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <li class="nav-header"></li>
          <li class="nav-item"> </li>
          <li class="nav-item">
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link"></a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link"></a>
                <ul class="nav nav-treeview">
                  <li class="nav-item"></li>
                  <li class="nav-item"><a href="#" class="nav-link"></a></li>
                  <li class="nav-item"><a href="#" class="nav-link"></a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="#" class="nav-link"></a></li>
            </ul>
          </li><!-- nav nav-treeview 끝 -->
          
          <li class="nav-item"><a href="#" class="nav-link"></a></li>
          
          <li class="nav-header"></li>
          <li class="nav-item"><a href="#" class="nav-link"></a></li>
          <li class="nav-item"><a href="#" class="nav-link"></a></li>
          <li class="nav-item"><a href="#" class="nav-link"></a></li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  <div class="content-wrapper" style="min-height: 1718.13px;">
   
    
  <!--  main 들어가는 자리 -->
  <tiles:insertAttribute name="body"/>
  
  </div>
  
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2020 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0-rc
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/dist/js/pages/dashboard.js"></script>
</body>
</html>

</body>
</html>