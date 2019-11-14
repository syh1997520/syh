package com.qlgshopping.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DBCTdemo {
private static DataSource dts;
static{
	InputStream is = DBCTdemo.class.getClassLoader().getResourceAsStream("dbcp.properties");
	Properties p=new Properties();
	try {
		p.load(is);
		dts = BasicDataSourceFactory.createDataSource(p);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
public static DataSource getds(){
	return dts;
}
public static Connection getConn(){
		Connection conn=null;
	try {
		conn=dts.getConnection();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return conn;
}
}
