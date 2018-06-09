<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/27
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <script src="../../layui/layui.js"></script>
    <script src="../../js/classify_list.js"></script>
    <script src="../../js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div style="width:1100px;margin-left: 20px;margin-top: 20px">
    <div class="layui-form">
        <blockquote class="layui-elem-quote quoteBox ">
            <button class="layui-btn layui-bg-blue" data-type="search" onclick="add();" style="margin-left:10px" >添加新的分类</button>
        </blockquote>
    </div>
    <table class="layui-table" lay-filter="demo"
           lay-data="{width: 470, height:440, url:'classify/show', page:true, id:'booklist',method:'post'}">
        <thead>
        <tr>
            <th lay-data="{field:'id', width:120, fixed: true}">分类标识</th>
            <th lay-data="{field:'name', width:150}">名称</th>
            <th
                    lay-data="{fixed: 'right', width:200, align:'center', toolbar: '#barDemo'}">操作</th>
        </tr>
        </thead>
    </table>
</div>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
</html>
