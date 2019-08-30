<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/20
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../common/link/head.jsp"></jsp:include>
    <title>订单查询</title>
    <script>
        //订单号查询
        function submitOrderNo() {
            $("#orderNoExist").css('display', 'none');
            var queryOrderNo = $("#queryOrderNo").val();
            $.post("../admin/orderFindByNo?no=" + queryOrderNo, function (data) {
                if (data.result == null) {
                    $("#orderNoNotExist").css('display', 'block');
                    alert("订单号不存在")
                } else {
                    $("#noOrderNo").text("订单号：" + data.result.orderNo);
                    $("#noOrderStatus").text("状态：" + data.result.orderStatus);
                    var content = "";
                    $.each(data.result.orderDetails, function (i, orderDetail) {
                        content += "<li>名称：" + orderDetail.orderDetailId + " 价格：￥" + orderDetail.productPrice + " 数量：" + orderDetail.productNumber + "</li>"
                    });
                    $("#noOrderDetails").html(content);
                    var invalidTime = new Date(data.result.orderDate).toLocaleString();
                    $("#noOrderDate").text(invalidTime);
                    if ("" == data.result.address || data.result.address == null) {
                        $("#noOrderAddress").text("");
                    } else {
                        $("#noOrderAddress").text("收货地址：" + data.result.address);
                    }
                    $("#noOrderMoney").text("总额￥：" + data.result.orderMoney);
                    $("#noOrderUsername").text("用户名：" + data.result.username);
                    $("#orderNoNotExist").css('display', 'none');
                    $("#orderNoExist").css('display', 'block')
                }
            })
        }
    </script>
</head>
<body>
<jsp:include page="../../common/head.jsp"></jsp:include>
<div class="container" style="padding-top: 70px">
    <div class="row">
        <div class="col-lg-6">
            <form class="form-inline" action="/admin/orderFind" method="post">
                <div class="form-group">
                    <label for="startDateTime">起始时间</label>
                    <input name="start" type="date" class="form-control" id="startDateTime" value="${startDate}">
                </div>
                <div class="form-group">
                    <label for="endDateTime">结束时间</label>
                    <input name="end" type="date" class="form-control" id="endDateTime" value="${endDate}">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div><!-- /.col-lg-6 -->
        <div class="col-lg-2">
            <label style="color: #252974;font-size: 20px">合计：${totalPrice}</label>
        </div>
        <div class="col-lg-4">
            <div class="input-group">
                <input id="queryOrderNo" type="text" class="form-control" placeholder="订单号">
                <span class="input-group-btn">
                    <button class="btn btn-default" onclick="submitOrderNo()" type="button" data-toggle="modal"
                            data-target="#myModal">查询</button>
                </span>
            </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->
    </div><!-- /.row -->
    <div class="row">
        <c:forEach items="${dateOrders}" var="dateOrder">
            <div name="singleOrder" class="panel panel-default" style="width: 50%;margin: 0 auto 20px auto;">
                <div class="panel-heading" style="text-align: justify; text-align-last: justify">
                    <label name="orderNo">订单号：${dateOrder.orderNo}</label>
                    <label>状态：${dateOrder.orderStatus}</label>
                </div>
                <div class="panel-body">
                    <div>
                        <div style="width: 70%; float: left;">
                            <h6>商品信息</h6>
                            <ul>
                                <c:forEach items="${dateOrder.orderDetails}" var="orderDetails">
                                    <li>名称：${orderDetails.productName} 价格￥${orderDetails.productPrice}
                                        数量${orderDetails.productNumber}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div style="width: 30%; float: left">
                            <h6>时间</h6>
                            <label>${dateOrder.orderDate}</label>
                        </div>
                    </div>
                    <c:if test="${!''.equals(dateOrder.address)&&dateOrder.address!=null}">
                        <div style="width: 100%; float: left">
                            收货地址：${dateOrder.address}
                        </div>
                    </c:if>
                    <div>
                        <div style="width: 31%; float: left">
                            <label style="float: left">总额：￥${dateOrder.orderMoney}</label>
                        </div>
                        <div style="width: 69%; float: left">
                            <label style="float: right">用户名：${dateOrder.username}</label>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div id="orderNoExist" style="display: none" name="singleOrder" class="panel panel-default">
                <div class="panel-heading" style="text-align: justify; text-align-last: justify">
                    <label id="noOrderNo" name="orderNo">订单号：noOrder.orderNo</label>
                    <label id="noOrderStatus">状态：noOrder.orderStatus</label>
                </div>
                <div class="panel-body">
                    <div>
                        <div style="width: 70%; float: left;">
                            <h6>商品信息</h6>
                            <ul id="noOrderDetails">
                                <li>名称：${orderDetails.productName} 价格￥${orderDetails.productPrice}
                                    数量${orderDetails.productNumber}</li>
                            </ul>
                        </div>
                        <div style="width: 30%; float: left">
                            <h6>时间</h6>
                            <label id="noOrderDate">noOrder.orderDate</label>
                        </div>
                    </div>
                    <div>
                        <div style="width: 100%; float: left">
                            <label id="noOrderAddress">收货地址：noOrder.address</label>
                        </div>
                        <div style="width: 31%; float: left">
                            <label id="noOrderMoney" style="float: left">总额：￥noOrder.orderMoney</label>
                        </div>
                        <div style="width: 69%; float: left">
                            <label id="noOrderUsername" style="float: right">用户名：noOrder.username</label>
                        </div>
                    </div>
                </div>
            </div>
            <div id="orderNoNotExist" style="display: block">
                <label>您查询的订单号不存在</label>
            </div>
        </div>
    </div>
</div>
</body>
</html>
