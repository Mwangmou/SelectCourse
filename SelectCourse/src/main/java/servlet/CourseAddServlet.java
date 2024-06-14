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
 * Servlet implementation class CourseAddServlet
 */
@WebServlet("/CourseAddServlet")
public class CourseAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CourseAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String CourseName=request.getParameter("CourseName");
		String TeacherName=request.getParameter("TeacherName");
		String CoursePlace=request.getParameter("CoursePlace");
		int AllStudent=Integer.parseInt(request.getParameter("AllStudent"));
		String CourseType=request.getParameter("CourseType");
		String CourseTime=request.getParameter("CourseTime");
		CourseInfo course=new CourseInfo(0,CourseName,TeacherName,CoursePlace,AllStudent,0,CourseType,CourseTime,"未满");
		int re=CourseDao.AddCourse(course);
		if(re>0) {
			out.println("<script language=javascript>alert('添加成功！');window.location='AdminCourse.jsp';</script>");
			return;
		}
		else {
			out.println("<script language=javascript>alert('添加失败！');window.location='AdminCourse.jsp';</script>");
			return;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
