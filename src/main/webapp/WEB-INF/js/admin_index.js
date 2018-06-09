//JavaScript代码区域
layui.use('element', function(){
    var element = layui.element;
});

$('#logout').onclick(function () {
    $.ajax({
         type:"get",
         url:'/Account/logout',

         success:function(result){
             window.location.href='/Account/login';
        }
    });
});
