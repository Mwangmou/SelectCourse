package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AdminDao;
import Dao.StudentDao;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		int type=Integer.parseInt(request.getParameter("identity"));
		PrintWriter ps=response.getWriter();
		boolean ok;
		if(type==1) {
			ok=StudentDao.StudentLogin(username,password);
			if(ok) {
				//将学号保存到Session对象中
				request.getSession().setAttribute("StudentID", Integer.parseInt(username));
				//设置isLogin属性为true
				request.getSession().setAttribute("isLogin", true);
				//使用重定向到首页
				response.sendRedirect("StudentMain.jsp");
				//提示信息
				out.println("<script>alert('登陆成功！')</script>");
				}
				
			}
			if(type==0) {
				ok=AdminDao.AdminLogin(username, password);
				if(ok) {
					//将账号保存到Session对象中
					request.getSession().setAttribute("AdminAccount", username);
					//设置isLogin属性为true
					request.getSession().setAttribute("isLogin", true);
					//使用重定向到首页
					response.sendRedirect("AdminMain.jsp");
					//提示信息
					out.println("<script>alert('登陆成功！')</script>");
					
				}
				
			}
			
		}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
