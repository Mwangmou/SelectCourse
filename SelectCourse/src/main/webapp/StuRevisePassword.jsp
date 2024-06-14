<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="Bean.*" %>
    <%@ page import="Dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/ChangePasswordStyle.css">
</head>
<body>
<!-- 完成界面传值，通过登陆界面的用户名（学号）显示学生信息  -->
<%!StudentInfo stu; %>
<%
try{
	Object id1=session.getAttribute("StudentID");
	int id=(int)id1;
	stu=StudentDao.getStudent(id);
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
%>
<div class="box">
		<div class="left">
			<div id="" class="title">
				智能选课系统
			</div>
			<ul>
								<li class="a"><img src="./img/试卷图标.jpg" class="course"><a href="StudentMain.jsp">在线选课</a>
								</li>
								<li class="a">
									<a href="CheckCourse.jsp"><img src="./img/试卷图标.jpg" class="course" />查看已选课程</a>
			
								</li>
								<li class="a">
									<a href="StuRevisePassword.jsp"><img src="./img/用户图标.png" class="user" />修改密码</a>
								</li>
								</ul>
		</div>
			<div class="right">
				<div class="title">
					修改密码
				</div>
				<div class="username">
					欢迎您，<%=stu.getName()%>同学
				</div>
					<a href="Login.jsp" class="off">退出登录</a>
					<div class="main">
						<form class="revise" action="RevisePasswordServlet" method="post">
							<div>
								新密码
							</div>
							<input type="password" name="newpw" id="newpw"/>
							<br />
							<div>
								确认密码
							</div>
							<input type="password" name="comfirmpw" id="comfirmpw" />
							<br />
							<label class="red" id="red">两次输入不一致！请重新输入</label>
							<br />
							<input type="submit" name="confirmRevise" id='confirmRevise' value="确认修改" />
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
				$('#red').css("display","block")
				return false;
			}
		});
	})
</script>