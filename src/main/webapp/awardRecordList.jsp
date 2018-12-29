<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="layui/css/layui.css"  media="all">
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<title>兑奖管理</title>

</head>
<body>



<blockquote class="layui-elem-quote layui-text">
   兑奖管理页面
</blockquote>

<table class="layui-hide" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">兑奖</a>
</script>

	<script src="layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
        layui.use(['table','jquery'], function(){
            var $ = layui.$ //重点处

            var table = layui.table;

            var tt = table.render({
                elem: '#test'
                ,url:'/AwardServlet?opt=searchRecord'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', width:80, title: 'ID', sort: true}
                    ,{field:'awardName', width:180, title: '奖品名'}
                    ,{field:'userName', width:150, title: '用户名'}
                    ,{field:'finished', width:150, title: '是否兑奖'}
                    ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
                ]]
            });

            table.on('tool(demo)', function(obj){
                var data = obj.data;
                if(obj.event === 'detail'){
                    layer.msg('ID：'+ data.id + ' 的查看操作');
                } else if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del();
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){

                    //ajax操作
                    $.ajax({
                        url: "/AwardServlet",
                        data:{index: data.index,opt: 'updateRecord',id:data.id},
                        type: "post",
                        dataType: 'text',
                        success: function (text) {
							tt.reload();
                        },
                        error: function(text){
                            ;
                        }
                    });

                }
               else  if(obj.event === 'setStock'){
                    layer.prompt({
                        formType: 2
                        ,title: '修改 ID 为 ['+ data.index +'] 的奖品库存'
                        ,value: data.stock
                    }, function(value, index){
                        layer.close(index);

                        //这里一般是发送修改的Ajax请求

						$.ajax({
                            url: "/AwardServlet",
                            data:{index: data.index,opt: 'updateStock',stock:data.stock},
                            type: "post",
                            dataType: 'text',
                            success: function (text) {
                               ;
                            },
                            error: function(text){
                                ;
							}
                            });


                        //同步更新表格和缓存对应的值
                        obj.update({
                            stock: value
                        });
                    });
                }
            });
        });


	</script>
</div>
</body>
</html>