<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.*" %>
<%@ page import="Dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师端|修改选课信息</title>
<link rel="stylesheet" href="./css/TeacherMainStyle.css">
<style>
form{

margin:0 auto;/* 水平居中 */
position: absolute; /* 相对定位 */
top: 45%; /* 距离顶部 50% */left: 50%; /* 距离左侧 50% */
transform: translate(-50%, -50%);
background-color: white;
}
tr{
height:50px;
line-height:50px;
}
input[type='text']{
height:50px;
line-height:50px;
width:200px;
}
input[type='submit']{
height:30px;
line-height:30px;
background-color:#2d6fb7;
color:white;
border:none;
width:100%;
}
</style>
</head>
<body>
<%
int CourseID=Integer.parseInt(request.getParameter("CourseID"));
CourseInfo course;
course=CourseDao.getCourseByID(CourseID);
%>
<div class="box">
<div class="left">
				<div id="" class="title">
					智能选课系统
				</div>
				<ul>
									<li class="a"><img src="./img/用户图标.png" class="user"><a href="AdminMain.jsp">学生信息管理</a>
									</li>
									<li class="a">
										<a href="AdminCourse.jsp"><img src="./img/试卷图标.jpg" class="course" />选修课程管理</a>
									<div class="droplist">
										<ul>
											<li><a href="AdminCourse.jsp">选修列表</a></li>
											<li><a href="AddCourse.jsp">新增课程</a></li>
										</ul>
									</div>
									</li>
									<li class="a">
										<a href="AdmRevisePassword.jsp"><img src="./img/用户图标.png" class="course" />修改密码</a>
									
									</li>
									</ul>
			</div>
			<div class="right">
				<div class="title">
					修改课程信息
				</div>
				<div class="username">
					欢迎您，admin
				</div>
	<a href="Login.jsp" class="off">退出登录</a>
				<div class="main">
					<form action="CourseUpdateServlet" method="get" class="">
						<table style="width:400px;text-align:center;">
						<tr style="display:none;">
						<td>课程序号</td>
						<td><input type="text" name="CourseID" value=<%=course.getCourseID() %>></td>
						</tr>
						<tr>
						<td>课程名称</td>
						<td><input type="text" name="CourseName" value=<%=course.getCourseName() %>></td>
						</tr>
						<tr>
						<td>授课老师</td>
						<td><input type="text" name="TeacherName" value=<%=course.getTeacherName() %>></td>
						</tr>
						<tr>
						<td>上课地点</td>
						<td><input type="text" name="CoursePlace" value=<%=course.getCoursePlace() %>></td>
						</tr>
						<tr>
						<td>教室可容纳人数</td>
						<td><input type="text" name="AllStudent" value=<%=course.getAllStudent() %>></td>
						</tr>
						<tr>
						<td>课程类型</td>
						<td><input type="text" name="CourseType" value=<%=course.getCourseType() %>></td>
						</tr>
						<tr>
						<td>上课时间</td>
						<td><input type="text" name="CourseTime" value=<%=course.getCourseTime() %>></td>
						</tr>
						<tr>
						<td colspan="2"><input type="submit" value="提交"></td>
						</tr>
						</table>
					
					</form>
						
					
				</div>
			</div>
</div>
</body>
</html>