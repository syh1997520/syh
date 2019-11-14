package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.EvaLike;
import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.EvaLikeService;
import com.qlgshopping.service.EvaluteService;

public class EvaLikeServlet extends HttpServlet {
	private EvaLikeService evaSe=new EvaLikeService();
	private EvaluteService eSe=new EvaluteService();
	/**
	 * Constructor of the object.
	 */
	public EvaLikeServlet() {
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
		if(op.equals("givegood")){
			giveGood(request, response);
		}
	}
	/**
	 * 点赞方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void giveGood(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		if(user==null){
			response.getWriter().print("请先登录");
			return;
		}else{
			int evaluteId=Integer.parseInt(request.getParameter("evaid"));
			ArrayList<EvaLike> selectEvaLikeByLikeFrom = evaSe.selectEvaLikeByLikeFor(evaluteId);
			for(EvaLike e:selectEvaLikeByLikeFrom){
				if(user.getUserId()==e.getLikeFrom()){
					response.getWriter().print("您已经点过赞啦！请勿刷赞");
					return;
				}
			}
			EvaLike evalike=new EvaLike();
			evalike.setLikeFor(evaluteId);
			evalike.setLikeFrom(user.getUserId());
			evaSe.insertEvaLike(evalike);
			eSe.giveLikeAdd(evaluteId);
			response.getWriter().print("success");
		}
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
