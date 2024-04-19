<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生选课管理</title>
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseselectdb", "root", "123456");
        stmt = conn.createStatement();

        // 查询所有选课信息
        rs = stmt.executeQuery("SELECT * FROM studentcourseinfo");

        out.println("<h2>学生选课信息</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>学生ID</th><th>课程ID</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("StudentID") + "</td>");
            out.println("<td>" + rs.getInt("CourseID") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        // 添加选课信息
        int studentId = 1; // 举例：学生ID
        int courseId = 1; // 举例：课程ID
        stmt.executeUpdate("INSERT INTO studentcourseinfo (StudentId, CourseId) VALUES (" + studentId + ", " + courseId + ")");

        // 删除选课信息
        int deleteId = 1; // 举例：要删除的选课信息ID
        stmt.executeUpdate("DELETE FROM studentcourseinfo WHERE id = " + deleteId);

    } catch (Exception e) {
        out.println("错误： " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

</body>
</html>
