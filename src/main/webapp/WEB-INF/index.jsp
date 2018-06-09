<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>

    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="layui/layui.js"></script>
    <script src="js/index.js"></script>
</head>

<body>
<jsp:include page="page/top.jsp"></jsp:include>
<div class="layui-carousel" id="carousel" >
    <div carousel-item="">
        <div><img src="../img/1.jpg"></div>
        <div><img src="../img/2.jpg"></div>
    </div>
</div>

<div class="clearfix wd10"></div>
<div id="product-content">
    <strong >特惠推荐</strong>
    <span>SALE</span>
    <ul class="product-list">
        <li class="product-box">
            <a class="image">
                <img src="img/sale.jpg">
            </a>
            <a class="name">多功能沙发</a>
            <div class="price">
                <span >￥ 2230.0</span>
                <del>￥ 3230.0</del>
                <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe641;</i>
            </div>

        </li>
        <li class="product-box">
            <a class="image">
                <img src="img/sale.jpg">
            </a>
            <a class="name">多功能沙发</a>
            <div class="price">
                <span >￥ 2230.0</span>
                <del>￥ 3230.0</del>
                <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe641;</i>
            </div>
        </li>
        <li class="product-box">
            <a class="image">
                <img src="img/sale.jpg">
            </a>
            <a class="name">多功能沙发</a>
            <div class="price">
                <span >￥ 2230.0</span>
                <del>￥ 3230.0</del>
                <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe641;</i>
            </div>

        </li>
        <li class="product-box">
            <a class="image">
                <img src="img/sale.jpg">
            </a>
            <a class="name">多功能沙发</a>
            <div class="price">
                <span >￥ 2230.0</span>
                <del>￥ 3230.0</del>
                <i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe641;</i>
            </div>
        </li>
    </ul>
</div>
  <div id="footer"></div>
</body >

</html>
