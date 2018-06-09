<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/25
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../layui/layui.js"></script>
    <script src="../../js/admin_index.js"></script>

</head>
<body class="layui-layout-body" >
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">消息管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    维特无忧堡
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/Account/logout">安全退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="goodList" target="maincontent">列表信息</a></dd>
                        <dd><a href="javascript:;">特色优惠</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="classify" target="maincontent">分类管理</a></li>
                <li class="layui-nav-item"><a href="order" target="maincontent">订单管理</a></li>
                <li class="layui-nav-item"><a href="2" target="maincontent">用户管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="overflow: hidden">
        <!-- 内容主体区域 -->

        <iframe name="maincontent" marginwidth="1" marginheight="1"   scrolling="no" frameborder="0" height="700"
        width="100%"></iframe>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        ©  - 底部固定区域
    </div>
</div>

</body>
</html>
