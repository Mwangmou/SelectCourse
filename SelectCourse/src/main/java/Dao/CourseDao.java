package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import Bean.AdminInfo;

//import com.mysql.jdbc.PreparedStatement;

import Bean.CourseInfo;
import Bean.StudentCourseInfo;
import Bean.StudentInfo;
import Util.DBHelper;

public class CourseDao {
	 public static List getCourseList(String sql){
			Connection conn=null;
			List list=new ArrayList();
			ResultSet re=null;
			   try {
				conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql,list);
				while(re.next()){
					list.add(new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9)));
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				
			}
			   return list;
		   }
	   
	 public static int UpdateCourse(String sql){
		   Connection conn=null;
		   int re=0;
		   try {
			   conn=DBHelper.getConn();
				re=DBHelper.executeUpdate(sql, null);
		} catch (Exception e) {
			// TODO: handle exception
		}
		   return re;
	   }
	 //添加学生信息
	 public static int AddCourse(CourseInfo course){
		   int re=0;
		   try{
			   String sql="insert into CourseInfo values(?,?,?,?,?,?,?,?,?)";
			   List params= new ArrayList();
			   params.add(course.getCourseID());
			   params.add(course.getCourseName());
			   params.add(course.getTeacherName());
			   params.add(course.getCoursePlace());
			   params.add(course.getAllStudent());
			   params.add(course.getStudentNum());
			   params.add(course.getCourseType());
			   params.add(course.getCourseTime());
			   params.add(course.getCourseCondition()); 
			   re=DBHelper.executeUpdate(sql, params);
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }
		return re;
	   }
	   //分页
	   public static int getCount()  throws SQLException{
			Connection conn=null;
	    	ResultSet re=null;
	    	int count=0;
			try{
				conn=DBHelper.getConn();   
				String sql="select count(0) from news";
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()){
					count=re.getInt(1);
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				re.close();
			}return count;
			
		}
	   
	   public static List<CourseInfo> getCoursePage(int pageNum,int pageSize) throws SQLException{
	    	List<CourseInfo>list=new ArrayList<CourseInfo>();
	    	Connection conn=null;
	    	ResultSet re=null;
	    	int row=(pageNum-1)*pageSize;
	      try {
	    	  String sql="select * from News limit "+row+","+pageSize;
			conn=DBHelper.getConn();      
			re=DBHelper.executeQuery(conn, sql);
			while(re.next()){
				list.add(new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9)));
			  
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
				re.close();
		}
	      return list;
	    }
		
		
