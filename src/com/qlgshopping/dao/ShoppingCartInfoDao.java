package com.qlgshopping.dao;

import java.util.List;

import com.qlgshopping.entity.ShoppingCartInfo;

public class ShoppingCartInfoDao extends BaseDao<ShoppingCartInfo> {
	/**
	 * 新增
	 * 
	 * @param p
	 * @return
	 */
	public int insertShoppingCartInfo(ShoppingCartInfo sc2) {
		Object[] para2 = { sc2.getShpId(), sc2.getProId(),sc2.getStoId(),sc2.getProNumber(),sc2.getShpifCost()
				 };
		String sql = "INSERT INTO `ShoppingCartInfo` (`shpifId`, `shpId`, `proId`,`stoId`,`proNumber`,`shpifCost`) VALUES (null,?,?,?,?,?)";
		return this.updateOne(sql, para2);
	}
	/**
	 * 删除详情
	 * @param shpifId
	 * @return
	 */
	public int deleteByshpifId(int shpifId) {

		String sql = "delete from ShoppingCartInfo where shpifId=?";
		
		Object[] date={shpifId};
		return this.updateOne(sql, date);
	}
	/**
	 * 
	 * @param p
	 * @param status
	 *     
	 * @return
	 */
	public int updateByshpifId(ShoppingCartInfo pu) {

		String sql = "update ShoppingCartInfo set shpId=?,proId=? where shpifId=?";
		

		Object[] date = {pu.getShpifId(),pu.getShpId(),pu.getProId()};
		return this.updateOne(sql, date);
	}
	/**
	 * 修改购物车详情的价格和数量
	 * @param p
	 * @param status
	 *     
	 * @return
	 */
	public int updateproNumberCost(ShoppingCartInfo pu) {
		String sql = "update ShoppingCartInfo set proNumber=?,shpifCost=? where shpifId=?";
		Object[] date = {pu.getProNumber(),pu.getShpifCost(),pu.getShpifId()};
		return this.updateOne(sql, date);
	}
	/**
	 * 根据购物车详情id查找购物车详情
	 * @param shpifId
	 * @return
	 */
	public ShoppingCartInfo selectByShpifId(int shpifId){
		String sql="select * from ShoppingCartInfo where shpifId=?";
		return this.selectOne(sql, shpifId);
	}
	/**
	 * 根据购物车id查找购物详情
	 * @param shpId
	 * @return
	 */
	public List<ShoppingCartInfo> selectByshpId(int shpId){
		String sql="select * from ShoppingCartInfo where shpId=?";
		return this.selectAll(sql, shpId);
	}
}
