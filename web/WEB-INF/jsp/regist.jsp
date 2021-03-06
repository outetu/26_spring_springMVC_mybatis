﻿<!DOCTYPE html>
<html lang="en">
<head>
<!-- META TAGS -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="SmartBox">

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
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<!-- MODERNIZER -->
<script src="../../assets/js/modernizr.min.js"></script>
</head>
<body class="loreg-page close-it">
<!-- Begin page -->
<div id="logreg-wrapper" class="text-center"> 
	<div class="container">
		<a href="#"><img src="../../assets/images/logo-2.png" class="img-responsive center-block" alt=""/></a>
		<p class="lead">Welcome back</p>
		<p>Please regist your account</p>
		<p>${msg}</p>
		<form action="regist.action">
			<div class="form-group">
				<input type="text" placeholder="Username" class="form-control" id="email" name="username">
			</div>
			<div class="form-group">
				<input type="password" placeholder="Password" class="form-control" id="pwd"name="password">
			</div>
			<div class="cbox">
				<label for="cbox"><input type="checkbox" id="cbox"><span></span> Remember me</label>
			</div>
			<button type="submit" class="btn btn-success btn-md">注册</button>
		</form>
		<p class="copy">&copy; 2019. KFBIOSmart<span>Box</span></p>
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