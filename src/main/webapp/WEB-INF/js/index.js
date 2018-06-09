


layui.use('element', function(){
    var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

    //监听导航点击
    element.on('nav(menu)', function(elem){
        console.log(elem);

       // layer.msg(elem.text());
    });
});
layui.use('carousel', function(){
    var carousel = layui.carousel;
    //建造实例
    carousel.render({
        elem: '#carousel'
        ,width: '100%' //设置容器宽度
        ,height: '100%'
        ,arrow: 'always' //始终显示箭头
        //,anim: 'updown' //切换动画方式
        ,interval:10000
    });
});

function changenum(userId,goodId,number) {
   console.log(userId+""+goodId+number);
    $.ajax({
        type:"post",
        url:'/shop/update',
        data:{
            goodId:goodId,
            userId:userId,
            number:number
        },
        success:function(result){
               if (result=="success"){
                   layer.msg("修改成功");
               }else if(result=="error"){
                   layer.msg("修改失败");
               }
        }
    });
}