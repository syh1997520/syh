package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.ReceiveAddressDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.ReceiveAddress;

public class ReceiveAddressService {
	private ReceiveAddressDao rDao=new ReceiveAddressDao();
	private UserInfoDao userDao=new UserInfoDao();
	/**
	 * 新增收货地址
	 * 
	 * @param sc
	 * @return
	 */
	public boolean insertReceiveAddress(ReceiveAddress sc) {
		if(rDao.insertReceiveAddress(sc)>0){
			return true;
		}
		return false;
	}
	/**
	 * 删除收货地址
	 * @param recId
	 * @return
	 */
	public boolean deleteByrecId(int recId) {

		if(rDao.deleteByrecId(recId)>0){
			return true;
		}
		return false; 
	}
	
	/**
	 * 根据收货地址id获取地址（返回单个对象）
	 * @param recId
	 * @return
	 */
	public ReceiveAddress selectByReceAddId(int recId){
		 ReceiveAddress selectByReceAddId = rDao.selectByReceAddId(recId);
		 this.loadAddressForeignData(selectByReceAddId);
		 return selectByReceAddId;
	}
	/**
	 * 根据用户id获取地址集合（返回集合）
	 * @param recId
	 * @return
	 */
	public ArrayList<ReceiveAddress> selectByUserId(int userId){
	ArrayList<ReceiveAddress> selectByUserId = new ArrayList<ReceiveAddress>(rDao.selectByUserId(userId));
	for(ReceiveAddress rec:selectByUserId){
		this.loadAddressForeignData(rec);
	}
	return selectByUserId;
	}
	/**
	 * 加载地址实体的外键
	 * @param rec
	 */
	public void loadAddressForeignData(ReceiveAddress rec){
		if(rec==null)
			return;
		rec.setUser(userDao.selectUserById(rec.getUserId()));
	}
}
