<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/23
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addProduct</title>
</head>
<body>
    <form action="/product/save" method="post" enctype="multipart/form-data">
        商品添加<br>
        商品类型<input type="text" name="productType"><br>
        商品名称<input type="text" name="productName"><br>
        商品价格<input type="text" name="productPrice"><br>
        商品数量<input type="text" name="productAmount"><br>
        图片:<input type="file" name="file"><br>
        <input type="submit" value="提交"/>
    </form>
</body>
</html>
