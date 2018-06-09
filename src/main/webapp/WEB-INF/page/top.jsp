<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/28
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="headtool">
    <%
        User user=(User)request.getSession().getAttribute("user");
        if(user==null){
    %>
    <span >购物车(0)</span>
    <span id="regbtn" onclick="window.location.href='Account/register'">注册</span>
    <span style="color: #01AAED" onclick="window.location.href='Account/login'">会员登录</span>
    <% }else {%>
    <span style="color: #01AAED" id="logout" onclick="window.location.href='/Account/logout'">注销</span>
    <span onclick="window.location.href='shop'">购物车(0)</span>
    <span style="color: #01AAED" onclick="window.location.href='message'">欢迎您，<%=user.getName()%></span>
    <%}%>
</div>
<div id="headmenu">
    <ul class="layui-nav layui-bg-blue" lay-filter="menu">
        <li class="layui-nav-item layui-this"><a href="/" >网站首页</a></li>
        <li class="layui-nav-item "><a href="#" >关于我们</a></li>
        <li class="layui-nav-item"><a href="good">商品中心</a></li>
        <li class="layui-nav-item"><a href="#" >联系我们</a></li>
        <div class="layui-input-inline" style="margin-left: 200px">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
        </div>
    </ul>
</div>