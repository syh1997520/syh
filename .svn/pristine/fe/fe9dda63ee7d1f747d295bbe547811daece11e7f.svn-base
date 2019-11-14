package com.qlgshopping.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qlgshopping.utils.DBCTdemo;



public class BaseDao<T> {
	/**
	 * 查找多条数据
	 * @param sql
	 * @param obj
	 * @return
	 */
public List<T> selectAll(String sql,Object... obj){
	DataSource ds=DBCTdemo.getds();
	QueryRunner qr=new QueryRunner(ds);
	T t = null;

	Type t1 = ((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	Class<T> tClass = (Class<T>)t1;
	List<T> query=null;
	try {
		query = qr.query(sql,new BeanListHandler<T>(tClass),obj);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return query;
}
/**
 * 查找一条数据
 * @param sql
 * @param obj
 * @return
 */
public T selectOne(String sql,Object... obj){
	QueryRunner qr=new QueryRunner(DBCTdemo.getds());
	T t = null;
	Type t1 = ((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	Class<T> tClass = (Class<T>)t1;
	T query=null;
	try {
		 query= qr.query(sql,new BeanHandler<>(tClass),obj);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return query;
}
/**
 * 进行增删改操作
 * @param sql
 * @param obj
 * @return
 */
public int updateOne(String sql,Object... obj){
	QueryRunner qr=new QueryRunner(DBCTdemo.getds());
	int update=0;
	try {
		update= qr.update(sql, obj);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return update;
}
/**
 * 聚合函数查询
 * @param sql
 * @param obj
 * @return
 */
public Long getTableSize(String sql,Object... obj){
	QueryRunner qr=new QueryRunner(DBCTdemo.getds());
	long l=0;
	try {
		l = (Long)qr.query(sql, new ScalarHandler(),obj);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return l;
}
}
