<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
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
<script src="../../js/jquery.min.js" type="text/javascript"></script>
 <script src="../../bootstrap-4.0.0-dist/js/bootstrap.js"></script>
 <script src="../../js/bs4.pop.js"></script>
<link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
<%--right--%>
	<style>
		#collection{
			display: block;
			width: 100%;
			height: 300px;
		}
		#collection a{
			text-decoration: none;
			font-family: "微软雅黑";
			font-size: 12px;
		}
		#collection ul{
			list-style: none;
		}
		#collection ul li{
			display: block;
			width: 100%;
		}
		#list-info{
			height: 40px;
			width: 100%;
			line-height: 220%;
		}
		.list-border{
			border-bottom:solid 1px #F2F6FD;
		}
		#collection li .para{
			font-family: "微软雅黑";
			font-size: 12px;
			color: #666;
		}
		#collection li #warn{
			float:left;
		}
		#collection li #clean{
			text-align: center;
			line-height: 30px;
			height: 30px;
			float:right;
			border:solid 1px #C0D9FE;
			margin: 4px 2px 0 0;
			border-radius: 5%;
			margin-right: 8px;
			padding-right: 5px;
		}
		#clean img{
			float: left;
			margin-top: 6px;
		}
		#clean span{
			float:left;
			color: #3B8CFF;
		}
		#clean:hover{
			opacity: 0.8;
			color: #91AFFF;
		}
		/*-----------list-show------------*/
		.list-collection{
			height: 25px;
			line-height: 25px;
		}
		/*-----------list-table-----------*/
		.list-table{
			height: 30px;
			width: 100%;
			line-height: 220%;
			font-size: 12px;
		}
		.list-table input{
			float:left;margin:7px 0 0 2px;
		}
		.list-table span{
			float: left;
		}
		.list-table span:hover,input:hover{
			background-color: #F6FAFF;
			cursor: pointer;
		}
		/*------list-show-----------*/
		.list-tr{
			height: 30px;
			width: 100%;
			line-height: 220%;
			font-size: 12px;
			margin-top:5px;
		}
		.list-tr input{
			float:left;margin:7px 0 0 2px;
		}
		.list-tr span{
			float: left;
		}
		.para1{
			font-family: "微软雅黑";
			font-size: 12px;
		}
		#revert{
			text-align: center;
			line-height: 19px;
			height: 20px;
			float:right;
			border:solid 1px #C0D9FE;
			border-radius: 5%;
			margin-right: 8px;
			padding-right: 5px;
		}
		#revert img{
			float:left;
		}
		#revert span{
			font-size: 12px;
			font-family: '微软雅黑';
			color: #3B8CFF;
		}
		#revert:hover{
			opacity: 0.8;
			color: #91AFFF;
		}
		.addSrc:hover{
			opacity: 0.8;
			color: #91AFFF;
			cursor: pointer;
		}
		#div1,#div2{
			border: 0;
		}
		/*----------------------*/
		#empty{
			width: 400px;
			text-align: center;
			vertical-align: middle;
			font-size: 12px;
			font-family: "微软雅黑";
			margin: 0 auto;
			margin-top: 5%;
		}
		#empty span{
			color: #666;
		}
		#empty a{
			text-decoration: none;
		}
	</style>
	<script type="text/javascript">
        function mouseOver(i){
            $(".list-tr").eq(i).css("background-color","#F6FAFF");
            $(".addSrc").eq(2*i).attr('src',"../../img/refresh1.png");
            $(".addSrc").eq(2*i+1).attr('src',"../../img/delete.png");
        }
        function mouseOut(){
            $(".list-tr").css("background-color","#FFFFFF");
            $(".addSrc").attr('src',"");
            $(".addSrc").attr('src',"");
        }

        function revertFile(obj){
            var id = $(obj).parent().parent().children(".oneCheck").attr("id");
            $.post("revertDirectory.action", {"fileId":id}, function(data){
                layer.msg(data.msg);
                window.location.reload();
            });
        }
