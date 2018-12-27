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
<title>奖品管理</title>

</head>
<body>

<blockquote class="layui-elem-quote layui-text">
   奖品管理页面
</blockquote>

<table class="layui-hide" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

	<script src="layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
        layui.use(['table','jquery'], function(){
            var $ = layui.$ //重点处

            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/AwardServlet?opt=search'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'index', width:80, title: 'ID', sort: true}
                    ,{field:'awardName', width:150, title: '奖品名'}
                    ,{field:'stock', width:80, title: '库存',event:'setStock' , sort: true}
                    ,{field:'image', width:250, title: '图片地址'}
                    ,{field:'column1', width:80,title: '备用'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ,{field:'column2', width:80,title: '备注'}
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
                    layer.alert('请注意：<br>'+ "请直接在单元格上点击进行修改")
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