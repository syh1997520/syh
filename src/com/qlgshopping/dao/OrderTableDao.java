package com.qlgshopping.dao;

import java.util.ArrayList;
import java.util.List;

import com.qlgshopping.entity.OrderTable;

public class OrderTableDao extends BaseDao<OrderTable> {
	/**
	 * 根据店铺分页查询订单
	 * @return
	 */
	public ArrayList<OrderTable> selectAllByPage(int stoId,int start,int pageSize){
		String sql="select * from ordertable where stoId=? limit ?,?";
		Object[] obj={stoId,start,pageSize};
		return (ArrayList<OrderTable>) this.selectAll(sql, obj);
	}
	
	public long getTableSizeA(){
		String sql="select count(*) from ordertable";
		return this.getTableSize(sql);
	}
	
	public ArrayList<OrderTable> selectAllByPageA(int start,int pageSize){
		String sql="select * from ordertable order by ordId desc limit ?,?";
		Object[] obj={start,pageSize};
		return (ArrayList<OrderTable>) this.selectAll(sql, obj);
	}
	
	public long getTableSize(int stoId){
		String sql="select count(*) from ordertable where stoId=?";
		return this.getTableSize(sql, stoId);
	}
	
	
	
	
	/**
	 * 支付订单执行的方法
	 * @param orderId
	 * @param payTime
	 * @param addId
	 * @return
	 */
	public int payOrder(int orderId,String payTime,int addId){
		String sql="update ordertable set payTime=?,ordAddress=?,`ordStatic`='已付款'  where ordId=?";
		return this.updateOne(sql, payTime,addId,orderId);
	}
	
	/**
	 * 查询所有的方法
	 * @return
	 */
	public List<OrderTable> selectAllOrderTable(){
		String sql="select * from ordertable";
		return this.selectAll(sql);
	}
	/**
	 * 根据ordId删除数据
	 * @param ordId
	 * @return
	 */
	public int deleteOrderTable(int ordId){
		String sql="delete from ordertable where ordId=?";
		return this.updateOne(sql,ordId);
	}
	/**
	 * 将对象插入到数据库
	 * @param ord
	 * @return
	 */
	public int insertOrdId(OrderTable ord){
		String sql="insert into ordertable values (null,?,?,?,?,?,?,?)";
		if(ord.getOrdAddress()!=0){
			Object[] obj={ord.getStoId(),ord.getUserId(),ord.getOrdPrice(),ord.getOrdTime(),ord.getPayTime(),ord.getOrdStatic(),ord.getOrdAddress()};
			return this.updateOne(sql, obj);
		}
		else{
			Object[] obj={ord.getStoId(),ord.getUserId(),ord.getOrdPrice(),ord.getOrdTime(),ord.getPayTime(),ord.getOrdStatic(),null};	
			return this.updateOne(sql, obj);
		}
	}
	/**
	 * 生成新的订单,返回orderid
	 * @param ord
	 * @return
	 */
	public int insertNewOrderTable(OrderTable ord){
		String sql="insert into ordertable values (null,?,?,?,?,null,?,null)";
		Object[] obj={ord.getStoId(),ord.getUserId(),ord.getOrdPrice(),ord.getOrdTime(),ord.getOrdStatic()};
		this.updateOne(sql, obj);
		String sql2="select LAST_INSERT_ID()";
		return this.getTableSize(sql2).intValue();
	}
	/**
	 * 修改订单信息
	 * @param ord
	 * @return
	 */
	public int updatePayTimeStatic(OrderTable ord){
		String sql="update ordertable set ordPrice=?,ordTime=?,payTime=?,ordStatic=?,ordAddress=? where ordId=?";
		Object obj[] ={ord.getOrdPrice(),ord.getOrdTime(),ord.getPayTime(),ord.getOrdStatic(),ord.getOrdAddress(),ord.getOrdId()};
		return this.updateOne(sql, obj);
	}
	/**
	 * 修改某一订单的总价
	 * @param odyableId
	 * @param totalCost
	 * @return
	 */
	public int updateTotalCost(int odyableId,double totalCost){
		String sql="update ordertable set ordPrice=? where ordId=?";
		return this.updateOne(sql, totalCost,odyableId);
	}
	/**
	 * 根据ordId删除数据
	 * @param ordId
	 * @return
	 */
	public OrderTable selectByOrderId(int ordId){
		String sql="select * from ordertable where ordId=?";
		return this.selectOne(sql, ordId);
	}
	/**
	 * 根据店铺id获取订单
	 * @param ordId
	 * @return
	 */
	public List<OrderTable> selectByStoId(int ordId){
		String sql="select * from ordertable where stoId=?";
		return this.selectAll(sql, ordId);
	}
	
	/**
	 * 根据用户id获取订单
	 * @param ordId
	 * @return
	 */
	public List<OrderTable> selectByUserId(int userId){
		String sql="select * from ordertable where userId=?";
		return this.selectAll(sql, userId);
	}
	
	/**
	 * 根据用户id和订单获取订单
	 * @param ordId
	 * @return
	 */
	public List<OrderTable> selectByUserIdAndOrdStatic(int userId,String ordStatic){
		String sql="select * from ordertable where userId=? and ordStatic=?";
		Object obj[]={userId,ordStatic};
		return this.selectAll(sql, obj);
	}
	
}
