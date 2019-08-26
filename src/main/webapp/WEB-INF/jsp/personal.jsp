<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/7
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/jumbotron-narrow.css">
    <title>Personal</title>
    <style type="text/css">
        .leftAndRight {
            text-align: justify;
            text-align-last: justify;
        }

        .lableLeft {
            margin-left: 5%;
        }

        .lableRight {
            margin-right: 5%;
        }

        .liStyle {
            margin: 5px 30% auto;
        }

        .aButton {
            border-radius: 5px;
            color: white;
            background-color: #357bb7;
        }
    </style>
    <script type="text/javascript">
        //下一步按钮
        function nextStep() {
            var oldPassword = $("#oldPassword").val();
            $.post("/user/checkPassword?password=" + oldPassword, function (data) {
                var passwordJudge = $("#passwordJudge");
                if (data.result === "密码正确") {
                    $("#oldPassword").attr('disabled', true);
                    passwordJudge.css("color", 'green');
                    passwordJudge.text(data.result);
                    passwordJudge.show();
                    $("#passwordNewDiv").show();
                    $("#againPasswordNewDiv").show();
                    $("#nextStep").attr('disabled', true);
                } else {
                    passwordJudge.show()
                }
            })
        }

        //判断两次密码是否相同
        function checkPasswordNew() {
            var passwordNew = $("#passwordNew");
            var againPasswordNew = $("#againPasswordNew");
            var submitNewPassword = $("#submitNewPassword");
            var passwordDifferent = $("#passwordDifferent");
            if (passwordNew.val() === "" || againPasswordNew.val() === "") {
                passwordDifferent.text("新密码不能为空");
                passwordDifferent.css("color", 'red');
                passwordDifferent.show();
                submitNewPassword.attr('disabled', true);
            } else if (passwordNew.val() !== againPasswordNew.val()) {
                passwordDifferent.text("两次密码不相同");
                passwordDifferent.css("color", 'red');
                passwordDifferent.show();
                submitNewPassword.attr('disabled', true);
            } else {
                passwordDifferent.text("输入正确请提交");
                passwordDifferent.css("color", 'green');
                submitNewPassword.attr('disabled', false)
            }
        }

        //提交新密码
        function submitNewPassword() {
            var passwordNew = $("#passwordNew").val();
            $.post("/user/changePassword?password=" + passwordNew, function (data) {
                alert("修改成功");
                window.location.reload();
            })
        }

        //余额充值
        function investMoney() {
            var money = $("#investMoney").val();
            $.post("/user/investMoney", {money: money}, function (data) {
                alert("充值成功");
                window.location.reload();
            })
        }

        //升级vip
        function upgradeVip() {
            if (confirm("确定花费200积分升级？")) {
                $.post("/user/upgradeVip", function (data) {
                    alert(data.result);
                    if (data.result == "升级成功") {
                        window.location.reload()
                    }
                })
            }
        }

        //查看用户地址
        function viewUserAddress() {
            $.post("/address/viewUserAddress", function (data) {
                if (data.result != null) {
                    var content = "";
                    $.each(data.result, function (i, userAddress) {
                        content += "<tr><th><button type=\"button\" class=\"btn btn-primary\" style=\"margin-bottom: 5px\" onclick=\"delUserAddress("
                            + userAddress.userAddressId
                            + ")\">删除</button></th><td>" + userAddress.address + "</td></tr>"
                    });
                    $("#addressTable").html(content)
                }
            })
        }

        //删除用户地址
        function delUserAddress(userAddressId) {
            $.post("/address/delUserAddress?userAddressId=" + userAddressId, function (data) {
                if (data == 1) {
                    alert("删除成功");
                    viewUserAddress()
                } else {
                    alert("删除失败")
                }
            })
        }

        //添加用户地址按钮
        function addUserAddressButton() {
            var content = "<tr><th><button type=\"button\" class=\"btn btn-primary\" onclick=\"addUserAddress(this)\">确定</button></th><td><input type='text'></td></tr>";
            $("#addressTable").append(content)
        }

        //添加用户地址
        function addUserAddress(button) {
            var address = $(button).parent().next().children().val()
            $.post("/address/addUserAddress", {address: address}, function (data) {
                if (data == 1) {
                    alert("添加成功");
                    viewUserAddress()
                } else {
                    alert("添加失败")
                }
            })
        }
    </script>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="container" style="margin-top: 70px">
    <div class="jumbotron" style="padding-top: 1px; padding-bottom: 20px; background-color: #f5f5f5;">
        <h3>个人中心</h3>
        <div class="row">
            <div class="sidebar">
                <ul class="nav nav-sidebar">
                    <li>
                        <a class="leftAndRight">
                            <label class="lableLeft">头像</label>
                            <label class="lableRight"><img src="/upload/headImage/${user.headImage}" height="60px"
                                                           width="60px"></label>
                        </a>
                    </li>
                    <li class="disabled">
                        <a class="leftAndRight">
                            <label class="lableLeft">用户名</label>
                            <label class="lableRight">${user.username}</label>
                        </a>
                    </li>
                    <li>
                        <a class="leftAndRight">
                            <label class="lableLeft">绑定手机</label>
                            <label class="lableRight">${user.telephone}</label>
                        </a>
                    </li>
                    <li>
                        <a class="leftAndRight">
                            <label class="lableLeft">积分</label>
                            <label class="lableRight">${user.point}</label>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" onclick="upgradeVip()" class="leftAndRight">
                            <label class="lableLeft">Vip</label>
                            <label class="lableRight">${user.vip}</label>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" data-toggle="modal" data-target="#balanceDialog"
                           class="leftAndRight">
                            <label class="lableLeft">余额</label>
                            <label class="lableRight">${user.balance}</label>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" data-toggle="modal" data-target="#addressModal"
                           onclick="viewUserAddress()" class="leftAndRight">
                            <label class="lableLeft">地址</label>
                            <label class="lableRight">查看</label>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li class="liStyle"><a href="" class="aButton" data-toggle="modal" data-target="#myModal">修改密码</a>
                    </li>
                    <li class="liStyle"><a href="/user/outLogin" class="aButton">退出登录</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="oldPassword" style="display: block">旧密码</label>
                        <input name="password" type="password" class="form-control" style="width: 70%; display: inline"
                               id="oldPassword" placeholder="请输入旧密码">
                        <label id="passwordJudge" style="margin-left: 10px; color: red" hidden>密码错误</label>
                    </div>
                    <div class="form-group" id="passwordNewDiv" hidden>
                        <label for="passwordNew" style="display: block">新密码</label>
                        <input type="password" class="form-control" style="width: 70%; display: inline" id="passwordNew"
                               placeholder="请输入新密码" onblur="checkPasswordNew()">
                    </div>
                    <div class="form-group" id="againPasswordNewDiv" hidden>
                        <label for="againPasswordNew" style="display: block">再输一遍</label>
                        <input type="password" class="form-control" style="width: 70%; display: inline"
                               id="againPasswordNew" placeholder="再输一遍" onblur="checkPasswordNew()">
                        <label id="passwordDifferent" style="margin-left: 10px; color: red" hidden>两次密码不相同</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary submit" id="nextStep" onclick="nextStep()">下一步</button>
                    <button type="button" class="btn btn-primary submit" id="submitNewPassword" disabled
                            onclick="submitNewPassword()">提交
                    </button>
                </div>
            </div>
        </div>
    </div><!-- big/modal-dialog -->
    <div id="balanceDialog" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
         aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title">余额充值</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input class="form-control" type="text" id="investMoney"
                               onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="充值金额">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary submit" onclick="investMoney()">充值</button>
                </div>
            </div>
        </div>
    </div><!-- small/modal-dialog -->

    <div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <label style="font-size: 20px">用户地址</label>
                    <button type="button" onclick="addUserAddressButton()" class="btn btn-primary" style="float: right">
                        添加
                    </button>
                </div>
                <div class="modal-body">
                    <table id="addressTable" class="table">
                        <th>
                            <button type="button" class="btn btn-primary" onclick="delUserAddress()">删除</button>
                        </th>
                        <td>地址</td>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->
</body>
</html>
