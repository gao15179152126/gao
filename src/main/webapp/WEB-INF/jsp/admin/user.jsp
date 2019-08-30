<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/15
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../../common/link/head.jsp"></jsp:include>
    <title>用户管理</title>
    <script type="text/javascript">
        //改变用户状态
        function changeUserStatus(id, status) {
            if (status == "管理员") {
                alert("该用户状态不可改变")
            }
            if (status == "正常") {
                if (confirm("确定改变该用户状态？")) {
                    $.post("/admin/changeUserStatus?id=" + id + "&status=禁用", function (data) {
                        if (data.result == 1) {
                            alert("修改成功");
                            window.location.reload()
                        } else {
                            alert("修改失败")
                        }
                    })
                }
            }
            if (status == "禁用") {
                if (confirm("确定改变该用户状态？")) {
                    $.post("/admin/changeUserStatus?id=" + id + "&status=正常", function (data) {
                        if (data.result == 1) {
                            alert("修改成功");
                            window.location.reload()
                        } else {
                            alert("修改失败")
                        }
                    })
                }
            }
        }

        //用户积分清零
        function clearUserPoint(id) {
            if (confirm("确定清零？")) {
                $.post("/admin/clearPoint?id=" + id, function (data) {
                    if (data.result == 1) {
                        alert("清零成功");
                        window.location.reload()
                    } else {
                        alert("清零失败")
                    }
                })
            }
        }

        //重置用户密码
        function resetPassword(id) {
            if (confirm("是否重置为“654321”？")) {
                $.post("/admin/resetPassword", {id: id}, function (data) {
                    if (data.result == 1) {
                        alert("重置成功");
                        window.location.reload()
                    } else {
                        alert("重置失败")
                    }
                })
            }
        }
    </script>
</head>
<body>
<jsp:include page="../../common/head.jsp"></jsp:include>
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="container" style="margin-top: 70px">
    <h3 style="text-align: center; margin: 1px auto">用户管理</h3>
    <div class="row">
        <div class="col-lg-3" style="float: right">
            <form action="/admin/userManagement?page=${currentPage}" method="get">
                <div class="input-group">
                    <input name="queryUsername" type="text" class="form-control" placeholder="用户名"
                           value="${queryUsername}">
                    <span class="input-group-btn">
                            <button type="submit" class="btn btn-default" type="button">搜索</button>
                        </span>
                </div>
            </form>
        </div>
    </div>
    <div class="bs-example" data-example-id="contextual-table">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>名称</th>
                <th>电话</th>
                <th>余额</th>
                <th>积分</th>
                <th>vip</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td>******
                        <button type="button" class="btn-warning" style="float: right" href="javascript:void(0);"
                                onclick="resetPassword(${user.id})">重置
                        </button>
                    </td>
                    <td>${user.name}</td>
                    <td>${user.telephone}</td>
                    <td>${user.balance}</td>
                    <td>${user.point}
                        <button type="button" class="btn-info" style="float: right" href="javascript:void(0);"
                                onclick="clearUserPoint(${user.id})">清零
                        </button>
                    </td>
                    <td>${user.vip}</td>
                    <c:if test="${user.userStatus == '管理员'}">
                        <td>
                            <button type="button" class="btn-primary" href="javascript:void(0);"
                                    onclick="changeUserStatus(${user.id},'${user.userStatus}')">${user.userStatus}</button>
                        </td>
                    </c:if>
                    <c:if test="${user.userStatus == '正常'}">
                        <td>
                            <button type="button" class="btn-success" href="javascript:void(0);"
                                    onclick="changeUserStatus(${user.id},'${user.userStatus}')">${user.userStatus}</button>
                        </td>
                    </c:if>
                    <c:if test="${user.userStatus == '禁用'}">
                        <td>
                            <button type="button" class="btn-danger" href="javascript:void(0);"
                                    onclick="changeUserStatus(${user.id},'${user.userStatus}')">${user.userStatus}</button>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<nav class="navbar-fixed-bottom" style="text-align: center" aria-label="Page navigation">
    <ul class="pagination">
        <c:if test="${currentPage > 1}">
            <li>
                <a href="/admin/userManagement?page=${currentPage-1}&queryUsername=${queryUsername}"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:if test="${currentPage>2}">
            <li>
                <a href="/admin/userManagement?page=${currentPage-2}&queryUsername=${queryUsername}">${currentPage-2}</a>
            </li>
        </c:if>
        <c:if test="${currentPage>1}">
            <li>
                <a href="/admin/userManagement?page=${currentPage-1}&queryUsername=${queryUsername}">${currentPage-1}</a>
            </li>
        </c:if>
        <li><a href="/admin/userManagement?page=${currentPage}&queryUsername=${queryUsername}">${currentPage}</a></li>
        <c:if test="${totalPage>currentPage}">
            <li>
                <a href="/admin/userManagement?page=${currentPage+1}&queryUsername=${queryUsername}">${currentPage+1}</a>
            </li>
        </c:if>
        <c:if test="${totalPage>currentPage+1}">
            <li>
                <a href="/admin/userManagement?page=${currentPage+2}&queryUsername=${queryUsername}">${currentPage+2}</a>
            </li>
        </c:if>
        <c:if test="${totalPage>currentPage}">
            <li>
                <a href="/admin/userManagement?page=${currentPage+1}&queryUsername=${queryUsername}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</nav>
</body>
</html>
