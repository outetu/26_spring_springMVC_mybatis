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
	<%--图片阅览弹框--%>
	<link rel="stylesheet" href="../../assets/css/lightbox.css"  />

    <%--图标--%>
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
    <%--<link rel="stylesheet" href="../../assets/css/style.css">--%>
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
                        <%--<li class="dropdown top-menu-item-xs">--%>
                            <%--<a href="javascript:void(0)" class="right-bar">--%>
                                <%--&lt;%&ndash;<span class="user-name">Hoang.Thai</span>&ndash;%&gt;--%>
                                <%--<span class="caret"></span>--%>
                                <%--<img src="../../assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle">--%>
                            <%--</a>--%>
                        <%--</li>--%>

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
						<%--<li class="dropdown top-menu-item-xs">--%>
							<%--<a href="javascript:void(0)" class="right-bar-toggle profile waves-effect waves-light"><span class="user-name">Hoang.Thai</span>--%>
							<%--<span class="caret"></span>--%>
							<%--<img src="../../assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle">--%>
							<%--</a>--%>
						<%--</li>--%>
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
					<li class="menu-title"></li>
					<%--<li class="has_sub">--%>
						<%--<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-dashboard"></i> <span> 找资源 </span> <span class="label label-success pull-right">1</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>--%>
						<%--<ul class="list-unstyled">--%>
							<%--<li><a href="http://m.jspoo.com/zysearch.html">Dashboard1</a> </li>--%>
						<%--</ul>--%>
					<%--</li>--%>
                    <li> <a href="login.action?ID=1234" class="waves-effect"> <i class="fa fa-envelope"></i> <span> 全部文件 </span> </a> </li>
					<li> <a href="files/recycleFile.action" class="waves-effect"> <i class="icon-briefcase"></i> <span> 回收站 </span> </a> </li>
					<li> <a href="http://m.jspoo.com/zysearch.html" class="waves-effect"> <i class="icon-search"></i><span> 找资源 </span> </a> </li>
					<li class="has_sub">
                        <%--直接打开下拉--%>
						<a href="javascript:void(0);" class="waves-effect "> <i class="icon-sitemap"></i> <span> 更多功能</span> <span class="label label-warning pull-right">3</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
						<ul class="list-unstyled ">
							<li><a href="404.html">在线电影</a> </li>
							<li><a href="blank.html">查询工具</a> </li>
							<li><a href="buttons.html">学习专区</a> </li>
						</ul>
					</li>

					<li> <a href="profile.html" class="waves-effect"> <i class="fa fa-user"></i> <span> 设置</span> </a> </li>


					<%--<li class="text-muted menu-title">Component</li>--%>

					<%--<li class="has_sub">--%>
						<%--<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-tasks"></i> <span> Forms </span>  <span class="label label-warning pull-right">3</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>--%>
						<%--<ul class="list-unstyled">--%>
							<%--<li><a href="form-elements.html">Form Elements</a> </li>--%>
							<%--<li><a href="login.html"> Login</a> </li>--%>
							<%--<li><a href="login2.html"> login2</a> </li>--%>
						<%--</ul>--%>
					<%--</li>--%>
					<%--<li class="has_sub">--%>
						<%--<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-table"></i> <span> Tabels </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>--%>
						<%--<ul class="list-unstyled">--%>
							<%--<li><a href="tables.html">Tabel 1</a> </li>--%>
						<%--</ul>--%>
					<%--</li>--%>
					<%--<li class="has_sub">--%>
						<%--<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-area-chart"></i> <span> Charts </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>--%>
						<%--<ul class="list-unstyled">--%>
							<%--<li><a href="chart.html">Charts 1</a> </li>--%>
						<%--</ul>--%>
					<%--</li>--%>

				</ul>
				<%--<div class="clearfix"></div>--%>
			</div>
			<div class="clearfix"></div>
			<div class="data-points col-md-12">
				<div class="title-text text-left m-b-20">容量</div>
				<p class="font-500"><span id="countSize">${countSize}</span>/<span id="totalSize">${totalSize}</span> <span id="sizeprogress"class="text-primary pull-right"></span> </p>
				<div class="progress m-b-30">
					<div id="progressview" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" aria-valuemin="0" > </div>
					<%--<!-- /.progress-bar .progress-bar-danger -->--%>
				</div>

				<!-- /.progress .no-rounded -->
				<%--<p class="font-400">Release <span id="sizeprogress"class="text-pink pull-right"></span> </p>--%>
				<%--<div class="progress m-b-20">--%>
					<%--<div class="progress-bar progress-bar-pink progress-animated wow animated progress-50" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"> </div>--%>
					<%--<!-- /.progress-bar .progress-bar-pink -->--%>
				<%--</div>--%>
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
			<div class="right">
				<div>
                    <div class="navbar-header"
                         style="margin-left: 10px; margin-top: 10px;">
                        <!-- 			<img id="ImgSrc" src="" height="10" width="10">
                                         <a class="btn btn-default glyphicon glyphicon-cloud-upload" href="#"
                                        style="font-size: 15px; height:40px; width: 100px;" onclick="return upload(this)">上传</a>
                                     -->
                        <a href="javascript:;" class="file glyphicon glyphicon-cloud-upload">上传文件
                            <input type="file" id="input" name="input" onchange="upload()" multiple="multiple" />
                        </a>
                    </div>
					<%--<div class="navbar-header" style="margin-left: 10px; margin-top: 10px;">--%>
						<%--<!-- 			<img id="ImgSrc" src="" height="10" width="10">--%>
                                         <%--<a class="btn btn-default glyphicon glyphicon-cloud-upload" href="#"--%>
                                        <%--style="font-size: 15px; height:40px; width: 100px;" onclick="return upload(this)">上传</a>--%>
                                     <%---->--%>
						<%--<a class="file glyphicon glyphicon-cloud-upload" href="javascript:;">上传文件--%>
							<%--<input name="input" id="input" onchange="upload()" value="" type="file" multiple="multiple">--%>
						<%--</a>--%>
					<%--</div>--%>
					<div id="menubutton">
						<a class="btn btn-default glyphicon glyphicon-folder-open" role="button" style="margin-left: 10px; margin-top: 10px; width: 120px;" onclick="return buildfile()" href="#">&nbsp;新建文件夹</a>
						<div class="btn-group" id="operation" role="group" style="margin-top: 10px; margin-left: 10px; display: inline-block;">
							<a class="btn btn-default glyphicon glyphicon-share" onclick="return share(this)" href="#">分享</a>
							<a class="btn btn-default glyphicon glyphicon-download-alt" id="download" onclick="return downloadFileSelect(this)" href="#">下载</a>
							<a class="btn btn-default glyphicon glyphicon-trash" id="delete" onclick="return deleteall()" href="#">删除</a>
							<a class="btn btn-default" id="main-rename" onclick="return rename()" href="#">重命名</a>
							<a class="btn btn-default" onclick="return copyto()" href="#">复制到</a>
							<a class="btn btn-default" id="main-moveto" onclick="return moveto()" href="#">移动到</a>
							<a class="btn btn-default" style="width: 100px;" href="#">推送到云设备</a>
						</div>
						<div class="input-group" style="width: 200px; float: right; margin-top: 10px; margin-right: 50px;">
							<input class="form-control" aria-label="Amount (to the nearest dollar)" type="text"> <span class="input-group-addon glyphicon glyphicon-search" onclick="searchFile(this)"></span>
						</div>
					</div>
				</div>
