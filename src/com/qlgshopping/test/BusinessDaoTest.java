package com.qlgshopping.test;

import java.util.List;

import com.qlgshopping.dao.BusinessDao;
import com.qlgshopping.entity.Business;

public class BusinessDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BusinessDao ndao = new BusinessDao();
		List<Business> allness = ndao.selectAllBusiness();
		System.out.println(allness);
		
		
		int del = ndao.deleteBusiness(6);
		System.out.println(del);
		
		
		
	}
	
	

}
