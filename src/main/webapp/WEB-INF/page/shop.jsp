<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/5/4
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/index.css">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../layui/layui.js"></script>

    <script src="../js/index.js"></script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>

<div class="clearfix wd10"></div>
<div id="content" style="margin-left: 50px">
    <strong >购物车信息</strong>
    <div class="layui-btn-group demoTable" style="margin-left: 420px">
        <button class="layui-btn layui-bg-red" data-type="getCheckData">结算</button>
    </div>
    <table class="layui-table" lay-filter="demo"
           lay-data="{width: 570, height:440, url:'shop/get', page:true, id:'list',method:'post'}">
        <thead>
        <tr>
            <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
            <th lay-data="{field:'name',templet: '#goodName' ,width:200}">商品名称</th>
            <th lay-data="{field:'number', templet: '#number' ,width:120}">购买数量</th>
            <th lay-data="{field:'price',templet: '#price',width:120}">单价</th>
            <th
            lay-data="{fixed: 'right', width:120, align:'center', toolbar: '#barDemo'}">操作</th>
        </tr>
        </thead>

    </table>

</div>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">移除购物车</a>
</script>
  <script >
      layui.use('table', function(){
          var table = layui.table
              ,form = layui.form;

          var $ = layui.$, active = {
              getCheckData: function(){ //获取选中数据
                  var checkStatus = table.checkStatus('list')
                      ,data = checkStatus.data;
                    console.log(data[0].number);

                 /* layer.alert(JSON.stringify(data));*/
                  var PriceSum=0;
                  for(var i=0;i<data.length;i++){
                     var   d=data[i];
                     PriceSum+=d.number*d.good.price;
                     console.log(d.number);
                     console.log(d.good);
                  }
                  layer.confirm('总计金额：'+PriceSum, {icon: 3, title:'提示:下单'}, function(index){
                      //do something
                      $.ajax({
                          type:'post',
                          url:'/shop/order',
                          data:{
                                  lists:  JSON.stringify(data)
                                },
                          success:function (result) {
                              if(result=="success"){
                                  layer.alert("下单成功");
                                  window.reload();
                              }else{
                                  layer.alert("下单失败");
                              }
                          }
                      })
                      layer.close(index);
                  });

              }
          };
          $('.demoTable .layui-btn').on('click', function(){
              var type = $(this).data('type');
              active[type] ? active[type].call(this) : '';
          });


      });
  </script>
  <script id="goodName" type="text/html">
    {{ d.good.name }}
  </script>
  <script id="number" type="text/html">
      <input class="layui-input" type="number" name="lock" value="{{d.number}}" min="1" onchange="changenum({{d.userId}},{{d.goodId}},this.value)">
  </script>
  <script id="price" type="text/html">
    {{ d.good.price }}
  </script>


</body>
</html>
