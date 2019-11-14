<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>修改订单</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin order_style" id="page_style">
   
<div class="operation clearfix">




</div>
	
	
	<div class="table-responsive">
											<form action="shopServlet" class="form-horizontal" role="form" style="margin-top:30px" >
												<!-- 类别ID -->
												<input type="hidden" name="op" value="modOrd">	
			
												<div class="form-group">
													<label for="odrId" class="col-sm-2 control-label">订单编号：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="odrId" name="odrId" value="${order.ordId }"  readonly>
													</div>
													
												</div>
												
												
												<!-- 类别名称 -->
												<div class="form-group">
													<label for="" class="col-sm-2 control-label">用户名：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="userId" name="userId" value="${order.userId }"
															   readonly>
													</div>
												</div>
												
												<div class="form-group">
													<label for="ordPrice" class="col-sm-2 control-label">成交价：</label>
													<div class="col-sm-4">
														<input type="number" class="form-control" id="ordPrice" name="ordPrice" value="${order.ordPrice }"
															   readonly>
													</div>
												</div>
												
												<div class="form-group">
													<label for="ordTime" class="col-sm-2 control-label">下单日期：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="ordTime" name="ordTime" value="${order.ordTime }"
															   readonly>
													</div>
												</div>
												
												
												<div class="form-group">
													<label for="payTime" class="col-sm-2 control-label">支付日期：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="payTime" name="payTime" value="${order.payTime }"
															   readonly>
													</div>
												</div>
												
												<div class="form-group">
													<label for="ordStatic" class="col-sm-2 control-label">订单状态：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="ordStatic" name="ordStatic" value="${order.ordStatic }"
															readonly   >
													</div>
												</div>
												
												
												
												
												<div class="form-group">
													<label for="ordAddress" class="col-sm-2 control-label">地址：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="ordStatic" name="ordAddress" value="${order.ordAddress }"
															  >
													</div>
												</div>
												
												

												

									
												
												
												
											
											</form>
											
											
										</div>
	
	
	
	
	

 
 <script>
 /*时间*/
	laydate({
    elem: '#start',
    event: 'focus' 
});
 
 </script>   
</div>
<!--发货-->

</body>
</html>
