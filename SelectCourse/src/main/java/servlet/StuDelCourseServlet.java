package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StudentCourseDao;
//退课页面
@WebServlet("/StuDelCourseServlet")
public class StuDelCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public StuDelCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		int StudentID=Integer.parseInt(request.getParameter("StudentID"));
		int CourseID=Integer.parseInt(request.getParameter("CourseID"));
		String CourseName=request.getParameter("CourseName");
		System.out.println(StudentID);
		System.out.println(CourseName);
		try {
		int re=StudentCourseDao.DeleteCourse(StudentID, CourseName,CourseID);
		if(re>0) {
			out.println("<script language=javascript>alert('退课成功！');window.location='StudentMain.jsp';</script>");
		}
		else {
			out.println("<script language=javascript>alert('退课失败！');window.location='CheckCourse.jsp';</script>");

		}
		}catch(Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
