<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/7/23
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../pack/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/signin.css">
    <title>Login</title>
</head>
<body background="/images/bg.jpg" style="margin-top: 70px">
<jsp:include page="../pack/head.jsp"></jsp:include>
    <div class="container">

        <form class="form-signin" action="/user/checkLogin" method="post">
            <h2 class="form-signin-heading" style="color: cornflowerblue">Please sign in</h2>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input name="username" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
            <label for="inputPassword" class="sr-only">Password</label>
            <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
            <div class="checkbox">
                <label style="color: white">
                    <input type="checkbox" value="remember-me" > Remember me
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>

    </div> <!-- /container -->
</body>
</html>
