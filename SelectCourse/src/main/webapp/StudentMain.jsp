<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Bean.*" %>
<%@ page import="Dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在线选课</title>
<link rel="stylesheet" href="./css/StudentMainStyle.css">
</head>
<body>
<%!StudentInfo stu; %>
<%
	try{
		Object id1 = session.getAttribute("StudentID");
		int id = (int) id1;
		stu = StudentDao.getStudent(id);
	}
	catch(Exception e){
		out.println(e.getMessage());
	}


	List<CourseInfo> courses = CourseDao.getNewList(); // Assuming CourseDao has a method to get all courses
%>
<div class="box">
	<div class="left">
		<div id="" class="title">
			智能选课系统
		</div>
		<ul>
			<li class="a"><img src="./img/试卷图标.jpg" class="course"><a href="">在线选课</a></li>
			<li class="a"><a href=""><img src="./img/试卷图标.jpg" class="course" />查看已选课程</a></li>
			<li class="a"><a href="StuRevisePassword.jsp"><img src="./img/用户图标.png" class="user" />修改密码</a></li>
		</ul>
	</div>
	<div class="right">
		<div class="title">
			在线选课
		</div>
		<div class="username">
			欢迎您，<%=stu.getName()%>同学
		</div>
		<a href="Login.jsp" class="off">退出登录</a>
		<div class="main">
			<div class="head">
				课程类型：<select>
					<option value="1">网络选修课</option>
					<option value="2">公共选修课</option>
				</select>
				<input type="text" class="Coursename" placeholder="课程名" />
				<input type="button" value="搜索" />
			</div>
			<table class="detail" border="1" bordercolor=#ccc cellspacing="0">
				<tr>
					<td class="title1">ID</td>
					<td class="title1">课程名称</td>
					<td class="title1">授课老师</td>
					<td class="title1">上课地点</td>
					<td class="title1">教室可容纳人数</td>
					<td class="title1">已选学生人数</td>
					<td class="title1">课程类型</td>
					<td class="title1">上课时间</td>
					<td class="title1">课程状态</td>
					
					<td class="title1">操作</td>
				</tr>
				<%
		
					for (CourseInfo course : courses) {
				%>
				<tr>
					<td><%= course.getCourseID() %></td>
					<td><%= course.getCourseName() %></td>
					<td><%= course.getTeacherName() %></td>
					<td><%= course.getCoursePlace() %></td>
					<td><%= course.getAllStudent() %></td>
					<td><%= course.getStudentNum() %></td>
					<td><%= course.getCourseType() %></td>
					<td><%= course.getCourseTime() %></td>
					<td><%= course.getCourseCondition() %></td>
					<td><span class="buttonblue"><input type="button" value="选课" /></span></td>
				</tr>
				<%
					}
				%>
			</table>
			<!-- 页码 -->
			<input type="button" value="首页" class="page start"/>
			<input type="button" value="1" class="pagenum"/>
			<input type="button" value="尾页" class="page last"/>
		</div>
	</div>
</div>
</body>
</html>
