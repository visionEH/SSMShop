

layui.use('element', function() {
    var element = layui.element;

});
layui.use([ 'form', 'layedit', 'laydate' ],
    function() {
        var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            account : function(value) {

                if (value.length == 0) {
                    return '不能为空';
                }
            },
            pass : [ /(.+){6,12}$/, '密码必须6到12位' ]
        });

        //监听提交
        form.on('submit(login)', function(data) {

            return true;
        });
        //是否登陆成功
        var msg='<%=request.getParameter("msg") %>';
        if(msg=="error"){
            layer.alert("账号或者密码错误");
        }

});
function  register() {
      //跳转到注册页面
      window.location.href="register";
}