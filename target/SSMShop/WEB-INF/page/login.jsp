<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/23
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/main.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/login.js"></script>
</head>
<body>
<div class="login">
    <div class="message">登录入口</div>
    <div id="darkbannerwrap" class=""></div>
    <form class="layui-form layui-form-pane formbox" action="/Account/login"  method="post">
        <div class="layui-form-item" style="">

            <input name="username" class="layui-input" type="text"
                   placeholder="Username" autocomplete="off"  lay-verify="account" value="vision" style="height:45px;">
        </div>
        <hr class="hr15">
        <div class="layui-form-item">
            <input name="password" class="layui-input" type="password"
                   placeholder="Password" autocomplete="off" lay-verify="account" value="123456">
        </div>
        <%--<hr class="hr15">
        <hr class="hr15">--%>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid layui-bg-blue" lay-submit lay-filter="login" style="height:50px">提交</button>
        </div>
        <span onclick="register();" style=" cursor: pointer;">还没账号？注册一个</span>
    </form>
</div>

</body>
</html>
