package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.MyHistoryDao;
import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.MyHistory;

public class MyHistoryService {
	private MyHistoryDao mDao=new MyHistoryDao();
	private UserInfoDao userDao=new UserInfoDao();
	private ProductDao proDao=new ProductDao();
	/**
	 * 插入新的足迹
	 * @param mh
	 * @return
	 */
public boolean insertMyHistory(MyHistory mh){
	if(mDao.insertMyHistory(mh)>0){
		return true;
	}
	return false;
}
/**
 * 根据足迹id删除足迹
 * @param hisId
 * @return
 */
public boolean deleteMyHistoryByHisId(int hisId){
	if(mDao.deleteMyHistoryByHisId(hisId)>0){
		return true;
	}
	return false;
}
/**
 * 根据足迹id查找足迹
 * @param hisId
 * @return
 */
public MyHistory selectByHisId(int hisId){
	return mDao.selectByHisId(hisId);
}
/**
 * 根据用户获取足迹列表（未删除的足迹）
 * @param hisFromId
 * @return
 */
public ArrayList<MyHistory> selectByHisFromId(int hisFromId){
	ArrayList<MyHistory> selectByHisFromId = new ArrayList<MyHistory>(mDao.selectByHisFromId(hisFromId));
	for(MyHistory mi:selectByHisFromId){
		this.loadHistoryForeignData(mi);
	}
	return selectByHisFromId;
}
/**
 * 加载我的足迹的外键
 * @param mh
 */
public void loadHistoryForeignData(MyHistory mh){
	if(mh==null)
		return;
	mh.setProduct(proDao.selectProductByProId(mh.getHisForId()));
	mh.setUser(userDao.selectUserById(mh.getHisFromId()));
}
}
