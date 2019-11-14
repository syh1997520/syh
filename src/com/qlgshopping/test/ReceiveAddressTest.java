package com.qlgshopping.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;

import com.qlgshopping.entity.ReceiveAddress;
import com.qlgshopping.service.ReceiveAddressService;

public class ReceiveAddressTest {
	
	
	
	

	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    
    @Test
    public void testReceiveAddressInsert(){
    	ReceiveAddress rec=new ReceiveAddress();
    	rec.setRecName("上海时间的话沙河");
    	rec.setRecPhone("55454665655");
    	rec.setRecAddress("SKJKAH");
    	rec.setUserId(1);
    	ReceiveAddressService recService=new ReceiveAddressService();
    	if(recService.insertReceiveAddress(rec)){
    		System.out.println("添加成功。");
    	}
    }
    	@Test
    	public void testReceiveAddressDelete(){
    		ReceiveAddressService recService=new ReceiveAddressService();
    		if(recService.deleteByrecId(1058)){
    			System.out.println("删除成功。");
    		}
    	}
    	
    	
    	
    }


