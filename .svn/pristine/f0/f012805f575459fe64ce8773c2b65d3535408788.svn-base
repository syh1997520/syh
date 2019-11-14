package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.OrderInfo;
import com.qlgshopping.entity.OrderTable;
import com.qlgshopping.service.OrderInfoService;
import com.qlgshopping.service.OrderTableService;
import com.qlgshopping.service.ProductService;

public class PayOrderServlet extends HttpServlet {
	private OrderTableService odSe=new OrderTableService();
	private ProductService proSe=new ProductService();
	/**
	 * Constructor of the object.
	 */
	public PayOrderServlet() {
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
		ArrayList<OrderTable> orderList=(ArrayList<OrderTable>)request.getSession().getAttribute("orderList");
		SimpleDateFormat idf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int addId=(Integer)request.getSession().getAttribute("addid");
		for(OrderTable od:orderList){
			odSe.payOrdId(od.getOrdId(), idf.format(new Date()), addId);
			for(OrderInfo odif:od.getOdifList()){
				proSe.buyProduct(odif.getProId(), odif.getProNumber());
			}
		}
		request.getSession().removeAttribute("addid");
		request.getSession().removeAttribute("orderList");
		response.sendRedirect("order.jsp");
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
