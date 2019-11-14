package com.qlgshopping.entity;

import java.util.ArrayList;

public class ShoppingCart {
	
	private int shpId;
	private int userId;
	private double shpPrice;
	private UserInfo user;
	private ArrayList<ShoppingCartInfo> shoppingCartInfoList;//购物车对应的购物车详情集合
	
	public ShoppingCart(){
		user = new UserInfo();
		
	}
	@Override
	public String toString() {
		return "shoppingcart [shpId=" + shpId + ", userId=" + userId
				+ ", shpPrice=" + shpPrice +user.getUserId()+ "]";
	}
	public int getShpId() {
		return shpId;
	}
	public void setShpId(int shpId) {
		this.shpId = shpId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getShpPrice() {
		return shpPrice;
	}
	public void setShpPrice(double shpPrice) {
		this.shpPrice = shpPrice;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	
	public ArrayList<ShoppingCartInfo> getShoppingCartInfoList() {
		return shoppingCartInfoList;
	}
	public void setShoppingCartInfoList(
			ArrayList<ShoppingCartInfo> shoppingCartInfoList) {
		this.shoppingCartInfoList = shoppingCartInfoList;
	}
	public ShoppingCart(int shpId,int userId,double shpPrice){
		this.shpId = shpId;
		this.userId = userId;
		this.shpPrice = shpPrice;
	}

}
