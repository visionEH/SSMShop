<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/27
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <link rel="stylesheet" href="../../layui/css/layui.css">
     <script src="../../layui/layui.js"></script>
     <script src="../../js/good_list.js"></script>
</head>
<body>

   <div style="width:1100px;margin-left: 20px;margin-top: 20px">
       <div class="layui-form">
           <blockquote class="layui-elem-quote quoteBox ">
               <button class="layui-btn layui-bg-blue" data-type="search" onclick="window.location.replace('/Admin/addGood')" style="margin-left:10px" >添加商品信息</button>
           </blockquote>
       </div>
       <table class="layui-table" lay-filter="demo"
              lay-data="{width: 1100, height:440, url:'good/show', page:true, id:'booklist',method:'post'}">
           <thead>
           <tr>
               <th lay-data="{field:'id', width:120, fixed: true}">商品编号</th>
               <th lay-data="{field:'name', width:200}">名称</th>
               <th lay-data="{field:'stock', width:120}">库存</th>
               <th lay-data="{field:'price', width:120}">售价</th>
               <th lay-data="{field:'classify',templet: '#class', width:120}">所属分类</th>
               <th lay-data="{field:'msg', width:250}">详情</th>
               <th
                   lay-data="{fixed: 'right', width:183, align:'center', toolbar: '#barDemo'}">操作</th>
           </tr>
           </thead>
       </table>
   </div>
   <script id="barDemo" type="text/html">
       <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
       <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
       <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
   </script>

   <script id="class" type="text/html">
      {{ d.classify.name}}
   </script>



</body>
</html>
