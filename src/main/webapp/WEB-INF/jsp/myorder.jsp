<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/5
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>myOrder</title>
</head>
<body>
<table style="text-align: center">
    <tr>
        <th>订单号</th>
        <th>时间</th>
        <th>产品编号</th>
        <th>用户名</th>
        <th>单价</th>
        <th>数量</th>
    </tr>
    <c:forEach items="${listOrder}" var="orders">
        <tr>
            <td>${orders.orderId}</td>
            <td>${orders.orderDate}</td>
            <td>${orders.productId}</td>
            <td>${orders.username}</td>
            <td>${orders.orderMoney}</td>
            <td>${orders.orderNumber}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
