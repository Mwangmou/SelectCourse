package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.StudentCourseInfo;
import Dao.StudentCourseDao;


@WebServlet("/StuAddCourseServlet")
public class StuAddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public int count=0;
    public StuAddCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		int CourseID=Integer.parseInt(request.getParameter("id"));
		int StudentID=Integer.parseInt(request.getParameter("StudentID"));
		StudentCourseInfo st=new StudentCourseInfo(0,StudentID,CourseID);
		int re2;
		//先查询表里面有没有这个学生的相关选课信息
		try {
			int re=StudentCourseDao.getCourseStudent(CourseID, StudentID);
			if(re>0) {
			out.println("<script language=javascript>alert('不能多次选择同一课程！');window.location='StudentMain.jsp';</script>");
			}
			else {
				re2=StudentCourseDao.AddStudentCourse(st);
				if(re2>0) {
					out.println("<script language=javascript>alert('选课成功！');window.location='StudentMain.jsp';</script>");
				}
				else {
					out.println("<script language=javascript>alert('选课失败！');window.location='StudentMain.jsp';</script>");

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		int re;
//		count++;
//		if(count==1) {
//			re=StudentCourseDao.AddStudentCourse(st);
//			if(re>0) {
//			out.println("<script language=javascript>alert('选课成功！');window.location='StudentMain.jsp';</script>");
//			}else {
//				out.println("<script language=javascript>alert('选课失败！');window.location='StudentMain.jsp';</script>");
//
//			}
//			}
//		else {
//			out.println("<script language=javascript>alert('不能多次选择同一课程！');window.location='StudentMain.jsp';</script>");
//		}
//		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
