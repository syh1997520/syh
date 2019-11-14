package com.qlgshopping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.qlgshopping.entity.Page;
import com.qlgshopping.entity.UserInfo;
import com.qlgshopping.service.ShoppingCartService;
import com.qlgshopping.service.UserInfoService;

public class UserInfoServlet extends HttpServlet {
	UserInfoService infoservice = new UserInfoService();
	/**
	 * Constructor of the object.
	 */
	public UserInfoServlet() {
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
		if(r.equals("login")){
			this.login(request, response);
		}else if(r.equals("queryUser")){
			this.queryUser(request, response);
		}else if(r.equals("modSpeakAble")){
			this.modSpeakAble(request, response);
		}else if(r.equals("modUnSpeakAble")){
			this.modUnSpeakAble(request, response);
		}else if(r.equals("queryUnSpeakAble")){
			this.queryUnSpeakAble(request, response);
		}else if(r.equals("logout")){
			logOut(request, response);
		}
		else if(r.equals("registerloginname")){
			checkLoginName(request, response);
		}
		else if(r.equals("registerusername")){
			checkUserName(request, response);
		}else if(r.equals("register")){
			register(request, response);
		}
		
	}
	/**
	 * 将新用户写入数据库
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo user=new UserInfo();
		user.setUserPassword(request.getParameter("password"));
		user.setUserLoginName(request.getParameter("loginname"));
		user.setUserName(request.getParameter("username"));
		user.setUserGender(request.getParameter("optionsRadiosinline"));
		user.setUserScore(0);
		user.setUserimg("Image/userImage/default.jpg");
		user.setSpeakAble(1);
		int insertUser = infoservice.insertUser(user);
		UserInfo selectUserById = infoservice.selectUserById(insertUser);
		request.getSession().setAttribute("user", selectUserById);
		response.sendRedirect("index.jsp");
	}
	
	/**
	 * 检查昵称是否重复
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userName=request.getParameter("username");
		if(userName.length()<3||userName.length()>10){
			response.getWriter().print("昵称长度不合法");
			return;
		}
		if(infoservice.selectByUsername(userName)!=null){
			response.getWriter().print("昵称已存在，换一个吧");
			return;
		}
		else
			response.getWriter().print("昵称合法");
	}
	
	/**
	 * 检查登录名是否重复
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void checkLoginName(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String loginname=request.getParameter("loginname");
		if(loginname.length()<6||loginname.length()>12){
			response.getWriter().print("用户名不合法（应为6-12位）");
			return;
		}
		if(infoservice.selectByLoginname(loginname)!=null){
			response.getWriter().print("用户名已存在");
			return;
		}
		response.getWriter().print("用户名合法");
	}
	
	/**
	 * 注销
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().removeAttribute("user");
		response.sendRedirect("index.jsp");
	}
	
	public void modSpeakAble(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String struserId=request.getParameter("userId");
		int userId=Integer.parseInt(struserId);
		UserInfo user=infoservice.selectUserById(userId);
		user.setSpeakAble(0);
		if(infoservice.updateUser(user)){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
        response.sendRedirect("administrator_list.jsp");		
		
	}
	
	public void modUnSpeakAble(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String struserId=request.getParameter("userId");
		int userId=Integer.parseInt(struserId);
		UserInfo user=infoservice.selectUserById(userId);
		user.setSpeakAble(1);
		if(infoservice.updateUser(user)){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
        response.sendRedirect("administrator_list.jsp");		
		
	}
	
	public void queryUnSpeakAble(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int currentPage=1;
		int pageSize=5;
		
		String strcurrentPage=request.getParameter("currentPage");
		if(strcurrentPage!=null&&!"".equals(strcurrentPage)){
			currentPage=Integer.parseInt(strcurrentPage);
		}
		System.out.println(currentPage);
		String strpageSize=request.getParameter("pageSize");
		if(strpageSize!=null&&!"".equals(strpageSize)){
			pageSize=Integer.parseInt(strpageSize);
		}
		
		Page<UserInfo> page=infoservice.getPageSpeak(currentPage, pageSize);
		Gson gson=new Gson();
		String gs=gson.toJson(page);
		response.getWriter().println(gs);
	}
	
	
	
	
	public void queryUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int currentPage=1;
		int pageSize=5;
		
		String strcurrentPage=request.getParameter("currentPage");
		if(strcurrentPage!=null&&!"".equals(strcurrentPage)){
			currentPage=Integer.parseInt(strcurrentPage);
		}
		System.out.println(currentPage);
		String strpageSize=request.getParameter("pageSize");
		if(strpageSize!=null&&!"".equals(strpageSize)){
			pageSize=Integer.parseInt(strpageSize);
		}
		
		Page<UserInfo> page=infoservice.getPage(currentPage, pageSize);
		Gson gson=new Gson();
		String gs=gson.toJson(page);
		response.getWriter().println(gs);
	}
	
	
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userLoginname = request.getParameter("username");
		String userpwd = request.getParameter("password");
		HttpSession session = request.getSession();
		UserInfo user = infoservice.selectByUsernamePassword(userLoginname, userpwd);
		
		if(user!=null&&!"".equals(user)){
			session.setAttribute("user", user);
			session.removeAttribute("loginMsg");
			response.sendRedirect("index.jsp");
		}
		else{
			session.setAttribute("loginMsg","用户名或密码输入错误");
			response.sendRedirect("login.jsp");
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
