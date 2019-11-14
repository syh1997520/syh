package com.qlgshopping.test;

import static org.junit.Assert.fail;


import java.util.List;

import org.junit.Test;

import com.qlgshopping.entity.Product;
import com.qlgshopping.service.ProductService;


public class ProductTest {
	
/*    private Product pro;*/
	



	@Test
    public void test(){
    	fail("Not yet implemented");
    }
    @Test
	public void testHello() {
    	System.out.println("hello world！");
	}
    @Test
    public void testProductSelectAll(){
    	ProductService proService=new ProductService();
    	
    	List<Product> proList=proService.selectAllProduct();
    	for(Product pro:proList){
    		System.out.println(pro);
    	}
    }
    @Test
    public void testproductInsert(){
    	Product pro=new Product();
    	
    	pro.setProName("蛋黄派");
    	pro.setProStatic("在售");
    	pro.setProGroundDate("2019-03-25");
    	pro.setProType(27);
    	pro.setStoId(17);
    	ProductService proService=new ProductService();
    	if(proService.insertProduct(pro)){
    		System.out.println("添加成功。");
    	}
    }
    
    
    
    @Test
    public void testProductDelet(){
    	ProductService proService=new ProductService();
    	if(proService.deletProduct(52)){
    		System.out.println("删除成功。");
    	}
    }
    @Test
    public void testProductUpdate(){
       /* Product pro=new Product();
        
        pro.setProName("蛋黄");*/
    	ProductService proService=new ProductService();
    	if(proService.updateProduct(proService.selectProductByProId(54))){
    		System.out.println("修改成功。");
    	}
    }

}
