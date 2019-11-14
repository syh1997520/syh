<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css" rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script> 
<title>店铺管理</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script type="text/javascript" src="js/PIE/PIE_IE678.js"></script>
 <![endif]-->
<body>
 <div class="Sellerber" id="Sellerber">
 <!--顶部-->
  <div class="Sellerber_header apex clearfix" id="Sellerber_header">
   <div class="l_f logo"><img src="images/logo_03.png" /></div>
   <div class="r_f Columns_top clearfix">
   <!--<div class="time_style"><i class="fa  fa-clock-o"></i><span id="time"></span></div>-->
   <div class="news l_f"><a href="#" class="fa  fa-bell "></a><em>5</em></div>
     <div class="administrator l_f">
       <img src="images/avatar.png"  width="36px"/><span class="user-info">欢迎你,超级管理员</span><i class="glyph-icon fa  fa-caret-down"></i>
       <ul class="dropdown-menu">
        <li><a href="#"><i class="fa fa-user"></i>个人信息</a></li>
        <li><a href="#"><i class="fa fa-cog"></i>系统设置</a></li>
        <li><a href="javascript:void(0)" id="Exit_system"><i class="fa fa-user-times"></i>退出</a></li>
       </ul>
     </div>
   </div>
  </div>
<!--左侧-->
  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
    <div class="menu_style" id="menu_style">
    <div class="list_content">
    <div class="skin_select">
      <ul class="dropdown-menu dropdown-caret">
         <li><a class="colorpick-btn selected" href="javascript:ovid()"data-val="default"  id="default" style="background-color:#222A2D" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="blue" style="background-color:#438EB9;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="green" style="background-color:#72B63F;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="blue" style="background-color:#D0D0D0;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:ovid()" data-val="blue" style="background-color:#FF6868;" ></a></li>
        </ul>     
     </div>
     <div class="search_style">
        <form action="#" method="get" class="sidebar_form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control">
                        <span class="input-group-btn">
                            <a class="btn_flat" href="javascript:" onclick=""><i class="fa fa-search"></i></a>
                        </span>
                    </div>
                </form>
     </div>     
    <dl class="nav nav-list" id="menu_list">
     <dt class="shop_index nav_link " ><a href="javascript:void(0)" name="index.html" class="iframeurl" title=""><i class="fa fa-home"></i><span class="menu-text">商城首页</span></a></dt>
     <dd class="submenu" style="height:0px; border:0px;"></dd>
     <dt class="nav_link ">
     <a href="javascript:void(0)" class="dropdown-toggle title_nav"><i class="fa fa-desktop"></i><span class="menu-text"> 商品管理 </span><b class="arrow fa fa-angle-down"></b></a>
     </dt>
     <dd class="submenu">
       <ul>
         <li class="home"><a href="javascript:void(0)" name="Products.html" title="产品类表" class="iframeurl"><i class="fa fa-angle-double-right"></i>产品管理</a></li>
        
         </ul>
         </dd>
 
      <dt class="nav_link"><a href="javascript:void(0)" class="dropdown-toggle title_nav"><i class="fa  fa-th-list"></i><span class="menu-text"> 店铺管理 </span><b class="arrow fa fa-angle-down"></b></a></dt>
    <dd class="submenu">
     <ul>
       <li class="home"><a href="javascript:void(0)" name="Store.html" title="店铺列表" class="iframeurl"><i class="fa fa-angle-double-right"></i>店铺列表</a></li>
       
       </ul>
      </dd>
      
      
        <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-user"></i><span class="menu-text"> 审核模块</span><b class="arrow fa fa-angle-down"></b></a></dt>
    <dd class="submenu">
     <ul>
       <li class="home"><a href="javascript:void(0)" name="admin_Competence1.html" title="评论审核" class="iframeurl"><i class="fa fa-angle-double-right"></i>评论审核</a></li>
       <li class="home"><a href="javascript:void(0)" name="admin_Competence2.html" title="店铺审核 " class="iframeurl"><i class="fa fa-angle-double-right"></i>店铺审核 </a></li>
       <li class="home"><a href="javascript:void(0)" name="admin_Competence3.html" title="禁言管理" class="iframeurl"><i class="fa fa-angle-double-right"></i>禁言管理</a></li>
       </ul>
      </dd>
      
       <dt class="nav_link"><a href="#" class="dropdown-toggle title_nav"><i class="fa fa-users"></i><span class="menu-text">用户管理</span><b class="arrow fa fa-angle-down"></b></a></dt>
    <dd class="submenu">
     <ul>
       <li class="home"><a href="javascript:void(0)" name="member_list.html" title="普通用户" class="iframeurl"><i class="fa fa-angle-double-right"></i>普通用户</a></li>
       <li class="home"><a href="javascript:void(0)" name="admin_Competence.html" title="商家" class="iframeurl"><i class="fa fa-angle-double-right"></i>商家</a></li>
       
       </ul>
      </dd>
     
    </dl>  
    </div>
  </div>
 </div>
