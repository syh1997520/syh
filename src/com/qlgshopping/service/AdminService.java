package com.qlgshopping.service;

import com.qlgshopping.dao.AdminDao;
import com.qlgshopping.entity.Admin;

public class AdminService {
AdminDao aDao=new AdminDao();


/**
 * 管理员添加
 * @param ad
 * @return
 */
	public boolean insertAdmin(Admin ad) {
		if(aDao.insertAdmin(ad)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据id删除管理员
	 * @param admId
	 * @return
	 */
	public boolean deleteByAdmId(int admId){
		if(aDao.deleteByAdmId(admId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 管理员修改
	 * @param ad
	 * @return
	 */
	public boolean updateByAdmName(Admin admin) {
	if(aDao.updateByAdmName(admin)>0){
		return true;
	}
	return false;
	}
	/**
	 * 根据登录名和密码查找管理员
	 * @param loginName
	 * @param password
	 * @return
	 */
	public Admin selectByLoginNamePassword(String loginName,String password){
		return aDao.selectByLoginNamePassword(loginName,password);
	}
}
