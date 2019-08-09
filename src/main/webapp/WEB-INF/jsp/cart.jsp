<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/31
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>cart</title>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/extra/jquery-3.2.1/jquery-3.2.1.min.js"></script>
    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style type="text/css">
        #images{
            width: 100px;
            height: 150px;
        }
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
        $("[name = checkItem]").click(function () {
            refreshTotalPrice();
        })
        $("[name = addButton]").click(function () {
            addNumber($(this).prev());
            refreshTotalPrice();
        })
        $("[name = delButton]").click(function () {
            delNumber($(this).next());
            refreshTotalPrice();
        })
    });
    function refreshTotalPrice() {
        var total = 0;
        $("[name = checkItem]:checked").each(function (i, e) {
            var singlePrice = parseFloat($(this).parent().parent().children().eq(-3).text());
            var number = parseInt($(this).parent().parent().children().eq(-2).children().eq(-2).text());
            var price = singlePrice*number;
            total += parseFloat(price);
        });
        $("#total").text(total);
    }
    function addNumber(labelForNum) {
        var number = parseInt($(labelForNum).text());
        number += 1;
        $(labelForNum).text(number);
    }
    function delNumber(labelForNum) {
        var number = parseInt($(labelForNum).text());
        if(number<=0) number=0
        else number -= 1;
        $(labelForNum).text(number);
    }
    /*function orderObj(productId,username,orderMoney,orderNumber) {
        this.productId = productId;
        this.username = username;
        this.orderMoney = orderMoney;
        this.orderNumber = orderNumber;
    }*/
    function submit() {
        var order=[];
        $("[name = checkItem]:checked").each(function (i, e){
            var productId = parseInt($(this).parent().next().next().text());
            var username = $(this).parent().next().text()
            var orderMoney = parseFloat($(this).parent().next().next().next().next().next().text());
            var orderNumber = parseInt($(this).parent().next().next().next().next().next().next().children().eq(1).text());
            order.push({"productId":productId,"username":username,"orderMoney":orderMoney,"orderNumber":orderNumber})
        });
        var orderList = JSON.stringify(order);
        $.ajax({
            async: false,
            contentType:'application/json',
            type:'post',
            data:orderList,
            dateType:'json',
            url:'/order/submitOrder',
            success:function () {
                alert('success')
                location.replace("/order/myOrder")
            }
        })
    }
</script>
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
<table style="text-align: center">
    <tr>
        <th>选择</th>
        <th>用户名</th>
        <th>产品编号</th>
        <th>图片</th>
        <th>产品状态</th>
        <th>单价</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${listCart}" var="productCart">
        <tr name="product">
            <td><input type="checkbox" name="checkItem"/></td>
            <td name = "username">${productCart.username}</td>
            <td name = "productId">${productCart.productId}</td>
            <td><img alt="" src="/upload/${productCart.productImage}" id="images"></td>
            <td>${productCart.cartStatus}</td>
            <td name = "price">${productCart.cartMoney}</td>
            <td><button name="delButton">-</button><label name="num">1</label><button name="addButton">+</button></td>
            <td><a href="/cart/deleteCart?username=${productCart.username}&productId=${productCart.productId}">删除</a></td>
        </tr>
    </c:forEach>
</table>
合计：<label id="total">0</label>元<button name="submit" style="margin-left: 20px" onclick="submit()">结算</button>
</body>
</html>
