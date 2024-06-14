package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.CourseInfo;
import Bean.StudentInfo;
import Dao.CourseDao;
import Dao.StudentDao;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageNum = 1;
		int pageSize = 12;
		if(request.getParameter("pageNum")!=null){
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("pageSize")!=null){
			pageSize=Integer.parseInt(request.getParameter("pageSize"));
		}
		String CourseName=request.getParameter("CourseName");
		String CourseCondition=request.getParameter("CourseCondition");
		String CourseType=request.getParameter("CourseType");
		
		try {
			response.setContentType("text/json;charest=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			List<CourseInfo> list = null;
			list=CourseDao.getCoursePage(pageSize, pageNum,CourseType,CourseName,CourseCondition);
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
