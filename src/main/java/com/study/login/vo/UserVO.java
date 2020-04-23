package com.study.login.vo;

public class UserVO {

	private String userID;
	private String userPass;
	private String userName;
	private String userRole;
	
	public UserVO() {
		
	}

	public UserVO(String userID, String userPass, String userName, String userRole) {
		super();
		this.userID = userID;
		this.userPass = userPass;
		this.userName = userName;
		this.userRole = userRole;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
}
