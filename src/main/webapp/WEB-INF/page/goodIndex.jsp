<%@ page import="javax.naming.Name" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*"%>
<%@ page import="entity.Good" %>
<%@ page import="util.JsonUtil" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/28
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/index.js"></script>

</head>

<body>
<jsp:include page="top.jsp"></jsp:include>

<div class="clearfix wd10"></div>
<div id="product-content">
    <strong >所有商品</strong>
    <ul class="product-list">
        <%
            List<Good> goodList= (List<Good>) request.getAttribute("goodlist");

            for(int i=0;i<goodList.size();i++){
               Good good=goodList.get(i);
            %>
        <li class="product-box">
            <a class="image" >
                <img src="img/sale.jpg" >
            </a>
            <a class="name"><%=good.getName()%></a>
            <div class="price">
                <span>￥ <%=good.getPrice()%></span>
                <del>￥ <%=good.getPrice()%></del>
                <a  class="layui-btn" onclick="add(<%=good.getId()%>)">加入购物车</a>
            </div>
        </li><%
        }
        %>

    </ul>
</div>
<div id="footer"></div>
 <script>
     function add(v) {
         <%
           User user=(User)session.getAttribute("user");
         %>
         var  userid=<%=user==null?null:1%>
         if(userid ==null){
             alert('请先登录');
             window.location.href='/Account/login';
             return ;
         }else{
             $.ajax({
                 type:"post",
                 url:"/shop/add",
                 data:{
                     goodId:v
                 },
                 dataType:'text',
                 success:function(data){
                     if(data=="error"){
                         alert('添加购物车失败,请重试');
                     }else if(data=="exist"){
                         alert('该商品已经存在');
                     }else if(data=="success"){
                         alert("添加成功");
                     }
                 }
             })

         }


     }
 </script>
</body >

