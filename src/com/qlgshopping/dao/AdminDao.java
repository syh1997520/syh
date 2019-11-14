package com.qlgshopping.dao;

import com.qlgshopping.entity.Admin;

public class AdminDao extends BaseDao<Admin> {
	/**
	 * 管理员添加
	 * @param ad
	 * @return
	 */
		public int insertAdmin(Admin ad) {
			String sql = "insert into admin values(null,?,?,?,?)";
			Object[] obj = { ad.getAdmPassword(), ad.getAdmLoginName(),
					ad.getAdmName(), ad.getAdmStatic() };
			return this.updateOne(sql, obj);
		}
		/**
		 * 根据id删除管理员
		 * @param admId
		 * @return
		 */
		public int deleteByAdmId(int admId){
			String sql = "delete from admin where admId=?";
			return this.updateOne(sql, admId);
		}
		/**
		 * 管理员修改
		 * @param ad
		 * @return
		 */
		public int updateByAdmName(Admin admin) {
			String sql = "update admin  set admPassword=?,admLoginName=?,admName=?,admStatic=? where admId=?";
			Object[] obj = {admin.getAdmPassword(),admin.getAdmLoginName(),admin.getAdmName(),admin.getAdmStatic(),admin.getAdmId() };
			return this.updateOne(sql, obj);
		}
		/**
		 * 根据登录名和密码查找管理员
		 * @param loginName
		 * @param password
		 * @return
		 */
		public Admin selectByLoginNamePassword(String loginName,String password){
			String sql="select * from admin where admLoginName=? and admPassword=?";
			return this.selectOne(sql, loginName,password);
		}

}
