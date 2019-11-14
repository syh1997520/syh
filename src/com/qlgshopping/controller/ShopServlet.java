package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qlgshopping.entity.OrderTable;
import com.qlgshopping.entity.Page;
import com.qlgshopping.entity.Type;
import com.qlgshopping.entity.Product;
import com.qlgshopping.service.OrderTableService;
import com.qlgshopping.service.ProductService;
import com.qlgshopping.service.TypeService;

public class ShopServlet extends HttpServlet {
  ProductService pSer=new ProductService();
  OrderTableService oSer=new OrderTableService();
  TypeService tSer=new TypeService();
  
	/**
	 * Constructor of the object.
	 */
	public ShopServlet() {
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
                  }
                  
                  else if(op.equals("del")){
                	  this.del(request, response);
                  }else if(op.equals("queryOrd")){
                	  this.queryOrd(request, response);
                  }else if(op.equals("delOrd")){
                	  this.delOrd(request, response);
                  }else if(op.equals("queryOne")){
                	  this.queryOne(request, response);
                  }else if(op.equals("checkProName")){
                	  this.checkProName(request, response);
                  }else if(op.equals("mod")){
                	  this.mod(request, response);
                  }else if(op.equals("getOrd")){
                	  this.getOrd(request, response);
                  }else if(op.equals("queryAll")){
                	  this.queryAll(request, response);
                  }else if(op.equals("queryAllOrd")){
                	  this.queryAllOrd(request, response);
                  }else if(op.equals("loadType")){
                	  this.loadType(request, response);
                  }
                  else if(op.equals("reup")){
                	  reupLoad(request, response);
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
	 * 将商品上架
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void reupLoad(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int proid=Integer.parseInt(request.getParameter("proId"));
		pSer.productUpload(proid);
		response.sendRedirect("shopproduct.jsp");
	}
	
	public void loadType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Type> typeList=tSer.selectAllType();
		request.setAttribute("typeList", typeList);
		System.out.println("1111111");
		request.getRequestDispatcher("getshopproduct.jsp").forward(request, response);
		
	}
	
	public void queryAllOrd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int currentPage=1;
		int pageSize=5;
		
		String strcurrentPage=request.getParameter("currentPage");
		if(strcurrentPage!=null&&!"".equals(strcurrentPage)){
			currentPage=Integer.parseInt(strcurrentPage);
		}
		String strpageSize=request.getParameter("pageSize");
		if(strpageSize!=null&&!"".equals(strpageSize)){
			pageSize=Integer.parseInt(strpageSize);
		}
		
