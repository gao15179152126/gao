<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>personal</title>
</head>
<body>
    <table border="1">
        <tr>
            <td>序号</td>
            <td>${sessionScope.user.id}</td>
        </tr>
        <tr>
            <td>用户名</td>
            <td>${sessionScope.user.username}</td>
        </tr>
        <tr>
            <td>密码</td>
            <td>${sessionScope.user.password}</td>
        </tr>
        <tr>
            <td>名字</td>
            <td>${sessionScope.user.name}</td>
        </tr>
        <tr>
            <td>手机号</td>
            <td>${sessionScope.user.telephone}</td>
        </tr>
        <tr>
            <td>余额</td>
            <td>${sessionScope.user.balance}</td>
        </tr>
        <tr>
            <td>VIP</td>
            <td>${sessionScope.user.vip}</td>
        </tr>
        <tr>
            <td>积分</td>
            <td>${sessionScope.user.point}</td>
        </tr>
    </table>
</body>
</html>
