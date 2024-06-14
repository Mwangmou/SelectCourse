package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.CourseInfo;
import Dao.CourseDao;

/**
 * Servlet implementation class CourseUpdateServlet
 */
@WebServlet("/CourseUpdateServlet")
public class CourseUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CourseUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int CourseID=Integer.parseInt(request.getParameter("CourseID"));
		String CourseName=request.getParameter("CourseName");
		String TeacherName=request.getParameter("TeacherName");
		String CoursePlace=request.getParameter("CoursePlace");
		int AllStudent=Integer.parseInt(request.getParameter("AllStudent"));
		String CourseType=request.getParameter("CourseType");
		String CourseTime=request.getParameter("CourseTime");
		PrintWriter out=response.getWriter();
		CourseInfo course=new CourseInfo(CourseID,CourseName,TeacherName,CoursePlace,AllStudent,0,CourseType,CourseTime,"未满");
		int re=CourseDao.UpdateCourse(course, CourseID);
		if(re>0) {
			out.println("<script language=javascript>alert('修改成功！');window.location='AdminCourse.jsp';</script>");
		}
		else {
			out.println("<script language=javascript>alert('修改失败！');window.location='AdminCourse.jsp';</script>");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
