<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/7
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/css/carousel.css">
    <title>Home</title>
    <style type="text/css">
        .carousel-control.left {

            background-image: none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
        }

        .carousel-control.right {
            left: auto;
            right: 0;

            background-image: none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
        }

        .english {
            color: #7f7f7f;
            font-size: 12px;
        }

        .my_title {
            font-weight: bold;
        }

        .center_panel {
            height: 430px;
        }

        .thumbnail {
            box-shadow: 3px 3px 10px #9d9d9d;
        }
    </style>
</head>
<body style="margin-top: 50px">
<jsp:include page="../common/head.jsp"></jsp:include>
<div class="container-fluid" style="margin-top: 50px">
    <div class="jumbotron" style="box-shadow:5px 5px 10px #9d9d9d;overflow: hidden;padding: 0">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0"
                    class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="/images/home.png" alt="">
                </div>
                <div class="item">
                    <img src="/images/home.png" alt="">
                </div>
                <div class="item">
                    <img src="/images/home.png" alt="">
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href=" " role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            </a>
        </div>
    </div>
</div>
</body>
</html>
