layui.use('element', function() {
    var element = layui.element;

});

layui.use('form', function() {
    var form = layui.form;
});

layui.use('table', function(){
    var table = layui.table;
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
                    url:"/Admin/classify/delete",
                    data:{
                       id:data.id
                    },
                    dataType:'json',
                    success:function(result){
                        if(result=="error"){
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
    $('.quoteBox .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
});

function add() {

    layer.prompt({
        formType:2,
        title:'请输入分类名称',
        area:['250px','30px'],

    },function (value,index,elem){
        console.log(value);
        $.ajax({
            type:"post",
            url:"/Admin/AdminServlet",
            data:{
               name:value
            },
            dataType:'json',
            success:function(result){
               if(result=="success"){
                   layer.close(index);
               }else{
                   layer.msg('添加失败');
               }

            }
        }) ;

    });

}