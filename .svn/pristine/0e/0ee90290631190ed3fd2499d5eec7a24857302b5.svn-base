package com.qlgshopping.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.SecKill;
import com.qlgshopping.service.SecKillService;

/**
 * Servlet implementation class SecKillServlet
 */
@WebServlet("/front/SecKillServlet")
public class SecKillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SecKillService secSe=new SecKillService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecKillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op");
		if(op.equals("queryall")) {
			queryAll(request, response);
		}
		else if(op.equals("gettime")) {
			gettimes(request, response);
		}
		else if(op.equals("buypro")) {
			buyproduct(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/**
	 * 执行购买商品
	 * @param request
	 * @param response
	 */
	private void buyproduct(HttpServletRequest request, HttpServletResponse response) {
		int secid=Integer.parseInt(request.getParameter("secid"));
		int proNumber = this.secSe.getProNumber(secid);
		if(proNumber==0) {
			//跳到未抢到页面
			return;
		}
		synchronized(Object.class) {
			int proNumber2 = this.secSe.getProNumber(secid);
			if(proNumber2==0) {
				//跳到未抢到页面
				return;
			}
			this.secSe.buyOnePro(secid);
			//跳转到成功页面
			return;
		}
	}
	
	/**
	 * 获取服务器时间
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void gettimes(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.getWriter().print(new Date().getTime()); 
		return;
	}
	
	/**
	 * 查询所有的秒杀商品
	 * @param request
	 * @param response
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<SecKill> selectSecList = secSe.selectSecList();
		return;
	}
}