//修改
	   public static int UpdateCourse(CourseInfo course,int id){
			 int re=0;
			 try {
				String sql="update CourseInfo set CourseID=?,CourseName=?,TeacherName=?,CoursePlace=?,AllStudent=?,StudentNum=?,CourseType=?,CourseTime=?,CourseCondition=? where CourseID="+id+"";
				List params=new ArrayList();
				params.add(course.getCourseID());
				params.add(course.getCourseName());
				params.add(course.getTeacherName());
				params.add(course.getCoursePlace());
				params.add(course.getAllStudent());
				params.add(course.getStudentNum());
				params.add(course.getCourseType());
				params.add(course.getCourseTime());
				params.add(course.getCourseCondition());
				
				
				re=DBHelper.executeUpdate(sql,params);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			 return re;
		}

		    
		
	   public static int AddNews(CourseInfo news){
		   int re=0;
		   try{
			   String sql="insert into News values(?,?,?,?,?)";
			   List params= new ArrayList();
			   params.add(news.getCourseID());
			   params.add(news.getCourseName());
			   params.add(news.getTeacherName());
			   params.add(news.getCoursePlace());
			   params.add(news.getAllStudent());
			   params.add(news.getStudentNum());
			   params.add(news.getCourseType());
			   params.add(news.getCourseTime());
			   params.add(news.getCourseCondition());
			   
			 
			   re=DBHelper.executeUpdate(sql, params);
			   
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }
		return re;
	   }
	   
	 //修改 根据type找出其他学生信息
		 public static CourseInfo getCourseType(String CourseType){
			 CourseInfo news=null;
			 Connection conn=null;
			 String sql="select * from courseinfo where CourseType="+CourseType;
			
			 try {
				 conn=DBHelper.getConn();
				 ResultSet re = DBHelper.executeQuery(conn, sql);
				while(re.next()){
					 news=new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9));
				 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
			 return news;
		 }
	   
		 //根据课程ID找出课程其他信息
		 public static CourseInfo getCourseByID(int id){
			 Connection conn=null;
			CourseInfo course=null;
			ResultSet re=null;
			 try {
				 String sql="select * from CourseInfo where CourseID="+id+"";
				 conn=DBHelper.getConn();
					re=DBHelper.executeQuery(conn, sql);
					System.out.println();
					while(re.next()){
						course=new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9));
						
					}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			 finally{
//				 DBHelper.closeResource(re, null, conn);
			 }
			 return course;
		 }
	   
	  
	   public static int DeleteCourse(int id){
		   String sql="DELETE FROM CourseInfo where CourseID="+id;
		   int re=0;
		   try {
				re= DBHelper.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		   return re;
	   }
	   //
	    public static CourseInfo select(int newsid) throws SQLException{
			ResultSet re=null;
			CourseInfo n=null;
			try {
				String sql="select * from news where newsid="+newsid;
				re=DBHelper.executeQuery( null, sql);
				System.out.println(sql);
				while(re.next()){
					n=new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9));
				}
				System.out.println(sql);
			} catch (Exception e) {
				
				System.out.println(e.getMessage());
			}finally {
				re.close();
			}
			return n;
	}
	    
	    
	    
	    
	    public static List<CourseInfo> getCoursesByType(String courseType) throws SQLException {
	        List<CourseInfo> courses = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;
	        try {
	            connection = DBHelper.getConn();
	            String sql = "SELECT * FROM courseinfo WHERE CourseType = ?";
	            statement = connection.prepareStatement(sql);
	            statement.setString(1, courseType);
	            resultSet = statement.executeQuery();

	            // Process the query results here...
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle the SQL exception (e.g., log the error, return an error response, etc.)
	        } finally {
	            // Close resources in the finally block
	            DBHelper.closeResource(resultSet, statement, connection);
	        }

	        
	        
	        
	        
	        
	        
//	        try {
//	            connection = DBHelper.getConn();
//	            String sql = "SELECT * FROM courseinfo WHERE CourseType = ?";
////	            try {
////	                statement = connection.prepareStatement(sql);
////	            } catch (SQLException e) {
////	                e.printStackTrace();
////	                // Handle the exception (e.g., log the error, return an error response, etc.)
////	            }
//
//	           // statement = (PreparedStatement) connection.prepareStatement(sql);
//	            statement.setString(1, courseType);
//	            resultSet = statement.executeQuery();
//
//	            while (resultSet.next()) {
//	                CourseInfo course = new CourseInfo(
//	                    resultSet.getInt("CourseID"),
//	                    resultSet.getString("CourseName"),
//	                    resultSet.getString("TeacherName"),
//	                    resultSet.getString("CoursePlace"),
//	                    resultSet.getInt("AllStudent"),
//	                    resultSet.getInt("StudentNum"),
//	                    resultSet.getString("CourseType"),
//	                    resultSet.getString("CourseTime"),
//	                    resultSet.getString("CourseCondition")
//	                );
//	                courses.add(course);
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	            throw e;
//	        } finally {
//	            DBHelper.closeResource(resultSet, statement, connection);
//	        }
	        return courses;
	    }
	    
	    
	    
	   //所有
	    public static List<CourseInfo> getCoursePage(int pageSize,int pageNum,String CourseType,String CourseName,String CourseCondition) throws SQLException{
			   List<CourseInfo> list=new ArrayList<CourseInfo>();
			   ResultSet re=null;
			   Connection conn=null;
			   int offset=(pageNum-1)*pageSize;
			   String sql="select * from CourseInfo where 1=1";
			   try {
				conn=DBHelper.getConn();
				if("null".equals(CourseType)) {
					CourseType = null;
				}
				if("null".equals(CourseCondition)) {
					CourseCondition = null;
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
				   if(CourseCondition!=null&&!CourseCondition.equals(""))
				   {
					   sql+=" and CourseCondition like '%"+CourseCondition+"%'";
					   System.out.println(sql);
				   }
				   sql+=" limit "+offset+","+pageSize;
				   System.out.println(sql);
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()) {
					list.add(new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9)));
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
	   //未满
	
	    public static List<CourseInfo> getSomeCoursePage(int pageSize,int pageNum,String CourseType,String CourseName) throws SQLException{
			   List<CourseInfo> list=new ArrayList<CourseInfo>();
			   ResultSet re=null;
			   Connection conn=null;
			   int offset=(pageNum-1)*pageSize;
			   String sql="select * from CourseInfo where CourseCondition='未满'";
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
					list.add(new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9)));
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
	  
		   //获取总记录数
			public static int getPageRows() throws SQLException{
				ResultSet re=null;
				Connection conn=null;
				int TotalPage = 0;
				String sql="select count(0) from CourseInfo";
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
//根据课程ID修改已选学生
			 public static int UpdateByID(int id){
				 int re=0;
				 try {
					String sql="update CourseInfo set StudentNum=StudentNum+1 where CourseID="+id+"";
					
					re=DBHelper.executeUpdate(sql);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
				}
				 return re;
			}
			 public static int UpdateByIDMinus(int id){
				 int re=0;
				 try {
					String sql="update CourseInfo set StudentNum=StudentNum-1 where CourseID="+id+"";
					re=DBHelper.executeUpdate(sql);
					System.out.println(re);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
				}
				 return re;
			}
//如果课程选满了，状态改为已满
			//根据课程ID修改已选学生
			 public static int UpdateCondition(){
				 int re=0;
				 try {
					String sql="update CourseInfo set CourseCondition='已满' where AllStudent=StudentNum";
					
					re=DBHelper.executeUpdate(sql);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
				}
				 return re;
			}
	    
			 public static int UpdateConditionMinus(){
				 int re=0;
				 try {
					String sql="update CourseInfo set CourseCondition='未满' where AllStudent!=StudentNum";
					
					re=DBHelper.executeUpdate(sql);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
				}
				 return re;
			}
	    
	    
	    
	    
}
