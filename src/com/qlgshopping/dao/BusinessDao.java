package com.qlgshopping.dao;

import java.util.ArrayList;
import java.util.List;

import com.qlgshopping.entity.Business;

public class BusinessDao extends BaseDao<Business> {
	
	
	/**
	 * f分页查询
	 * @return
	 */
	public ArrayList<Business> selectAllByPage(int start,int pageSize){
		String sql="select * from Business order by busId desc limit ?,?";
		Object obj[]={start,pageSize};
		return (ArrayList<Business>) this.selectAll(sql,obj);
	}
	

	/**
	 * 获取所有business
	 * @return
	 */
	public List<Business> selectAllBusiness(){
		String sql="select * from Business";
		return new ArrayList(this.selectAll(sql));
	}
	/**
	 * 根据id删除商家
	 * @param busId
	 * @return
	 */
	public int deleteBusiness(int busId){
		String sql="delete  from Business where busId=?";
		Object obj[]={busId};
		return this.updateOne(sql, obj);
	}
	/**
	 * 修改商家信息
	 * @param bus
	 * @return
	 */
	public int updateBusiness(Business bus){
		String sql="update Business set busPassword=?,busLoginName=?,busName=? where busId=?";
		Object obj[]={bus.getBusPassword(),bus.getBusLoginName(),bus.getBusName(),bus.getBusId()};
		return this.updateOne(sql, obj);
	}
	/**
	 * 新增商家
	 * @param business
	 * @return
	 */
	public int insertBusiness(Business business){
		String sql="insert into  Business values(null,?,?,?)";
		Object obj[]={business.getBusPassword(),business.getBusLoginName(),business.getBusName()};
		return this.updateOne(sql, obj);
	}
	/**
	 * 根据商家Id查询
	 * @param business
	 * @return
	 */
	public Business selectBusinessByBusId(int busId){
		String sql="select * from Business where busId=?";
		return this.selectOne(sql, busId);
	}
	/**
	 * 根据登录名和密码查询
	 * @param business
	 * @return
	 */
	public Business selectBusByLnameAndPwd(String busLoginName,String busPassword){
		String sql="select * from Business where busLoginName=? and busPassword=?";
		Object obj[]={busLoginName,busPassword};
		return this.selectOne(sql, obj);
	}
	/**
	 * 根据用户名查询
	 * @param business
	 * @return
	 */
	public Business selectBusByBname(String busName){
		String sql="select * from Business where busName=?";
		return this.selectOne(sql, busName);
	}
	
	/**
	 * 得到总笔数
	 * @param business
	 * @return
	 */
	public long getTableSize(){
		String sql="select count(*) from Business";
		return this.getTableSize(sql);
	}
	
}
