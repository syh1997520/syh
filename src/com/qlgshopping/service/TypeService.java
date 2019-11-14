package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.dao.TypeDao;
import com.qlgshopping.entity.Product;
import com.qlgshopping.entity.Type;

public class TypeService {
	private TypeDao tyDao=new TypeDao();
	private ProductDao proDao=new ProductDao();
	
	
	public Type selectBytypeName(String typeName){
	return tyDao.selectBytypeName(typeName);
		
	}
	
	/**
	 * 得到所有类型
	 * 
	 */
	public ArrayList<Type> selectAllType(){
		ArrayList<Type> selectAllType =new ArrayList<Type>(tyDao.selectAllType());
		for(Type t:selectAllType){
			loadTypeForeignerData(t);
		}
		return selectAllType;
	}
	
	/**
	 * 增加类型
	 * @param type
	 * @return
	 */
	public boolean insertType(Type type){
		int insertType = tyDao.insertType(type);
		return insertType>0?true:false;
	}
	/**
	 * 删除类型
	 * @param TypeId
	 * @return
	 */
	public boolean deleteType(int TypeId){
		int deleteType = tyDao.deleteType(TypeId);
		return deleteType>0?true:false;
		}
	/**
	 * 根据类型编号查找类别
	 * @param typeId
	 * @return
	 */
	public Type selectBytypeId(int typeId){
		Type selectBytypeId = tyDao.selectBytypeId(typeId);
		this.loadTypeForeignerData(selectBytypeId);
		return selectBytypeId;
	}
	/**
	 * 根据类别等级查找类别
	 * @param typeRank
	 * @return
	 */
	public ArrayList<Type> selectBytypeRank(int typeRank){
		ArrayList<Type> selectBytypeRank = new ArrayList<Type>(tyDao.selectBytypeRank(typeRank));
		for(Type t:selectBytypeRank){
			this.loadTypeForeignerData(t);
			for(Type t2:t.getNextRankIdList()){
				this.loadTypeForeignerData(t2);
			}
		}
		return selectBytypeRank;
	}
	/**
	 * 根据商品的上一级类别查找类别
	 * @param typeBeyondId
	 * @return
	 */
	public ArrayList<Type> selectBytypeBeyondId(int typeBeyondId){
		ArrayList<Type> selectBytypeBeyondId = new ArrayList<Type>(tyDao.selectBytypeBeyondId(typeBeyondId));
		for(Type t:selectBytypeBeyondId){
			this.loadTypeForeignerData(t);
		}
		return selectBytypeBeyondId;
	}
	/**
	 * 加载type类的外键
	 * @param type
	 */
private void loadTypeForeignerData(Type type){
	if(type==null)
		return;
	type.setBeyondType(tyDao.selectBytypeId(type.getTypeBeyondId()));
	type.setProductList(new ArrayList<Product>(proDao.selectProductByType(type.getTypeId())));
	type.setNextRankIdList(new ArrayList<Type>(tyDao.selectBytypeBeyondId(type.getTypeId())));
}
}
