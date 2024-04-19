<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>智能选课系统 | 学生注册</title>
<link rel="stylesheet" href="./css/RegisterStyle.css">
</head>
<body>
	<form action="RegisterServlet">
			<p class="title">
				学生注册
			</p>
			<table border="0" cellspacing="0" cellpadding="">
				<tr>
					<td class="title1">姓名</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td class="title1">学号</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td class="title1">密码</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td class="title1">性别</td>
					<td><input type="radio" name="sex" value="男" checked>男<input type="radio" name="sex" value="女">女</td>
				</tr>
				<tr>
					<td class="title1">年龄</td>
					<td><input type="text" name="age"></td>
				</tr>
				<tr>
					<td class="title1">籍贯</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td class="title1">专业</td>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<td class="title1">班级</td>
					<td><input type="text" name="classid"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="注册" /></td>
				</tr>
			</table>
			
		</form>
	
</body>
</html>