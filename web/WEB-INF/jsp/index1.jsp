<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- META TAGS -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="SmartBox">

<!-- TITLE -->
<title>SMARTBOX|KFBIOS</title>

<!-- FAVICON -->
<link rel="shortcut icon" href="../../assets/images/favicon.png">

<!-- STYLESHEETS -->
<link rel="stylesheet" href="../../assets/plugins/morris/morris.css">
<link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="../../assets/css/core.css" type="text/css" />
<link rel="stylesheet" href="../../assets/css/components.css" type="text/css" />
<link rel="stylesheet" href="../../assets/css/icons.css" type="text/css" />
<link rel="stylesheet" href="../../assets/css/pages.css" type="text/css" />
<link rel="stylesheet" href="../../assets/css/responsive.css" type="text/css" />
<script src="js/jquery.min.js" type="text/javascript"></script>
 <script src="bootstrap-4.0.0-dist/js/bootstrap.js"></script>
 <script src="./js/bs4.pop.js"></script>


<!-- MODERNIZER -->
<script src="../../assets/js/modernizr.min.js"></script>

</head>

<body class="fixed-left deshboard-first close-it">
<!-- Begin page -->
<div id="wrapper">
	<!-- Top Bar Start -->
	<div class="topbar">
		<!-- LOGO -->
		<div class="topbar-left">
			<a href="javascript:void(0)" class="logo d-logo hidden-xs hidden-sm">
			</a> 
			<a href="javascript:void(0)" class="logo d-logo hidden visible-xs visible-sm">
				<img src="../../assets/images/m-logo.png" alt="SmartBox" class="img-responsive hidden-xs" height="0">
			</a> 
			<!-- Image Logo here --> 
		</div>
		
		<!-- Button mobile view to collapse sidebar menu -->
		<div class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="top-fix-navbar">
					<div class="pull-left">
						<button class="button-menu-mobile open-left waves-effect waves-light">
						<i class="fa fa-outdent"></i>
						</button>
						<span class="clearfix"></span>
					</div>
					<ul class="nav navbar-nav hidden-xs">
						<li>
							<a href="javascript:void(0)" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i></a>
						</li>
						<li class="dropdown">
							<a href="javascript:void(0)" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${username}<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)"><i class="ti-settings m-r-10 text-custom"></i>个人中心</a>
								</li>
								<li class="divider"></li>
								<li><a href="/logout.action"><i class="ti-power-off m-r-10 text-danger"></i>退出</a>
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="javascript:void(0)" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">New<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)">New Theme</a>
								</li>
								<li><a href="javascript:void(0)">New Update</a>
								</li>
								<li><a href="javascript:void(0)">New World</a>
								</li>
							</ul>
						</li>
					</ul>
					<form role="search" class="navbar-left app-search pull-left hidden-xs">
						<input type="text" placeholder="Search project..." class="form-control">
						<a href="javascript:void(0)"><i class="fa fa-search"></i></a>
					</form>
					<ul class="nav navbar-nav navbar-right pull-right">
						<li class="dropdown hidden-xs">
							<a href="javascript:void(0)" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">English<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)">French</a>
								</li>
								<li><a href="javascript:void(0)">Russian</a>
								</li>
							</ul>
						</li>
						<li class="dropdown top-menu-item-xs">
							<a href="javascript:void(0)" data-target="#" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
							<i class="fa fa-calendar"></i> <span class="badge badge-xs badge-danger">5</span>
							</a>
							<ul class="dropdown-menu dropdown-menu-lg">
								<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>
								<li class="list-group slimscroll-noti notification-list">
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-diamond noti-primary"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">A new order has been placed A new order has been placed</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-cog noti-warning"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">New settings</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-bell-o noti-custom"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">Updates</h5>
												<p class="m-0">
													<small>There are <span class="text-primary font-600">2</span> new updates available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-user-plus noti-pink"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">New user registered</h5>
												<p class="m-0">
													<small>You have 10 unread messages</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-diamond noti-primary"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">A new order has been placed A new order has been placed</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-cog noti-warning"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">New settings</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="list-group-item text-right">
									<small class="font-600">See all notifications</small>
									</a>
								</li>
							</ul>
						</li>
						<li class="dropdown top-menu-item-xs">
							<a href="javascript:void(0)" data-target="#" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
							<i class="fa fa-bell-o"></i> <span class="badge badge-xs badge-danger">3</span>
							</a>
							<ul class="dropdown-menu dropdown-menu-lg">
								<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>
								<li class="list-group slimscroll-noti notification-list">
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-diamond noti-primary"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">A new order has been placed A new order has been placed</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-cog noti-warning"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">New settings</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-bell-o noti-custom"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">Updates</h5>
												<p class="m-0">
													<small>There are <span class="text-primary font-600">2</span> new updates available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-user-plus noti-pink"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">New user registered</h5>
												<p class="m-0">
													<small>You have 10 unread messages</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-diamond noti-primary"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">A new order has been placed A new order has been placed</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
									<!-- list item-->
									<a href="javascript:void(0);" class="list-group-item">
										<div class="media">
											<div class="pull-left p-r-10">
												<em class="fa fa-cog noti-warning"></em>
											</div>
											<div class="media-body">
												<h5 class="media-heading">New settings</h5>
												<p class="m-0">
													<small>There are new settings available</small>
												</p>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="list-group-item text-right">
									<small class="font-600">See all notifications</small>
									</a>
								</li>
							</ul>
						</li>
						<li class="dropdown top-menu-item-xs">
							<a href="javascript:void(0)" class="right-bar-toggle profile waves-effect waves-light"><span class="user-name">Hoang.Thai</span>
							<span class="caret"></span>
							<img src="../../assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle">
							</a>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- Top Bar End -->

	<!-- ========== Left Sidebar Start ========== -->
	<div class="left side-menu">
		<div class="sidebar-inner slimscrollleft">
			<!--- Divider -->
			<div id="sidebar-menu">
				<ul>
					<li class="menu-title">回收站</li>
					<li class="has_sub">
						<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-dashboard"></i> <span> Dashboard </span> <span class="label label-success pull-right">1</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
						<ul class="list-unstyled">
							<li><a href="dashboard.html">Dashboard1</a> </li>
						</ul>
					</li>
					<li> <a href="mailbox.html" class="waves-effect"> <i class="fa fa-envelope"></i> <span> Mailbox </span> </a> </li>
					<li> <a href="calendar.html" class="waves-effect"> <i class="fa fa-calendar"></i> <span> Calendar </span> </a> </li>
					<li class="has_sub">
						<a href="javascript:void(0);" class="waves-effect subdrop"> <i class="fa fa-file"></i> <span> Pages </span> <span class="label label-warning pull-right">3</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
						<ul class="list-unstyled block">
							<li><a href="404.html">404</a> </li>
							<li><a href="blank.html">Blank</a> </li>
							<li><a href="buttons.html">Buttons</a> </li>
						</ul>
					</li>

					<li> <a href="profile.html" class="waves-effect"> <i class="fa fa-user"></i> <span> Profile</span> </a> </li>


					<li class="text-muted menu-title">Component</li>

					<li class="has_sub">
						<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-tasks"></i> <span> Forms </span>  <span class="label label-warning pull-right">3</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
						<ul class="list-unstyled">
							<li><a href="form-elements.html">Form Elements</a> </li>
							<li><a href="login.html"> Login</a> </li>
							<li><a href="login2.html"> login2</a> </li>
						</ul>
					</li>
					<li class="has_sub">
						<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-table"></i> <span> Tabels </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
						<ul class="list-unstyled">
							<li><a href="tables.html">Tabel 1</a> </li>
						</ul>
					</li>
					<li class="has_sub">
						<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-area-chart"></i> <span> Charts </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
						<ul class="list-unstyled">
							<li><a href="chart.html">Charts 1</a> </li>
						</ul>
					</li>

				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
			<div class="data-points col-md-12">
				<div class="title-text text-left m-b-20">Data Points</div>
				<p class="font-400">Milestone <span class="text-primary pull-right">80%</span> </p>
				<div class="progress m-b-30">
					<div class="progress-bar progress-bar-primary progress-animated wow animated progress-80" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"> </div>
					<!-- /.progress-bar .progress-bar-danger -->
				</div>
				<!-- /.progress .no-rounded -->
				<p class="font-400">Release <span class="text-pink pull-right">50%</span> </p>
				<div class="progress m-b-20">
					<div class="progress-bar progress-bar-pink progress-animated wow animated progress-50" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"> </div>
					<!-- /.progress-bar .progress-bar-pink -->
				</div>
				<!-- /.progress .no-rounded -->
			</div>
		</div>
	</div>
	 <!--Left Sidebar End-->


	<!-- ============================================================== -->

	<!-- Start right Content here -->
	<div class="content-page">
		<!-- Start content -->
		<div class="content">
			<!-- Page-Title -->
				<div class="navbar-header"
					 style="margin-left: 10px; margin-top: 10px;">
					<img id="ImgSrc" src="" height="10" width="10">

					<a href="javascript:;" class="file glyphicon glyphicon-cloud-upload"style="margin-left: 10px; margin-top: 10px; width: 100px;">上传文件
						<input type="file" id="input" name="input" onchange="upload()" multiple="multiple" />
					</a>
				</div>
				<div id="menubutton">
					<a class="btn btn-primary" href="#"
					   role="button"
					   style="margin-left: 10px; margin-top: 10px; width: 100px;" onclick="return buildfile()">&nbsp;新建文件夹</a>
					<%--<button class="btn btn-primary" onclick="bs4pop.prompt('文件名：', '', function(sure, value){ console.log('我算老:', value);})">新建文件夹</button>--%>
					<div class="btn-group" role="group" id="operation"
						 style="margin-left: 10px; margin-top: 10px;">
						<a class="btn btn-default glyphicon glyphicon-share" href="#" onclick="return share(this)">分享</a>
						<a class="btn btn-default glyphicon glyphicon-download-alt" href="#" id="download" onclick="return downloadFileSelect(this)">下载</a>
						<a class="btn btn-default glyphicon glyphicon-trash" href="#" id="delete" onclick="return deleteall()">删除</a>
						<a class="btn btn-default" href="#" id="main-rename" onclick="return rename()">重命名</a>
						<a class="btn btn-default" href="#" onclick="return copyto()">复制到</a>
						<a class="btn btn-default" href="#" id="main-moveto" onclick="return moveto()">移动到</a>
						<%--<a class="btn btn-default" href="#" style="width: 100px;">推送到云设备</a>--%>
						<%--1<div class="input-group"--%>
							 <%--style="width: 200px; float: right; margin-top: 10px; margin-right: 50px;">--%>
							<%--<input type="text" class="form-control"--%>
								   <%--aria-label="Amount (to the nearest dollar)"> <span--%>
								<%--class="input-group-addon glyphicon glyphicon-search" onclick="searchFile(this)"></span>--%>
						<%--</div>--%>
					</div>

				</div>
			<div class="input-group"
				  style="width: 200px; float: right; margin-top: 10px; margin-right: 50px;">
			<input type="text" class="form-control"
				   aria-label="Amount (to the nearest dollar)"> <span
				class="input-group-addon glyphicon glyphicon-search" onclick="searchFile(this)"></span>
		</div>
			</div>
			<div class="panel panel-default" style="margin-left: 10px; margin-top: 10px">
				<!-- Default panel contents -->
				<div class="panel-heading" id="pathnav">
					<a href="login.action?ID=${username}" path=""> >SmartBox</a>
					<span id="navPath">
			        </span>
				</div>
			</div>
                                    <table class="table table-hover" id="mytable">
                                        <thead>
                                        <tr>
                                            <th><input id="checkAll" type="checkbox" aria-label="..."></th>
                                            <th colspan="4" width="60%">文件名</th>
                                            <th>大小</th>
                                            <th>修改时间</th>
                                        </tr>
                                        </thead>
                                        <tbody id="list" currentPath="">

                                        </tbody>

                                    </table>
                                </div>
									<div class="row mob-center">
										<div class="col-sm-5">
											<%--<p>Showing 20-30 of 50 items</p>--%>
										</div>
										<div class="col-sm-7">
											<ul class="pagination pull-right">
												<li><a href="#"><span class="fa fa-angle-double-left"></span></a></li>
												<li class="active"><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">5</a></li>
												<li><a href="#"><span class="fa fa-angle-double-right"></span></a></li>
											</ul>
										</div>
									</div>
								</div>
						</div>
					</div>
					<!-- Table Ends -->
		</div>
		<!-- container -->
	<!-- ============================================================== -->
		<!-- content -->
		<footer class="footer text-right">

			&copy; 2019. All rights reserved.
		</footer>