		Page<OrderTable> page=oSer.getPageA(currentPage, pageSize);
		Gson gson=new Gson();
		String gs=gson.toJson(page);
		response.getWriter().println(gs);
		
	}
	
	
	
	public void queryAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int currentPage=1;
		int pageSize=5;
		String strcurrentPage=request.getParameter("currentPage");
		
	
		if(strcurrentPage!=null&&!"".equals(strcurrentPage)){
			currentPage=Integer.parseInt(strcurrentPage);
		}
		String strpageSize=request.getParameter("pageSize");
		
		if(strpageSize!=null&&!"".equals(strpageSize)){
			pageSize=Integer.parseInt(strpageSize);
		}
		Page<Product> page=pSer.getPageA(currentPage, pageSize);
		
		
		Gson gson=new Gson();
		String gs=gson.toJson(page);
		response.getWriter().println(gs);
		
		
	}

	
	public void getOrd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strordId=request.getParameter("ordId");
		int ordId=Integer.parseInt(strordId);
		OrderTable orderTable=oSer.selectByOrderId(ordId);
		request.setAttribute("order", orderTable);
		
		request.getRequestDispatcher("getordertable.jsp").forward(request, response);
		
	}
	
	
	public void checkProName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String proName=request.getParameter("proName");
		
		String msg="";
		if(proName==null || "".equals(proName)){
		msg="商品名不能为空";
		}
		
		response.getWriter().println(msg);
		
		
		
	}
	
	public void mod(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product product=new Product();
		String proName=request.getParameter("proName");
		if(proName==null&&"".equals(proName)){
			return;
		}
		
		
		//String strproType=request.getParameter("proType");
		
		//Type type=tSer.selectBytypeName(strproType);
		//int typeId=type.getTypeId();
		
		String strproPrice=request.getParameter("proPrice");
		
		double proPrice=0;
		
		if(strproPrice==null&&"".equals(strproPrice)){
			proPrice=0;
		}else{
			proPrice=Double.parseDouble(strproPrice);
		}
		
		String strproNumber=request.getParameter("proNumber");
		int proNumber=0;
		if(strproNumber!=null&&!"".equals(strproNumber)){
			proNumber=Integer.parseInt(strproNumber);
		}
		String proMessage=request.getParameter("proMessage");
		String proStatic=request.getParameter("proStatic");
		String proGroundDate=request.getParameter("proGroundDate");
		int proSalesNumber=0;
		String proImg=request.getParameter("proImg");
		String proBrand=request.getParameter("proBrand");
		String strproId=request.getParameter("proId");
		int proId=Integer.parseInt(strproId);
	
		product.setProId(proId);
		System.out.println();
		product.setProName(proName);
		product.setProType(15);
		product.setProPrice(proPrice);
		product.setProNumber(proNumber);
		product.setProMessage(proMessage);
		product.setProStatic(proStatic);
		product.setProGroundDate(proGroundDate);
		product.setProSalesNumber(proSalesNumber);
		product.setProImg(proImg);
		product.setProBrand(proBrand);
		product.setStoId(2);
		
		if(pSer.updateProduct(product)){
			System.out.println("成功");
		}else{
			System.out.println("失败");
		}
		
		response.sendRedirect("shopproduct.jsp");
		
	}
	
	
	
	public void queryOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String proName=request.getParameter("proName");
		
		
	Product product=pSer.selectProductByProNameStoId(proName, 2);
	String typeName=tSer.selectBytypeId(product.getProType()).getTypeName();
	
	request.setAttribute("typeName", typeName);
	request.setAttribute("product", product);
	
	request.getRequestDispatcher("getshopproduct.jsp").forward(request, response);
				
		
		
	}
	
	
	
	public void delOrd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ordId=0;
		String strOrdId=request.getParameter("ordId");
		if(strOrdId!=null&&!"".equals("strOrdId")){
			ordId=Integer.parseInt(strOrdId);
		}
		if(oSer.deleteOrderTable(ordId)){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败");
		}
		this.queryOrd(request, response);
		
	}
	
	
	
	public void queryOrd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int currentPage=1;
		int pageSize=5;
		int stoId=2;
		String strcurrentPage=request.getParameter("currentPage");
		if(strcurrentPage!=null&&!"".equals(strcurrentPage)){
			currentPage=Integer.parseInt(strcurrentPage);
		}
		String strpageSize=request.getParameter("pageSize");
		if(strpageSize!=null&&!"".equals(strpageSize)){
			pageSize=Integer.parseInt(strpageSize);
		}
		
		Page<OrderTable> page=oSer.getPage(stoId, currentPage, pageSize);
		Gson gson=new Gson();
		String gs=gson.toJson(page);
		response.getWriter().println(gs);
		
	}
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("zhix");
		ArrayList<Product> pro = new ArrayList<Product>();
		
		String proName = request.getParameter("proName");
		pro = pSer.selectProductByProNamePriceHigh(proName);
		
		if(pro!=null&&pro.size()!=0){
			request.setAttribute("pro", "新增名重复了");
			request.getRequestDispatcher("add_product.jsp").forward(request, response);
			return;
		}
		
		int proNumber = Integer.parseInt(request.getParameter("proNumber"));
		
		int proType = Integer.parseInt(request.getParameter("proType"));
		
		
		int proPrice = Integer.parseInt(request.getParameter("proPrice"));
		
		String proMessage = request.getParameter("proMessage");
		String proStatic = request.getParameter("proStatic");
		System.out.println("v"+proStatic);
		String proGroundDate = request.getParameter("proGroundDate");
		int proSalesNumber = Integer.parseInt(request.getParameter("proSalesNumber"));
		String proBrand = request.getParameter("proBrand");
		
		System.out.println("proName="+proName);
		System.out.println("proNumber="+proNumber);
		System.out.println("proType="+proType);
	
		Product pros = new Product();
		pros.setStoId(2);
		pros.setProName(proName);
		pros.setProNumber(proNumber);
		pros.setProType(proType);
		pros.setProPrice(proPrice);
		pros.setProMessage(proMessage);
		pros.setProStatic(proStatic);
		pros.setProGroundDate(proGroundDate);
		pros.setProSalesNumber(proSalesNumber);
		pros.setProBrand(proBrand);
	
		
		System.out.println(pros);
		
		if(pSer.insertProduct(pros)){
			System.out.println("新增成功");
			
		}else{
			System.out.println("新增失败");
			
		}
		response.sendRedirect("shopproduct.jsp");
		request.setAttribute("pros", pros);
		this.query(request, response);
		
	}
	
	
	
	public void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int proId=0;
		String msg="";
		String strproId=request.getParameter("proId");
		
		
		if(strproId!=null&&!"".equals(strproId)){
			proId=Integer.parseInt(strproId);
		}
		Product product=pSer.selectProductByProId(proId);
		product.setProStatic("下架");
		pSer.updateProduct(product);
		response.sendRedirect("shopproduct.jsp");
		
	}
	
	
	
	public void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//获取当前页
		int stoId=Integer.parseInt(request.getParameter("stoId"));
		System.out.println(stoId);
		int currentPage=1;
		int pageSize=8;
		String strcurrentPage=request.getParameter("currentPage");
		
	
		if(strcurrentPage!=null&&!"".equals(strcurrentPage)){
			currentPage=Integer.parseInt(strcurrentPage);
		}
		String strpageSize=request.getParameter("pageSize");
		
		if(strpageSize!=null&&!"".equals(strpageSize)){
			pageSize=Integer.parseInt(strpageSize);
		}
		
		Page<Product> page=pSer.getPage(stoId,currentPage, pageSize);
		
		
		Gson gson=new Gson();
		String gs=gson.toJson(page);
		response.getWriter().println(gs);
		
		
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
