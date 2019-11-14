package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.dao.ShoppingCartDao;
import com.qlgshopping.dao.ShoppingCartInfoDao;
import com.qlgshopping.dao.StoreDao;
import com.qlgshopping.entity.ShoppingCartInfo;

public class ShoppingCartInfoService {
	private ShoppingCartInfoDao sDao=new ShoppingCartInfoDao();
	private ProductDao proDao=new ProductDao();
	private ShoppingCartDao shopDao=new ShoppingCartDao();
	private StoreDao stDao=new StoreDao();
	/**
	 * 新增
	 * 
	 * @param p
	 * @return
	 */
	public boolean insertShoppingCartInfo(ShoppingCartInfo sc2) {
		if(sDao.insertShoppingCartInfo(sc2)>0){
			return true;
		}
		return false;
	}
	/**
	 * 删除详情
	 * @param shpifId
	 * @return
	 */
	public boolean deleteByshpifId(int shpifId) {

		if(sDao.deleteByshpifId(shpifId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 
	 * @param p
	 * @param status
	 *     
	 * @return
	 */
	public boolean updateByshpifId(ShoppingCartInfo pu) {

		if(sDao.updateByshpifId(pu)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据商品数量和价格更新数据库
	 * @param p
	 * @param status
	 *     
	 * @return
	 */
	public boolean updateByProNumberCost(ShoppingCartInfo pu) {
		if(sDao.updateproNumberCost(pu)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据购物车详情id查找购物车详情
	 * @param shpifId
	 * @return
	 */
	public ShoppingCartInfo selectByShpifId(int shpifId){
	ShoppingCartInfo selectByShpifId = sDao.selectByShpifId(shpifId);
	this.loadShoppinginfoForeignerData(selectByShpifId);
	return selectByShpifId;
	}
	/**
	 * 根据购物车id查找购物详情
	 * @param shpId
	 * @return
	 */
	public ArrayList<ShoppingCartInfo> selectByshpId(int shpId){
		ArrayList<ShoppingCartInfo> selectByshpId =new ArrayList<ShoppingCartInfo>(sDao.selectByshpId(shpId));
		for(ShoppingCartInfo shinfo:selectByshpId){
			this.loadShoppinginfoForeignerData(shinfo);
		}
		return selectByshpId;
	}
	/**
	 * 给购物详情表添加外键关系
	 * @param shopcart
	 */
	public void loadShoppinginfoForeignerData(ShoppingCartInfo shopcart){
		if(shopcart==null)
			return;
		shopcart.setPro(proDao.selectProductByProId(shopcart.getProId()));
		shopcart.setShp(shopDao.selectByShoppingCart(shopcart.getShpId()));
		shopcart.setStore(stDao.selectBystoId(shopcart.getStoId()));
	}
}
