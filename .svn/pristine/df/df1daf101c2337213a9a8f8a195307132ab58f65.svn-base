package com.qlgshopping.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;

import com.qlgshopping.entity.Store;
import com.qlgshopping.service.StoreService;

public class StoreTest {
	
	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    @Test
    public void testStoreselectAll(){
    	StoreService stoService=new StoreService();
    	List<Store> stoList=stoService.selectAllStore();
    	for(Store sto:stoList){
    		System.out.println(sto);
    	}
    }
    
    @Test
    public void testStoreInsert(){
    	Store sto=new Store();
    	sto.setStoName("自己发开发");
    	sto.setStoAddress("北京");
    	sto.setBusId(5);
    	sto.setStoType(5);
    	sto.setStoStatic("营业中");
    	sto.setStoPhone("15869325847");
    	
    	
    	StoreService stoService=new StoreService();
    	if(stoService.insertStor(sto)){
    		System.out.println("添加成功。");
    	}
    }
    
    @Test
    public void testStoreDelete(){
    	StoreService stoService=new StoreService();
    	if(stoService.deleteStore(23)){
    		System.out.println("删除成功。");
    	}
    }
    
    @Test
    public void testStoreUpdate(){
    	StoreService stoService=new StoreService();
    	if(stoService.updateScore(stoService.selectBystoId(21))){
    		System.out.println("修改成功。");
    	}
    }

}
