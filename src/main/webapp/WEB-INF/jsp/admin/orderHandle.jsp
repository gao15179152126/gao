<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/19
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../common/link/head.jsp"></jsp:include>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="popover"]').popover({
                html: true
            });
        });
    </script>
    <title>订单处理</title>
</head>
<body>
<jsp:include page="../../common/head.jsp"></jsp:include>
<div class="container" style="margin-top: 70px">
    <table class="table table-bordered">
        <caption><strong style="font-size: 150%">已付款订单处理</strong></caption>
        <thead>
        <tr>
            <th>#</th>
            <th>时间</th>
            <th>单号</th>
            <th>详情</th>
            <th>地址</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${statusOrders}" var="statusOrder">
            <tr>
                <th scope="row">${statusOrder.orderId}</th>
                <td>${statusOrder.orderDate}</td>
                <td>${statusOrder.orderNo}</td>
                <td>
                    <button name="orderDetails" type="button"
                            class="btn btn-info" data-container="body" data-toggle="popover" data-placement="bottom"
                            data-content="">详情
                    </button>
                </td>
                <td>${statusOrder.address}</td>
                <td>
                    <button type="button" class="btn btn-primary"
                            onclick="location.href='/admin/finishOrder?orderNo=${statusOrder.orderNo}'">完成
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript">
    window.onload = function () {
        $("[name = orderDetails]").each(function () {
            var orderNo = $(this).parent().prev().text();
            var _this = $(this);
            $.post("/admin/orderDetails", {no: orderNo}, function (data) {
                var content = "<table class=\"table table-bordered\"><thead><tr><th>商品</th><th>价格</th><th>数量</th></tr></thead><tbody>";
                $.each(data.result, function (i, orderDetail) {
                    content += "<tr><td>" + orderDetail.productName + "</td><td>" + orderDetail.productPrice + "</td><td>" + orderDetail.productNumber + "</td></tr>"
                });
                content += "</tbody></table>";
                console.info(content);
                console.info($(this));
                _this.attr('data-content', content)
            })
        })
    };
</script>
</html>
