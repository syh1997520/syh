package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.EvaLikeDao;
import com.qlgshopping.dao.EvaluteDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.EvaLike;

public class EvaLikeService {
private EvaLikeDao eDao=new EvaLikeDao();
private EvaluteDao elDao=new EvaluteDao();
private UserInfoDao uDao=new UserInfoDao();

/**
 * 给 EvaLike对象的外键添加数据	
 * @param user
 */
private void loadForeignEvaLikeData(EvaLike evaLike){
	if(evaLike==null)
		return;
	evaLike.setEvalute(elDao.selectByevaId(evaLike.getLikeFor()));
	evaLike.setUser(uDao.selectUserById(evaLike.getLikeFrom()));
}

/**
 * 插入新的点赞内容
 * @param evalike
 * @return
 */
public boolean insertEvaLike(EvaLike evalike){
if(eDao.insertEvaLike(evalike)>0){
	return true;
}
return false;
}
/**
* 根据Likeid删除一条数据
* @param likeId
* @return
*/
public boolean deleteEvaLikeByLikeId(int likeId){
if(eDao.deleteEvaLikeByLikeId(likeId)>0){
	return true;
}
return false;
}
/**
* 更新一条evalike
* @param evalike
* @return
*/
public boolean updateEvaLike(EvaLike evalike){
if(eDao.updateEvaLike(evalike)>0){
	return true;
}
return false;
}
/**
* 根据likeid查找
* @param likeId
* @return
*/
public EvaLike selectEvaLikeByLikeId(int likeId){
        EvaLike selectEvaLikeByLikeId = eDao.selectEvaLikeByLikeId(likeId);
        this.loadForeignEvaLikeData(selectEvaLikeByLikeId);
        return selectEvaLikeByLikeId;
}
/**
* 查看某用户的点赞列表
* @param likeFrom
* @return
*/
public ArrayList<EvaLike> selectEvaLikeByLikeFrom(int likeFrom){
ArrayList<EvaLike> selectEvaLikeByLikeFrom = new ArrayList<EvaLike>(eDao.selectEvaLikeByLikeFrom(likeFrom));
for(EvaLike eva:selectEvaLikeByLikeFrom){
	this.loadForeignEvaLikeData(eva);
}
return selectEvaLikeByLikeFrom;
}
/**
* 根据评价的id返回点赞列表
* @param likeFor
* @return
*/
public ArrayList<EvaLike> selectEvaLikeByLikeFor(int likeFor){
ArrayList<EvaLike> selectEvaLikeByLikeFrom = new ArrayList<EvaLike>(eDao.selectEvaLikeByLikeFor(likeFor));
for(EvaLike eva:selectEvaLikeByLikeFrom){
	this.loadForeignEvaLikeData(eva);
}
return selectEvaLikeByLikeFrom;
}
}
