package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.StudentInfo;
import Bean.ViewCourseInfo;
import Dao.StudentCourseDao;
import Dao.StudentDao;
import net.sf.json.JSONArray;

@WebServlet("/ViewCourseServlet")
public class ViewCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ViewCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageNum = 1;
		int pageSize = 20;
		if(request.getParameter("pageNum")!=null){
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("pageSize")!=null){
			pageSize=Integer.parseInt(request.getParameter("pageSize"));
		}
		String ClassID=request.getParameter("ClassID");
		int CourseID=Integer.parseInt(request.getParameter("CourseID"));
		try {
			response.setContentType("text/json;charest=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			List<ViewCourseInfo> list = null;
			list=StudentCourseDao.getCoursePageByCourseID(pageSize, pageNum,CourseID,ClassID);
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
