package com.qlgshopping.entity;

/**
 * 订单详情表
 * @author Administrator
 *
 */
public class OrderInfo {
private int odifId;
private int ordId;
private int proId;
private int proNumber;
private double odifPrice;
private int odifEvaluate;
private OrderTable orderTable; //订单详情对应的订单表的实体类
private Product product; //订单详情对应的购买的商品的实体类
private Evalute evalute;

public Evalute getEvalute() {
	return evalute;
}
public void setEvalute(Evalute evalute) {
	this.evalute = evalute;
}
public int getOdifId() {
	return odifId;
}
public void setOdifId(int odifId) {
	this.odifId = odifId;
}
public int getOrdId() {
	return ordId;
}
public void setOrdId(int ordId) {
	this.ordId = ordId;
}
public int getProId() {
	return proId;
}
public void setProId(int proId) {
	this.proId = proId;
}
public int getProNumber() {
	return proNumber;
}
public void setProNumber(int proNumber) {
	this.proNumber = proNumber;
}
public double getOdifPrice() {
	return odifPrice;
}
public void setOdifPrice(double odifPrice) {
	this.odifPrice = odifPrice;
}
public OrderTable getOrderTable() {
	return orderTable;
}
public void setOrderTable(OrderTable orderTable) {
	this.orderTable = orderTable;
}

public int getOdifEvaluate() {
	return odifEvaluate;
}
public void setOdifEvaluate(int odifEvaluate) {
	this.odifEvaluate = odifEvaluate;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
@Override
public String toString() {
	return "OrderInfo [odifId=" + odifId + ", ordId=" + ordId + ", proId="
			+ proId + ", proNumber=" + proNumber + ", odifPrice=" + odifPrice
			+ ", odifEvaluate=" + odifEvaluate + ", orderTable=" + orderTable
			+ ", product=" + product + ", evalute=" + evalute + "]";
}


}
