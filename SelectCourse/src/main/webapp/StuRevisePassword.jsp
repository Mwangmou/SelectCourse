<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Bean.*" %>
    <%@ page import="Dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/StudentMainStyle.css">
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
				<a href=""><img src="./img/试卷图标.jpg" class="course" />查看已选课程</a>
	
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
				<!-- 右上角显示学生姓名功能  -->
					欢迎您，<%=stu.getName()%>同学
				</div>
					<a href="login.jsp" class="off">退出登录</a>
					<div class="main">
			<form class="revise" action="RevisePasswordServlet" method="post">
							<div>
								新密码
							</div>
							<input type="password" name="newpw"/>
							<br />
							<label class="red">密码不能与旧密码一致！</label>
							<div>
								确认密码
							</div>
							<input type="password" name="comfirmpw" />
							<br />
							<label class="red">两次输入不一致！</label>
							<br />
							<input type="submit" name="confirmRevise" value="确认修改" />
							<a href="RevisePasswordServlet">确认修改</a>
						</form>
					</div>
			</div>
		</div>

</body>
</html>