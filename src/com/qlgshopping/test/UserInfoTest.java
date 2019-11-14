package com.qlgshopping.test;

import static org.junit.Assert.fail;

import java.util.ArrayList;

import org.junit.Test;

import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.UserInfoService;

public class UserInfoTest {
	
	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    
    @Test
    public void testUserInfoselectAll(){
    	UserInfoService userService=new UserInfoService();
    	ArrayList<UserInfo> userList=userService.selectAllUser();
    	for(UserInfo u:userList){
    		System.out.println(u);
    	}
    }
    
    @Test
    public void testUserInfoInsert(){
    	UserInfo user=new UserInfo();
    	user.setUserName("ajshj");
    	user.setUserPassword("1555658");
    	user.setUserGender("女");
    	user.setUserLoginName("hysagiudg");
    	user.setUserPhoneNumber("15863259874");
    	user.setUserScore(5245);
    	UserInfoService userService=new UserInfoService();
    	
    }
    @Test
    public void testUserInfoDelet(){
    	UserInfoService userService=new UserInfoService();
    	if(userService.deleteUserById(111)){
    		System.out.println("删除成功。");
    	}
    }

}