// 还原
        function revertAllFiles(){
            var $allFiles = $("input[name='check_name']:checked");
            var fileId = new Array();
            $.each($allFiles,function(i,n){
                fileId[i] = $(this).attr("id");
            });
            $.ajax({
                type:"POST",
                url:"revertDirectory.action",
                data:{
                    "fileId":fileId,
                },
                success:function(data){
                    layer.msg(data.msg);
                    setTimeout('window.location.reload()',2500);
                },
                traditional:true
            });
        }

        function delAllFiles(){
            layer.confirm('确认清空回收站？', {
                btn: ['确认','返回'] //按钮
            }, function(){
                $.ajax({
                    type:"POST",
                    url:"../files/delAllRecycle.action",
                    data:{
                    },
                    success:function(data){
                        layer.msg(data.msg);
                        window.location.reload()
                    },
                    traditional:true
                });
            }, function(){
            });
        }

        function delFile(obj){
            layer.confirm('确认删除？', {
                btn: ['确认','返回'] //按钮
            }, function(){
                var id = $(obj).parent().parent().children(".oneCheck").attr("id");
                $.post("../files/delRecycle.action", {"fileId":id}, function(data){
                    layer.msg(data.msg);
                    window.location.reload();
                });
            }, function(){
            });
        }

        // 	function

        $(document).ready(function(){
            /* 点击事件 */
            $("#fileCheck").click(function(){
                if($("#fileCheck").is(":checked")){
                    $("#div2").attr('style',"display:block");
                    $("#div1").attr('style',"display:none;");
                    $(".oneCheck").prop('checked',true);
                    $num = $("input:checked");
                    $("#num").html($num.length-1);
                }
            })
            /* 移开事件 */
            $("#fileCheck").mouseup(function(){
                if($("#fileCheck").is(":checked")){
                    $("#div1").attr('style',"display:block");
                    $("#div2").attr('style',"display:none;");
                    $(".oneCheck").prop('checked',false);
                }
            })


            $(".oneCheck").click(function(){
                if($(".oneCheck").is(":checked")){
                    $("#div2").attr('style',"display:block");
                    $("#div1").attr('style',"display:none;");
                    $("#fileCheck").prop('checked',true);

                    $num = $("input:checked");
                    $("#num").html($num.length-1);
                }
            })
            $(".oneCheck").mouseup(function(){
                if($(".oneCheck").is(":checked")){
                    $("#div1").attr('style',"display:block");
                    $("#div2").attr('style',"display:none;");
                    $("#fileCheck").prop('checked',false);
                }
            })

        })
	</script>
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
					<li class="menu-title"></li>
					<li> <a href="../login.action?ID=1234" class="waves-effect"> <i class="fa fa-envelope"></i> <span>全部文件 </span> </a> </li>
					<%--<li class="has_sub">--%>
						<%--<a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-dashboard"></i> <span> 找资源 </span> <span class="label label-success pull-right">1</span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>--%>
						<%--<ul class="list-unstyled">--%>
							<%--<li><a href="http://m.jspoo.com/zysearch.html">Dashboard1</a> </li>--%>
						<%--</ul>--%>
					<%--</li>--%>

					<li> <a href="recycleFile.action" class="waves-effect"> <i class="icon-briefcase"></i> <span> 回收站 </span> </a> </li>
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
			<div class="page-title-group">
				<h4 class="page-title">回收站</h4>
				<%--<h5 class="text-muted page-title-alt">Sub Title</h5>--%>
			</div>

			<c:choose>
			<c:when test="${findDelFile == null}">
			<div id="empty" style="display:block;">
				<img src="../../img/empty.png" />
				<p style="margin-bottom:20px;color: #878C8D;">您的回收站为空噢~</p>
				<%--<span>--%>
					<%--回收站为你保存10天内删除的--%>
					<%--文件，想要延长保存时间？--%>
					<%--<p>--%>
						<%--开通会员--%>
						<%--<a href="#">延长至15天</a>开通超级会员--%>
						<%--<a href="#">延长至35天</a>--%>
					<%--</p>--%>
				<%--</span>--%>
			</div>
			</c:when>
			<c:when test="${findDelFile != null}">
			<div style="display:block" id="collection">
				<ul>
					<li id="list-info" class="list-border">
						<span class="para" id="warn">
							<%--，文件保存10天后将自动被清除--%>
							提示:回收站不占用网盘空间。
					<%--<a href="#" style="color: #3B8CFF;">开通会员</a>延长至15天,--%>
					<%--<a href="#" style="color: #3B8CFF;">开通超级会员</a>--%>
							<%--延长至30天--%>
						</span>
						<span class="para" id="clean">
						<img src="../../img/delete.png"/>
						<span style="cursor: pointer;" onclick="delAllFiles()">清空回收站</span>
					</span>
					</li>
					<li class="list-collection" style="display: none">
						<span style="font-size: 12px;float:left;">回收站</span>
						<span style="font-size: 12px;float:right">已加载<span>1</span>个</span>
					</li>

					<li class="list-border">
						<input type="checkbox" id="fileCheck" style="float: left;margin-top: 0.6%;margin-left: 0.2%;"/>
						<div style="display: block;border: 0;" class="list-table" id="div1">
							<span style="width: 54%;height:100%;">文件名</span>
							<span style="width: 15%;height:100%;">大小</span>
							<span style="width: 16%;height:100%;">删除时间</span>
							<span style="width: 12%;height:100%;">有效时间</span>
						</div>
						<div style="display: none;border: 0;" class="list-table" id="div2">
							<span style="font-size: 12px;float:left;">
								<span style="float: left;">已选中</span>
								<span style="float: left;" id="num">1</span>个文件/文件夹
							</span>
							<span  onclick="revertAllFiles()" class="para1" id="revert" style="margin-top:4px;float: left;margin-left: 1.5%;">
								<img src="../../img/refresh1.png"/>
								<span style="cursor: pointer;">还原</span>
							</span>
						</div>
					</li>
					<c:forEach items="${findDelFile}" var="delFile" varStatus="index">
						<li class="list-tr" class="list-border" style="cursor:pointer;" onmouseover="mouseOver(${index.index})" onmouseout="mouseOut()">
							<input type="checkbox" class="oneCheck" name="check_name" id="${delFile.fileId }"/>
							<span style="width: 49%;height:100%;float:left;">
								<img style="float: left;margin: 3px 4px 0 5px;" src="../../img/picture.png" />
								<span style="float:left;">${delFile.fileName }</span>
							</span>
							<span style="float:left;margin-top: 0.5%;width:5%;">
									<img style="float:left" class="addSrc" src="" onclick="revertFile(this)"/>
									<img style="float: left;margin-left: 10px;" onclick="delFile(this)" class="addSrc" src="" />
							</span>
							<span style="width: 15%;height:100%;float:left;">${delFile.fileSize }</span>
							<span style="width: 16%;height:100%;float:left">${delFile.lastTime }</span>
							<span style="width: 12%;height:100%;float:left">10天</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:when>
			</c:choose>

		</div>
		<!-- container -->
	</div>
	<!-- content -->

		<!-- container -->
	<!-- ============================================================== -->
		<!-- content -->
		<%--<footer class="footer text-right">--%>

			<%--&copy; 2019. All rights reserved.--%>
		<%--</footer>--%>


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
 <%--<script src="../../assets/js/index.js"></script>--%>
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