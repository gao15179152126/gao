<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/24
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>shopShow</title>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <style type="text/css">
        #images{
            width: 150px;
            height: 150px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light">
    <!-- Links -->
    <a href="../product/shopShow"><img src="/images/logo.png" height="50" width="180"></a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
        </li>
        <li class="nav-item" >
            <a class="nav-link" href="../product/shopShow">首页</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../user/personal">您好，${user.name}</a>

        </li>
        <li class="nav-item">
            <a class="nav-link" href="../user/outLogin">退出登录</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../cart/cartShow">购物车</a>
        </li>
    </ul>
</nav>
<div>
    <c:forEach items="${list}" var="product">
        <div style="height: 200px; width: 200px; float: left; margin: 20px; text-align: center">
            <div style="height: 150px; width: 150px" >
                <c:if test="${product.productImage != null}">
                    <img src="/upload/${product.productImage}" id="images">
                </c:if>
            </div>
            <div>${product.productName} ${product.productPrice}元</div>
            <div><a href="../cart/addCart?username=${user.username}&productId=${product.productId}">加入购物车</a></div>
        </div>
    </c:forEach>
</div>
<%--<table>
    <tr>
        <th>序号</th>
        <th>类型</th>
        <th>名称</th>
        <th>价格</th>
        <th>图片</th>
        <th>数量</th>
        <th>购物车</th>
    </tr>
    <c:forEach items="${list}" var="product">
        <tr>
            <td>${product.productId}</td>
            <td>${product.productType}</td>
            <td>${product.productName}</td>
            <td>${product.productPrice}</td>
            <td>
                <c:if test="${product.productImage != null}">
                    <img alt="" src="/upload/${product.productImage}" id="images">
                </c:if>
            </td>
            <td>${product.productAmount}</td>
            <th><a href="../cart/addCart?username=${user.username}&productId=${product.productId}">加入购物车</a></th>
        </tr>
    </c:forEach>
</table>--%>
</body>
</html>
