<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Dao.*" %>
<%@ page import="Front.*" %>
<%@ page import="Bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>选修列表</title>
<link rel="stylesheet" href="./css/TeacherMainStyle.css">
</head>
<body>

<%
	int pageNum=1;
	int pageRows=CourseDao.getPageRows();
	StringBuffer sb=CourseFrontPage.ShowInfo(pageNum, pageRows);
	%>
	<%
	int pageSize=CourseFrontPage.pageSize;
	int totalPage=CourseFrontPage.TotalPage;
	String CourseName=request.getParameter("CourseName");
	String CourseCondition=request.getParameter("CourseCondition");
	String CourseType=request.getParameter("CourseType");
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
					选课列表
				</div>
				<div class="username">
					欢迎您，admin
				</div>
	<a href="Login.jsp" class="off">退出登录</a>
				<div class="main">
					<form action="" method="get" class="sousuo" >
						<table>
						<tr>
							<td><input type="text" placeholder="课程名称" name="CourseName" id="CourseName"></td>
							<td>
							<select name="CourseCondition" id="CourseCondition" style="height:30px;width:80px;line-height:80px;">
							<option value=""></option>
							<option value="已满">已满</option>
							<option value="未满">未满</option>
							</select>
							</td>
							<td>
							<select name="CourseType" id="CourseType" style="height:30px;width:80px;line-height:80px;">
							<option value=""></option>
							<option value="公共选修课">公共选修课</option>
							<option value="网络选修课">网络选修课</option>
							</select>
							</td>
							
							<td><input type="submit" id="searchBtn" value="搜索"></td>						</tr>
						</table>
					
					</form>
						<div id="Courselist">
	</div>
	<%=sb %>
					
				</div>
			</div>
		</div>

</body>
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script>
	var pageNum=1;
	var pageSize="<%=pageSize%>";
	var CourseName="<%=CourseName%>";
	var CourseType="<%=CourseType%>";
	var CourseCondition="<%=CourseCondition%>";
	$(function(){
		getlistwithPage();
		
		ClickSearch();
	});
	function ClickSearch(){
		
		$('#searchBtn').click(function(){
			CourseName=$('#CourseName').val();
			CourseCondition=$('#CourseCondition').val();
			CourseType=$('#CourseType').val();
			getlistwithPage();
		})
	}
	
	function getlistwithPage(){
		
		var content=[];
		content.push("<table style='width:90%;margin-top:20px;' cellspacing='0'  bordercolor='#ccc' border='1' cellspelling='0'>");
		content.push("<thead class='tableH'><td style='width:10%;text-align:center;'>课程序号</td><td style='width:20%;text-align:center;'>课程名称</td><td style='width:10%;text-align:center;'>授课老师</td><td style='width:10%;text-align:center;'>上课地点</td><td style='width:10%;text-align:center;'>教室可容纳人数</td><td style='width:10%;text-align:center;'>课程类型</td><td style='width:10%;text-align:center;'>上课时间</td><td style='width:20%;text-align:center;' colspan='3'>操作</td></thead>");
		content.push("<tbody>");
		$.ajax({
			type:"post",
			async:true,
			url:"CourseServlet?pageSize="+pageSize+"&pageNum="+pageNum+"&CourseName="+CourseName+"&CourseCondition="+CourseCondition+"&CourseType="+CourseType,
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
						content.push("<td style='text-align:center;'>"+dateArr[i].allStudent+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].courseType+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].courseTime+"</tb>");
						content.push("<td style='text-align:center;'><a href='UpdateCourse.jsp?CourseID="+dateArr[i].courseID+"' style='display:inline-block;height:30px;line-height:30px;color:white;background-color:#ff0000;width:50px;'>修改</a></tb>");
						content.push("<td style='text-align:center;'><a href='CourseDelServlet?CourseID="+dateArr[i].courseID+"' style='background-color:#2d6fb7;width:50px;display:inline-block;height:30px;line-height:30px;color:white;'>删除</a></tb>");
						content.push("<td style='text-align:center;'><a href='ViewCourse.jsp?CourseID="+dateArr[i].courseID+"' style='display:inline-block;height:30px;line-height:30px;color:white;background-color:#ff0000;width:50px;'>查看</a></tb>");						content.push("</tr>");
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

	function delCourse(courseID){
		var res = window.confirm("是否确认删除");
		if(!res){
			return;
		}
		$.ajax({
			type:"post",
			url:"NewsDsreServlet?courseID="+courseID,
			dataType:"text",
			success:function(mes){
				alert(mes);
				window.location.reload();
			}
		})
	}
</script>
</body>
</html>