<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Dao.*" %>
<%@ page import="Bean.*" %>
<%@ page import="Front.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师端 | 查看已选学生</title>
<link rel="stylesheet" href="./css/TeacherMainStyle.css">
</head>
<body>
<%
	int CourseID=Integer.parseInt(request.getParameter("CourseID"));
	int pageNum=1;
	int pageRows=StudentCourseDao.getCoursePageRows(CourseID);
	StringBuffer sb=FrontPage.ShowInfo(pageNum, pageRows);
	int pageSize=FrontPage.pageSize;
	int totalPage=FrontPage.TotalPage;
	String ClassID=request.getParameter("ClassID");
	
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
					查看已选学生
				</div>
				<div class="username">
					欢迎您，admin
				</div>
	<a href="Login.jsp" class="off">退出登录</a>
				<div class="main">
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
	var ClassID="<%=ClassID%>";
	var CourseID="<%=CourseID%>";
	$(function(){
		getlistwithPage();
		
		ClickSearch();
	});
	function ClickSearch(){
		
		$('#searchBtn').click(function(){
			CourseID=$('#CourseID').val();
			ClassID=$('#ClassID').val();
			getlistwithPage();
		})
	}
	
	function getlistwithPage(){
		
		var content=[];
		content.push("<table style='width:90%;margin-top:20px;' cellspacing='0'  bordercolor='#ccc' border='1' cellspelling='0'>");
		content.push("<thead class='tableH'><td style='width:10%;text-align:center;'>学生学号</td><td style='width:10%;text-align:center;'>学生姓名</td><td style='width:10%;text-align:center;'>学生专业</td><td style='width:10%;text-align:center;'>学生班级</td><td style='width:10%;text-align:center;'>选修课程</td><td style='width:10%;text-align:center;'>授课老师</td></thead>");
		content.push("<tbody>");
		$.ajax({
			type:"post",
			async:true,
			url:"ViewCourseServlet?pageSize="+pageSize+"&pageNum="+pageNum+"&CourseID="+CourseID+"&ClassID="+ClassID,
			dataType:"json",
			success:function(result){
				var result = JSON.stringify(result);
				var dateArr = jQuery.parseJSON(result);
				console.log(dateArr.length);
				if(dateArr.length>0){
					for(var i =0;i<dateArr.length;i++){
						content.push("<tr style='height:30px;line-height:30px;' class='tabledate'>");
						content.push("<td style='text-align:center;'>"+dateArr[i].studentID+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].name+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].major+"</td>");
						content.push("<td style='text-align:center;'>"+dateArr[i].classID+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].courseName+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].teacherName+"</tb>");
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