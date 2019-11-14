package com.qlgshopping.entity;

import java.util.ArrayList;
/**
 * 商品类
 * @author 陈苏莹
 *
 */
public class Product {
	private int proId;//商品编号
	private String proName;//商品名称
	private int proType;//商品类别
	private double proPrice;//商品价格
	private int proNumber;//商品数量
	private int stoId;//店铺编号
	private String proMessage;//商品描述
	private String proStatic;//商品状态
	private String proGroundDate;//商品上架时间
	private int proSalesNumber;//商品销售量
	private String proImg;//保存的商品图片
	private String proBrand;
	private Type type;//外键关系
	
	private Store store;//外键关系
	private ArrayList<Evalute> evaluteList;//商品所对应的评价集合
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProType() {
		return proType;
	}
	public void setProType(int proType) {
		this.proType = proType;
	}
	public double getProPrice() {
		return proPrice;
	}
	public void setProPrice(double proPrice) {
		this.proPrice = proPrice;
	}
	public int getProNumber() {
		return proNumber;
	}
	public void setProNumber(int proNumber) {
		this.proNumber = proNumber;
	}
	public int getStoId() {
		return stoId;
	}
	public void setStoId(int stoId) {
		this.stoId = stoId;
	}
	public String getProMessage() {
		return proMessage;
	}
	public void setProMessage(String proMessage) {
		this.proMessage = proMessage;
	}
	public String getProStatic() {
		return proStatic;
	}
	public void setProStatic(String proStatic) {
		this.proStatic = proStatic;
	}
	public int getProSalesNumber() {
		return proSalesNumber;
	}
	public void setProSalesNumber(int proSalesNumber) {
		this.proSalesNumber = proSalesNumber;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public ArrayList<Evalute> getEvaluteList() {
		return evaluteList;
	}
	public void setEvaluteList(ArrayList<Evalute> evaluteList) {
		this.evaluteList = evaluteList;
	}
	public String getProGroundDate() {
		return proGroundDate;
	}
	public void setProGroundDate(String proGroundDate) {
		this.proGroundDate = proGroundDate;
	}
	public String getProBrand() {
		return proBrand;
	}
	public void setProBrand(String proBrand) {
		this.proBrand = proBrand;
	}
	
}
