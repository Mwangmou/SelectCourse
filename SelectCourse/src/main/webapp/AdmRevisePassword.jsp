<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智能选课系统 | 修改密码</title>
<link rel="stylesheet" href="./css/TeacherRevice.css">
</head>
<body>
<div class="box">
			<div class="left">
				<div class="title">
					智能选课系统
				</div>
				<ul>
									<li class="a"><img src="./img/用户图标.png" class="user"><a href="">学生信息管理</a>
									<div class="droplist">
										<ul>
											<li><a href="AdminMain.jsp">学生列表</a></li>
										</ul>
									</div>
									</li>
									<li class="a">
										<a href=""><img src="./img/试卷图标.jpg" class="course" />选修课程管理</a>
									<div class="droplist">
										<ul>
											<li><a href="">选修列表</a></li>
											<li><a href="">新增课程</a></li>
										</ul>
									</div>
									</li>
									<li class="a">
										<a href=""><img src="./img/用户图标.png" class="course" />修改密码</a>
									</li>
									</ul>
			</div>
			<div class="right">
				<div class="title">
					修改密码
				</div>
				<div class="username">
					欢迎您，admin
				</div>
					<a href="Login.jsp" class="off">退出登录</a>
				<div class="main">
					<form class="revise" action="AdRevisePasswordServlet">
						<div class="newpw">
							新密码
						</div>
						<input type="password" name="newpw" id="newpw"/>
						<br />
						<div class="confirm">
							确认密码
						</div>
						<input type="password" name="comfirmpw" id="comfirmpw"/>
						<br />
						<label class="red" id="red">两次输入密码不一致！</label>
						<br />
						<input type="submit" name="confirmRevise" id="confirmRevise" value="确认修改" />
					</form>
					
				</div>
			</div>
		</div>

</body>
</html>
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		$('#confirmRevise').click(function(e){
			if($('#newpw').val()!=$('#comfirmpw').val()){
				$('#red').css("display","block");
				return;
			}
		});
	})

</script>