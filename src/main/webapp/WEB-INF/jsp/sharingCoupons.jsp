<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/28
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/jumbotron-narrow.css">
    <title>分享优惠券</title>
    <script type="text/javascript">
        function getCoupon() {
            var username = $("#username").val();
            var orderNo = ${orderNo};
            $.post("getCoupon", {
                username: username,
                orderNo: orderNo
            }, function success(data) {
                alert(data.result);
                location.reload()
            })
        }

        function copyUrl() {
            var inputZ = document.createElement('input');
            inputZ.setAttribute('id', 'inputCopy');
            inputZ.value = window.location.href;
            document.body.appendChild(inputZ);
            document.getElementById('inputCopy').select();
            document.execCommand('Copy');
            document.body.removeChild(inputZ);
            alert("已复制链接，请分享")
        }
    </script>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="container" style="margin-top: 70px; text-align: center">
    <h3>优惠券领取</h3>
    <div class="row">
        <label for="username">用户名</label>
        <input class="form-control" style="width: 220px; display: inline" id="username" type="text" name="username"
               value="${user.username}" placeholder="用户名">
        <button class="btn btn-default" onclick="getCoupon()" type="button">领取</button>
    </div>
    <div class="row" style="margin-top: 10px">
        <button class="btn btn-default" onclick="copyUrl()" type="button">分享给其他好友</button>
        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2545380906&site=qq&menu=yes"><img border="0"
                                                                                                   src="http://wpa.qq.com/pa?p=2:1075930808:51"
                                                                                                   alt="点击这里给我发消息"
                                                                                                   title="点击这里给我发消息"/></a>
    </div>
    <div class="row" style="width: 50%; margin: 10px auto; padding-bottom: 10px; background-color: #f8f8f8">
        <h4>看看大家的手气</h4>
        <c:forEach var="coupon" items="${coupons}">
            <div style="text-align: justify; text-align-last: justify">
                <label>${coupon.username}</label>
                <label style="color: #01AAED">${coupon.couponName}</label>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
