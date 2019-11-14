package com.qlgshopping.service;

import java.util.ArrayList;
import java.util.List;

import com.qlgshopping.dao.EvaLikeDao;
import com.qlgshopping.dao.EvaluteDao;
import com.qlgshopping.dao.OrderInfoDao;
import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.EvaLike;
import com.qlgshopping.entity.Evalute;
import com.qlgshopping.utils.TimeTransfer;

public class EvaluteService {
	private EvaluteDao eDao=new EvaluteDao();
	private UserInfoDao uDao=new UserInfoDao();
	private ProductDao pDao=new ProductDao();
	private EvaLikeDao elDao=new EvaLikeDao();
	private OrderInfoDao odifDao=new OrderInfoDao();
	/**
	 * 加载外键
	 * @param eva
	 * @return
	 */
	private void loadForeignEvaluteData(Evalute evalute){
		if(evalute==null)
			return;
		evalute.setOrderinfo(odifDao.selectByOrderInfoId(evalute.getOdifId()));
		evalute.setUserInfo(uDao.selectUserById(evalute.getUserId()));
		evalute.setProduct(pDao.selectProductByProId(evalute.getProId()));
		evalute.setLikeList(new ArrayList<EvaLike>(elDao.selectEvaLikeByLikeFor(evalute.getEvaId())));
	}
	
	/**
	 * 将一个evalute对象插入数据库
	 * @param eva
	 * @return
	 */
	public boolean insertEvalute(Evalute eva){
		if(eDao.insertEvalute(eva)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据id删除相应数据
	 * @param evaId
	 * @return
	 */
	public boolean deleteByEvaId(int evaId){
		if(eDao.deleteByEvaId(evaId)>0){
			return true;
		}
		return false;
	}
	/**
	 * 根据id修改评价的内容和星级
	 * @param eva
	 * @return
	 */
	public boolean updateMsgScore(Evalute eva){
	if(eDao.updateMsgScore(eva)>0){
		return true;
	}
	return false;
	}
	/**
	 * 给某个评论点赞
	 * @param eva
	 * @return
	 */
	public boolean giveLikeAdd(int evaId){
	if(eDao.getLikeAdd(evaId)>0){
		return true;
	}
	return false;
	}
	/**
	 * 根据评价id获取对象
	 * @param evaId
	 * @return
	 */
	public Evalute selectByevaId(int evaId){
		   Evalute selectByevaId = eDao.selectByevaId(evaId);
		   this.loadForeignEvaluteData(selectByevaId);
		   return selectByevaId;
	}
	/**
	 * 根据订单详情id获取对象
	 * @param odifId
	 * @return
	 */
	public Evalute selectByodifId(int odifId){
		 Evalute selectByevaId = eDao.selectByodifId(odifId);
		   this.loadForeignEvaluteData(selectByevaId);
		   return selectByevaId;
	}
	/**
	 * 根据用户Id获取集合
	 * @param userId
	 * @return
	 */
	public ArrayList<Evalute> selectAllByuserId(int userId){
		ArrayList<Evalute> selectAllByuserId = new ArrayList<Evalute>(eDao.selectAllByuserId(userId));
		for(Evalute eva:selectAllByuserId){
			this.loadForeignEvaluteData(eva);
		}
		return selectAllByuserId;
	}
	/**
	 * 根据商品id获取集合
	 * @param proId
	 * @return
	 */
	public List<Evalute> selectAllByproId(int proId){
		ArrayList<Evalute> selectAllByuserId = new ArrayList<Evalute>(eDao.selectAllByproId(proId));
		for(Evalute eva:selectAllByuserId){
			this.loadForeignEvaluteData(eva);
		}
		return selectAllByuserId;
	}
	/**
	 * 根据是否被举报获取评价
	 * @param evaMsg
	 * @return
	 */
	public List<Evalute> selectAllByevaMsg(String evaMsg){
		ArrayList<Evalute> selectAllByuserId = new ArrayList<Evalute>(eDao.selectAllByevaMsg(evaMsg));
		for(Evalute eva:selectAllByuserId){
			this.loadForeignEvaluteData(eva);
		}
		return selectAllByuserId;
	}
}
