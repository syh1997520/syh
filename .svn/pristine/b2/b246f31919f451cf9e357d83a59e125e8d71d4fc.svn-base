package com.qlgshopping.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;

import com.qlgshopping.entity.Type;
import com.qlgshopping.service.TypeService;

public class TypeTest {
	
	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    @Test
    public void testTypeSelectAll(){
    	TypeService typeService=new TypeService();
    	List<Type> typeList=typeService.selectAllType();
    	for(Type type:typeList){
    		System.out.println(type);
    	}
    }
    
    
    @Test
    public void testTypeInsert(){
    	Type type=new Type();
    	type.setTypeName("京东");
    	type.setTypeRank(2);
    	type.setTypeBeyondId(11);
    	
    	TypeService typeService=new TypeService();
    	if(typeService.insertType(type)){
    		System.out.println("添加成功。");
    	}
    }
    
    @Test
    public void testTypeDelete(){
    	TypeService typeService=new TypeService();
    	if(typeService.deleteType(29)){
    		System.out.println("删除成功。");
    	}
    }
    
 

}
