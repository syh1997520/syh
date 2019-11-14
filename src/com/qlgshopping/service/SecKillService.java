package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.ProductDao;
import com.qlgshopping.dao.SecKillDao;
import com.qlgshopping.entity.SecKill;

public class SecKillService {
	ProductDao prodao=new ProductDao();
	SecKillDao skDao=new SecKillDao();
/**
 * 给一个秒杀对象赋外键	
 * @param sk
 */
private void loadForeignData(SecKill sk) {
	if(sk==null)
		return;
	sk.setPro(prodao.selectProductByProId(sk.getProid()));
}
/**
 * 获取sec集合
 * @return
 */
public ArrayList<SecKill> selectSecList(){
	ArrayList<SecKill> secList=new ArrayList<SecKill>(skDao.selectAllSec()); 
	for(SecKill sec:secList) {
		this.loadForeignData(sec);
	}
	return secList;
}
/**
 * 根据secid返回商品数量
 * @param secid
 * @return
 */
public int getProNumber(int secid) {
	SecKill selectProNumber = skDao.selectProNumber(secid);
	return selectProNumber.getSecnumber();
}
/**
 * 根据secid减少一件产品数量
 * @param secid
 * @return
 */
public boolean buyOnePro(int secid) {
	int onePro = skDao.getOnePro(secid);
	if(onePro>0)
		return true;
	else
		return false;
}
}
