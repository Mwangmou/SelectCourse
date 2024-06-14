package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.StudentInfo;
import Dao.StudentDao;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		int StudentID=Integer.parseInt(request.getParameter("id"));
		String password=request.getParameter("password");
		String sex=request.getParameter("sex");
		int age=Integer.parseInt(request.getParameter("age"));
		String address=request.getParameter("address");
		String major=request.getParameter("major");
		String classid=request.getParameter("classid");
		StudentInfo stu= new StudentInfo(StudentID,name,password,sex,age,address,major,classid);
		int re=StudentDao.AddStudent(stu);
		if(re>0) {
			out.println("<script language=javascript>alert('注册成功，请登录！');window.location='Login.jsp';</script>");
		}else {
			out.println("<script language=javascript>alert('注册失败，请重新注册！');window.location='Register.jsp';</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