<!--内容-->
  <div class="Sellerber_content" id="contents">
    <div class="breadcrumbs" id="breadcrumbs">
       <a id="js-tabNav-prev" class="radius btn-default left_roll" href="javascript:;"><i class="fa fa-backward"></i></a>
       <div class="breadcrumb_style clearfix">
	  <ul class="breadcrumb clearfix" id="min_title_list">
        <li class="active home"><span title="我的桌面" data-href="index.html"><i class="fa fa-home home-icon"></i>首页</span></li>
      </ul>
      </div>
       <a id="js-tabNav-next" class="radius btn-default right_roll" href="javascript:;"><i class="fa fa-forward"></i></a>
       <div class="btn-group radius roll-right">
                    <a class="dropdown tabClose" data-toggle="dropdown" aria-expanded="false">
                        页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
                        <li><a class="tabReload" href="javascript:void();">刷新当前</a></li>
                        <li><a class="tabCloseCurrent" href="javascript:void();">关闭当前</a></li>
                        <li><a class="tabCloseAll" href="javascript:void();">全部关闭</a></li>
                        <li><a class="tabCloseOther" href="javascript:void();">除此之外全部关闭</a></li>
                    </ul>
                </div>
                <a href="javascript:void()" class="radius roll-right fullscreen"><i class="fa fa-arrows-alt"></i></a>
    </div>
  <!--具体内容-->  
  <div class="table-responsive" style="margin-left:500px">
											<form action="" class="form-horizontal" role="form" style="margin-top:30px" >
												
												<!-- 不需要让用户看到，又要带上值
													隐藏域
												 -->
												<input type="hidden" value="mod" name="op" />
												
												
												
												
												
												<!-- 类别名称 -->
												<div class="form-group">
													<label for="typename" class="col-sm-2 control-label">请输入产品名称：</label><br/>
													<div class="col-sm-1">
														<input type="text" class="form-control" id="typename" name="typename" value=""
															   placeholder="请输入产品名称" style="width:500px;height:50px">
													</div>
												</div><br/><br/><br/>
												
												
												
												<div class="form-group">
													<label for="typename" class="col-sm-2 control-label">请输入产品现价：</label><br/>
													<div class="col-sm-1">
														<input type="text" class="form-control" id="typename" name="typename" value=""
															   placeholder="请输入产品现价" style="width:500px;height:50px">
													</div>
												</div><br/><br/><br/>
												
												
												
												<div class="form-group">
													<label for="typename" class="col-sm-2 control-label">请输入产品分类：</label><br/>
													<div class="col-sm-1">
														<input type="text" class="form-control" id="typename" name="typename" value=""
															   placeholder="请输入产品分类" style="width:500px;height:50px">
													</div>
												</div><br/><br/><br/>
												
												<div class="form-group">
													<label for="typename" class="col-sm-2 control-label">请输入产品剩余数量：</label><br/>
													<div class="col-sm-1">
														<input type="text" class="form-control" id="typename" name="typename" value=""
															   placeholder="请输入产品剩余数量" style="width:500px;height:50px">
														
														<span id ="modMsg"><%=request.getAttribute("modMsg")==null?"":request.getAttribute("modMsg") %></span>
													</div>
												</div><br/><br/><br/>
												
												
												
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-4">
														<button type="button" class="btn btn-info" style="width:100px;height:50px;font-size:25px">修改</button>
														<button type="button" class="btn btn-default" style="width:100px;height:50px;margin-left:100px" >取消</button>

													</div>
													
												</div>
											</form>
											
											
										</div>
<!--底部-->
  <div class="Sellerber_bottom info" id="bottom">
  <span class="l_f">版权所有：南京思美软件系统有限公司</span>
  </div>
 </div>
</body>
</html>
<script>
//设置框架
 $(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		header:70,//顶部高度
		bottom:30,//底部高度
		menu:200,//菜单栏宽度
		Sellerber_menu:'.list_content',
		Sellerber_header:'.Sellerber_header',
	});
});
//时间设置
  function currentTime(){ 
   var weekday=new Array(7)
	weekday[0]="星期一"
	weekday[1]="星期二"
	weekday[2]="星期三"
	weekday[3]="星期四"
	weekday[4]="星期五"
	weekday[5]="星期六"
	weekday[6]="星期日"	
    var d=new Date(),str='';	
    str+=d.getFullYear()+'年'; 
    str+=d.getMonth() + 1+'月'; 
    str+=d.getDate()+'日'; 
    str+=d.getHours()+'时'; 
    str+=d.getMinutes()+'分'; 
    str+= d.getSeconds()+'秒'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	str+=weekday[d.getDay()-1]; 
    return str; 
} 
setInterval(function(){$('#time').html(currentTime)},1000); 
$('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="login.html";
        
    });
});
</script>
<script type="text/javascript">
$("#menu_style").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
}); 
</script>

