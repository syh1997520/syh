package com.qlgshopping.dao;

import java.util.ArrayList;
import java.util.List;

import com.qlgshopping.entity.Store;

public class StoreDao extends BaseDao<Store> {
	
	/**
	 * 分页查找所有店铺
	 * @return
	 */
		public ArrayList<Store> selectAllByPage(int busId,int start,int pageSize){
			
			String sql="select * from Store where busId=? limit ?,?";
			Object obj[]={busId,start,pageSize};
			return (ArrayList<Store>) this.selectAll(sql, obj);
			
		}
		
		public long getTableSize(int busId){
			String sql="select count(*) from Store where busId=?";
			return this.getTableSize(sql,busId);
		}
		
		/**
		 * 分页查找所有店铺
		 * @return
		 */
			public ArrayList<Store> selectAllByPageA(int start,int pageSize){
				
				String sql="select * from Store order by stoId desc limit ?,?";
				Object obj[]={start,pageSize};
				return (ArrayList<Store>) this.selectAll(sql, obj);
				
			}
			
			public long getTableSizeA(){
				String sql="select count(*) from Store";
				return this.getTableSize(sql);
			}
		
	
	
	/**
	 * 查找所有店铺
	 * @return
	 */
		public List<Store> selectAllStore(){
			
			String sql="select * from Store";
			return this.selectAll(sql);
		}
		/**
		 * 新增店铺
		 * @param store
		 * @return
		 */
		public int insertStor(Store store){
			String sql="insert into  Store values(?,?,?,?,?,?,?,?,?,?,?)";
			Object[] obj={store.getStoId(),store.getStoName(),store.getStoAddress(),store.getBusId(),store.getStoScore(),store.getStoType(),store.getStoStatic(),store.getStoPhone(),store.getStoTransNumber(),store.getStoImg(),store.getStoExam()};
			return this.updateOne(sql, obj);
		}
		/**
		 * 删除店铺
		 * @param stoId
		 * @return
		 */
		public int deleteStore(int stoId){
			String sql="delete  from Store where stoId=?";
			Object obj[]={stoId};
			return this.updateOne(sql, obj);	
		}
		/**
		 * 修改店铺
		 * @param store
		 * @return
		 */
		public int updateScore(Store store){
			String sql="update Store set stoName=?,stoAddress=?,stoScore=?,stoStatic=?,stoPhone=?,stoTransNumber=?,stoImg=?,stoExam=? where stoId=?";
			Object[] obj={store.getStoName(),store.getStoAddress(),store.getStoScore(),store.getStoStatic(),store.getStoPhone(),store.getStoTransNumber(),store.getStoImg(),store.getStoExam(),store.getStoId()};
			return this.updateOne(sql, obj);
		}
		/**
		 * 根据店铺id查找店铺
		 * @param stoId
		 * @return
		 */
		public Store selectBystoId(int stoId){
			String sql="select * from Store where stoId=?";
			return this.selectOne(sql, stoId);
		}
		
		
		/**
		 * 根据店铺id查找店铺
		 * @param stoId
		 * @return
		 */
		public Store selectBystoName(String stoName){
			String sql="select * from Store where stoName=?";
			return this.selectOne(sql, stoName);
		}
		/**
		 * 根据商家id查找店铺
		 * @param busId
		 * @return
		 */
		public List<Store> selectByBusId(int busId){
			String sql="select * from Store where busId=?";
			return this.selectAll(sql, busId);
		}
		/**
		 * 根据类别ID查找店铺集合
		 * @param typeId
		 * @return
		 */
		public List<Store> selectByStoType(int typeId){
			String sql="select * from Store where stoType=?";
			return this.selectAll(sql, typeId);
		}
		/**
		 * 根据店铺状态查找店铺集合
		 * @param stoExam
		 * @return
		 */
		public List<Store> selectByStoExam(int stoExam){
			String sql="select * from Store where stoExam=?";
			return this.selectAll(sql, stoExam);
		}
}
