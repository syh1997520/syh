package com.qlgshopping.test;


import com.qlgshopping.dao.MyHistoryDao;

import com.qlgshopping.entity.MyHistory;

public class MyHistoryDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyHistoryDao edaoo = new MyHistoryDao();
		MyHistory ela = new MyHistory();
		ela.setHisId(0);
		ela.setHisFromId(1);
		ela.setHisForId(2);
		ela.setHisDate("2019-02-03");
		ela.setHisDelete(3);
		int uu = edaoo.insertMyHistory(ela);
		System.out.println(uu);
		
		
	}

}
