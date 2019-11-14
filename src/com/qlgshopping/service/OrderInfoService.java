package com.qlgshopping.service;

import java.util.ArrayList;
import java.util.List;

import com.qlgshopping.dao.EvaluteDao;
import com.qlgshopping.dao.OrderInfoDao;
import com.qlgshopping.dao.OrderTableDao;
import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.entity.OrderInfo;

public class OrderInfoService {
	private OrderInfoDao oDao=new OrderInfoDao();
	private OrderTableDao ordtableDao=new OrderTableDao();
	private ProductDao proDao=new ProductDao();
	private EvaluteDao evaDao=new EvaluteDao();
	/**
	 * 将一个订单对象插入到数据库中
	 * @param odif
	 * @return
	 */
	public boolean insertOrderinfo(OrderInfo odif){
		if(oDao.insertOrderinfo(odif)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据odifId删除某一项数据
	 * @param odifId
	 * @return
	 */
	public boolean deleteByOdifId(int odifId){
		if(oDao.deleteByOdifId(odifId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据id更新购买的数量和价格
	 * @param odif
	 * @return
	 */
	public boolean updateNumberPrice(OrderInfo odif){
		if(oDao.updateNumberPrice(odif)>0){
			return true;
		}
		return false;
	}
	/**
	 * 更改某一订单详情的状态为已评价
	 * @param odifId
	 * @return
	 */
	public boolean updateOdifEva(int odifId){
		if(oDao.updateEvaStatic(odifId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据订单详情id获取订单详情（返回单个对象）
	 * @param odif
	 * @return
	 */
	public OrderInfo selectByOrderInfoId(int odifId){
		OrderInfo selectByOrderInfoId = oDao.selectByOrderInfoId(odifId);
		this.loadOrderInfoForeignData(selectByOrderInfoId);
		return selectByOrderInfoId;
	}
	
	/**
	 * 根据订单表id获取订单详情（返回集合）
	 * @param odif
	 * @return
	 */
	public ArrayList<OrderInfo> selectByOrderTableId(int ordId){
		ArrayList<OrderInfo> selectByOrderTableId = new ArrayList<OrderInfo>(oDao.selectByOrderTableId(ordId));
		for(OrderInfo odif:selectByOrderTableId){
			this.loadOrderInfoForeignData(odif);
		}
		return selectByOrderTableId;
	}
	/**
	 * 根据订单表id与是否评价返回订单详情（返回集合）
	 * @param odif
	 * @return
	 */
	public ArrayList<OrderInfo> selectByOrderTableIdAndEva(int ordId,int odifEvaluate){
		ArrayList<OrderInfo> selectByOrderTableId = new ArrayList<OrderInfo>(oDao.selectByOrderTableIdAndEva(ordId, odifEvaluate));
		for(OrderInfo odif:selectByOrderTableId){
			this.loadOrderInfoForeignData(odif);
		}
		return selectByOrderTableId;
	}
	
	public void loadOrderInfoForeignData(OrderInfo odif){
		if(odif==null)
		return;	
		odif.setOrderTable(ordtableDao.selectByOrderId(odif.getOrdId()));
		odif.setProduct(proDao.selectProductByProId(odif.getProId()));
		odif.setEvalute(evaDao.selectByevaId(odif.getOdifEvaluate()));
	}
}