<%--面包导航--%>
<div class="panel-heading" id="pathnav">
					<%--<a href="login.action?ID=${username}" path="">--%>
						<a href="index.action" path="">
						<i class="icon-home" ></i> SmartBox <i class="icon-chevron-sign-right" style="color: #59555F"></i></a>
					<span id="navPath">
			        </span>

					</div>

					<table class="table table-hover" id="mytable">
						<thead>
						<tr>
							<th><input id="checkAll" aria-label="..." type="checkbox"></th>
							<th width="60%" colspan="4">文件名</th>
							<th>大小</th>
							<th>修改时间</th>
						</tr>
						</thead>
						<tbody id="list" currentpath=""><tr><td>
							<input name="check_name" aria-label="..." onclick="selectCheckbox()" type="checkbox"></td><td width="60%"><a onclick="return openFile(this)" href="#" filetype="folder-open" prepath="\"><span class="glyphicon glyphicon-folder-open" style="margin-right: 10px"></span>image</a></td><td width="32"></td><td width="32"><a title="下载" class="glyphicon glyphicon-download-alt" onclick="return downloadFile(this)" href="#"></a></td><td width="32"><a title="更多" class="glyphicon glyphicon-option-horizontal" href="#"></a></td><td>-</td><td>2019-09-19 08:17:06</td></tr><tr><td>
							<input name="check_name" aria-label="..." onclick="selectCheckbox()" type="checkbox"></td><td width="60%"><a onclick="return openFile(this)" href="#" filetype="folder-open" prepath="\"><span class="glyphicon glyphicon-folder-open" style="margin-right: 10px"></span>music</a></td><td width="32"></td><td width="32"><a title="下载" class="glyphicon glyphicon-download-alt" onclick="return downloadFile(this)" href="#"></a></td><td width="32"><a title="更多" class="glyphicon glyphicon-option-horizontal" href="#"></a></td><td>-</td><td>2019-09-19 08:17:06</td></tr><tr><td>
							<input name="check_name" aria-label="..." onclick="selectCheckbox()" type="checkbox"></td><td width="60%"><a onclick="return openFile(this)" href="#" filetype="folder-open" prepath="\"><span class="glyphicon glyphicon-folder-open" style="margin-right: 10px"></span>source</a></td><td width="32"></td><td width="32"><a title="下载" class="glyphicon glyphicon-download-alt" onclick="return downloadFile(this)" href="#"></a></td><td width="32"><a title="更多" class="glyphicon glyphicon-option-horizontal" href="#"></a></td><td>-</td><td>2019-09-19 08:17:06</td></tr><tr><td>
							<input name="check_name" aria-label="..." onclick="selectCheckbox()" type="checkbox"></td><td width="60%"><a onclick="return openFile(this)" href="#" filetype="folder-open" prepath="\"><span class="glyphicon glyphicon-folder-open" style="margin-right: 10px"></span>vido</a></td><td width="32"></td><td width="32"><a title="下载" class="glyphicon glyphicon-download-alt" onclick="return downloadFile(this)" href="#"></a></td><td width="32"><a title="更多" class="glyphicon glyphicon-option-horizontal" href="#"></a></td><td>-</td><td>2019-09-19 08:17:06</td></tr></tbody>
					</table>
				</div>
        </div>
			</div>
		<!-- container -->
	<!-- ============================================================== -->
    <!-- Right Sidebar -->
    <%--<div class="side-bar right-bar">--%>
        <%--<div class="slimscrollleft">--%>
            <%--<!-- Cotact list -->--%>
            <%--<div class="contact-list">--%>
                <%--<div class="contact-list-link">--%>
                    <%--<ul class="nav nav-tabs tabs">--%>
                        <%--<li class="active tab">--%>
                            <%--<a href="#cl-tab1" data-toggle="tab" aria-expanded="false">--%>
                                <%--<i class="fa fa-users"></i>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="tab">--%>
                            <%--<a href="#cl-tab2" data-toggle="tab" aria-expanded="false">--%>
                                <%--<i class="fa fa-comments"></i>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="tab">--%>
                            <%--<a href="#cl-tab3" data-toggle="tab" aria-expanded="false">--%>
                                <%--<i class="fa fa-gear"></i>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="tab-content">--%>
                    <%--<!-- Active Contact -->--%>
                    <%--<div class="tab-pane active" id="cl-tab1">--%>
                        <%--<h4 class="text-center">Who to follow</h4>--%>
                        <%--<ul class="list-group contacts-list">--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="info-prof">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="info-prof">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<div class="text-center"><a href="javascript:void(0)" class="btn btn-primary dropdown-toggle waves-effect m-t-30">More Connections</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!-- Active Contact -->
                    <%--<div class="tab-pane active" id="cl-tab2">--%>
                        <%--<h4 class="text-center">Conversation</h4>--%>
                        <%--<ul class="list-group contacts-list">--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="info-prof">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="info-prof">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<div class="text-center"><a href="javascript:void(0)" class="btn btn-primary dropdown-toggle waves-effect m-t-30">More Connections</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<!-- Active Contact -->--%>
                    <%--<div class="tab-pane active" id="cl-tab3">--%>
                        <%--<h4 class="text-center">Setting</h4>--%>
                        <%--<ul class="list-group contacts-list">--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="info-prof">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="info-prof">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle danger"></i>--%>
                                        <%--<img src="assets/images/users/avatar-1.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Amelia Nelson</span>--%>
                                        <%--<span class="info-prof">UI Graphic</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-2.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Alyssa Molligan</span>--%>
                                        <%--<span class="info-prof">Art director, Movie Cut</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                            <%--<li class="list-group-item">--%>
                                <%--<a href="javascript:void(0)">--%>
                                    <%--<div class="thumb-box">--%>
                                        <%--<i class="fa fa-circle online"></i>--%>
                                        <%--<img src="assets/images/users/avatar-3.jpg" alt="">--%>
                                    <%--</div>--%>
                                    <%--<div class="info-box">--%>
                                        <%--<span class="info-name">Kaitlyn Eddington</span>--%>
                                        <%--<span class="">Writter, Mag Editor</span>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                                <%--<span class="clearfix"></span>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<div class="text-center"><a href="javascript:void(0)" class="btn btn-primary dropdown-toggle waves-effect m-t-30">More Connections</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="clear"></div>--%>
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
<script src="../../assets/js/lightbox.js"></script>
</body>
</html>