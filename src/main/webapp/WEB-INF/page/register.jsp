<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/24
  Time: 10:40
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
    <div class="message">用户注册</div>
    <div id="darkbannerwrap" class=""></div>
    <form class="layui-form layui-form-pane formbox" action="/Account/register"  method="post">

        <div class="layui-form-item">

            <input name="name" class="layui-input" type="text"
                   placeholder="昵称" autocomplete="off" lay-verify="account" value="">
        </div>
        <div class="layui-form-item" style="">
            <input name="username" class="layui-input" type="text"
                   placeholder="账号" autocomplete="off"  lay-verify="account" value="" style="height:45px;">
        </div>

        <div class="layui-form-item">
            <input name="password" class="layui-input" type="password"
                   placeholder="密码" autocomplete="off" lay-verify="account" value="">
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid layui-bg-blue" lay-submit lay-filter="login" style="height:50px">提交注册</button>
        </div>

    </form>
</div>

</body>
</html>
