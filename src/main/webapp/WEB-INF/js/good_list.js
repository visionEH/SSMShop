layui.use('element', function() {
    var element = layui.element;

});

layui.use('laydate', function() {
    var laydate = layui.laydate;

    laydate.render({
        elem: '#time_start'
    });
    laydate.render({
        elem: '#time_end'

    });


});
layui.use('form', function() {
    var form = layui.form;
    //监听性别操作
    form.on('switch(sexDemo)', function(obj){
        layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
    });
});

layui.use('table', function(){
    var table = layui.table;
    //监听表格复选框选择
    table.on('checkbox(demo)', function(obj){
        console.log(obj)
    });


    //监听工具条
    table.on('tool(demo)', function(obj){
        var data = obj.data;
        if(obj.event === 'detail'){
            //查看当前
            layer.alert('查看行：<br>'+ JSON.stringify(data));
        } else if(obj.event === 'del'){
            layer.confirm('真的删除这一行么？', function(index){

                $.ajax({
                    type:"post",
                    url:"/Book/AdminServlet",
                    data:{
                        isbn:data.isbn,
                        op:"delete"
                    },
                    dataType:'json',
                    success:function(result){
                        if(!result.code){
                            //error
                            layer.alert('删除失败,请重试');
                        }else{
                            layer.alert('删除成功');
                        }
                    }
                });
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            //layer.alert('编辑行：<br>'+ data.id);
            window.location.href=encodeURI('editGood?msg='+JSON.stringify(data));
        }
    });

    var $ = layui.$, active = {
        deleteall: function(){ //批量删除
            var checkStatus = table.checkStatus('booklist')
                ,data = checkStatus.data;
            $.ajax({
                type:"post",
                url:"/Book/AdminServlet",
                data:{
                    isbn:JSON.stringify(data),
                    op:"deleteall"
                },
                dataType:'json',
                success:function(result){
                    if(!result.code){
                        //error
                        layer.alert('删除失败,请重试');
                    }else{
                        layer.alert('删除成功');
                        location.reload();
                    }
                }
            });
        }
        ,search: function(){
            var searchname=$('#searchname');

            table.reload('booklist',{
                page:{
                    curr:1
                }
                ,where:{
                    type:"key",
                    name : encodeURI(searchname.val())

                }
            });
        }
        ,filter: function(){

            var start=$('.start:visible');
            var end=$('.end:visible');
            var type=$('#type').val();
            table.reload('booklist',{
                page:{
                    curr:1
                }
                ,where:{
                    start:start.val(),
                    end:end.val(),
                    type:type
                }
            });
        }
    };
    $('.quoteBox .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
});