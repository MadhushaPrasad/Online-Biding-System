package com.user;

public class Users {
	private int userID;
	private String userName;
	private String lname;
	private String fname;
	private String email;
	private String address;
	private String password;
	private String img;
	private String type;
	
	
	public Users(int userID, String userName, String lname, String fname, String email, String address, String password,String img,
			String type) {
		
		this.userID = userID;
		this.userName = userName;
		this.lname = lname;
		this.fname = fname;
		this.email = email;
		this.address = address;
		this.password = password;
		this.img = img;
		this.type = type;
	}


	public int getUserID() {
		return userID;
	}



	public String getUserName() {
		return userName;
	}



	public String getLname() {
		return lname;
	}



	public String getFname() {
		return fname;
	}



	public String getEmail() {
		return email;
	}



	public String getAddress() {
		return address;
	}



	public String getPassword() {
		return password;
	}
	
	public String getimg() {
		return img;
	}



	public String getType() {
		return type;
	}

	
	
	
}
