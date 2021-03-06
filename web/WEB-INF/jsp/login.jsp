﻿<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

<!-- META TAGS -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="KFBIOSmartBox">

<!-- TITLE -->
<title>SMARTBOX | KFBIOS</title>

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

<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<!-- MODERNIZER -->
<script src="../../assets/js/modernizr.min.js"></script>

</head>

<body class="loreg-page close-it">
<!-- Begin page -->
<div id="logreg-wrapper" class="login-style2 text-center"> 
	<div class="container">
		<a href="#"><img src="../../assets/images/logo-2.png" class="img-responsive center-block" alt=""/></a>
		<p class="lead">Welcome back</p>
		<p>${msg}</p>
		<form  action ="login.action">
			<div class="form-group">
				<label>用户名</label>
				<input type="text" placeholder="请输入用户名" class="form-control" id="email"name="username">
			</div>
			<div class="form-group">
				<label>密&nbsp&nbsp&nbsp&nbsp&nbsp码</label>
				<input type="password" placeholder="请输入密码" class="form-control" id="pwd" name ="password">
			</div>
			<button type="submit" class="btn btn-success btn-md">登录</button>
		</form>
        <form action="regist.action">
            <button type="submit" class="btn btn-success btn-md ">注册</button>
        </form>
		<p class="copy">&copy; 2019.KFBIOSmart<span>Box</span></p>
	</div>
</div>
<!-- END wrapper --> 

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

<script src="../../assets/plugins/raphael/raphael-min.js"></script> 
<script src="../../assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script> 
<script src="../../assets/pages/jquery.charts-sparkline.js"></script> 

<script src="../../assets/js/jquery.app.js"></script> 


</body>
</html>