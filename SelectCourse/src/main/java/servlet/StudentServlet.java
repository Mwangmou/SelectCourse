package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.*;
import Dao.*;
import Front.*;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = 1;
		int pageSize = 20;
		if(request.getParameter("pageNum")!=null){
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("pageSize")!=null){
			pageSize=Integer.parseInt(request.getParameter("pageSize"));
		}
		String StudentName=request.getParameter("StudentName");
		String StudentMajor=request.getParameter("StudentMajor");
		String StudentSex=request.getParameter("StudentSex");
		String StudentClass=request.getParameter("StudentClass");
		String StudentAddress=request.getParameter("StudentAddress");
		
		try {
			response.setContentType("text/json;charest=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			List<StudentInfo> list = null;
			list=StudentDao.getStudentPage(pageSize, pageNum,StudentName,StudentMajor,StudentSex,StudentClass,StudentAddress);
			JSONArray jsonarry = JSONArray.fromObject(list);
			pw.write(jsonarry.toString());
			System.out.println(jsonarry.toString());
			pw.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
