<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智能选课系统 | 登录页面</title>
<link rel="stylesheet" href="./css/LoginStyle.css">
<!-- 判断账号密码是否为空，若为空弹出红色提示信息 -->
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$('.login').click(function(e){
		if($('#username').val().length==0){
			$('.usn').css("display","block");
			return false;
		}
		if($('#password').val().length==0){
			$('.psw').css("display","block");
			return false;
		}
	});
});
</script>
</head>
<body>
<div class="box">
			<form class="contain" action="LoginServlet">
			<p class="title">智能选课管理</p>
			<label>用户名</label>
			<div>
				<input type="text" name="username" id="username" value="" />
				<br>
				<label class="red usn">用户名为空！请输入！</label>
			</div>
			<label>密码</label>
			<div>
				<input type="password" name="password" id="password" value="" />
				<br>
					<label class="red psw">密码为空！请输入！</label>
			</div>
			<input type="radio" name="identity" id="" value="0" checked />管理员
			<input type="radio" name="identity" id="" value="1" />用户
			<br>
			<input type="submit" name="login" value="立即登录" class="login" />
			<br>
			<a href="Register.jsp">
			<input type="button" name="register" id="" value="前往注册" class="register"/>
			</a>
			<br/>
		</form>

</div>
</body>
</html>