package com.qlgshopping.service;

import java.util.ArrayList;






import com.qlgshopping.dao.EvaluteDao;
import com.qlgshopping.dao.OrderInfoDao;
import com.qlgshopping.dao.OrderTableDao;
import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.dao.ReceiveAddressDao;
import com.qlgshopping.dao.StoreDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.OrderInfo;
import com.qlgshopping.entity.OrderTable;
import com.qlgshopping.entity.Page;
import com.qlgshopping.utils.TimeTransfer;

public class OrderTableService {
  private OrderTableDao oDao=new OrderTableDao();
  private StoreDao stoDao=new StoreDao();
  private UserInfoDao userDao=new UserInfoDao();
  private OrderInfoDao odifDao=new OrderInfoDao();
  private ReceiveAddressDao recDao=new ReceiveAddressDao();
  private ProductDao proDao=new ProductDao();
  private EvaluteDao evaDao=new EvaluteDao();
  
  /**
	 * 查询所有的方法
	 * @return
	 */
public Page<OrderTable> getPageA(int currentPage,int pageSize){
	  Page<OrderTable> page=new Page<OrderTable>();
	  
	 //设置当前页
	  page.setCurrentPage(currentPage);
	  
	  //设置页面容量
	  page.setPageSize(pageSize);
	  
	  //获取总笔数；
	  int totalRow=(int) oDao.getTableSizeA();
	  page.setTotalRow(totalRow);
	  
	  //开头笔数
	  int start=(page.getCurrentPage()-1)*page.getPageSize();
	  ArrayList<OrderTable> aList=oDao.selectAllByPageA(start, pageSize);
	  for(OrderTable type:aList){
		  loadOrderTableForeignerData(type);
	  }
	  
	  page.setaList(aList);
	  
	  
	  return page;
}
  
  
  
  /**
 	 * 查询所有的方法
 	 * @return
 	 */
  public Page<OrderTable> getPage(int stoId,int currentPage,int pageSize){
	  
	  
	  
	  Page<OrderTable> page=new Page<OrderTable>();
	  
	 //设置当前页
	  page.setCurrentPage(currentPage);
	  
	  //设置页面容量
	  page.setPageSize(pageSize);
	  
	  //获取总笔数；
	  int totalRow=(int) oDao.getTableSize(stoId);
	  page.setTotalRow(totalRow);
	  
	  //开头笔数
	  int start=(page.getCurrentPage()-1)*page.getPageSize();
	  ArrayList<OrderTable> aList=oDao.selectAllByPage(stoId, start, pageSize);
	  for(OrderTable order:aList){
		  loadOrderTableForeignerData(order);
	  }
	  
	  
	  page.setaList(aList);
	  
	  
	  return page;
  }
  
