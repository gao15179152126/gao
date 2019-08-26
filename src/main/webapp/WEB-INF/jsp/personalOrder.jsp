<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/10
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MyOrder</title>
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/jumbotron-narrow.css">
    <script>
        //支付订单
        function payForOrder(orderNo, button) {
            var address = $(button).parent().parent().prev().children().val();
            if (confirm("确定付款？") == true) {
                $.post("/order/payForOrder", {
                    orderNo: orderNo,
                    address: address
                }, function (data) {
                    alert(data.result);
                    if (data.result === "付款成功") {
                        window.location.reload()
                    }
                })
            }
        }

        //取消订单
        function cancelOrder(orderNo) {
            if (confirm("确定取消？") == true) {
                $.post("/order/cancelOrder", {orderNo: orderNo}, function (data) {
                    alert("取消成功");
                    location.reload()
                })
            }
        }

        //获取当前系统时间
        function currentTime() {
            var now = new Date();

            var year = now.getFullYear();       //年
            var month = now.getMonth() + 1;     //月
            var day = now.getDate();            //日

            var hh = now.getHours();            //时
            var mm = now.getMinutes();          //分
            var ss = now.getSeconds();           //秒

            var clock = year + "-";

            if (month < 10)
                clock += "0";

            clock += month + "-";

            if (day < 10)
                clock += "0";

            clock += day + " ";

            if (hh < 10)
                clock += "0";

            clock += hh + ":";
            if (mm < 10) clock += '0';
            clock += mm + ":";

            if (ss < 10) clock += '0';
            clock += ss;
            return (clock);
        }

        //当前系统时间与订单时间相减
        function timeDel() {
            $("[name = timeRemaining]").each(function (i, e) {
                var orderTime = new Date($(this).prev().prev().text());
                var currentTime = new Date();

                var s1 = orderTime.getTime()+120000, s2 = currentTime.getTime();
                var total = (s1 - s2) / 1000;

                var day = parseInt(total / (24 * 60 * 60));//计算整数天数
                if (day < 0) {
                    location.reload()
                }
                var afterDay = total - day * 24 * 60 * 60;//取得算出天数后剩余的秒数
                var hour = parseInt(afterDay / (60 * 60));//计算整数小时数
                if (hour < 0) {
                    location.reload()
                }
                var afterHour = total - day * 24 * 60 * 60 - hour * 60 * 60;//取得算出小时数后剩余的秒数
                var min = parseInt(afterHour / 60);//计算整数分
                if (min < 0) {
                    location.reload()
                }
                var afterMin = total - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60;//取得算出分后剩余的秒数
                var second = parseInt(afterMin);
                if (second < 0) {
                    location.reload()
                }
                var delTime = hour+ "时" + min + "分" + second+"秒";

                $(this).text(delTime)
            })
        }

        //每秒中执行一次
        setInterval("timeDel()", 1000);
    </script>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="container" style="margin-top: 70px">
    <div class="jumbotron" style="padding-top: 1px">
        <h3>个人订单</h3>
        <c:forEach items="${personalOrderLists}" var="personalOrderList">
            <div name="singleOrder" class="panel panel-default">
                <div class="panel-heading" style="text-align: justify; text-align-last: justify">
                    <label name="orderNo">订单号：${personalOrderList.orderNo}</label>
                    <label>状态：${personalOrderList.orderStatus}</label>
                </div>
                <div class="panel-body">
                    <div>
                        <div style="width: 70%; float: left;">
                            <h6>商品信息</h6>
                            <ul>
                                <c:forEach items="${personalOrderList.orderDetails}" var="orderDetails">
                                    <li>名称：${orderDetails.productName} 价格：￥${orderDetails.productPrice}
                                        数量：${orderDetails.productNumber}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div style="width: 30%; float: left">
                            <h6>订单时间</h6>
                            <label style="margin-bottom: 1px">${personalOrderList.orderDate}</label>
                            <c:if test="${personalOrderList.orderStatus == '未完成'}">
                                <label style="color: #d43f3a; margin-bottom: 1px">剩余支付时间</label>
                                <label name="timeRemaining" style="color: #d43f3a"></label>
                            </c:if>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${personalOrderList.orderStatus == '未完成'}">
                            <div style="width: 100%; float: left">
                                收货地址：
                                <select name="address">
                                    <c:forEach items="${userAddressLists}" var="userAddressList">
                                        <option value="${userAddressList}">${userAddressList}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <a href="/user/personal">添加收货地址</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${!''.equals(personalOrderList.address)&&personalOrderList.address!=null}">
                                <div style="width: 100%; float: left">
                                    收货地址：${personalOrderList.address}
                                </div>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <div>
                        <div style="width: 31%; float: left">
                            <label style="float: left">总额：￥${personalOrderList.orderMoney}</label>
                        </div>
                        <div style="width: 69%; float: left">
                            <c:choose>
                                <c:when test="${personalOrderList.orderStatus == '未完成'}">
                                    <button style="float: right"
                                            onclick="payForOrder(${personalOrderList.orderNo},this)">
                                        支付
                                    </button>
                                    <button style="float: right" onclick="cancelOrder(${personalOrderList.orderNo})">
                                        取消订单
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button onclick="location.href='/luckincoffee/shop'" style="float: right">再来一单
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <c:if test="${personalOrderList.orderStatus == '未完成'}">
                        <div style="float: left">
                            <label style="color: #01AAED">尊贵的VIP${user.vip} 您的会员折扣为：${(1-(0.02*user.vip))*10}折</label>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>

</div> <!-- /container -->
</body>
</html>
