package com.qlgshopping.test;

import java.util.ArrayList;

import com.qlgshopping.dao.AdminDao;
import com.qlgshopping.entity.Admin;

public class AdminDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AdminDao mdao = new AdminDao();
		Admin ads = new Admin();
		ads.setAdmId(7);
		ads.setAdmLoginName("cdshfrhs");
		ads.setAdmName("小慈sa");
		ads.setAdmPassword("1131111");
		ads.setAdmStatic("离线");
		int admin = mdao.insertAdmin(ads);
		
			System.out.println(admin);
		
		
		
		int n = mdao.deleteByAdmId(2);
		System.out.println(n);
		
		

	}

}
