package com.qlgshopping.entity;
/**
 * 管理员类（Admin）
 * @author Administrator
 *
 */

public class Admin {
	private int admId;//管理员编号
	private String admPassword;//密码
	private String admLoginName;//登录时的用户名（6-12位）,由英文构成
	private String admName;//管理员登录以后设置的用户名3-10个字，不可重复
	private String admStatic;//管理员状态(在线，离线)
	
	public Admin(){
		
	}

	public int getAdmId() {
		return admId;
	}

	public void setAdmId(int admId) {
		this.admId = admId;
	}

	public String getAdmPassword() {
		return admPassword;
	}

	public void setAdmPassword(String admPassword) {
		this.admPassword = admPassword;
	}

	public String getAdmLoginName() {
		return admLoginName;
	}

	public void setAdmLoginName(String admLoginName) {
		this.admLoginName = admLoginName;
	}

	public String getAdmName() {
		return admName;
	}
	
	public void setAdmName(String admName) {
		this.admName = admName;
	}

	public String getAdmStatic() {
		return admStatic;
	}

	public void setAdmStatic(String admStatic) {
		this.admStatic = admStatic;
	}

	public Admin(int admId, String admPassword, String admLoginName,
			String admName, String admStatic) {
		super();
		this.admId = admId;
		this.admPassword = admPassword;
		this.admLoginName = admLoginName;
		this.admName = admName;
		this.admStatic = admStatic;
	}

	public String toString() {
		return "Admin [admId=" + admId + ", admPassword=" + admPassword
				+ ", admLoginName=" + admLoginName + ", admName=" + admName
				+ ", admStatic=" + admStatic + "]";
	}

	
	
	


	

}
