package com.qlgshopping.dao;

import java.util.List;

import com.qlgshopping.entity.SecKill;

public class SecKillDao extends BaseDao<SecKill> {
	/**
	 * 根据时间倒序查找所有参与秒杀的商品
	 * @return
	 */
	public List<SecKill> selectAllSec(){
		String sql="select * from seckill order by secdate desc";
		return this.selectAll(sql);
	}
	/**
	 * 根据秒杀表id减少一件商品
	 * @param secid
	 * @return
	 */
	public int getOnePro(int secid) {
		String sql="update seckill set secnumber=secnumber-1 where secid=?";
		return this.updateOne(sql,secid);
	}
	/**
	 * 根据secid查找剩余的商品件数
	 * @param secid
	 * @return
	 */
	public SecKill selectProNumber(int secid) {
		String sql="select * from seckill where secid=?";
		return this.selectOne(sql, secid);
	}
}
