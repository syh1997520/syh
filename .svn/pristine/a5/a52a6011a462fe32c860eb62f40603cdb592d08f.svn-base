package com.qlgshopping.dao;

import java.util.List;

import com.qlgshopping.entity.ReceiveAddress;

public class ReceiveAddressDao extends BaseDao<ReceiveAddress> {

	/**
	 * 新增收货地址
	 * 
	 * @param sc
	 * @return
	 */
	public int insertReceiveAddress(ReceiveAddress sc) {
		Object[] para = { sc.getUserId(), sc.getRecName(),
				sc.getRecAddress(), sc.getRecPhone() };
		String sql = "INSERT INTO `Receiveaddress` (`userId`, `recName`, `recAddress`, `recPhone`) VALUES (?,?,?,?)";
		return this.updateOne(sql, para);
	}
	/**
	 * 删除收货地址
	 * @param recId
	 * @return
	 */
	public int deleteByrecId(int recId) {

		String sql = "delete from ReceiveAddress where recId=?";
		
		Object[] date={recId};
		return this.updateOne(sql, date);
	}
	
	/**
	 * 根据收货地址id获取地址（返回单个对象）
	 * @param recId
	 * @return
	 */
	public ReceiveAddress selectByReceAddId(int recId){
		String sql="select * from ReceiveAddress where recId=?";
		return this.selectOne(sql, recId);
	}
	/**
	 * 根据用户id获取地址集合（返回集合）
	 * @param recId
	 * @return
	 */
	public List<ReceiveAddress> selectByUserId(int userId){
		String sql="select * from ReceiveAddress where userId=?";
		return this.selectAll(sql, userId);
	}
	
}
