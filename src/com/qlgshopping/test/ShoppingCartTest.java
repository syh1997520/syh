package com.qlgshopping.test;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.qlgshopping.entity.ShoppingCart;
import com.qlgshopping.service.ShoppingCartService;

public class ShoppingCartTest {
	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    
    @Test
    public void testShoppingCartInsert(){
    	ShoppingCart shoc=new ShoppingCart();
    	shoc.setShpId(1080);
    	shoc.setUserId(88);
    	
    	ShoppingCartService shocService=new ShoppingCartService();
    	if(shocService.insertShoppingCart(shoc)){
    		System.out.println("添加成功。");
    	}
    	
    }
    
    @Test
    public void testShoppingCartDelete(){
    	ShoppingCartService shocService=new ShoppingCartService();
    	if(shocService.deleteByshpId(1080)){
    		System.out.println("删除成功。");
    	}
    }
    
    

}
