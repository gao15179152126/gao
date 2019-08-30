<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/7
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/css/dashboard.css">
    <style type="text/css">
        .buttonAdd {
            font-weight: bold;
            color: white;
            width: 20px;
            height: 20px;
            background-color: #232773;
            border: none;
            float: right;
        }

        .buttonDel {
            font-weight: bold;
            color: white;
            width: 20px;
            height: 20px;
            background-color: #232773;
            border: none;
            float: right;
        }

        input[type=number] {
            -moz-appearance: textfield;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .mask {
            background: #efefef;
            -moz-opacity: 1;
            opacity: 1;
            -webkit-filter: blur(2px);
            -ms-filter: blur(2px);
            filter: blur(2px);
        }
    </style>
    <script>
        //产品详情弹框
        function showProduct(productId) {
            $.ajax({
                type: "post",
                contentType: "application/json",
                dataType: "json",
                url: "/product/singleProductShow?productId=" + productId,
                success: function (product) {
                    $("#showImage").prop("src", "/upload/" + product.productImage),
                        $("#productPrice").text(product.productPrice),
                        $("#productName").text(product.productName),
                        $("#productDetail").text(product.productDetail)
                    $("#addCart").attr("onclick", "addCart(" + product.productId + ")")
                }
            })
        }

        //添加购物车
        function addCart(productId) {
            var productNumber = $("#productNumber").val();
            if (productNumber > 20) {
                alert("此产品单次最大只能购买20份")
            } else if ("" === productNumber) {
                alert("输入不能为空");
            } else if (productNumber === '0') {
                alert("输入不能为0")
            } else {
                $.ajax({
                    type: "post",
                    contentType: "application/x-www-form-urlencoded",
                    dataType: "json",
                    data: {
                        productId: productId,
                        cartNumber: productNumber
                    },
                    url: "/cart/addCart",
                    success: function () {
                        console.log("success");
                        window.location.reload()
                    },
                    error: function () {
                        alert("未登录");
                        location.replace("/user/login")
                    }
                })

            }
        }

        //自动加载价格计算
        window.onload = refreshTotalPrice;
        //点击选框刷新总价
        $(document).ready(function () {
            $("[name = checkItem]").click(function () {
                refreshTotalPrice();
            })
        });

        //刷新总价
        function refreshTotalPrice() {
            var total = 0;
            $("[name = checkItem]:checked").each(function (i, e) {
                var productId = e.nextElementSibling.value;
                var singlePrice = parseFloat($(this).siblings("[name = singlePrice]").text());
                var cartNumber = parseInt($(this).siblings("[name = cartNumber]").text());
                total += singlePrice * cartNumber;
            });
            $("#totalPrice").text("￥" + total)
        }

        //添加购物车单品数量
        function addNumber(button) {
            //对数据库操作
            var productId = $(button).siblings("[name = productId]").val();
            $.post("/cart/singleAdd?productId=" + productId);
            //页面操作
            var cartNum = $(button).siblings("[name = cartNumber]");
            var cartNumber = parseInt(cartNum.text()) + 1;
            cartNum.text(cartNumber);
            refreshTotalPrice();
        }

        //减少购物车单品数量（判断是否为0）
        function delNumber(button) {
            var cartNum = $(button).siblings("[name = cartNumber]");
            var cartNumber = parseInt(cartNum.text());
            if (cartNumber < 2) {
                if (confirm("确定不要了吗")) {
                    //删除数据库
                    var productId = $(button).siblings("[name = productId]").val();
                    //测试数据传输
                    //console.log(productId)
                    $.ajax({
                        type: "post",
                        contentType: "application/json",
                        dataType: "json",
                        url: "/cart/deleteCart?productId=" + productId,
                        success: function () {
                            //console.log("success")
                        },
                        error: function () {
                            location.replace("/luckincoffee/shop")
                        }
                    })
                }
            } else {
                //对数据库操作
                var productId = $(button).siblings("[name = productId]").val();
                $.post("/cart/singleDel?productId=" + productId);
                //页面操作
                cartNum.text(cartNumber - 1)
            }
            refreshTotalPrice();
        }

        //结算购物车
        function submitOrder() {
            var orderDetail = [];
            $("[name = checkItem]:checked").each(function (i, e) {
                var productId = e.nextElementSibling.value;
                var productPrice = parseFloat($(this).siblings("[name = singlePrice]").text());
                var productNumber = parseInt($(this).siblings("[name = cartNumber]").text());
                orderDetail.push({"productId": productId, "productPrice": productPrice, "productNumber": productNumber})
            });
            var orderDetails = JSON.stringify(orderDetail);
            $.ajax({
                async: false,
                contentType: 'application/json',
                type: 'post',
                data: orderDetails,
                dateType: 'json',
                url: '/order/submitOrder',
                success: function (data) {
                    if (data.result.endsWith("库存不足")) {
                        alert(data.result);
                    } else {
                        location.replace("/order/myOrder")
                    }
                },
                error: function () {
                    alert('error')
                }
            })
        }
    </script>
    <title>Shop</title>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-3 sidebar" style="margin-bottom: 50px">
            <ul class="nav nav-sidebar">
                <img src="/images/cartHead.jpg" height="80px">
            </ul>
            <c:if test="${empty user}">
                <ul class="nav nav-sidebar">
                    <li>
                        <a href="/user/login" style="text-align: center">请先登录</a>
                    </li>
                </ul>
            </c:if>
            <c:forEach items="${listCart}" var="productCart">
                <ul class="nav nav-sidebar">
                    <li>
                        <a>
                            <input id="checkItem" name="checkItem" type="checkbox" style="margin-right: 20px" checked>
                            <input name="productId" style="display: none" value="${productCart.productId}">
                            <lable style="font-weight: bold; color: black">${productCart.productName}</lable>
                            <button class="buttonAdd" onclick="addNumber(this)">+</button>
                            <label name="cartNumber"
                                   style="margin-left: 5px; margin-right: 5px; float: right;color: black; font-size: 15px">${productCart.cartNumber}</label>
                            <button class="buttonDel" onclick="delNumber(this)">-</button>
                            <label name="singlePrice"
                                   style="float:right; margin-right: 15px; color: black">${productCart.cartMoney}</label>
                            <label style=" color: black; float: right">￥</label>
                        </a>
                    </li>
                </ul>
            </c:forEach>
            <nav class="col-sm-3 col-md-3 navbar navbar-default navbar-fixed-bottom">
                <div class="container">
                    <ul class="nav navbar-nav">
                        <li style=" background-color: #232773"><a href="javascript:submitOrder()"
                                                                  style="color: white; font-weight: bold">去结算</a></li>
                        <li style="margin-left: 50px"><a style="color: black">合计</a></li>
                        <li><a id="totalPrice" style="color: black; font-weight: bold; font-size: 20px"></a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-3 main">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#coffee" data-toggle="tab">大师咖啡</a></li>
                <li><a href="#deerTea" data-toggle="tab">小鹿茶</a></li>
                <li><a href="#iceCream" data-toggle="tab">瑞纳冰</a></li>
                <li><a href="#NFC" data-toggle="tab">鲜榨果汁</a></li>
                <li><a href="#lightFood" data-toggle="tab">健康轻食</a></li>
                <li><a href="#littleFood" data-toggle="tab">幸运小食</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active row placeholders" style="margin-bottom: 0" id="coffee">
                    <c:forEach items="${list}" var="product">
                    <c:if test="${product.productType == '大师咖啡'}">
                    <c:choose>
                    <c:when test="${product.productAmount < 1}">
                    <div class="col-xs-6 col-sm-3 placeholder mask">
                        </c:when>
                        <c:otherwise>
                        <div class="col-xs-6 col-sm-3 placeholder" onclick="showProduct(${product.productId})"
                             data-toggle="modal" data-target="#myModal">
                            </c:otherwise>
                            </c:choose>
                            <img src="/upload/${product.productImage}" width="160" height="160"
                                 class="img-responsive" alt="Generic placeholder thumbnail">
                            <h4>${product.productName}</h4>
                            <span class="text-muted">￥${product.productPrice}</span>
                        </div>
                        </c:if>
                        </c:forEach>
                    </div>
                    <div class="tab-pane fade" id="deerTea" style="margin-bottom: 0; text-align: center">
                        <c:forEach items="${list}" var="product">
                        <c:if test="${product.productType == '小鹿茶'}">
                        <c:choose>
                        <c:when test="${product.productAmount < 1}">
                        <div class="col-xs-6 col-sm-3 placeholder mask">
                            </c:when>
                            <c:otherwise>
                            <div class="col-xs-6 col-sm-3 placeholder" onclick="showProduct(${product.productId})"
                                 data-toggle="modal" data-target="#myModal">
                                </c:otherwise>
                                </c:choose>
                                <img src="/upload/${product.productImage}" width="160" height="160"
                                     class="img-responsive" alt="Generic placeholder thumbnail">
                                <h4>${product.productName}</h4>
                                <span class="text-muted">￥${product.productPrice}</span>
                            </div>
                            </c:if>
                            </c:forEach>
                        </div>
                        <div class="tab-pane fade" id="iceCream" style="margin-bottom: 0; text-align: center">
                            <c:forEach items="${list}" var="product">
                            <c:if test="${product.productType == '瑞纳冰'}">
                            <c:choose>
                            <c:when test="${product.productAmount < 1}">
                            <div class="col-xs-6 col-sm-3 placeholder mask">
                                </c:when>
                                <c:otherwise>
                                <div class="col-xs-6 col-sm-3 placeholder" onclick="showProduct(${product.productId})"
                                     data-toggle="modal" data-target="#myModal">
                                    </c:otherwise>
                                    </c:choose>
                                    <img src="/upload/${product.productImage}" width="160" height="160"
                                         class="img-responsive" alt="Generic placeholder thumbnail">
                                    <h4>${product.productName}</h4>
                                    <span class="text-muted">￥${product.productPrice}</span>
                                </div>
                                </c:if>
                                </c:forEach>
                            </div>
                            <div class="tab-pane fade" id="NFC" style="margin-bottom: 0; text-align: center">
                                <c:forEach items="${list}" var="product">
                                <c:if test="${product.productType == '鲜榨果汁'}">
                                <c:choose>
                                <c:when test="${product.productAmount < 1}">
                                <div class="col-xs-6 col-sm-3 placeholder mask">
                                    </c:when>
                                    <c:otherwise>
                                    <div class="col-xs-6 col-sm-3 placeholder"
                                         onclick="showProduct(${product.productId})"
                                         data-toggle="modal" data-target="#myModal">
                                        </c:otherwise>
                                        </c:choose>
                                        <img src="/upload/${product.productImage}" width="160" height="160"
                                             class="img-responsive" alt="Generic placeholder thumbnail">
                                        <h4>${product.productName}</h4>
                                        <span class="text-muted">￥${product.productPrice}</span>
                                    </div>
                                    </c:if>
                                    </c:forEach>
                                </div>
                                <div class="tab-pane fade" id="lightFood" style="margin-bottom: 0; text-align: center">
                                    <c:forEach items="${list}" var="product">
                                    <c:if test="${product.productType == '健康轻食'}">
                                    <c:choose>
                                    <c:when test="${product.productAmount < 1}">
                                    <div class="col-xs-6 col-sm-3 placeholder mask">
                                        </c:when>
                                        <c:otherwise>
                                        <div class="col-xs-6 col-sm-3 placeholder"
                                             onclick="showProduct(${product.productId})"
                                             data-toggle="modal" data-target="#myModal">
                                            </c:otherwise>
                                            </c:choose>
                                            <img src="/upload/${product.productImage}" width="160" height="160"
                                                 class="img-responsive" alt="Generic placeholder thumbnail">
                                            <h4>${product.productName}</h4>
                                            <span class="text-muted">￥${product.productPrice}</span>
                                        </div>
                                        </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="littleFood"
                                         style="margin-bottom: 0; text-align: center">
                                        <c:forEach items="${list}" var="product">
                                        <c:if test="${product.productType == '幸运小食'}">
                                        <c:choose>
                                        <c:when test="${product.productAmount < 1}">
                                        <div class="col-xs-6 col-sm-3 placeholder mask">
                                            </c:when>
                                            <c:otherwise>
                                            <div class="col-xs-6 col-sm-3 placeholder"
                                                 onclick="showProduct(${product.productId})"
                                                 data-toggle="modal" data-target="#myModal">
                                                </c:otherwise>
                                                </c:choose>
                                                <img src="/upload/${product.productImage}" width="160" height="160"
                                                     class="img-responsive" alt="Generic placeholder thumbnail">
                                                <h4>${product.productName}</h4>
                                                <span class="text-muted">￥${product.productPrice}</span>
                                            </div>
                                            </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span
                                                            aria-hidden="true">x</span><span
                                                            class="sr-only">Close</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">商品信息</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form role="form">
                                                        <div class="form-group">
                                                            <label>商品图片</label>
                                                            <img id="showImage" width="150" height="150" src="">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>商品价格</label>
                                                            <label>￥<a id="productPrice"></a>元</label>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>商品名称</label>
                                                            <label><a id="productName"></a></label>
                                                            <p class="help-block">商品详情：<a id="productDetail"></a></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>数量 </label>
                                                            <input class="form-control" style="width: 50%" type="number"
                                                                   id="productNumber"
                                                                   name="productNumber" value="1" size="2px"
                                                                   onkeyup="value=value.replace(/[^\d]/g,'')">
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        关闭
                                                    </button>
                                                    <button id="addCart" type="button" class="btn btn-primary submit"
                                                            onclick="">加入购物车
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</body>
</html>
