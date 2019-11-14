package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qlgshopping.entity.OrderInfo;
import com.qlgshopping.entity.OrderTable;
import com.qlgshopping.entity.Product;
import com.qlgshopping.entity.ShoppingCart;
import com.qlgshopping.entity.ShoppingCartInfo;
import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.OrderInfoService;
import com.qlgshopping.service.OrderTableService;
import com.qlgshopping.service.ProductService;
import com.qlgshopping.service.ShoppingCartInfoService;
import com.qlgshopping.service.ShoppingCartService;
import com.qlgshopping.utils.ShopingCartInfoCollect;

public class ShoppingCartServlet extends HttpServlet {
	private ShoppingCartService shopSe=new ShoppingCartService();
	private ShoppingCartInfoService shpifSe=new ShoppingCartInfoService();
	private OrderTableService odtableSe=new OrderTableService();
	private OrderInfoService odifSe=new OrderInfoService();
	private ProductService proSe=new ProductService();
	/**
	 * Constructor of the object.
	 */
	public ShoppingCartServlet() {
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
		if(op.equals("lookCart")){
			lookCart(request, response);
		}
		if(op.equals("changepronumber")){
			changeProNumber(request, response);
		}
		if(op.equals("submitcar")){
			submitCar(request, response);
		}
		if(op.equals("addcart")){
			addCarinfo(request, response);
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
		doGet(request, response);
	}
	/**
	 * 添加购物车
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void addCarinfo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo user =(UserInfo)request.getSession().getAttribute("user");
		if(user==null){
			response.getWriter().print("请先登录");
			return;
		}else{
			int proId=Integer.parseInt(request.getParameter("proid"));
			ArrayList<ShoppingCartInfo> selectByshpId = shpifSe.selectByshpId(user.getShoppingCart().getShpId()); 
			for(ShoppingCartInfo sci:selectByshpId){
				if(sci.getProId()==proId){
					response.getWriter().print("购物车已经存在此商品了哦~");
					return;
				}
			}
			ShoppingCartInfo shif=new ShoppingCartInfo();
			Product product = proSe.selectProductByProId(proId);
			if(product.getProStatic().equals("下架")){
				response.getWriter().print("来晚了呦，宝贝已经下架了呢");
				return;
			}
			shif.setProId(proId);
			shif.setShpId(user.getShoppingCart().getShpId());
			shif.setStoId(product.getStoId());
			shif.setProNumber(1);
			shif.setShpifCost(product.getProPrice());
			shpifSe.insertShoppingCartInfo(shif);
			response.getWriter().print("添加成功");
		}
	}
	/**
	 * 将购物车转换成订单
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void submitCar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String[] idStringList = request.getParameterValues("infoid");
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ArrayList<Integer> idList=new ArrayList<>();
		for(String str:idStringList){
			idList.add(Integer.parseInt(str));
		}
		ArrayList<ShoppingCartInfo> infoList=new ArrayList<>();
		for(Integer i:idList){
			ShoppingCartInfo selectByShpifId = shpifSe.selectByShpifId(i);
			infoList.add(selectByShpifId);
		}
		 HashMap<Integer, ArrayList<ShoppingCartInfo>> mapOfInt = ShopingCartInfoCollect.getMapOfInt(infoList);
		 ArrayList<Integer> orderIdList=new ArrayList<>();//盛新生成的订单id
		 for(Integer i:mapOfInt.keySet()){
			 double oderSum=0;
			 OrderTable odtable=new OrderTable();
			 odtable.setStoId(i);
			 odtable.setUserId(user.getUserId());
			 odtable.setOrdPrice(0);
			 odtable.setOrdTime(sdf.format(new Date()));
			 odtable.setOrdStatic("未付款");
			 int orderId = odtableSe.insertOrderTable(odtable);
			 orderIdList.add(orderId);
			 for(ShoppingCartInfo shif:mapOfInt.get(i)){
				 OrderInfo odif=new OrderInfo();
				 odif.setOrdId(orderId);
				 odif.setProId(shif.getProId());
				 odif.setProNumber(shif.getProNumber());
				 odif.setOdifPrice(shif.getShpifCost());
				 odif.setOdifEvaluate(0);
				 odifSe.insertOrderinfo(odif);
				 oderSum+=shif.getShpifCost();
				 shopSe.updateShoppingCartDeleteinfo(shif.getShpId(), shif.getShpifCost());
				 shpifSe.deleteByshpifId(shif.getShpifId());
			 }
			 odtableSe.updateOrderCost(orderId, oderSum);
		 }
		request.setAttribute("oderlist", orderIdList);
		request.getRequestDispatcher("orderTableServlet?op=loadordermany").forward(request, response);
	}
	
	/**
	 * 更改商品数量
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void changeProNumber(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int shpifId =Integer.parseInt(request.getParameter("shpifId"));
		int proNumber=Integer.parseInt(request.getParameter("pronumber"));
		ShoppingCartInfo selectByShpifId = shpifSe.selectByShpifId(shpifId);
		selectByShpifId.setProNumber(proNumber);
		selectByShpifId.setShpifCost(selectByShpifId.getPro().getProPrice()*proNumber);
		shpifSe.updateByProNumberCost(selectByShpifId);
		ShoppingCart selectByShoppingCart = shopSe.selectByShoppingCart(selectByShpifId.getShpId());
		double sum=0;
		for(ShoppingCartInfo shif:selectByShoppingCart.getShoppingCartInfoList()){
			sum+=shif.getShpifCost();
		}
		selectByShoppingCart.setShpPrice(sum);
		shopSe.updateShoppingCart(selectByShoppingCart);
		response.getWriter().print((selectByShpifId.getPro().getProPrice()*proNumber)+";"+sum);
	}
	
	/**
	 * 跳转到用户的购物车页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void lookCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		//用于测试，用户使用id为1的
		/*if(request.getSession().getAttribute("user")==null){
			response.sendRedirect("login.jsp");
			return;
		}
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		user.getShopCID
		*/
		response.setContentType("application/json;charset=utf-8");
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		ShoppingCart selectByUserId = shopSe.selectByUserId(user.getUserId());
		ArrayList<ShoppingCartInfo> selectByshpId = shpifSe.selectByshpId(selectByUserId.getShpId());
		if(selectByshpId.size()==0)
		{
			String str = new Gson().toJson("none");
			response.getWriter().print(str);
			return;
		}
		HashMap<String, ArrayList<ShoppingCartInfo>> map = ShopingCartInfoCollect.getMap(selectByshpId);
		Gson gs=new Gson();
		String json = gs.toJson(map);
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
