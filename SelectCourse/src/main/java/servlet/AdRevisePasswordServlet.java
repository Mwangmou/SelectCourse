package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AdminDao;

public class AdRevisePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdRevisePasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		Object Account=request.getSession().getAttribute("AdminAccount");
		String Account1=Account.toString();
		String newpw=request.getParameter("newpw");
		String comfirmpw=request.getParameter("comfirmpw");
		if(newpw.equals(comfirmpw)) {
			int re=AdminDao.UpdatePassword(comfirmpw,Account1);
			if(re>0) {
				out.println("<script language=javascript>alert('修改密码成功！');window.location='Login.jsp';</script>");
			}
			else {
				out.println("<script language=javascript>alert('修改密码失败！');window.location='Login.jsp';</script>");
			}
			
		}
		else {
			System.out.println("<servlet>alert('两次密码不一致，请重新输入！')</servlet>");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
