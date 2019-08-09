<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/23
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <%--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <title>list</title>
    <style type="text/css">
        #images{
            width: 150px;
            height: 250px;
        }
    </style>
</head>
<body>

<table class="table table-bordered table-hover">
    <tr>
        <th>序号</th>
        <th>图片</th>
    </tr>
    <c:forEach items="${list}" var="product">
        <tr>
            <td>${product.pid}</td>
            <td>
                <c:if test="${product.pimage != null}">
                    <img alt="" src="/upload/${product.pimage}" id="images">
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
