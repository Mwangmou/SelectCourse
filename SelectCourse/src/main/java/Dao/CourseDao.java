package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.CourseInfo;
import Util.DBHelper;

public class CourseDao {
	   public static List<CourseInfo> getNewList() throws SQLException{
		   String sql="select*from Courseinfo";
			List<CourseInfo> list=new ArrayList<CourseInfo>();
			Connection conn=null; 
			ResultSet re=null;
			   try {
				conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql);
				while(re.next()){
					list.add(new CourseInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getInt(6),re.getString(7),re.getString(8),re.getString(9)));
					
				}
				System.out.println("list"+list);
			   } catch (Exception e) {
		
				System.out.println("发生异常："+e.getMessage());
			}finally{
				 DBHelper.closeResource(re, null, conn);
			}
			   return list;
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
	   
	   public static List<CourseInfo> getNewList(int pageNum,int pageSize) throws SQLException{
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
	   //修改 根据ID找出其他学生信息
		 public static CourseInfo getNewsID(int id){
			 CourseInfo news=null;
			 Connection conn=null;
			 String sql="select * from News where NewsID="+id;
			
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
		 public static int UpdateNews(CourseInfo news,int id){
			 int re=0;
			 try {
				String sql="update News set newsTitle=?,newsContent=?,newsTime=?,adminName=? where newsID="+id;
				List params=new ArrayList();
				 params.add(news.getCourseID());
				   params.add(news.getCourseName());
				   params.add(news.getTeacherName());
				   params.add(news.getCoursePlace());
				   params.add(news.getAllStudent());
				   params.add(news.getStudentNum());
				   params.add(news.getCourseType());
				   params.add(news.getCourseTime());
				   params.add(news.getCourseCondition());
				re=DBHelper.executeUpdate(sql,params);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			 return re;
		}
		 
	   public static int DeleteNews(int id){
		   String sql="DELETE FROM News where newsid="+id;
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
}
