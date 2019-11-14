package com.qlgshopping.entity;

import java.util.ArrayList;
import java.util.HashMap;

public class MapModel {
	private HashMap<OrderTable, ArrayList<OrderInfo>> ordermap=new HashMap<>();
	private HashMap<Integer, ArrayList<OrderInfo>> ordermap2=new HashMap<>();

	public HashMap<Integer, ArrayList<OrderInfo>> getOrdermap2() {
		return ordermap2;
	}

	public void setOrdermap2(HashMap<Integer, ArrayList<OrderInfo>> ordermap2) {
		this.ordermap2 = ordermap2;
	}

	public HashMap<OrderTable, ArrayList<OrderInfo>> getOrdermap() {
		return ordermap;
	}

	public void setOrdermap(HashMap<OrderTable, ArrayList<OrderInfo>> ordermap) {
		this.ordermap = ordermap;
	}
	

}
