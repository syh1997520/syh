package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.Store;
import com.qlgshopping.service.StoreService;

public class StoreinfoServlet extends HttpServlet {
	StoreService stoservice = new StoreService();
	/**
	 * Constructor of the object.
	 */
	public StoreinfoServlet() {
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
		String r = request.getParameter("r");
		if(r.equals("show")){
			this.show(request, response);
		}else if(r.equals("add")){
			this.add(request, response);
		}
		
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Store sto = new Store();
		int stoId = Integer.parseInt(request.getParameter("stoId"));
		sto = stoservice.selectBystoId(stoId);
		if(sto!=null&&!"".equals(sto)){
			request.setAttribute("addmsg", "新增重复了");
			
			request.getRequestDispatcher("add_store.html").forward(request, response);
			
			return;
		}
		
		String stoName = request.getParameter("stoName");
		String stoAddress = request.getParameter("stoAddress");
		String stoPhone = request.getParameter("stoPhone");
		int stoExam = Integer.parseInt(request.getParameter("stoExam"));
		
		sto = new Store();
		sto.setStoId(stoId);
		sto.setStoName(stoName);
		sto.setStoAddress(stoAddress);
		sto.setStoPhone(stoPhone);
		sto.setStoExam(stoExam);
		
		if(stoservice.insertStor(sto)){
			System.out.println("新增成功");
			request.getRequestDispatcher("Store.html").forward(request, response);
		}else{
			System.out.println("新增失败");
			request.getRequestDispatcher("add_store.html").forward(request, response);
				
			
		}
		
		this.show(request, response);
		
	}
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList <Store> stolist = stoservice.selectAllStore();
		
		request.setAttribute("stolist", stolist);
		
		request.getRequestDispatcher("Store.html").forward(request, response);
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
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
