<%--
  Created by IntelliJ IDEA.
  User: 王者
  Date: 2019/9/5
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="upload">
    <h2>文件上传</h2>
    <form  action="upload"  >
        选择文件:<input type="file" name="file"/><br/>
        <input type="hidden" name="path" value="${requestScope.folderId}" />
        <input type="submit" value="上传"/>
    </form>
</div>
<div>
    <h2>新建文件夹</h2>
    <form  action="folderAdd" >
        <a>文件夹名:</a>
        <input type="text" name="folderName"/><br/>
        <input type="hidden" name="path" value="${requestScope.folderId}" />
        <input type="submit" value="新建" />
    </form>
</div>

<div>
    //多文件上传
    <form action="upload.action" method="post" enctype="multipart/form-data">
        一次选择多个文件的多文件上传 : <br />
        <input type="file" name="files" multiple>
        <input type="submit" name="提交">
    </form>
</div>

</body>
</html>
