package com.qlgshopping.test;

import com.qlgshopping.dao.EvaLikeDao;
import com.qlgshopping.entity.EvaLike;

public class EvaLikeDaoTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EvaLikeDao edao = new EvaLikeDao();
		EvaLike el = new EvaLike();
		el.setLikeFrom(1);
		el.setLikeId(2);
		el.setLikeFor(4);
		int eva = edao.insertEvaLike(el);
		System.out.println(eva);
		
	}

}
