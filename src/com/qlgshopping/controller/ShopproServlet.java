package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.Product;
import com.qlgshopping.service.ProductService;

public class ShopproServlet extends HttpServlet {
	ProductService proservice = new ProductService();
	/**
	 * Constructor of the object.
	 */
	public ShopproServlet() {
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
			if(r.equals("query")){
				this.query(request, response);
			}else if(r.equals("show")){
				this.show(request, response);
			}else if(r.equals("mod")){
				this.mod(request, response);
			}
		
	}
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	
	}
	
	public void mod(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ArrayList<Product> pro = new ArrayList<Product>();
			int proId = Integer.parseInt(request.getParameter("proId"));
			String proName = request.getParameter("proName");
			pro = proservice.selectProductByProName(proName);
			
			if(pro!=null){
				request.setAttribute("Msag", "名称重复了");
				request.setAttribute("pro", pro);
				request.getRequestDispatcher("shopmod_info").forward(request, response);
				return;
			}
			
			int proPrice = Integer.parseInt(request.getParameter("proPrice"));
			int proType = Integer.parseInt(request.getParameter("proType"));
			int proNumber = Integer.parseInt(request.getParameter("proNumber"));
			Product prod = new Product();
			
			
			prod.setProName(proName);
			prod.setProPrice(proPrice);
			prod.setProType(proType);
			prod.setProNumber(proNumber);
			
			if(proservice.updateProduct(prod)){
				System.out.println("修改成功");
			}else{
				System.out.println("修改失败");
			}
			
			this.query(request, response);
			
		
	}
	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			ArrayList<Product> prod = new ArrayList<Product>();
			String strId = request.getParameter("proId");
			if(strId!=null&&!"".equals(strId)){
				int proId = Integer.parseInt(strId);
			}
			prod = proservice.selectAllProduct();
			
			request.setAttribute("prod", prod);
			
			request.getRequestDispatcher("shopmod_info.jsp").forward(request, response);
			
		
	}
	
	public void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ArrayList<Product> prolist = proservice.selectAllProduct();
			
			request.setAttribute("prolist", prolist);
			
			request.getRequestDispatcher("shops_index.jsp").forward(request, response);
		
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
