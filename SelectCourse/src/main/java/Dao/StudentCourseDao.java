package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.CheckCourseInfo;
import Bean.CourseInfo;
import Bean.StudentCourseInfo;
import Bean.ViewCourseInfo;
import Util.DBHelper;

public class StudentCourseDao {
	public static List getSelectCourseList(String sql){
		Connection conn=null;
		List list=new ArrayList();
		ResultSet re=null;
		   try {
			conn=DBHelper.getConn();
			re=DBHelper.executeQuery(conn, sql,list);
			while(re.next()){
				list.add(new StudentCourseInfo(re.getInt(1),re.getInt(2),re.getInt(3)));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			
		}
		   return list;
	   }
	//添加学生选课信息并且更改课程信息表中的状态和已选人数
	 public static int AddStudentCourse(StudentCourseInfo st){
		   int re=0,re1=0,re2=0;
		   try{
			   String sql="insert into StudentCourseInfo values(?,?,?)";
			   List params= new ArrayList();
			   params.add(st.getID());
			   params.add(st.getStudentID());
			   params.add(st.getCourseID());
			   re=DBHelper.executeUpdate(sql, params);
				/*
				 * 先添加至学生选课表，每次添加时，课程表的已选学生+1，当课程表的已选学生=可容纳人数时，
				 * 状态改为“已满”，第三步：同一门课一个学生只能选择一次，如果再选，提示“你已经选过该课程了”
				 */
			   if(re>0) {
				   System.out.println("选课成功");
				   re1=CourseDao.UpdateByID(st.getCourseID());
				   re2=CourseDao.UpdateCondition();
				   //你已经选过该课程了 在表中进行查找
				   
				   System.out.println(re1);
				   
			   }
			   else {
				   System.out.println("选课失败！");
			   }
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }
		return re;
	   }
	  //多表查询
	    public static List<CheckCourseInfo> getManyCoursePage(int pageSize,int pageNum,int StudentID,String CourseType,String CourseName) throws SQLException{
			   List<CheckCourseInfo> list=new ArrayList<CheckCourseInfo>();
			   ResultSet re=null;
			   Connection conn=null;
			   int offset=(pageNum-1)*pageSize;
			   String sql="select c.CourseID,c.CourseName,c.TeacherName,c.CoursePlace,c.CourseType,c.CourseTime from StudentCourseInfo sc inner join CourseInfo c on sc.CourseID=c.CourseID where StudentID="+StudentID;
			   try {
				conn=DBHelper.getConn();
				if("null".equals(CourseType)) {
					CourseType = null;
				}

				if("null".equals(CourseName)) {
					CourseName = null;
				}			
				if(CourseType!=null&&!CourseType.equals("")) {
					   sql+=" and CourseType = '"+CourseType+"'";
					   System.out.println(sql);
				   }
				   if(CourseName!=null&&!CourseName.equals(""))
				   {
					   sql+=" and CourseName like '%"+CourseName+"%'";
					   System.out.println(sql);
				   }
				  
				   sql+=" limit "+offset+","+pageSize;
				   System.out.println(sql);
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()) {
					list.add(new CheckCourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getString(5),re.getString(6)));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			   finally {
				   DBHelper.closeResource(re, null, conn);
			   }
			   return list;
		   }
	    //根据学生ID和课程ID删除课程信息表中的对应学生选课
	    public static int DeleteCourse(int id,String CourseName,int CourseID){
			  String sql="delete from StudentCourseInfo where StudentID="+id+" and CourseID=(select CourseID from CourseInfo where CourseName='"+CourseName+"');";
			  //退课后将已经修改过的数据修改回来
			//查一下courseID
			 
			   int re=0,re1=0,re2=0;
			   try {
					re=DBHelper.executeUpdate(sql);
					//已选学生-1
					if(re>0) {
					System.out.println("退课成功！");
					
					re1=CourseDao.UpdateByIDMinus(CourseID);
					System.out.println(re1);
					//已满改为未满
					re2=CourseDao.UpdateConditionMinus();
					System.out.println(re2);
					}
					
			} catch (Exception e) {
				// TODO: handle exception
			}
			   return re;
		   }
	    //上面搜索
	    public static List<StudentCourseInfo> getCoursePage(int pageSize,int pageNum,String CourseType,String CourseName) throws SQLException{
			   List<StudentCourseInfo> list=new ArrayList<StudentCourseInfo>();
			   ResultSet re=null;
			   Connection conn=null;
			   int offset=(pageNum-1)*pageSize;
			   String sql="select * from StudentCourseInfo where 1=1";
			   try {
				conn=DBHelper.getConn();
				if("null".equals(CourseType)) {
					CourseType = null;
				}

				if("null".equals(CourseName)) {
					CourseName = null;
				}			
				if(CourseType!=null&&!CourseType.equals("")) {
					   sql+=" and CourseType = '"+CourseType+"'";
					   System.out.println(sql);
				   }
				   if(CourseName!=null&&!CourseName.equals(""))
				   {
					   sql+=" and CourseName like '%"+CourseName+"%'";
					   System.out.println(sql);
				   }
				  
				   sql+=" limit "+offset+","+pageSize;
				   System.out.println(sql);
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()) {
					list.add(new StudentCourseInfo(re.getInt(1),re.getInt(2),re.getInt(3)));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			   finally {
				   DBHelper.closeResource(re, null, conn);
			   }
			   return list;
		   }
	    public static int getCoursePageRows(int CourseID) throws SQLException{
			ResultSet re=null;
			Connection conn=null;
			int TotalPage = 0;
			String sql="select count(0) from StudentCourseInfo  where CourseID="+CourseID;
			System.out.println(sql);
			try {
				conn = DBHelper.getConn();
				re = DBHelper.executeQuery(conn, sql);
				while(re.next()){
					TotalPage = re.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBHelper.closeResource(re, null, conn);
			}
			return TotalPage;
		}
	    public static int getPageRows(int StudentID) throws SQLException{
			ResultSet re=null;
			Connection conn=null;
			int TotalPage = 0;
			String sql="select count(0) from StudentCourseInfo where StudentID="+StudentID;
			System.out.println(sql);
			try {
				conn = DBHelper.getConn();
				re = DBHelper.executeQuery(conn, sql);
				while(re.next()){
					TotalPage = re.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBHelper.closeResource(re, null, conn);
			}
			return TotalPage;
		}
	    //查询表中有没有这个学生的相关选课信息
	    public static int getCourseStudent(int CourseID,int StudentID) throws SQLException{
	    	ResultSet re=null;
	    	Connection conn=null;
	    	int CourseNum=0;
	    	String sql="select count(0) from StudentCourseInfo where StudentID="+StudentID+" and CourseID="+CourseID;
	    	try {
				conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()) {
					CourseNum=re.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
	    	finally {
	    		DBHelper.closeResource(re, null, conn);
	    	}
	    	return CourseNum;
	    }
	    //根据课程ID查询学生选课信息
	    public static List<ViewCourseInfo> getCoursePageByCourseID(int pageSize,int pageNum,int CourseID,String ClassID) throws SQLException{
			   List<ViewCourseInfo> list=new ArrayList<ViewCourseInfo>();
			   ResultSet re=null;
			   Connection conn=null;
			   int offset=(pageNum-1)*pageSize;
				String sql="select sc.StudentID,s.Name,s.major,s.classid,c.CourseName,c.TeacherName from StudentCourseInfo sc inner join CourseInfo c on sc.CourseID=c.CourseID inner join StudentInfo s on sc.StudentID=s.StudentID where sc.CourseID="+CourseID;
			   try {
				conn=DBHelper.getConn();
				if("null".equals(ClassID)) {
					ClassID = null;
				}		
				if(ClassID!=null&&!ClassID.equals("")) {
					   sql+=" and s.ClassID like '%"+ClassID+"%'";
					   System.out.println(sql);
				   }
				   sql+=" limit "+offset+","+pageSize;
				   System.out.println(sql);
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()) {
					list.add(new ViewCourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getString(5),re.getString(6)));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			   finally {
				   DBHelper.closeResource(re, null, conn);
			   }
			   return list;
		   }
}
