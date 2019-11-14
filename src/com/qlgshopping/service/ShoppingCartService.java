package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.ShoppingCartDao;
import com.qlgshopping.dao.ShoppingCartInfoDao;
import com.qlgshopping.dao.StoreDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.ShoppingCart;
import com.qlgshopping.entity.ShoppingCartInfo;

public class ShoppingCartService {
	private ShoppingCartDao sDao=new ShoppingCartDao();
	private UserInfoDao userDao=new UserInfoDao();
	private ShoppingCartInfoDao shopinfoDao=new ShoppingCartInfoDao();
	/**
	 * 新增
	 * 
	 * @param p
	 * @return
	 */
	public boolean insertShoppingCart(ShoppingCart sc1) {
		if(sDao.insertShoppingCart(sc1)>0){
			return true;
		}
		return false;
	}
	/**
	 * 删除购物车
	 * @param shpId
	 * @return
	 */
	public boolean deleteByshpId(int shpId) {
		if(sDao.deleteByshpId(shpId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 更新购物车
	 * @param shopcart
	 * @return
	 */
	public boolean updateShoppingCart(ShoppingCart shopcart){
		if(sDao.updateShoppingCart(shopcart)>0){
			return true;
		}
		return false;
	}
	/**
	 * 在购物详情减少时更新购物车价格
	 * @param shopcart
	 * @return
	 */
	public boolean updateShoppingCartDeleteinfo(int carId,double cost){
		if(sDao.updateShoppingCartDeleteShpInfo(carId, cost)>0){
			return true;
		}
		return false;
	} 
	/**
	 * 根据shpId查找购物车
	 * @param shpId
	 * @return
	 */
	public ShoppingCart selectByShoppingCart(int shpId){
		ShoppingCart selectByShoppingCart = sDao.selectByShoppingCart(shpId);
		this.loadShoppingCartForeignData(selectByShoppingCart);
		return selectByShoppingCart;
	}
	/**
	 * 根据用户Id查找购物车
	 * @param userId
	 * @return
	 */
	public ShoppingCart selectByUserId(int userId){
		ShoppingCart selectByUserId = sDao.selectByUserId(userId);
		this.loadShoppingCartForeignData(selectByUserId);
		return selectByUserId;
	}
	/**
	 * 加载购物车详情的外键
	 * @param shopcart
	 */
	public void loadShoppingCartForeignData(ShoppingCart shopcart){
		if(shopcart==null)
			return;
		shopcart.setUser(userDao.selectUserById(shopcart.getUserId()));
		shopcart.setShoppingCartInfoList(new ArrayList<ShoppingCartInfo>(shopinfoDao.selectByshpId(shopcart.getShpId())));
	}
}
