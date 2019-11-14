package com.qlgshopping.entity;

import java.util.ArrayList;

/**
 * 用来实现分页
 * @author Administrator
 * @param <T>
 *
 */
public class Page<T> {
private int currentPage;//当前页
private int pageSize;//每页存放的记录数
private int allPage;//总页数
private int prePage;//上一页
private int nextPage;//下一页
private int totalRow;//总记录数
private ArrayList<T> aList;//从来储存该页的记录实体
public int getCurrentPage() {
	return currentPage;
}
public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}
public int getAllPage() {
	return allPage;
}

public int getPrePage() {
	this.prePage=currentPage-1;
	if(prePage==0)
		prePage=1;
	return prePage;
}

public int getNextPage() {
	this.nextPage=currentPage+1;
	if(nextPage>allPage)
		nextPage=allPage;
	return nextPage;
}

public int getTotalRow() {
	return totalRow;
}
public void setTotalRow(int totalRow) {
	if(totalRow%pageSize==0)
	allPage=totalRow/pageSize;
	else
		allPage=totalRow/pageSize+1;
	this.totalRow = totalRow;
}
public ArrayList<T> getaList() {
	return aList;
}
public void setaList(ArrayList<T> aList) {
	this.aList = aList;
}
public int getPageSize() {
	return pageSize;
}
public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}

}