<!-- Page Loader -->
<div class="page-loader">
	<a href="#"><img src="../../assets/images/logo-2.png" class="img-responsive center-block" alt=""/></a>
	<span class="text-uppercase">Loading...</span>
</div>

<!-- SmartBox Js files -->
<script>
       var resizefunc = [];
</script>

<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/layer.js"></script>
 <script src="../../assets/js/index.js"></script>
<script src="../../assets/js/pace.min.js"></script>
<script src="../../assets/js/loader.js"></script>
<script src="../../assets/js/detect.js"></script>
<script src="../../assets/js/fastclick.js"></script>
<script src="../../assets/js/waves.js"></script>
<script src="../../assets/js/wow.min.js"></script>
<script src="../../assets/js/jquery.slimscroll.js"></script>
<script src="../../assets/js/jquery.nicescroll.js"></script>
<script src="../../assets/js/jquery.scrollTo.min.js"></script>
<script src="../../assets/pages/jquery.todo.js"></script>
<script src="../../assets/plugins/moment/moment.js"></script>
<script src="../../assets/plugins/morris/morris.min.js"></script>
<script src="../../assets/plugins/raphael/raphael-min.js"></script>
<script src="../../assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="../../assets/pages/jquery.charts-sparkline.js"></script>
<script src="../../assets/js/jquery.app.js"></script>
<script src="../../assets/js/cb-chart.js"></script>
</body>
</html>