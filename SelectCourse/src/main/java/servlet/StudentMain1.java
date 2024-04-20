package servlet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.CourseInfo;
import Dao.CourseDao;

public class StudentMain1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // String CourseType = Integer.parseInt(request.getParameter("CourseType"));
    	String CourseType = request.getParameter("CourseType");
    	
        List<CourseInfo> filteredCourses = (List<CourseInfo>) CourseDao.getCourseType(CourseType); // Assuming CourseDao has a method to get courses by type
        
        // You can store the filtered courses in a request attribute and then forward to a JSP to display the results
        request.setAttribute("filteredCourses", filteredCourses);
        request.getRequestDispatcher("FilteredCourses.jsp").forward(request, response);
    }
}










//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/StudentMain1")
//public class StudentMain1 extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//  
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//		doGet(request, response);
//	}
//
//}
