<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/18
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" href="/css/dashboard.css">
    <title>库存管理</title>
    <script>
        //修改库存信息
        $(function () {
            var previous;
            $("[name=productNumber]").on('focus', function () {
                previous = this.value;
            }).change(function () {
                if (confirm("确定修改？")) {
                    var id = $(this).parent().parent().siblings("[name = productId]").text();
                    $.post("/admin/setProductNumber?productId=" + id + "&productNumber=" + this.value, function (data) {
                        if (data.result == 1) {
                            alert("修改成功")
                        }
                    })
                } else {
                    this.value = previous
                }
            });
            $("[name=productPrice]").on('focus', function () {
                previous = this.value;
            }).change(function () {
                if (confirm("确定修改？")) {
                    var id = $(this).parent().parent().siblings("[name = productId]").text();
                    $.post("/admin/setProductPrice?productId=" + id + "&productPrice=" + this.value, function (data) {
                        if (data.result == 1) {
                            alert("修改成功")
                        }
                    })
                } else {
                    this.value = previous
                }
            });
            $("[name=productName]").on('focus', function () {
                previous = this.value;
            }).change(function () {
                if (confirm("确定修改？")) {
                    var id = $(this).parent().parent().siblings("[name = productId]").text();
                    $.post("/admin/setProductName?productId=" + id + "&productName=" + this.value, function (data) {
                        if (data.result == 1) {
                            alert("修改成功")
                        }
                    })
                } else {
                    this.value = previous
                }
            });
        });

        //改变商品图片
        function productImageChange(file) {
            function getObjectURL(file) {
                var url = null;
                if (window.createObjcectURL != undefined) {
                    url = window.createOjcectURL(file);
                } else if (window.URL != undefined) {
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) {
                    url = window.webkitURL.createObjectURL(file);
                }
                return url;
            }

            var newImageFilePath = getObjectURL(file.files[0]);
            $("#productImage").attr('src', newImageFilePath);
            $("#changeProduceImage").attr('disabled', false)
        }

        //获取商品图片
        function getProductImage(productId, button) {
            $("#changeProduceImage").attr('disabled', true);
            $("#changeImageProductId").val(productId);
            var productName = $(button).parent().siblings("[name=productNameTd]").children().children().val();
            $("#productName").html(productName);
            $.post("/admin/getProductImage?id=" + productId, function (data) {
                $("#productImage").attr('src', "/upload/" + data.productImage)
            })
        }

        //修改图片提交
        function changeImageSubmit() {
            var formData = new FormData($("#uploadImageForm")[0]);
            $.ajax({
                type: 'post',
                url: "/admin/updateProductImage",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.result == 1) {
                        alert("上传成功");
                    }
                },
                error: function () {
                    alert("上传失败");
                }
            })
        }
    </script>

    <style type="text/css">
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
</head>
<body>
<jsp:include page="../../common/head.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a>商品分类<span class="sr-only">(current)</span></a></li>
                <li><a href="/admin/storehouse?type=大师咖啡">大师咖啡</a></li>
                <li><a href="/admin/storehouse?type=小鹿茶">小鹿茶</a></li>
                <li><a href="/admin/storehouse?type=瑞纳冰">瑞纳冰</a></li>
                <li><a href="/admin/storehouse?type=鲜榨果汁">鲜榨果汁</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="/admin/storehouse?type=健康轻食">健康轻食</a></li>
                <li><a href="/admin/storehouse?type=幸运小食">幸运小食</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="padding-top: 15px">
            <h2 class="sub-header" style="margin-top: 0">库存管理</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>商品号</th>
                        <th>名称</th>
                        <th>单价</th>
                        <th>图片</th>
                        <th>数量</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td name="productId">${product.productId}</td>
                            <td name="productNameTd"><label>
                                <input name="productName" class="form-control" style="width: 200px" type="text"
                                       value="${product.productName}">
                            </label></td>
                            <td><label>
                                <input name="productPrice" class="form-control" style="width: 60px;" type="text"
                                       value="${product.productPrice}">
                            </label></td>
                            <td>
                                <button class="btn btn-primary" onclick="getProductImage(${product.productId},this)"
                                        data-toggle="modal" data-target="#myModal">修改
                                </button>
                            </td>
                            <td><label>
                                <input name="productNumber" class="form-control" style="width: 55px;" type="text"
                                       onkeyup="value=value.replace(/[^\d]/g,'')"
                                       value="${product.productAmount}">
                            </label></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">修改商品图片</h4>
            </div>
            <div class="modal-body">
                <h5 id="productName" style="text-align: center">商品名称</h5>
                <form id="uploadImageForm" style="text-align: center" enctype="multipart/form-data">
                    <input name="productId" id="changeImageProductId" type="hidden" value="">
                    <label>
                        <input style="position:absolute;opacity:0;" type="file" name="file"
                               onchange="productImageChange(this)" id="imageFile"
                               accept="image/gif,image/jpeg,image/x-png"/>
                        <img id="productImage" style="width: 160px;height: 160px;" src="" alt="点击上传">
                    </label>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="changeProduceImage" type="button" class="btn btn-primary submit" disabled="disabled"
                        onclick="changeImageSubmit()">修改
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
