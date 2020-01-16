<%--
  Created by IntelliJ IDEA.
  User: 王者
  Date: 2019/9/3
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    /*<script>
    function getFiles(){
        $.ajax(
            {
                url:"getFiles.action",
                type:"post",
                dataType:"json",
                success:function (data) {
                    alert("111")
                }
            }
        )};
</script>*/
    <title>Title</title>
</head>
<body>
<div>
    <button onclick="getFiles()">Click me</button>
</div>
<div>
    <div class="navbar-header"
         style="margin-left: 10px; margin-top: 10px;">
        <!-- 			<img id="ImgSrc" src="" height="10" width="10">
                         <a class="btn btn-default glyphicon glyphicon-cloud-upload" href="#"
                        style="font-size: 15px; height:40px; width: 100px;" onclick="return upload(this)">上传</a>
                     -->
        <a class="btn btn-primary btn-md" href="#">上传文件<input type="file" id="input" name="input" onchange="upload()" multiple="multiple" />
        </a>
    </div>
    <div id="menubutton">
        <a class="btn btn-default glyphicon glyphicon-folder-open" href="#"
           role="button"
           style="margin-left: 10px; margin-top: 10px; width: 100px;" onclick="return buildfile()">&nbsp;新建文件夹</a>
        <div class="btn-group" role="group" id="operation"
             style="margin-left: 10px; margin-top: 10px;">
            <a class="btn btn-default glyphicon glyphicon-share" href="#" onclick="return share(this)">分享</a>
            <a class="btn btn-default glyphicon glyphicon-download-alt" href="#" id="download" onclick="return downloadFileSelect(this)">下载</a>
            <a class="btn btn-default glyphicon glyphicon-trash" href="#" id="delete" onclick="return deleteall()">删除</a>
            <a class="btn btn-default" href="#" id="main-rename" onclick="return rename()">重命名</a>
            <a class="btn btn-default" href="#" onclick="return copyto()">复制到</a>
            <a class="btn btn-default" href="#" id="main-moveto" onclick="return moveto()">移动到</a>
            <a class="btn btn-default" href="#" style="width: 100px;">推送到云设备</a>
        </div>
        <div class="input-group"
             style="width: 200px; float: right; margin-top: 10px; margin-right: 50px;">
            <input type="text" class="form-control"
                   aria-label="Amount (to the nearest dollar)"> <span
                class="input-group-addon glyphicon glyphicon-search" onclick="searchFile(this)"></span>
        </div>
    </div>
</div>
<div class="panel panel-default" style="margin-left: 10px; margin-top: 10px">
    <!-- Default panel contents -->
    <div class="panel-heading" id="pathnav">
        <a href="index.action" path="">yun盘 ></a>
        <span id="navPath">
			</span>
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
    /*<div class="page-title-group">
    <div>
        <a class="btn btn-primary btn-md" href="#">上传文件<input type="file" id="input" name="input" onchange="upload()" multiple="multiple" />
        </a>
    </div>
    <div>
        <a href="#" role="button" onclick="return buildfile()">&nbsp;新建文件夹</a>
        <h4 class="page-title">Tables</h4>
        <h5 class="text-muted page-title-alt">Sub Title</h5>
    </div>
    <div class="cb-page-content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-box">
                        <div class="card-box-head  border-b m-t-0">
                            <h4 class="header-title"><b>Button Tables</b></h4>
                        </div>
                        <div class="card-box-content form-compoenent">
                            <div class="cb-res-table">
                                <div class="cb-table-search">
                                    <div class="dropdown pull-left ">
                                        <a href="#" class="btn btn-primary btn-sm">新建</a>
                                        <a href="#" class="btn btn-primary btn-sm">移动</a>
                                        <a href="#" class="btn btn-primary btn-sm">复制</a>
                                    </div>*/
                                    <div class="input-group pull-right cb-ta-search">
                                        <input type="text" class="form-control" placeholder="文件名">
                                        <span class="input-group-btn">
												<button class="btn btn-default" type="button">查询</button>
												</span>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <br>
                            <div class="table-responsive data-table">
                            </div>
                        <!-- 			<img id="ImgSrc" src="" height="10" width="10">
                                                       <a class="btn btn-default glyphicon glyphicon-cloud-upload" href="#"
                                                      style="font-size: 15px; height:40px; width: 100px;" onclick="return upload(this)">上传</a>
                                                   -->
</body>
</html>
