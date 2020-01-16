<%@ page import="com.qst.po.User" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/1/16
  Time: 10:58
  To change this template use FileCustom | Settings | FileCustom Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="updateCustomer.action">
    <h>${customerrtn.user_id}</h>
    <input type="hidden" name="iuser_id" value="${customerrtn.user_id}">
<br>
<input type="text" name="username" value="${customerrtn.username}">
<br>

<%--<input type="radio" name="gender" value="1" ${customer.gender == "1"?"checked":""}>男--%>
<%--<input type="radio" name="gender" value="0" ${customer.gender == "0"?"checked":""}>女--%>

<%--<br>--%>
<%--<input type="text" name="address" value="${user.address}"><br>--%>
<input type="submit" value="保存">
</form>
</body>
</html>
