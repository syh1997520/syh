package com.qlgshopping.dao;

import java.util.List;

import com.qlgshopping.entity.EvaLike;

public class EvaLikeDao extends BaseDao<EvaLike> {
	/**
	 * 插入新的点赞内容
	 * @param evalike
	 * @return
	 */
public int insertEvaLike(EvaLike evalike){
	String sql="insert into evalike values(null,?,?)";
	Object obj[]={evalike.getLikeFrom(),evalike.getLikeFor()};
	return this.updateOne(sql, obj);
}
/**
 * 根据Likeid删除一条数据
 * @param likeId
 * @return
 */
public int deleteEvaLikeByLikeId(int likeId){
	String sql="delete from evalike where likeId=?";
	return this.updateOne(sql, likeId);
}
/**
 * 更新一条evalike
 * @param evalike
 * @return
 */
public int updateEvaLike(EvaLike evalike){
	String sql="update evalike set likeFrom=?,likeFor=? where likeId=?";
	Object obj[]={evalike.getLikeFrom(),evalike.getLikeFor(),evalike.getLikeId()};
	return this.updateOne(sql, obj);
}
/**
 * 根据likeid查找
 * @param likeId
 * @return
 */
public EvaLike selectEvaLikeByLikeId(int likeId){
	String sql="select * from evalike where likeId=?";
	return this.selectOne(sql, likeId);
}
/**
 * 查看某用户的点赞列表
 * @param likeFrom
 * @return
 */
public List<EvaLike> selectEvaLikeByLikeFrom(int likeFrom){
	String sql="select * from evalike where likeFrom=?";
	return this.selectAll(sql, likeFrom);
}
/**
 * 根据评价的id返回点赞列表
 * @param likeFor
 * @return
 */
public List<EvaLike> selectEvaLikeByLikeFor(int likeFor){
	String sql="select * from evalike where likeFor=?";
	return this.selectAll(sql, likeFor);
}
}
