<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/7
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <jsp:include page="../pack/link/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="/css/shop.css">
    <title>Shop</title>
</head>
<script>
    function showProduct(productId) {
        $.ajax({
            type:"post",
            contentType:"application/json",
            dataType:"json",
            url:"/product/singleProductShow?productId="+productId,
            success:function (product) {
                $("#showImage").prop("src","/upload/"+product.productImage),
                $("#productPrice").text(product.productPrice),
                $("#productName").text(product.productName)
            }
        })
    }
</script>
<body>
<jsp:include page="../pack/head.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-3 sidebar" style="margin-bottom: 50px">
            <ul class="nav nav-sidebar">
                <img src="/images/cartHead.jpg" height="80px">
            </ul>
            <c:forEach items="${listCart}" var="productCart">
                <ul class="nav nav-sidebar">
                    <li><a>
                        <input type="checkbox" style="margin-right: 20px">
                        <lable>${productCart.productName}</lable>
                        <button class="buttonAdd">+</button>
                        <label style="margin-left: 5px; margin-right: 5px; float: right;color: black; font-size: 15px">${productCart.cartNumber}</label>
                        <button class="buttonDel">-</button>
                    </a></li>
                </ul>
            </c:forEach>
            <nav class="col-sm-3 col-md-3 navbar navbar-default navbar-fixed-bottom">
                <div class="container">
                    <ul class="nav navbar-nav">
                        <li style=" background-color: #4169E1"><a href="#" style="color: white; font-weight: bold">去结算</a></li>
                        <li style="margin-left: 50px"><a style="color: black">应付合计</a></li>
                        <li><a id="totalPrice" style="color: black; font-weight: bold">￥24元</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-3 main">
            <h1 class="page-header">咖啡</h1>
            <div class="row placeholders">
                <c:forEach items="${list}" var="product">
                    <div class="col-xs-6 col-sm-3 placeholder" onclick="showProduct(${product.productId})" data-toggle="modal" data-target="#myModal">
                        <img src="/upload/${product.productImage}" width="150" height="150" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>${product.productPrice}</h4>
                        <span class="text-muted">${product.productName}</span>
                    </div>
                </c:forEach>
<%--                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>--%>
            </div>

<%--            <h2 class="sub-header">Section title</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1,001</td>
                        <td>Lorem</td>
                        <td>ipsum</td>
                        <td>dolor</td>
                        <td>sit</td>
                    </tr>
                    <tr>
                        <td>1,002</td>
                        <td>amet</td>
                        <td>consectetur</td>
                        <td>adipiscing</td>
                        <td>elit</td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>Integer</td>
                        <td>nec</td>
                        <td>odio</td>
                        <td>Praesent</td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>libero</td>
                        <td>Sed</td>
                        <td>cursus</td>
                        <td>ante</td>
                    </tr>
                    <tr>
                        <td>1,004</td>
                        <td>dapibus</td>
                        <td>diam</td>
                        <td>Sed</td>
                        <td>nisi</td>
                    </tr>
                    <tr>
                        <td>1,005</td>
                        <td>Nulla</td>
                        <td>quis</td>
                        <td>sem</td>
                        <td>at</td>
                    </tr>
                    <tr>
                        <td>1,006</td>
                        <td>nibh</td>
                        <td>elementum</td>
                        <td>imperdiet</td>
                        <td>Duis</td>
                    </tr>
                    <tr>
                        <td>1,007</td>
                        <td>sagittis</td>
                        <td>ipsum</td>
                        <td>Praesent</td>
                        <td>mauris</td>
                    </tr>
                    <tr>
                        <td>1,008</td>
                        <td>Fusce</td>
                        <td>nec</td>
                        <td>tellus</td>
                        <td>sed</td>
                    </tr>
                    <tr>
                        <td>1,009</td>
                        <td>augue</td>
                        <td>semper</td>
                        <td>porta</td>
                        <td>Mauris</td>
                    </tr>
                    <tr>
                        <td>1,010</td>
                        <td>massa</td>
                        <td>Vestibulum</td>
                        <td>lacinia</td>
                        <td>arcu</td>
                    </tr>
                    <tr>
                        <td>1,011</td>
                        <td>eget</td>
                        <td>nulla</td>
                        <td>Class</td>
                        <td>aptent</td>
                    </tr>
                    <tr>
                        <td>1,012</td>
                        <td>taciti</td>
                        <td>sociosqu</td>
                        <td>ad</td>
                        <td>litora</td>
                    </tr>
                    <tr>
                        <td>1,013</td>
                        <td>torquent</td>
                        <td>per</td>
                        <td>conubia</td>
                        <td>nostra</td>
                    </tr>
                    <tr>
                        <td>1,014</td>
                        <td>per</td>
                        <td>inceptos</td>
                        <td>himenaeos</td>
                        <td>Curabitur</td>
                    </tr>
                    <tr>
                        <td>1,015</td>
                        <td>sodales</td>
                        <td>ligula</td>
                        <td>in</td>
                        <td>libero</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>--%>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
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
                                <label>￥<a id="productPrice"></a> 元</label>
                            </div>
                            <div class="form-group">
                                <label>商品名称</label>
                                <label><a id="productName"></a></label>
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Check me out
                                </label>
                            </div>
                            <div class="form-group">
                                <label>数量 </label>
                                <input id="productNumber" name="productNumber" value="1" size="2px" >
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary submit">加入购物车</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
