package com.qlgshopping.entity;

import java.util.ArrayList;


/**
 * 订单表
 * @author Administrator
 *
 */
public class OrderTable {
private int ordId;
private int stoId;
private int userId;
private double ordPrice;
private String ordTime;
private String payTime;
private String ordStatic;
private int ordAddress;
private Store store; //订单对应的店铺实体类
private UserInfo userInfo;//订单对应的用户的实体类
private ArrayList<OrderInfo> odifList;//一个订单对应多个订单明细
private ReceiveAddress receiveAddress;

public int getOrdAddress() {
	return ordAddress;
}
public void setOrdAddress(int ordAddress) {
	this.ordAddress = ordAddress;
}
public ReceiveAddress getReceiveAddress() {
	return receiveAddress;
}
public void setReceiveAddress(ReceiveAddress receiveAddress) {
	this.receiveAddress = receiveAddress;
}
public int getOrdId() {
	return ordId;
}
public void setOrdId(int ordId) {
	this.ordId = ordId;
}
public int getStoId() {
	return stoId;
}
public void setStoId(int stoId) {
	this.stoId = stoId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public double getOrdPrice() {
	return ordPrice;
}
public void setOrdPrice(double ordPrice) {
	this.ordPrice = ordPrice;
}
public String getOrdStatic() {
	return ordStatic;
}
public void setOrdStatic(String ordStatic) {
	this.ordStatic = ordStatic;
}
public Store getStore() {
	return store;
}
public void setStore(Store store) {
	this.store = store;
}
public UserInfo getUser() {
	return userInfo;
}
public void setUser(UserInfo userInfo) {
	this.userInfo = userInfo;
}
public ArrayList<OrderInfo> getOdifList() {
	return odifList;
}
public void setOdifList(ArrayList<OrderInfo> odifList) {
	this.odifList = odifList;
}
public UserInfo getUserInfo() {
	return userInfo;
}
public void setUserInfo(UserInfo userInfo) {
	this.userInfo = userInfo;
}

public String getOrdTime() {
	return ordTime;
}
public void setOrdTime(String ordTime) {
	this.ordTime = ordTime;
}
public String getPayTime() {
	return payTime;
}
public void setPayTime(String payTime) {
	this.payTime = payTime;
}
@Override
public String toString() {
	return "OrderTable [ordId=" + ordId + ", stoId=" + stoId + ", userId="
			+ userId + ", ordPrice=" + ordPrice + ", ordTime=" + ordTime
			+ ", payTime=" + payTime + ", ordStatic=" + ordStatic
			+ ", ordAddress=" + ordAddress + ", store=" + store + ", userInfo="
			+ userInfo + ", odifList=" + odifList + ", receiveAddress="
			+ receiveAddress + "]";
}


}
