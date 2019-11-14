package com.qlgshopping.entity;

import java.util.ArrayList;

/**
 * 商品类别类
 * @author 陈苏莹
 *
 */
public class Type {
	private int typeId;//类别编号
	private String typeName;//类别名称
	private int typeRank;//类别等级
	private int typeBeyondId;//商品的上一级类别
	private Type beyondType;//外键
	private ArrayList<Product> productList;//一个类别所包含的商品的集合
	private ArrayList<Type> nextRankIdList;//该类别的子类的id集合
	
	public Type getBeyondType() {
		return beyondType;
	}

	public void setBeyondType(Type beyondType) {
		this.beyondType = beyondType;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getTypeRank() {
		return typeRank;
	}

	public void setTypeRank(int typeRank) {
		this.typeRank = typeRank;
	}

	public int getTypeBeyondId() {
		return typeBeyondId;
	}

	public void setTypeBeyondId(int typeBeyondId) {
		this.typeBeyondId = typeBeyondId;
	}

	

	public ArrayList<Product> getProductList() {
		return productList;
	}

	public void setProductList(ArrayList<Product> productList) {
		this.productList = productList;
	}

	public ArrayList<Type> getNextRankIdList() {
		return nextRankIdList;
	}

	public void setNextRankIdList(ArrayList<Type> nextRankIdList) {
		this.nextRankIdList = nextRankIdList;
	}

	@Override
	public String toString() {
		return "Type [typeId=" + typeId + ", typeName=" + typeName
				+ ", typeRank=" + typeRank + ", typeBeyondId=" + typeBeyondId
				+ ", beyondType=" + beyondType + ", productList=" + productList
				+ ", nextRankIdList=" + nextRankIdList + "]";
	}
	
	
}
