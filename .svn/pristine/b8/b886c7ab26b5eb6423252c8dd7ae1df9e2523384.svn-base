package com.qlgshopping.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;

import com.qlgshopping.entity.ShoppingCartInfo;
import com.qlgshopping.service.ShoppingCartInfoService;

public class ShoppingCartInfoTest {
	
	
	
	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    
    @Test
    public void testShoppingCartInfoInsert(){
    	ShoppingCartInfo sho=new ShoppingCartInfo();
    	sho.setShpifId(100);
    	sho.setShpId(1011);
    	sho.setProId(20);
    	
    	ShoppingCartInfoService shoService=new ShoppingCartInfoService();
    	if(shoService.insertShoppingCartInfo(sho)){
    		System.out.println("添加成功。");
    	}
    }
    @Test
    public void testShoppingCartInfoDelete(){
    	ShoppingCartInfoService shoService=new ShoppingCartInfoService();
    	if(shoService.deleteByshpifId(100)){
    		System.out.println("删除成功。");
    	}
    }
    @Test
    public void testShoppingCartInfoSelectByshpId(){
    	
    	ShoppingCartInfoService shoService=new ShoppingCartInfoService();
    	List<ShoppingCartInfo> shoList=shoService.selectByshpId(2);
    	System.out.println(shoList);
    }
 
    
}
