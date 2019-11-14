package com.qlgshopping.dao;

import java.util.List;

import com.qlgshopping.entity.MyHistory;

public class MyHistoryDao extends BaseDao<MyHistory> {
	/**
	 * 插入新的足迹
	 * @param mh
	 * @return
	 */
public int insertMyHistory(MyHistory mh){
	String sql="insert into myhistory values(null,?,?,?,?)";
	Object obj[]={mh.getHisFromId(),mh.getHisForId(),mh.getHisDate(),mh.getHisDelete()};
	return this.updateOne(sql, obj);
}
/**
 * 根据足迹id删除足迹
 * @param hisId
 * @return
 */
public int deleteMyHistoryByHisId(int hisId){
	String sql="delete from myhistory where hisId=?";
	return this.updateOne(sql, hisId);
}
/**
 * 根据足迹id查找足迹
 * @param hisId
 * @return
 */
public MyHistory selectByHisId(int hisId){
	String sql="select * from myhistory where hisId=?";
	return this.selectOne(sql, hisId);
}
/**
 * 根据用户获取足迹列表（未删除的足迹）
 * @param hisFromId
 * @return
 */
public List<MyHistory> selectByHisFromId(int hisFromId){
	String sql="select * from myhistory where hisFromId=? and hisDelete=0 order by hisDate desc";
	return this.selectAll(sql, hisFromId);
}
}
