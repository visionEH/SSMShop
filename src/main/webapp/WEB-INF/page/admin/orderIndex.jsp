<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/5/3
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css">
    <script src="../../layui/layui.js"></script>
    <script src="../../js/good_list.js"></script>
</head>
<body>
<div style="width:1100px;margin-left: 20px;margin-top: 20px">
    <div class="layui-form">
        <blockquote class="layui-elem-quote quoteBox ">
            下单情况
        </blockquote>
    </div>
    <table class="layui-table" lay-filter="demo"
           lay-data="{width: 1100, height:440, url:'order/get', page:true, id:'booklist',method:'post'}">
        <thead>
        <tr>
            <th lay-data="{field:'orderId', width:150, fixed: true}">订单编号</th>
            <th lay-data="{field:'name',templet: '#name',width:200}">买家姓名</th>
            <th lay-data="{field:'name',templet: '#goodname',width:200}">商品名称</th>
            <th lay-data="{field:'date', width:120}">下单时间</th>
            <th lay-data="{field:'price', width:120}">金额</th>
            <th lay-data="{field:'isDistributed',templet: '#class', width:120}">是否被处理</th>
            <th
                    lay-data="{fixed: 'right', width:183, align:'center', toolbar: '#barDemo'}">操作</th>
        </tr>
        </thead>
    </table>
</div>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script id="name" type="text/html">
    {{ d.user.name}}
</script>
<script id="goodname" type="text/html">
    {{ d.good.name}}
</script>

</body>
</html>
