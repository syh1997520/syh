package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.Evalute;
import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.EvaluteService;
import com.qlgshopping.service.OrderInfoService;
import com.qlgshopping.service.UserInfoService;

public class EvaluteServlet extends HttpServlet {
	private EvaluteService evaSe=new EvaluteService();
	private OrderInfoService odifSe=new OrderInfoService();
	private UserInfoService usSv=new UserInfoService();
	/**
	 * Constructor of the object.
	 */
	public EvaluteServlet() {
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

		doPost(request, response);
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
		if(op.equals("addevalute")){
			addEvalute(request, response);
		}
		
	}
	
	/**
	 * 添加评论
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void addEvalute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Evalute eva=new Evalute();
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		UserInfo selectUserById = usSv.selectUserById(user.getUserId());
		if(selectUserById.getSpeakAble()==0){
			request.setAttribute("evamsg", "您已被禁言，无法评论");
			request.getRequestDispatcher("orderTableServlet?op=gotoevalute&odifid="+request.getParameter("odifid")).forward(request, response);
			return;
		}
		eva.setOdifId(Integer.parseInt(request.getParameter("odifid")));
		eva.setEvaMsg(request.getParameter("evainner"));
		eva.setEvaScore(Integer.parseInt(request.getParameter("score")));
		eva.setUserId(user.getUserId());
		eva.setProId(Integer.parseInt(request.getParameter("proid")));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		eva.setEvaDate(date);
		eva.setLikeCount(0);
		eva.setEvaReport(0);
		evaSe.insertEvalute(eva);
		odifSe.updateOdifEva(eva.getOdifId());
		request.getRequestDispatcher("productServlet?op=looksingle&proId="+eva.getProId()).forward(request, response);
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
