package com.qlgshopping.dao;

import com.qlgshopping.entity.ShoppingCart;

public class ShoppingCartDao extends BaseDao<ShoppingCart> {
	/**
	 * 添加新的购物车 
	 * @param userid
	 * @return
	 */
	public int insertNewCart(int userid){
		String sql = "INSERT INTO `ShoppingCart` (`shpId`, `userId`, `shpPrice`) VALUES (null,?,0)";
		return updateOne(sql, userid);
	}
	
	/**
	 * 新增
	 * 
	 * @param p
	 * @return
	 */
	public int insertShoppingCart(ShoppingCart sc1) {
		Object[] para1 = { sc1.getUserId(), sc1.getShpPrice(),
				 };
		String sql = "INSERT INTO `ShoppingCart` (`shpId`, `userId`, `shpPrice`) VALUES (null,?,?)";
		return this.updateOne(sql, para1);
	}
	/**
	 * 删除购物车
	 * @param shpId
	 * @return
	 */
	public int deleteByshpId(int shpId) {
		String sql = "delete from ShoppingCart where shpId=?";
		Object[] date={shpId};
		return this.updateOne(sql, date);
	}
	/**
	 * 更新购物车
	 * @param shopcart
	 * @return
	 */
	public int updateShoppingCart(ShoppingCart shopcart){
		String sql="update ShoppingCart set shpPrice=? where shpId=?";
		Object[] obj={shopcart.getShpPrice(),shopcart.getShpId()};
		return this.updateOne(sql, obj);
	}
	/**
	 * 更新购物车
	 * @param shopcart
	 * @return
	 */
	public int updateShoppingCartDeleteShpInfo(int shpId,double cost){
		String sql="update ShoppingCart set shpPrice=shpPrice-? where shpId=?";
		Object[] obj={cost,shpId};
		return this.updateOne(sql, obj);
	}
	/**
	 * 根据shpId查找购物车
	 * @param shpId
	 * @return
	 */
	public ShoppingCart selectByShoppingCart(int shpId){
		String sql="select * from ShoppingCart where shpId=?";
		return this.selectOne(sql, shpId);
	}
	/**
	 * 根据用户Id查找购物车
	 * @param userId
	 * @return
	 */
	public ShoppingCart selectByUserId(int userId){
		String sql="select * from ShoppingCart where userId=?";
		return this.selectOne(sql, userId); 
	}
}
