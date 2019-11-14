package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qlgshopping.entity.Evalute;
import com.qlgshopping.entity.Product;
import com.qlgshopping.service.OrderInfoService;
import com.qlgshopping.service.ProductService;
import com.qlgshopping.service.ShoppingCartInfoService;
import com.qlgshopping.utils.TimeTransfer;

public class ProductServlet extends HttpServlet {
	private ProductService proSer=new ProductService();
	ShoppingCartInfoService sSer=new ShoppingCartInfoService();
	/**
	 * Constructor of the object.
	 */
	public ProductServlet() {
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
		String op = request.getParameter("op");
		if(op.equals("queryid")){
			queryProductById(request, response);
		}else if(op.equals("looksingle")){
			lookSingle(request, response);
		}else if(op.equals("indexquery")){
			indexQuery(request, response);
		}else if(op.equals("queryname")){
			queryProductByName(request, response);
		}else if(op.equals("getpopular")){
			getPopularPro(request, response);
		}else if(op.equals("remove")){
			this.remove(request, response);
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
	 * 移除商品
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void remove(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strshpifId=request.getParameter("shpifId");
		int shpifId=Integer.parseInt(strshpifId);
		sSer.deleteByshpifId(shpifId);
		response.sendRedirect("mycart.jsp");
	}
	
	
	/**
	 * 获取热门产品集合
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void getPopularPro(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		ArrayList<Product> selectAllProduct = proSer.selectPopularPro();
		Gson gs=new Gson();
		String json = gs.toJson(selectAllProduct);
		response.getWriter().print(json);
	}
	
	private void indexQuery(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		int typeid =Integer.parseInt(request.getParameter("typeid"));
		ArrayList<Product> selectProductByTypeFromIndex = proSer.selectProductByTypeFromIndex(typeid);
		Gson gs=new Gson();
		String json = gs.toJson(selectProductByTypeFromIndex);
		response.getWriter().print(json);
	}
	
	/**
	 * 查看单个商品的详情
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void lookSingle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int proid = Integer.parseInt(request.getParameter("proId"));
		Product selectProductByProId = proSer.selectProductByProId(proid);
		for(Evalute eva:selectProductByProId.getEvaluteList()){
			eva.setEvaDate(TimeTransfer.timeDelete0(eva.getEvaDate()));
		}  
		request.setAttribute("product", selectProductByProId);
		request.getRequestDispatcher("single.jsp").forward(request, response);
	}
	/**
	 * 根据商品名字查询相关商品
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void queryProductByName(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		String proName =request.getParameter("proname");
		String orderBy=request.getParameter("orderby");
		ArrayList<Product> selectProductByName=null;
		if(orderBy==null){
			selectProductByName = proSer.selectProductByProName(proName);
		}else if(orderBy.equals("pricelow")){
			selectProductByName=proSer.selectProductByPronamePriceLow(proName);
		}
		else if(orderBy.equals("pricehigh")){
			selectProductByName=proSer.selectProductByProNamePriceHigh(proName);
		}
		else if(orderBy.equals("latest")){
			selectProductByName=proSer.selectProductByProNameDataLow(proName);
		}
		else if(orderBy.equals("saleslow")){
			selectProductByName=proSer.selectProductByProNameSalesLow(proName);
		}
		Gson gs=new Gson();
		String json = gs.toJson(selectProductByName);
		response.getWriter().print(json);
	}
	
	/**
	 * 根据类别id获取集合
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void queryProductById(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		int typeid =Integer.parseInt(request.getParameter("typeid"));
		String orderBy=request.getParameter("orderby");
		ArrayList<Product> selectProductByType=null;
		if(orderBy==null){
			selectProductByType = proSer.selectProductByType(typeid);
		}else if(orderBy.equals("pricelow")){
			selectProductByType=proSer.selectProductByTypePriceLow(typeid);
		}
		else if(orderBy.equals("pricehigh")){
			selectProductByType=proSer.selectProductByTypePriceHigh(typeid);
		}
		else if(orderBy.equals("latest")){
			selectProductByType=proSer.selectProductByTypeDataLow(typeid);
		}
		else if(orderBy.equals("saleslow")){
			selectProductByType=proSer.selectProductByTypeSalesLow(typeid);
		}
		Gson gs=new Gson();
		String json = gs.toJson(selectProductByType);
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
