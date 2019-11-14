package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qlgshopping.entity.Store;
import com.qlgshopping.service.StoreService;

public class StoreServlet extends HttpServlet {
	StoreService stoSe=new StoreService();
	/**
	 * Constructor of the object.
	 */
	public StoreServlet() {
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

		String op=request.getParameter("op");
		if(op.equals("addrom")){
			addRom(request, response);
		}
	}
	/**
	 * 添加店铺推荐
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void addRom(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		int stoId=Integer.parseInt(request.getParameter("stoid"));
		Store selectBystoId = stoSe.selectBystoId(stoId);
		Gson gs=new Gson();
		String json = gs.toJson(selectBystoId);
		response.getWriter().print(json);
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
