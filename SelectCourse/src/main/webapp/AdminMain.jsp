<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Bean.*" %>
     <%@page import="java.util.*" %>
    <%@page import="Dao.*" %>
    <%@ page import="Front.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/TeacherMainStyle.css">
</head>
<body>
<%!AdminInfo adm; %>
<!-- 取登录界面的username -->
<%
Object account=session.getAttribute("AdminAccount");
String account1=account.toString();

%>
<%
	int pageNum=1;
	int pageRows=StudentDao.getPageRows();
	StringBuffer sb=FrontPage.ShowInfo(pageNum, pageRows);
	%>
	<%
	int pageSize=FrontPage.pageSize;
	int totalPage=FrontPage.TotalPage;
	String StudentName=request.getParameter("StudentName");
	String StudentMajor=request.getParameter("StudentMajor");
	String StudentSex=request.getParameter("StudentSex");
	String StudentClass=request.getParameter("StudentClass");
	String StudentAddress=request.getParameter("StudentAddress");
%>

<div class="box">
			<div class="left">
				<div id="" class="title">
					智能选课系统
				</div>
				<ul>
									<li class="a"><img src="./img/用户图标.png" class="user"><a href="">学生信息管理</a>
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
										<a href="AdmRevisePassword.jsp"><img src="./img/用户图标.png" class="course" />修改密码</a>
									
									</li>
									</ul>
			</div>
			<div class="right">
				<div class="title">
					选课管理系统
				</div>
				<div class="username">
					欢迎您，admin
				</div>
	<a href="Login.jsp" class="off">退出登录</a>
				<div class="main">
					<form action="" method="get" class="sousuo">
						<table>
						<tr>
							<td><input type="text" placeholder="学生姓名" name="StudentName" id="StudentName"></td>
							<td><input type="text" placeholder="学生专业" name="StudentMajor" id="StudentMajor"></td>
							<td><input type="text" placeholder="学生性别" name="StudentSex" id="StudentSex"></td>
							<td><input type="text" placeholder="学生班级" name="StudentClass" id="StudentClass"></td>
							<td><input type="text" placeholder="学生籍贯" name="StudentAddress" id="StudentAddress"></td>
							<td><input type="submit" id="searchBtn" value="搜索"></td>
						</tr>
						</table>
					
					</form>
						<div id="StudentList">
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
	var StudentName="<%=StudentName%>";
	var StudentMajor="<%=StudentMajor%>";
	var StudentSex="<%=StudentSex%>";
	var StudentClass="<%=StudentClass%>";
	var StudentAddress="<%=StudentAddress%>";
	$(function(){
		getlistwithPage();
		
		ClickSearch();
	});
	function ClickSearch(){
		
		$('#searchBtn').click(function(){
			StudentName=$('#StudentName').val();
			StudentMajor=$('#StudentMajor').val();
			StudentSex=$('#StudentSex').val();
			StudentClass=$('#StudentClass').val();
			StudentAddress=$('#StudentAddress').val();
			getlistwithPage();
		})
	}
	
	function getlistwithPage(){
		
		var content=[];
		content.push("<table style='width:90%;' cellspacing='0'  bordercolor='#ccc' border='1' cellspelling='0'>");
		content.push("<thead class='tableH'><td style='width:10%;text-align:center;'>学生学号</td><td style='width:10%;text-align:center;'>学生姓名</td><td style='width:10%;text-align:center;'>学生密码</td><td style='width:10%;text-align:center;'>学生性别</td><td style='width:10%;text-align:center;'>学生年龄</td><td style='width:10%;text-align:center;'>学生班级</td><td style='width:20%;text-align:center;'>学生专业</td><td style='width:20%;text-align:center;'>学生籍贯</td></thead>");
		content.push("<tbody>");
		$.ajax({
			type:"post",
			async:true,
			url:"StudentServlet?pageSize="+pageSize+"&pageNum="+pageNum+"&StudentName="+StudentName+"&StudentMajor="+StudentMajor+"&StudentSex="+StudentSex+"&StudentClass="+StudentClass+"&StudentAddress="+StudentAddress,
			dataType:"json",
			success:function(result){
				var result = JSON.stringify(result);
				var dateArr = jQuery.parseJSON(result);
				console.log(dateArr.length);
				if(dateArr.length>0){
					for(var i =0;i<dateArr.length;i++){
						content.push("<tr style='height:30px;' class='tabledate'>");
						content.push("<td style='text-align:center;'>"+dateArr[i].studentID+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].name+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].password+"</td>");
						content.push("<td style='text-align:center;'>"+dateArr[i].sex+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].age+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].classID+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].major+"</tb>");
						content.push("<td style='text-align:center;'>"+dateArr[i].address+"</tb>");
						content.push("</tr>");
					}
				}
				content.push("</tbody>");
				content.push("</table>");
				console.log(content);
				$('#StudentList').html(content.join(''));
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

</html>