  /**
	 * 查询所有的方法
	 * @return
	 */
	public ArrayList<OrderTable> selectAllOrderTable(){
	   ArrayList<OrderTable> selectAllOrderTable = new ArrayList<OrderTable>(oDao.selectAllOrderTable());
	   for(OrderTable orTab:selectAllOrderTable){
		   this.loadOrderTableForeignerData(orTab);
	   }
	   return selectAllOrderTable;
	}
	/**
	 * 根据ordId删除数据
	 * @param ordId
	 * @return
	 */
	public boolean deleteOrderTable(int ordId){
		if(oDao.deleteOrderTable(ordId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 将对象插入到数据库
	 * @param ord
	 * @return
	 */
	public boolean insertOrdId(OrderTable ord){
		if(oDao.insertOrdId(ord)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 支付订单时执行的方法
	 * @param ord
	 * @return
	 */
	public boolean payOrdId(int orderId,String payTime,int addId){
		if(oDao.payOrder(orderId, payTime, addId)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 添加一个订单记录,返回刚插入的订单id
	 * @param ord
	 * @return
	 */
	public int insertOrderTable(OrderTable ord){
		return oDao.insertNewOrderTable(ord);
	}
	/**
	 * 修改订单信息
	 * @param ord
	 * @return
	 */
	public boolean updatePayTimeStatic(OrderTable ord){
		if(oDao.updatePayTimeStatic(ord)>0){
			return true;
		}
		return false;
	}
	/**
	 * 修改订单总价
	 * @param ord
	 * @return
	 */
	public boolean updateOrderCost(int odyableId,double totalCost ){
		if(oDao.updateTotalCost(odyableId, totalCost)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据ordId删除数据
	 * @param ordId
	 * @return
	 */
	public OrderTable selectByOrderId(int ordId){
		OrderTable selectByOrderId = oDao.selectByOrderId(ordId);
		this.loadOrderTableForeignerData(selectByOrderId);
		for(OrderInfo odif:selectByOrderId.getOdifList()){
			  if(odif==null)
					break;	
					odif.setOrderTable(oDao.selectByOrderId(odif.getOrdId()));
					odif.setProduct(proDao.selectProductByProId(odif.getProId()));
					odif.setEvalute(evaDao.selectByevaId(odif.getOdifEvaluate()));
		  }
		return selectByOrderId;
	}
	/**
	 * 根据店铺id获取订单
	 * @param ordId
	 * @return
	 */
	public ArrayList<OrderTable> selectByStoId(int ordId){
		ArrayList<OrderTable> selectAllOrderTable = new ArrayList<OrderTable>(oDao.selectByStoId(ordId));
		for(OrderTable orTab:selectAllOrderTable){
			  this.loadOrderTableForeignerData(orTab);
		}
		return selectAllOrderTable;
	}
	
	/**
	 * 根据用户id获取订单
	 * @param ordId
	 * @return
	 */
	public ArrayList<OrderTable> selectByUserId(int userId){
		ArrayList<OrderTable> selectAllOrderTable = new ArrayList<OrderTable>(oDao.selectByUserId(userId));
		for(OrderTable orTab:selectAllOrderTable){
			  this.loadOrderTableForeignerData(orTab);
			  for(OrderInfo odif:orTab.getOdifList()){
				  if(odif==null)
						break;	
						odif.setOrderTable(oDao.selectByOrderId(odif.getOrdId()));
						odif.setProduct(proDao.selectProductByProId(odif.getProId()));
						odif.setEvalute(evaDao.selectByevaId(odif.getOdifEvaluate()));
			  }
		}
		return selectAllOrderTable;
	}
	
	/**
	 * 根据用户id和订单获取订单
	 * @param ordId
	 * @return
	 */
	public ArrayList<OrderTable> selectByUserIdAndOrdStatic(int userId,String ordStatic){
	ArrayList<OrderTable> selectAllOrderTable = new ArrayList<OrderTable>(oDao.selectByUserIdAndOrdStatic(userId, ordStatic));
	for(OrderTable orTab:selectAllOrderTable){
		  this.loadOrderTableForeignerData(orTab);
		  for(OrderInfo odif:orTab.getOdifList()){
			  if(odif==null)
					break;	
					odif.setOrderTable(oDao.selectByOrderId(odif.getOrdId()));
					odif.setProduct(proDao.selectProductByProId(odif.getProId()));
					odif.setEvalute(evaDao.selectByevaId(odif.getOdifEvaluate()));
		  }
	}
	
	return selectAllOrderTable;
	}
	/**
	 * 获取某用户未评价的订单
	 * @param userId
	 * @param ordStatic
	 * @return
	 */
	public ArrayList<OrderTable> selectByUserIdAndNoEvalute(int userId){
		String ordStatic="已付款";
		ArrayList<OrderTable> selectAllOrderTable = new ArrayList<OrderTable>(oDao.selectByUserIdAndOrdStatic(userId, ordStatic));
		ArrayList<OrderTable> delOrder=new ArrayList<>();//用于删除空的ordertable
		for(OrderTable orTab:selectAllOrderTable){
			  this.loadOrderTableForeignerNoEvalute(orTab);
			  for(OrderInfo odif:orTab.getOdifList()){
				  if(odif==null)
						break;	
						odif.setOrderTable(oDao.selectByOrderId(odif.getOrdId()));
						odif.setProduct(proDao.selectProductByProId(odif.getProId()));
						odif.setEvalute(evaDao.selectByevaId(odif.getOdifEvaluate()));
			  }
			  if(orTab.getOdifList()==null||orTab.getOdifList().size()==0){
				  delOrder.add(orTab);
			  }
		}
		for(OrderTable o:delOrder){
			selectAllOrderTable.remove(o);
		}
		return selectAllOrderTable;
		}
	/**
	 * 记载外键（未评价的orderinfo）
	 * @param orTab
	 */
	private void loadOrderTableForeignerNoEvalute(OrderTable order) {
		// TODO Auto-generated method stub
		if(order==null)
			return;
		order.setStore(stoDao.selectBystoId(order.getStoId()));
		order.setUser(userDao.selectUserById(order.getUserId()));
		order.setOdifList(new ArrayList<OrderInfo>(odifDao.selectByOrderTableIdAndEva(order.getOrdId(),0)));
		order.setReceiveAddress(recDao.selectByReceAddId(order.getOrdAddress()));
	}
	/**
	 * 加载订单的外键
	 * @param order
	 */
	public void loadOrderTableForeignerData(OrderTable order){
		if(order==null)
			return;
		order.setStore(stoDao.selectBystoId(order.getStoId()));
		order.setUser(userDao.selectUserById(order.getUserId()));
		order.setOdifList(new ArrayList<OrderInfo>(odifDao.selectByOrderTableId(order.getOrdId())));
		order.setReceiveAddress(recDao.selectByReceAddId(order.getOrdAddress()));
	}
}
