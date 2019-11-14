package com.qlgshopping.entity;

public class SecKill {
private int secid;
private int proid;
private String secdate;
private double cutprice;
private int secnumber;
private Product pro;
public int getSecid() {
	return secid;
}
public void setSecid(int secid) {
	this.secid = secid;
}
public int getProid() {
	return proid;
}
public void setProid(int proid) {
	this.proid = proid;
}
public String getSecdate() {
	return secdate;
}
public void setSecdate(String secdate) {
	this.secdate = secdate;
}
public double getCutprice() {
	return cutprice;
}
public void setCutprice(double cutprice) {
	this.cutprice = cutprice;
}
public int getSecnumber() {
	return secnumber;
}
public void setSecnumber(int secnumber) {
	this.secnumber = secnumber;
}
public Product getPro() {
	return pro;
}
public void setPro(Product pro) {
	this.pro = pro;
}
@Override
public String toString() {
	return "SecKill [secid=" + secid + ", proid=" + proid + ", secdate=" + secdate + ", cutprice=" + cutprice
			+ ", secnumber=" + secnumber + ", pro=" + pro + "]";
}

}
