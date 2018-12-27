<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored ="false"%><!--注意要老版的jsp要加上isELIgnored ="false"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/custom.css">
	<!-- Favicon and touch icons -->
	<link rel="shortcut icon" href="assets/ico/favicon.png">
</head>
<body>

<body>
<div class="container ">
	<div class="row">
		<div class="login-container col-lg-4 col-md-6 col-sm-8 col-xs-12">
			<div class="login-title text-center">
				<h2><span>抽奖<strong>系统</strong></span></h2>
			</div>
			<div class="login-content">
				<div class="login-header ">
					<h3><strong>欢迎,</strong></h3>
					<h5>这是一个抽奖系统，还在测试中，如有问题请反馈给我们</h5>
				</div>
				<div class="login-body">
					<form role="form" action="LoginServlet" method="post" class="login-form">
						<div class="form-group ">
							<div class="pos-r">
								<input   id="employeeName" name="employeeName" type="text"  placeholder="Username..." class="form-username form-control">
								<i class="fa fa-user"></i>
							</div>
						</div>
						<div class="form-group">
							<div class="pos-r">
								<input  id="password" name="employeePassword" type="password"  placeholder="Password..." class="form-password form-control" >
								<i class="fa fa-lock"></i>
							</div>
						</div>


						<div class="form-group">
							<button type="submit" class="btn btn-primary form-control"><strong>登录</strong></button>
							<button type="submit" style="margin-top: 10px;background-color:greenyellow;border-color: yellow" class="btn btn-primary form-control" formaction="LoginServlet?employeeName=anonymous"><strong>游客登录</strong></button>
						</div>

					</form>
				</div> <!-- end  login-body -->
			</div><!-- end  login-content -->
			<div class="login-footer text-center template">
				<h5>您还没有账号?<a href="register.jsp" class="bold"> 注册 </a>     </h5>
			</div>
		</div>  <!-- end  login-container -->

	</div>
</div><!-- end container -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</body>
</html>