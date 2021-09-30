package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;



public class userDBUtil {
	private static boolean isSuccess;
	private static Connection connection = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean validate(String userName, String password){
		
		
		//database connnection
		String url ="jdbc:mysql://localhost:3306/onlineBiddingSystem";
		String user1 = "root";
		String pass = "1234";
		
		
		//validate
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url,user1,pass);
			Statement stmt = con.createStatement();
			
			System.out.println(userName);
			System.out.println(password);
			String sql = "select * from Users where userName='"+userName+"' and password='"+password+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	public static List<Users>getUser(String userName){
		ArrayList<Users> User = new ArrayList<>();
		
		try {
			connection = DBConnection.getInstance().getConnection();
			stmt = connection.createStatement();
			String sql = "select * from Users where UserName='"+userName+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int userID = rs.getInt(1);
				String username1 = rs.getString(2);
				String lname = rs.getString(3);
				String fname = rs.getString(4);
				String email = rs.getString(5);
				String address = rs.getString(6);
				String password = rs.getString(7);
				String img = rs.getString(8);
				String type = rs.getString(9);
				
				Users user1 = new Users(userID,username1,lname,fname,email,address,password,img,type);
				
				User.add(user1);
			}
		}catch(Exception e){
			
		}
		return User;
		}
			
		
		
	}

