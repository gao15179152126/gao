<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/7
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Fixed navbar -->
<c:choose>
<c:when test="${user.userStatus == '管理员'}">
<nav class="navbar navbar-inverse navbar-fixed-top">
</c:when>
<c:otherwise>
<nav class="navbar navbar-default navbar-fixed-top">
</c:otherwise>
</c:choose>
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/luckincoffee"><img src="/images/logo.png" style="height: 50px; width: 180px; margin-right: 20px"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li<%--class="active"--%>><a href="/luckincoffee/home">首页</a></li>
                <li><a href="/luckincoffee/shop">商城</a></li>
                <li><a href="http://www.luckincoffee.com/" target="_blank">企业</a></li>
                <c:if test="${user.userStatus == '管理员'}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/userManagement">用户管理</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">商品管理</li>
                            <li><a href="/admin/storehouse">商品库存</a></li>
                            <li><a href="/admin/newGoods">商品上架</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">订单管理</li>
                            <li><a href="/admin/orderHandle">订单处理</a></li>
                            <li><a href="/admin/orderFind">订单查询</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/user/personal">您好，${user.name}</a></li>
                <li><a href="/order/myOrder">个人订单</a></li>
                <c:choose>
                    <c:when test="${empty user}">
                        <li<%-- class="active"--%>><a href="/user/login">登录<span class="sr-only">(current)</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li<%-- class="active"--%>><a href="/user/outLogin">退出<span class="sr-only">(current)</span></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>