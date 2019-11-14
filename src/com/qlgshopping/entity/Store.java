package com.qlgshopping.entity;

import java.util.ArrayList;



/**
 * 店铺类（Store）
 * @author Administrator
 *
 */

public class Store {
	private int stoId;
	private String stoName;
	private String stoAddress;
	private int stoScore;
	private String stoStatic;
	private String stoPhone;
	private int stoTransNumber;
	private String stoImg;
	private int stoExam;
	private Business bus;
	private int busId;
	private ArrayList<OrderTable> orderTableList;//该店铺有关的订单表集合 
	private ArrayList<Product> productList;//用来存储该店铺所有的商品
	private int stoType;
	private Type type;//类别表的外键
	
	
	public int getStoType() {
		return stoType;
	}
	public void setStoType(int stoType) {
		this.stoType = stoType;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public int getStoId() {
		return stoId;
	}
	public void setStoId(int stoId) {
		this.stoId = stoId;
	}
	public String getStoName() {
		return stoName;
	}
	public void setStoName(String stoName) {
		this.stoName = stoName;
	}
	public String getStoAddress() {
		return stoAddress;
	}
	public void setStoAddress(String stoAddress) {
		this.stoAddress = stoAddress;
	}
	public int getStoScore() {
		return stoScore;
	}
	public void setStoScore(int stoScore) {
		this.stoScore = stoScore;
	}
	public String getStoStatic() {
		return stoStatic;
	}
	public void setStoStatic(String stoStatic) {
		this.stoStatic = stoStatic;
	}
	public String getStoPhone() {
		return stoPhone;
	}
	public void setStoPhone(String stoPhone) {
		this.stoPhone = stoPhone;
	}
	public int getStoTransNumber() {
		return stoTransNumber;
	}
	public void setStoTransNumber(int stoTransNumber) {
		this.stoTransNumber = stoTransNumber;
	}
	public String getStoImg() {
		return stoImg;
	}
	public void setStoImg(String stoImg) {
		this.stoImg = stoImg;
	}
	public Business getBus() {
		return bus;
	}
	public void setBus(Business bus) {
		this.bus = bus;
	}
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}
	public ArrayList<Product> getProductList() {
		return productList;
	}
	public void setProductList(ArrayList<Product> productList) {
		this.productList = productList;
	}
	public ArrayList<OrderTable> getOrderTableList() {
		return orderTableList;
	}
	public void setOrderTableList(ArrayList<OrderTable> orderTableList) {
		this.orderTableList = orderTableList;
	}
	public int getStoExam() {
		return stoExam;
	}
	public void setStoExam(int stoExam) {
		this.stoExam = stoExam;
	}
	@Override
	public String toString() {
		return "Store [stoId=" + stoId + ", stoName=" + stoName
				+ ", stoAddress=" + stoAddress + ", stoScore=" + stoScore
				+ ", stoStatic=" + stoStatic + ", stoPhone=" + stoPhone
				+ ", stoTransNumber=" + stoTransNumber + ", stoImg=" + stoImg
				+ ", stoExam=" + stoExam + ", bus=" + bus + ", busId=" + busId
				+ ", orderTableList=" + orderTableList + ", productList="
				+ productList + ", stoType=" + stoType + ", type=" + type + "]";
	}
	
}
