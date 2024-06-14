<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Front.*" %>
<%@ page import="Dao.*" %>
<%@ page import="Bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看已选课程</title>
<link rel="stylesheet" href="./css/CheckCourseStyle.css">
</head>
<body>
<!-- 完成界面传值，通过登陆界面的用户名（学号）显示学生信息  -->
<%!StudentInfo stu; %>
<%!int id; %>
<%
try{
	Object id1=session.getAttribute("StudentID");
	id=(int)id1;
	stu=StudentDao.getStudent(id);
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
// Assuming CourseDao has a method to get all courses
%>
<%
	int pageNum=1;
	int pageRows=StudentCourseDao.getPageRows(id);
	StringBuffer sb=CourseFrontPage.ShowInfo(pageNum, pageRows);
	%>
	<%
	int pageSize=CourseFrontPage.pageSize;
	int totalPage=CourseFrontPage.TotalPage;
	String CourseType=request.getParameter("CourseType");
	String CourseName=request.getParameter("CourseName");
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
					查看已选课程
				</div>
				<div class="username">
					欢迎您，<%=stu.getName() %>同学
				</div>
					<a href="Login.jsp" class="off">退出登录</a>
					<div class="main">
						<form action="" method="get" class="sousuo">
						<table>
						<tr>
							<td>课程类型：<select name="CourseType" id="CourseType" class="CourseType" style="height:30px;line-height:30px;width:100px;">
							<option value="">&nbsp;</option>
							<option value="网络选修课">网络选修课</option>
							<option value="公共选修课">公共选修课</option>
							</select>
							</td>
							<td><input type="text" placeholder="课程名称" name="CourseName" id="CourseName"></td>
							<td><input type="submit" id="searchBtn" value="搜索"></td>
						</tr>
						</table>
					
					</form>
						<div id="Courselist">
	</div>
	<%=sb %>
					</div>
			</div>
		</div>
	<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script>
var pageNum=1;
var pageSize="<%=pageSize%>";
var CourseType="<%=CourseType%>";
var CourseName="<%=CourseName%>";
var StudentID=<%=stu.getStudentID()%>;
$(function(){
	getlistwithPage();
	
	ClickSearch();
});
function ClickSearch(){
	
	$('#searchBtn').click(function(){
		CourseType=$('#CourseType').val();
		CourseName=$('#CourseName').val();
		getlistwithPage();
	})
}

function getlistwithPage(){
	
	var content=[];
	content.push("<table style='width:90%;' cellspacing='0'  bordercolor='#ccc' border='1' cellspelling='0'>");
	content.push("<thead class='tableH'><td style='width:20%;text-align:center;'>课程序号</td><td style='width:20%;text-align:center;'>课程名称</td><td style='width:10%;text-align:center;'>授课老师</td><td style='width:10%;text-align:center;'>上课地点</td><td style='width:10%;text-align:center;'>课程类型</td><td style='width:10%;text-align:center;'>上课时间</td><td style='width:10%;text-align:center;'>操作</td></thead>");
	content.push("<tbody>");
	$.ajax({
		type:"post",
		async:true,
		url:"CheckCourseServlet?pageSize="+pageSize+"&pageNum="+pageNum+"&CourseName="+CourseName+"&CourseType="+CourseType+"&StudentID="+StudentID,
		dataType:"json",
		success:function(result){
			var result = JSON.stringify(result);
			var dateArr = jQuery.parseJSON(result);
			console.log(dateArr.length);
			if(dateArr.length>0){
				for(var i =0;i<dateArr.length;i++){
					content.push("<tr style='height:50px;line-height:50px;' class='tabledate'>");
					content.push("<td style='text-align:center;'>"+dateArr[i].courseID+"</tb>");
					content.push("<td style='text-align:center;'>"+dateArr[i].courseName+"</tb>");
					content.push("<td style='text-align:center;'>"+dateArr[i].teacherName+"</td>");
					content.push("<td style='text-align:center;'>"+dateArr[i].coursePlace+"</tb>");
					content.push("<td style='text-align:center;'>"+dateArr[i].courseType+"</tb>");
					content.push("<td style='text-align:center;'>"+dateArr[i].courseTime+"</tb>");
					content.push("<td style='text-align:center;'><a href='StuDelCourseServlet?CourseName="+dateArr[i].courseName+"&StudentID="+StudentID+"&CourseID="+dateArr[i].courseID+"' style='display:inline-block;height:30px;width:50px;background-color:#2d6fb7;color:white;line-height:30px;'>退课</a></tb>");
					content.push("</tr>");
				}
			}
			content.push("</tbody>");
			content.push("</table>");
			console.log(content);
			$('#Courselist').html(content.join(''));
			$('#pageNum').html(pageNum);
			$('table .tabledate:even').css("background-color","#f2f2f2");
			/* alert("success"); */
		},error:function(){
			alert("error");
		}
	})
}


	

function prvePage(){
	if(pageNum==1){
		alert("已经是第一页了");
		return;
	}
	pageNum--;
	getlistwithPage();
}
function nextPage(){
	if(pageNum==<%=totalPage%>){
		alert("已经是最后一页了");
		return;
	}
	pageNum++;
	getlistwithPage();
}

</script>
</body>
</html>