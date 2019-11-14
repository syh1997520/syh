package com.qlgshopping.service;

import java.util.ArrayList;

import com.qlgshopping.dao.EvaLikeDao;
import com.qlgshopping.dao.EvaluteDao;
import com.qlgshopping.dao.MyHistoryDao;
import com.qlgshopping.dao.OrderTableDao;
import com.qlgshopping.dao.ReceiveAddressDao;
import com.qlgshopping.dao.ShoppingCartDao;
import com.qlgshopping.dao.UserInfoDao;
import com.qlgshopping.entity.EvaLike;
import com.qlgshopping.entity.Evalute;
import com.qlgshopping.entity.MyHistory;
import com.qlgshopping.entity.OrderTable;
import com.qlgshopping.entity.Page;
import com.qlgshopping.entity.ReceiveAddress;
import com.qlgshopping.entity.UserInfo;

public class UserInfoService {
	private EvaluteDao evaDao=new EvaluteDao();
	private OrderTableDao ordTabDao=new OrderTableDao();
	private ReceiveAddressDao recDao=new ReceiveAddressDao();
	private ShoppingCartDao shopCartDao=new ShoppingCartDao();
	private EvaLikeDao evalikeDao=new EvaLikeDao();
	private MyHistoryDao mhDao=new MyHistoryDao();
	private UserInfoDao userDao=new UserInfoDao();
	/**
	 * 分页查询
	 * @return
	 */
	public Page<UserInfo> getPage(int currentPage,int pageSize){
		Page<UserInfo> page=new Page<UserInfo>();
		
		//设置当前页
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		
		//获取总笔数
		int totalRow=(int) userDao.getTableSize();
		page.setTotalRow(totalRow);
		
		//获取第一笔
		int start=(page.getCurrentPage()-1)*page.getPageSize();
		 ArrayList<UserInfo> aList=userDao.selectAllByPage(start, pageSize);
		
		page.setaList(aList);
		
		
		return page;
	}
	
	
	public Page<UserInfo> getPageSpeak(int currentPage,int pageSize){
		Page<UserInfo> page=new Page<UserInfo>();
		
		//设置当前页
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		
		//获取总笔数
		int totalRow=(int) userDao.getTableSizeSpeak();
		page.setTotalRow(totalRow);
		
		//获取第一笔
		int start=(page.getCurrentPage()-1)*page.getPageSize();
		 ArrayList<UserInfo> aList=userDao.selectAllByPageSpeak(start, pageSize);
		
		page.setaList(aList);
		
		
		return page;
	}
	
	
	
	
	public long getTableSizeSpeak(){
	
		return userDao.getTableSizeSpeak();
				
	}
	
	
	
	
	
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public ArrayList<UserInfo> selectAllUser(){
		ArrayList<UserInfo> selectAllUser =new ArrayList<UserInfo>(userDao.selectAllUser());
		for(UserInfo u:selectAllUser){
			this.loadUserForeignData(u);
		}
		return selectAllUser;
	}
	/**
	 * 根据userid查找用户
	 * @param userId
	 * @return
	 */
	public UserInfo selectUserById(int userId){
		UserInfo selectUserById = userDao.selectUserById(userId);
		this.loadUserForeignData(selectUserById);
		return selectUserById;
	}
	/**
	 * 根据用户id删除用户
	 * @param userId
	 * @return
	 */
	public boolean deleteUserById(int userId){
		int deleteUserById = userDao.deleteUserById(userId);
		return deleteUserById>0?true:false;
	}
	/**
	 * 新增用户(返回新插入的id)
	 * @param user
	 * @return
	 */
	public int insertUser(UserInfo user){
		int insertUser = userDao.insertUser(user);
		shopCartDao.insertNewCart(insertUser);
		return insertUser;
	}
	/**
	 * 用户信息更新
	 * @param user
	 * @return
	 */
	public boolean updateUser(UserInfo user){
		int updateUser = userDao.updateUser(user);
		return updateUser>0?true:false;
	}
	/**
	 * 根据登录名查找用户
	 * @param userLoginName
	 * @return
	 */
	public UserInfo selectByLoginname(String userLoginName){
		UserInfo selectByLoginname = userDao.selectByLoginname(userLoginName);
		this.loadUserForeignData(selectByLoginname);
		return selectByLoginname;
	} 
	/**
	 * 根据用户名和密码查找用户
	 * @param userName
	 * @param userPassword
	 * @return
	 */
     public UserInfo selectByUsernamePassword(String userName,String userPassword){
		UserInfo selectByUsernamePassword = userDao.selectByUsernamePassword(userName, userPassword);
		
		this.loadUserForeignData(selectByUsernamePassword);
	
		return selectByUsernamePassword;
	}
     /**
      * 根据用户名查找用户
      * @param userName
      * @return
      */
     public UserInfo selectByUsername(String userName){
		UserInfo selectByUsername = userDao.selectByUsername(userName);
		this.loadUserForeignData(selectByUsername);
		return selectByUsername;
	}
     /**
      * 查找所有被禁言的用户
      * @param speakAble
      * @return
      */
     public ArrayList<UserInfo> selectAllByspeakAble(int speakAble){
     	ArrayList<UserInfo> selectAllByspeakAble =new ArrayList<UserInfo>(userDao.selectAllByspeakAble(speakAble));
     	for(UserInfo u:selectAllByspeakAble){
     		this.loadUserForeignData(u);
     	}
     	return selectAllByspeakAble;
     }
/**
 * 给user对象的外键添加数据	
 * @param user
 */
private void loadUserForeignData(UserInfo user){
	if(user==null)
		return;
	int userId=user.getUserId();
	user.setEvaluteList(new ArrayList<Evalute>(evaDao.selectAllByuserId(userId)));
	user.setOrderTableList(new ArrayList<OrderTable>(ordTabDao.selectByUserId(userId)));
	user.setReceiveAddress(new ArrayList<ReceiveAddress>(recDao.selectByUserId(userId)));
	user.setShoppingCart(shopCartDao.selectByUserId(userId));
	user.setLikeList(new ArrayList<EvaLike>(evalikeDao.selectEvaLikeByLikeFrom(userId)));
	user.setHistoryList(new ArrayList<MyHistory>(mhDao.selectByHisFromId(userId)));
}


}
