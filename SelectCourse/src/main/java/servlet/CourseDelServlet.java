package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CourseDao;
import Util.DBHelper;

/**
 * Servlet implementation class CourseDelServlet
 */
@WebServlet("/CourseDelServlet")
public class CourseDelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CourseDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int CourseID = Integer.parseInt(request.getParameter("CourseID"));

        // Check if any student has selected this course
        if (isCourseSelected(CourseID)) {
            out.println("<script language=javascript>alert('有学生选过这门课，无法删除！');window.location='AdminCourse.jsp';</script>");
            return;
        }

        int re = CourseDao.DeleteCourse(CourseID);
        if (re > 0) {
            out.println("<script language=javascript>alert('删除成功！');window.location='AdminCourse.jsp';</script>");
        } else {
            out.println("<script language=javascript>alert('删除失败！');window.location='AdminCourse.jsp';</script>");
        }
    }

    private boolean isCourseSelected(int courseID) {
        boolean isSelected = false;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.getConn();
            String sql = "SELECT COUNT(0) FROM StudentCourseInfo WHERE courseid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, courseID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                isSelected = count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	DBHelper.closeResultSet(rs);
        	DBHelper.closeStatement(pstmt);
        	DBHelper.closeConnection(conn);
        }

        return isSelected;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

//package servlet;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import Dao.CourseDao;
//
///**
// * Servlet implementation class CourseDelServlet
// */
//@WebServlet("/CourseDelServlet")
//public class CourseDelServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//    public CourseDelServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		int CourseID=Integer.parseInt(request.getParameter("CourseID"));
//		int re=CourseDao.DeleteCourse(CourseID);
//		if(re>0) {
//			out.println("<script language=javascript>alert('删除成功！');window.location='AdminCourse.jsp';</script>");
//			return;
//		}
//		else {
//			out.println("<script language=javascript>alert('删除成功！');window.location='AdminCourse.jsp';</script>");
//			return;
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
