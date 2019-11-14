package com.qlgshopping.service;

import java.util.ArrayList;
import java.util.List;

import com.qlgshopping.dao.BusinessDao;
import com.qlgshopping.entity.Business;
import com.qlgshopping.entity.Page;

public class BusinessService {
	BusinessDao bDao=new BusinessDao();
	/**
	 * 获取所有business
	 * @return
	 */
	public List<Business> selectAllBusiness(){	
		return bDao.selectAllBusiness();
	}
	
	/**
	 * 根据id删除商家
	 * @param busId
	 * @return
	 */
	public boolean deleteBusiness(int busId){
		if(bDao.deleteBusiness(busId)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 修改商家信息
	 * @param bus
	 * @return
	 */
	public boolean updateBusiness(Business bus){
		if(bDao.updateBusiness(bus)>0){
			return true;
		}
		return false;
	}
	/**
	 * 新增商家
	 * @param business
	 * @return
	 */
	public boolean insertBusiness(Business business){
	   if(bDao.insertBusiness(business)>0){
		   return true;
	   }
	   return false;
	}
	
	/**
	 * 根据商家Id查询
	 * @param business
	 * @return
	 */
	public Business selectBusinessByBusId(int busId){
		return bDao.selectBusinessByBusId(busId);
	}
	/**
	 * 根据登录名和密码查询
	 * @param business
	 * @return
	 */
	public Business selectBusByLnameAndPwd(String busLoginName,String busPassword){
		return bDao.selectBusByLnameAndPwd(busLoginName, busPassword);
	}
	/**
	 * 根据用户名查询
	 * @param business
	 * @return
	 */
	public Business selectBusByBname(String busName){
		return bDao.selectBusByBname(busName);
	}
	/**
	 * 分页查询
	 * @param business
	 * @return
	 */
	public Page<Business> getPage(int currentPage,int pageSize){
		Page<Business> page=new Page<Business>();
		//设置页面容量
		page.setPageSize(pageSize);
		
		//获取总笔数
		int totalRow=(int)bDao.getTableSize();
		page.setTotalRow(totalRow);
		//设置当前页
		page.setCurrentPage(currentPage);
		
		//开始的笔数
		
		int start=(page.getCurrentPage()-1)*page.getPageSize();
		
		ArrayList<Business> aList=bDao.selectAllByPage(start, pageSize);
		page.setaList(aList);
		
		return page;
		
	}
}
