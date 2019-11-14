package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.UserInfoService;

public class SignupServlet extends HttpServlet {
	
	UserInfoService infoservice = new UserInfoService();
	/**
	 * Constructor of the object.
	 */
	public SignupServlet() {
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
		if(r.equals("signup")){
			this.rigter(request, response);
		}else if(r.equals("checkname")){
			this.checkname(request, response);
		}else if(r.equals("rigter")){
			this.rigter(request,response);
		}
		
	}
	
	public void checkname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name=request.getParameter("name1");
		UserInfo user = infoservice.selectByLoginname(name);
		String msg;
		if(user==null&&"".equals(user)){
			msg="用户名不可为空";
			
		}else{
			msg="用户名可用";
		}
		response.getWriter().println(msg);
			
	}
	public void rigter(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name1");
		String sex=request.getParameter("optionsRadiosinline");
		String pwd1 = request.getParameter("password1");
		String pwd2 = request.getParameter("password2");
		String uname = request.getParameter("userName");
		String phone = request.getParameter("userPhoneNumber");
		
		String img = request.getParameter("userimg");
		
		
		UserInfo user = infoservice.selectByUsernamePassword(name, pwd1);
		
		if(user!=null){
			System.out.println("用户已存在");
		}else{
			user=new UserInfo();
			user.setUserLoginName(name);
			user.setUserPassword(pwd1);
			user.setUserGender("男");
			user.setUserName(uname);
			user.setUserPhoneNumber(phone);
			user.setUserScore(30);
			user.setUserimg(img);
			user.setSpeakAble(33);
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
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
