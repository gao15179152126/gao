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
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/signin.css">
    <title>Login</title>
    <script>
        //检查用户名是否存在
        function checkUsername() {
            var username = $("#registerUsername").val();
            $.post("/user/checkUsername?username="+username, function (data) {
                 if("1" == data.result){
                     $("#existUsername").show();
                     $("#registerButton").attr('disabled',true)
                 }
                 else {
                     $("#existUsername").hide();
                     $("#registerButton").attr('disabled',false)
                 }
            })
        }
        //判断两次密码是否相同
        function checkPassword() {
            if ($("#registerPassword2").val()!=$("#registerPassword").val()){
                $("#passwordDifferent").show();
                $("#registerButton").attr('disabled',true)
            }else {
                $("#passwordDifferent").hide();
                $("#registerButton").attr('disabled',false)
            }
        }
        //发送注册请求
        function register() {
            document.getElementById("registerForm").submit()
        }
    </script>
</head>
<body background="/images/bg.jpg" style="margin-top: 70px">
<jsp:include page="../common/head.jsp"></jsp:include>
    <!-- 登录框 -->
    <div class="container">
        <form class="form-signin" action="/user/checkLogin" method="post">
            <h2 class="form-signin-heading" style="color: cornflowerblue">请登录</h2>
            <input name="username" type="email" id="inputEmail" class="form-control" placeholder="邮箱地址" required autofocus>
            <input name="password" type="password" id="inputPassword" class="form-control" placeholder="密码" required>
            <div class="checkbox">
                <label style="color: white">
                    <input type="checkbox" value="remember-me" > 记住密码
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
            <div style="text-align: center; margin-top: 10px">
                <a type="button" style="color: cornflowerblue; text-decoration: none; cursor: pointer" onmouseover="javascript:this.style.color='#2A6191'" onmouseleave="javascript:this.style.color='#6596ED'" data-toggle="modal" data-target="#myModal">点击注册</a>
            </div>
            <div style="text-align: center; margin-top: 10px">
                <a style="color: #d43f3a; text-decoration: none">${msg}</a>
            </div>
        </form>
    </div>
    <!-- 注册弹框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title" id="myModalLabel">新用户注册</h4>
                </div>
                <div class="modal-body">
                    <form role="form" name="registerForm" id="registerForm" action="/user/register" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="registerUsername" style="display: block">邮箱地址</label>
                            <input name="username" type="email" class="form-control" style="width: 70%; display: inline" id="registerUsername" placeholder="邮箱地址" onblur="checkUsername()">
                            <label id="existUsername" style="margin-left: 10px; color: red" hidden>用户名已存在</label>
                        </div>
                        <div class="form-group">
                            <label for="registerPassword" style="display: block">密码</label>
                            <input name="password" type="password" class="form-control" style="width: 70%; display: inline" id="registerPassword" placeholder="密码" onblur="checkPassword()">
                        </div>
                        <div class="form-group">
                            <label for="registerPassword2" style="display: block">再输一次</label>
                            <input type="password" class="form-control" style="width: 70%; display: inline" id="registerPassword2" placeholder="再输一次" onblur="checkPassword()">
                            <label id="passwordDifferent" style="margin-left: 10px; color: red" hidden>两次密码不相同</label>
                        </div>
                        <div class="form-group">
                            <label for="registerName" style="display: block">名称</label>
                            <input name="name" type="text" class="form-control" style="width: 70%; display: inline" id="registerName" placeholder="名称">
                        </div>
                        <div class="form-group">
                            <label for="registerTelephone" style="display: block">电话</label>
                            <input name="telephone" type="text" class="form-control" style="width: 70%; display: inline" id="registerTelephone" placeholder="电话">
                        </div>
                        <div class="form-group">
                            <label for="registerFile">头像</label>
                            <input name="file" type="file" id="registerFile">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary submit" id="registerButton" disabled onclick="register()">注册</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
