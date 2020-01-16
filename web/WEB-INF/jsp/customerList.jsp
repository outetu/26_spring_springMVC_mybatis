<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/1/15
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<%--<script>--%>
    <%--function modifySubmit(modifyButton) {--%>
        <%--//document.getElementsByName("id")[0].value = customerId;--%>
        <%--alert(modifyButton.getAttribute("data-id"))--%>
        <%--document.forms[0].submit();--%>
    <%--}--%>
<%--</script>--%>
<body>
<form action="selectCustomerList.action">
<input type="text" name="username" value="${customerSearchItem.username}">
    <input type="hidden" name="flg" value="0">
<input type="submit">
<table>
<c:forEach items="${customerList}" var="item">
    <tr>
        <td>
                ${item.user_id}
        </td>
        <td>
                ${item.username}
        </td>
        <%--<td>--%>
                <%--<c:if test="${item.gender == '1'}">--%>
                    <%--男--%>
                <%--</c:if>--%>
                <%--<c:if test="${item.gender == '0'}">--%>
                    <%--女--%>
                <%--</c:if>--%>
        <%--</td>--%>
        <td>
                ${item.password}
        </td>
        <td>
            <%--<input type="button" value="修改" onclick="modifySubmit(${item.id})">--%>
                <%--<input type="button" value="修改" data-id="${item.id}" onclick="modifySubmit(this)">--%>
            <a href="selectCustomer.action?id=${item.user_id}">修改</a>
        </td>
        <td>
            <a href="selectCustomer.action?id=${item.user_id}">删除</a>
        </td>
    </tr>
</c:forEach>
    <%--<input type="hidden" name="id">--%>
</table>
</form>
<%--<%--%>
<%--session.removeAttribute("customer");--%>
<%--%>--%>
</body>
</html>
