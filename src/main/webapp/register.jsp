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
<title>注册</title>

</head>
<body>

<blockquote class="layui-elem-quote layui-text">
   注册页面
</blockquote>

<div id="container-register">

	<form id = "registerForm" class="layui-form layui-form-pane" method="post" action="RegisterServlet">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
			<input type="text"  id="employeeName" placeholder="输入" name="employeeName" class="layui-input" autocomplete="off">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码:</label>
			<div class="layui-input-inline">
				<input type="password" class="layui-input" id="employeePassword"
					   placeholder="输入" name="employeePassword">
			</div>
		</div>
		<div class="layui-form-item" pane="">
			<label class="layui-form-label">性别：</label>
			<div class="layui-input-block">
				<input type="radio" name="employeeSex" value="男" title="男" checked="">
				<input type="radio" name="employeeSex" value="女" title="女">
				<input type="radio" name="employeeSex" value="禁" title="禁用" disabled="">
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">出生日期</label>
			<div class="layui-input-inline">
				<input type="text" name="employeeBirth" id="employeeBirth" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">电话：</label>
			<div class="layui-input-inline">
				<input type="tel" id="employeePhone" name="employeePhone" lay-verify="required|phone" autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">创建时间:</label>
			<div class="layui-input-inline">
					<input type="text" id="joinTime" name="joinTime" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">地址</label>
			<div class="layui-input-block">
				<input type="text" name="employeePlace"  autocomplete="off" placeholder=".." class="layui-input">
			</div>
		</div>


		<div>
			<button type="submit" style="margin-left: 50px" class="layui-btn">注册</button>
			<button type="reset" style="margin-left: 50px" class="layui-btn layui-btn-primary">重置</button>
		</div>


	</form>
	<script src="layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>

        layui.use(['form', 'laydate'], function(){
            var form = layui.form
				,laydate = layui.laydate;
            //日期
            laydate.render({
                elem: '#employeeBirth'
            });
            laydate.render({
                elem: '#joinTime'
            });

            //……

            //但是，如果你的HTML是动态生成的，自动渲染就会失效
            //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
            form.render();
        });

	</script>
</div>
</body>
</html>