package Dao;

import java.sql.*;
import java.util.*;

import Bean.StudentInfo;
import Util.DBHelper;

public class StudentDao {
	//查询全部的学生信息
	 public static List getStudentList(String sql){
			Connection conn=null;
			List list=new ArrayList();
			ResultSet re=null;
			   try {
				conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql,list);
				while(re.next()){
					list.add(new StudentInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getString(6),re.getString(7),re.getString(8)));
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				
			}
			   return list;
		   }
	 public static int UpdateStudent(String sql){
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
	 public static int AddStudent(StudentInfo stu){
		   int re=0;
		   try{
			   String sql="insert into StudentInfo values(?,?,?,?,?,?,?,?)";
			   List params= new ArrayList();
			   params.add(stu.getStudentID());
			   params.add(stu.getName());
			   params.add(stu.getPassword());
			   params.add(stu.getSex());
			   params.add(stu.getAge());
			   params.add(stu.getAddress());
			   params.add(stu.getMajor());
			   params.add(stu.getClassID());
			   re=DBHelper.executeUpdate(sql, params);
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }
		return re;
	   }
	 //根据id取学生信息
	 public static StudentInfo getStudent(int id){
		 Connection conn=null;
		StudentInfo stu=null;
		ResultSet re=null;
		 try {
			 String sql="select * from studentinfo where StudentID="+id+"";
			 conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql);
				System.out.println();
				while(re.next()){
					stu=new StudentInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getString(6),re.getString(7),re.getString(8));
					
				}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		 finally{
//			 DBHelper.closeResource(re, null, conn);
		 }
		 return stu;
	 }
//根据ID修改学生信息
	 public static int UpdateStudent(StudentInfo stu,int id){
		 int re=0;
		 try {
			String sql="update StudentInfo set name=?,password=?,sex=?,age=?,address=?,Major=?,Classid=? where StudentID="+id+"";
			List params=new ArrayList();
			   params.add(stu.getStudentID());
			   params.add(stu.getName());
			   params.add(stu.getPassword());
			   params.add(stu.getSex());
			   params.add(stu.getAge());
			   params.add(stu.getAddress());
			   params.add(stu.getMajor());
			   params.add(stu.getClassID());
			re=DBHelper.executeUpdate(sql,params);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		 return re;
	}
	 // 登录判断
	   public static boolean StudentLogin(String s1, String s2) {
	    String sql = "select * from StudentInfo where StudentID="+Integer.parseInt(s1)+" and password='"+s2+"'";
	    Connection conn=null;
	    ResultSet re=null;
	    boolean ok=false;
	    System.out.println(sql);
	    try {
			conn=DBHelper.getConn();
			re=DBHelper.executeQuery(conn, sql);
			if(re.next()) {
				ok=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	    return ok;
	    }
// 修改密码
	   public static int UpdatePassword(String psw,int id) {
		   int re=0;
		   try {
			String sql="update StudentInfo set password='"+psw+"' where StudentID="+id;
			re=DBHelper.executeUpdate(sql);
			System.out.println(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}
		   return re;
	   }
//分页查询
	   public static List<StudentInfo> getStudentPage(int pageSize,int pageNum) throws SQLException{
		   List<StudentInfo> list=new ArrayList<StudentInfo>();
		   ResultSet re=null;
		   Connection conn=null;
		   int offset=(pageNum-1)*pageSize;
		   String sql="select * from StudentInfo where 1=1 limit "+offset+","+pageSize;
		   try {
			conn=DBHelper.getConn();
			re=DBHelper.executeQuery(conn, sql);
			while(re.next()) {
				list.add(new StudentInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getString(6),re.getString(7),re.getString(8)));
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
	   public static List<StudentInfo> getStudentPage(int pageSize,int pageNum,String StudentName,String StudentMajor,String StudentSex,String StudentClass,String StudentAddress) throws SQLException{
		   List<StudentInfo> list=new ArrayList<StudentInfo>();
		   ResultSet re=null;
		   Connection conn=null;
		   int offset=(pageNum-1)*pageSize;
		   String sql="select * from StudentInfo where 1=1";
		   
		   
		   try {
			conn=DBHelper.getConn();
			if("null".equals(StudentName)) {
			    StudentName = null;
			}

			if("null".equals(StudentMajor)) {
			    StudentMajor = null;
			}

			if("null".equals(StudentSex)) {
			    StudentSex = null;
			}

			if("null".equals(StudentClass)) {
			    StudentClass = null;
			}

			if("null".equals(StudentAddress)) {
			    StudentAddress = null;
			}
			if(StudentName!=null&&!StudentName.equals("")) {
				   sql+=" and name like '%"+StudentName+"%'";
				   System.out.println(sql);
			   }
			   if(StudentMajor!=null&&!StudentMajor.equals(""))
			   {
				   sql+=" and major like '%"+StudentMajor+"%'";
				   System.out.println(sql);
			   }
			   if(StudentSex!=null&&!StudentSex.equals(""))
			   {
				   sql+=" and sex like '%"+StudentSex+"%'";
				   System.out.println(sql);
			   }
			   if(StudentClass!=null&&!StudentClass.equals(""))
			   {
				   sql+=" and classid like '%"+StudentClass+"%'";
				   System.out.println(sql);
			   }
			   if(StudentAddress!=null&&!StudentAddress.equals(""))
			   {
				   sql+=" and address like '%"+StudentAddress+"%'";
				   System.out.println(sql);
			   }
			   sql+=" limit "+offset+","+pageSize;
			   System.out.println(sql);
			re=DBHelper.executeQuery(conn, sql);
			while(re.next()) {
				list.add(new StudentInfo(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getInt(5),re.getString(6),re.getString(7),re.getString(8)));
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
			String sql="select count(0) from StudentInfo";
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

}
