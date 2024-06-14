package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.AdminInfo;
import Util.DBHelper;

public class AdminDao {
	 public static List getAdminList(String sql){
			Connection conn=null;
			List list=new ArrayList();
			ResultSet re=null;
			   try {
				conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql,list);
				while(re.next()){
					list.add(new AdminInfo(re.getInt(1),re.getString(2),re.getString(3)));
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				
			}
			   return list;
		   }
	 public static int UpdateAdmin(String sql){
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
	 public static int AddAdmin(AdminInfo adm){
		   int re=0;
		   try{
			   String sql="insert into AdminInfo values(?,?,?)";
			   List params= new ArrayList();
			   params.add(adm.getAdminID());
			   params.add(adm.getAdminAccount());
			   params.add(adm.getAdminPassword());
			   re=DBHelper.executeUpdate(sql, params);
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }
		return re;
	   }
	 //根据id取学生信息
	 public static AdminInfo getAdmin(int id){
		 Connection conn=null;
		 AdminInfo adm=null;
		ResultSet re=null;
		 try {
			 String sql="select * from AdminInfo where Adminid="+id+"";
			 conn=DBHelper.getConn();
				re=DBHelper.executeQuery(conn, sql);
				System.out.println();
				while(re.next()){
					adm=new AdminInfo(re.getInt(1),re.getString(2),re.getString(3));
					
				}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		 finally{
//			 DBHelper.closeResource(re, null, conn);
		 }
		 return adm;
	 }
//根据ID修改学生信息
	 public static int UpdateAdminByID(AdminInfo adm,int id){
		 int re=0;
		 try {
			String sql="update AdminInfo set AdminAccount=?,AdminPassword=? where AdminID="+id+"";
			List params=new ArrayList();
			   params.add(adm.getAdminID());
			   params.add(adm.getAdminAccount());
			   params.add(adm.getAdminPassword());
			re=DBHelper.executeUpdate(sql,params);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		 return re;
	}
	 // 登录判断
	   public static boolean AdminLogin(String s1, String s2) {
	    String sql = "select * from AdminInfo where AdminAccount='"+s1+"' and AdminPassword='"+s2+"'";
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
	   //账号查密码
	   
	   public static int UpdatePassword(String psw,String Account) {
		   int re=0;
		   try {
			String sql="update AdminInfo set AdminPassword='"+psw+"' where AdminAccount='"+Account+"'";
			re=DBHelper.executeUpdate(sql);
			System.out.println(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}
		   return re;
	   }
	

	   

}
