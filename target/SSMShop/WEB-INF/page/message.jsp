<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/5/9
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/good_list.js"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="clearfix wd10"></div>
<div id="content" style="margin-left: 50px">
    <strong >购物车信息</strong>

    <table class="layui-table" lay-filter="demo"
           lay-data="{width: 1100, height:440, url:'order/get', page:true, id:'booklist',method:'post'}">
        <thead>
        <tr>
            <th lay-data="{field:'orderId', width:150, fixed: true}">订单编号</th>
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
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">取消订单</a>
</script>

<script id="name" type="text/html">
    {{ d.user.name}}
</script>
<script id="goodname" type="text/html">
    {{ d.good.name}}
</script>
</body>
</html>
