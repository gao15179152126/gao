<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/23
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>regist</title>
</head>
<body>
        <form action="/user/doRegist" method="post">
            用户名<input type="text" name="username"><br>
            密码<input type="text" name="password"><br>
            姓名<input type="text" name="name"><br>
            电话<input type="text" name="telephone"><br>
            <input type="submit" id="regist" value="注册"/>
        </form>
</body>
</html>
