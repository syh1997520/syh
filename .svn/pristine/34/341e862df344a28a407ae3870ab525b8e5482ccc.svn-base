package com.qlgshopping.test;

import com.qlgshopping.dao.EvaluteDao;
import com.qlgshopping.entity.Evalute;

public class EvaluteDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EvaluteDao vdao = new EvaluteDao();
		Evalute lt = new Evalute();
		lt.setEvaId(21);
		lt.setOdifId(21);
		lt.setEvaMsg("豆腐干是与非广东撒一个");
		lt.setEvaScore(4);
		lt.setUserId(20);
		lt.setProId(18);
		lt.setEvaDate("2019-09-03");
		lt.setLikeCount(0);
		lt.setEvaReport(11);
		int kk = vdao.insertEvalute(lt);
		System.out.println(kk);
		
		int ew = vdao.deleteByEvaId(9);
		System.out.println(ew);

	}

}
