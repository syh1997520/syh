package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qlgshopping.entity.ReceiveAddress;
import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.ReceiveAddressService;

public class ReceiveAddressServlet extends HttpServlet {
	ReceiveAddressService rSer=new ReceiveAddressService();
	/**
	 * Constructor of the object.
	 */
	public ReceiveAddressServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
             String op=request.getParameter("op");
             if(op.equals("query")){
            	this.query(request, response); 
             }else if(op.equals("add")){
             	this.add(request, response); 
              }else if(op.equals("del")){
              	this.add(request, response); 
               }else if(op.equals("checkImpAddress")){
            	   this.checkImpAddress(request, response);
               }else if(op.equals("checkuName")){
            	   this.checkuName(request, response);
               }else if(op.equals("checkPhone")){
            	   this.checkPhone(request, response);
               }
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
          this.doGet(request, response);
	}
	
	/**
	 * 查询
	 *
	 * @throws ServletException if an error occurs
	 */
	public void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		if(user==null)
			return;
		 ArrayList<ReceiveAddress> recList=rSer.selectByUserId(user.getUserId());
		 Gson gson=new Gson();
		 String strGson=gson.toJson(recList);
		 response.getWriter().println(strGson);
	}
	/**
	 * 添加
	 *
	 * @throws ServletException if an error occurs
	 */
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String impAddress=request.getParameter("impAddress");
		if(impAddress==null||"".equals(impAddress)){
			response.sendRedirect("chooseAddress2.jsp");
			return;
		}
		String uName=request.getParameter("uName");
		if(uName==null||"".equals(uName)){
			response.sendRedirect("chooseAddress2.jsp");
			return;
		}
		String phone=request.getParameter("phone");
		if(phone==null||"".equals(phone)){
			response.sendRedirect("chooseAddress2.jsp");
			return;
		}
		ReceiveAddress recAdd=new ReceiveAddress();
		recAdd.setRecAddress(impAddress);
		recAdd.setRecName(uName);
		recAdd.setRecPhone(phone);
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		recAdd.setUserId(user.getUserId());
		rSer.insertReceiveAddress(recAdd);
		
		response.sendRedirect("chooseAddress2.jsp");
	}
	
	/**
	 * 添加
	 *
	 * @throws ServletException if an error occurs
	 */
	public void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	
	/**
	 * 添加
	 *
	 * @throws ServletException if an error occurs
	 */
	
	public void checkImpAddress(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg;
         
		String impAddress=request.getParameter("impAddress");
		
		System.out.println(impAddress);
		if(impAddress!=null&&!"".equals(impAddress)){
			msg="该地址可用";
		}else{
			msg="请填写地址";
		}
		response.getWriter().println(msg);
	}
	public void checkuName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg;
         
		String uName=request.getParameter("uName");
		
		
		if(uName!=null&&!"".equals(uName)){
			msg="该名字可用";
		}else{
			msg="请填写名字";
		}
		response.getWriter().println(msg);
	}
	public void checkPhone(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String msg;
         
		String phone=request.getParameter("phone");
		
		
		if(phone!=null&&!"".equals(phone)&& phone.length()==11){
			msg="该手机号码可用";
		}else{
			msg="请输入11位数字";
		}
		response.getWriter().println(msg);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
