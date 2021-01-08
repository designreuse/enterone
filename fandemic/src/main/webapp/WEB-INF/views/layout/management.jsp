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
  <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/jqvmap.min.css"> --%>
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
<%-- <script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jquery/jquery.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resourcesSchedule/vendor/js/jquery.min.js"></script> 	
<!-- jQuery UI 1.11.4 -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<%-- <script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
<!-- ChartJS -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/sparklines/sparkline.js"></script>
<%-- <!-- JQVMap -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script> --%>
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
<%-- <!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/dist/js/demo.js"></script>
 --%><!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<%-- <script src="${pageContext.request.contextPath}/resourcesAdmin/dist/js/pages/dashboard.js"></script> --%> 	
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
        <a href="${pageContext.request.contextPath}/management" class="nav-link">Home</a>
      </li>
      <!-- <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li> -->
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
       <!-- Navbar Search -->
      <!-- <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>  -->

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${pageContext.request.contextPath}/resourcesAdmin/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${pageContext.request.contextPath}/resourcesAdmin/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${pageContext.request.contextPath}/resourcesAdmin/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath}/resourcesAdmin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light"><!-- 소속사ID -->${company.com_id }</span>
    </a>

    <!-- 왼쪽메뉴 바  -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/resourcesAdmin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><!-- 소속사명 -->${company.com_name }</a>
        </div>
      </div>

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
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <!-- 공지 -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/management/notices" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	공지사항
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <!--스타관리  -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/management/star/starList" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	스타관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <!--굿즈관리  -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/management/goods/goodsList" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	굿즈관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <!--오디션관리  -->
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/management/aboard/aboard" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	소속사오디션관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <!--소속사정보관리  -->
          <li class="nav-item">
            <a href="pages/widgets.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	소속사정보관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <!--언택트행사관리  -->
          <li class="nav-item">
            <a href="pages/widgets.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	언택트행사관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          
          <!--팬관리  -->
          <li class="nav-item">
            <a href="pages/widgets.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	팬관리
                <span class="right badge badge-danger"><!-- 메일같은거오면 왔다고 알림창띠우는그런기능 --></span>
              </p>
            </a>
          </li>
          <li class="nav-header">MULTI LEVEL EXAMPLE</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
                Level 1
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Level 2
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-danger"></i>
              <p class="text">Important</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
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
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/resourcesAdmin/dist/js/demo.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resourcesAdmin/plugins/jqvmap/jquery.vmap.min.js"></script> --%>

</body>
</html>

</body>
</html>