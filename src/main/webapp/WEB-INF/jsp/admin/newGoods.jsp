<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/19
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../common/link/head.jsp"></jsp:include>
    <script type="text/javascript">
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
        }

        //上传商品
        function uploadProduct() {
            var formData = new FormData($("#uploadProduct")[0]);
            $.ajax({
                type: 'post',
                url: "../product/save",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data == 1) {
                        alert("上架成功");
                        location.replace("/admin/newGoods")
                    }
                },
                error: function () {
                    alert("上架失败");
                }
            })
        }
    </script>
    <title>商品上架</title>
</head>
<body>
<jsp:include page="../../common/head.jsp"></jsp:include>
<div class="container" style="margin-top: 60px; text-align: center">
    <h3>商品上架</h3>
    <form id="uploadProduct" method="post" enctype="multipart/form-data" style="width: 25%; margin: 0 auto">
        <div class="form-group">
            <input name="productName" type="text" class="form-control" placeholder="商品名称">
        </div>
        <div class="form-group">
            <input name="productPrice" type="text" class="form-control" placeholder="商品价格">
        </div>
        <div class="form-group">
            <input name="productAmount" type="text" class="form-control" placeholder="商品数量">
        </div>
        <div class="form-group">
            <label for="productType">商品类型</label>
            <select name="productType" id="productType" class="form-control">
                <option>大师咖啡</option>
                <option>小鹿茶</option>
                <option>瑞纳冰</option>
                <option>鲜榨果汁</option>
                <option>健康轻食</option>
                <option>幸运小食</option>
            </select>
        </div>
        <div class="form-group">
            <label>
                <input style="position:absolute;opacity:0;" type="file" name="file"
                       onchange="productImageChange(this)" id="imageFile"
                       accept="image/gif,image/jpeg,image/x-png"/>
                <img id="productImage" style="width: 160px;height: 160px;" src="/images/image.png" alt="点击上传">
            </label>
        </div>
        <div class="form-group">
            <textarea name="productDetail" class="form-control" rows="3" placeholder="商品详情..."></textarea>
        </div>
        <div class="form-group">
            <button type="button" onclick="uploadProduct()" class="btn btn-default">上架</button>
        </div>
    </form>
</div>
</body>
</html>
