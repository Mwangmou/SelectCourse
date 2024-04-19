<%@page import="Bean.StudentInfo"%>
<%@page import="Dao.*"%>
<%@page import="Front.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	int pageNum = 1;
	int pageRows = StudentDao.getPageRows();
	StringBuffer sb = FrontPage.ShowInfo(pageNum, pageRows);
%>
</head>
<body>
	<%=sb %>
</body>
</html>