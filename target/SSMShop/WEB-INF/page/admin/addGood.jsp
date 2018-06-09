<%--
  Created by IntelliJ IDEA.
  User: 62588
  Date: 2018/4/27
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../layui/layui.js"></script>
</head>
<body >

    <div style="width:1100px;margin-left:20px;margin-top:20px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>发布新的商品</legend>
    </fieldset>
    <form class="layui-form" action="/Admin/good/add" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">货物名称</label>
            <div class="layui-input-block">
                <input name="name" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">售价</label>
            <div class="layui-input-inline">
                <input name="price" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">库存</label>
                <div class="layui-input-inline">
                    <input name="stock" class="layui-input" id="date" type="number" placeholder="请输入" autocomplete="off" >
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属分类</label>
            <div class="layui-input-inline">
                <select name="classId" id="classify">
                    <option value="">请选择分类信息</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item  layui-form-text">
            <label class="layui-form-label">商品简介</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea" placeholder="请输入内容" name="msg"></textarea>
            </div>
        </div>
        <div class="layui-form-item  layui-form-text">
            <label class="layui-form-label">展示图片</label>
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-danger" id="upload1" type="button"><i class="layui-icon"></i>上传图片</button>
                <div class="layui-inline layui-word-aux">
                    这里以限制 60KB 为例
                </div>
                <input type="hidden" id="img_url" name="imgUrl" value=""/>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" width="100px" height="80px" id="demo1"/>
                    <p id="demoText"></p>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="demo1" lay-submit="">立即提交</button>
            </div>
        </div>
    </form>
    </div>
     <script>
         //JavaScript代码区域
         layui.use(['form', 'layedit', 'laydate'], function(){
             var form = layui.form
                 ,layer = layui.layer;
             //自定义验证规则
             form.verify({
                 title: function(value){
                     if(value.length < 5){
                         return '标题至少得5个字符啊';
                     }
                 }
                 ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                 ,content: function(value){
                     layedit.sync(editIndex);
                 }
             });

             //监听指定开关
             form.on('switch(switchTest)', function(data){
                 layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                     offset: '6px'
                 });
                 layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
             });

             //监听提交
             form.on('submit(demo1)', function(data){
                 layer.alert(JSON.stringify(data.field), {
                     title: '最终的提交信息'
                 })
                 return true;
             });


         });
         layui.use('upload', function(){
             var upload = layui.upload
                 , $ = layui.jquery;
             var uploadInst = upload.render({
                 elem: '#upload1' //绑定元素
                 ,url: '/Admin/upload/img' //上传接口
                 ,before: function(obj) {
                     //预读本地文件示例，不支持ie8
                     obj.preview(function (index, file, result) {
                         $('#demo1').attr('src', result); //图片链接（base64）
                     });
                 }
                 ,done: function(res){
                         //如果上传失败
                         if(res.code > 0){
                             return layer.msg('上传失败');
                         }
                         //上传成功
                         alert("上传成功"+res.url);
                         document.getElementById("img_url").value = res.url;

                 }
                 ,error: function(){
                     //演示失败状态，并实现重传
                     var demoText = $('#demoText');
                     demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                     demoText.find('.demo-reload').on('click', function(){
                         uploadInst.upload();
                     });
                 }
             });
         });

     </script>
     <script>
         $.ajax({
             type:"post",
             url:"/Admin/classify/show",
             dataType:'json',
             success:function(result){
                 var _classify=$('#classify');
                 for(var i=0;i<result.data.length;i++){
                     var _date=(result.data)[i];
                     _classify.append("<option value='"+_date.id+"'>"+_date.name+"</option>");
                 }
             }
         });


     </script>
</body>
</html>
