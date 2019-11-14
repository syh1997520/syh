package com.qlgshopping.entity;

import java.util.ArrayList;

/*
 * 商家（Business）实体
 */
public class Business {
	private int busId;
	private String busPassword;
	private String busLoginName;
	private String busName;
	private ArrayList<Store> storeList;//一个商家所对应的店铺集合
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}
	public String getBusPassword() {
		return busPassword;
	}
	public void setBusPassword(String busPassword) {
		this.busPassword = busPassword;
	}
	public String getBusLoginName() {
		return busLoginName;
	}
	public void setBusLoginName(String busLoginName) {
		this.busLoginName = busLoginName;
	}
	public String getBusName() {
		return busName;
	}
	public void setBusName(String busName) {
		this.busName = busName;
	}
	@Override
	public String toString() {
		return "Business [busId=" + busId + ", busPassword=" + busPassword
				+ ", busLoginName=" + busLoginName + ", busName=" + busName
				+ "]";
	}
	public ArrayList<Store> getStoreList() {
		return storeList;
	}
	public void setStoreList(ArrayList<Store> storeList) {
		this.storeList = storeList;
	}
	

}
