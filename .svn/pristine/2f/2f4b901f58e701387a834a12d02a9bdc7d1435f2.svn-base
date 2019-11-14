package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.MyHistory;
import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.MyHistoryService;
import com.qlgshopping.utils.MyHistoryDateCollect;

public class MyHistoryServlet extends HttpServlet {
	private MyHistoryService mgSv=new MyHistoryService();
	/**
	 * Constructor of the object.
	 */
	public MyHistoryServlet() {
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

		this.doPost(request, response);
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

		String op = request.getParameter("op");
		if(op.equals("query")){
			queryMyFoot(request, response);
		}
		if(op.equals("addhistory")){
			addMyHistory(request, response);
		}
	}
	/**
	 * 添加我的历史记录
	 * @param request
	 * @param response
	 */
	public void addMyHistory(HttpServletRequest request, HttpServletResponse response){
		int proId=Integer.parseInt(request.getParameter("proid"));
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		if(user==null)
			return;
		MyHistory mi=new MyHistory();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		mi.setHisDate(sdf.format(new Date()));
		mi.setHisDelete(0);
		mi.setHisForId(proId);
		mi.setHisFromId(user.getUserId());
		ArrayList<MyHistory> selectByHisFromId = mgSv.selectByHisFromId(user.getUserId());
		for(MyHistory mhis:selectByHisFromId){
			if(mhis.getHisForId()==mi.getHisForId()&&mhis.getHisDate().substring(5, 10).equals(mi.getHisDate().substring(5, 10))){
				mgSv.deleteMyHistoryByHisId(mhis.getHisId());
			}
		}
		mgSv.insertMyHistory(mi);
	}
	/**
	 * 查找我的足迹
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void queryMyFoot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//用于测试，获取用户id为1的足迹
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		ArrayList<MyHistory> selectByHisFromId = mgSv.selectByHisFromId(user.getUserId());
		LinkedHashMap<String, ArrayList<MyHistory>> histtoryMap = MyHistoryDateCollect.getHisttoryMap(selectByHisFromId);
		request.setAttribute("myhistorymap", histtoryMap);
		request.getRequestDispatcher("myfoot.jsp").forward(request, response);
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
