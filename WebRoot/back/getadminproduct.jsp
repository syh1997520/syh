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
<title>物流管理</title>
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
											<form action="adminServlet" class="form-horizontal" role="form" style="margin-top:30px" >
												<!-- 类别ID -->
												<input type="hidden" name="op" value="mod">	
												<input type="hidden" name="proId" value="${product.proId}">
												<div class="form-group">
													<label for="proId" class="col-sm-2 control-label">产品名称：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="proName" name="proName" value="${product.proName }"  placeholder="请输入产品类型">
													</div>
													<label id="msg"></label>
												</div>
												<script>
												
												$(function(){
												$("#proName").blur(function(){
												$.get("shopServlet",{"op":"checkProName"},function(data,status,xhr){
												console.log(data);
												$("#msg").html(data);
												
												});
												
												});
												});
												
												$(function(){
												$("#seach").click(function(){
												
												});
												
												});
												
												
												</script>
												
												<!-- 类别名称 -->
												<div class="form-group">
													<label for="proType" class="col-sm-2 control-label">产品类型：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="proType" name="proType" value="${product.proType }"
															   placeholder="请选择产品类型">
													</div>
												</div>
												
												<div class="form-group">
													<label for="proPrice" class="col-sm-2 control-label">产品价格：</label>
													<div class="col-sm-4">
														<input type="number" class="form-control" id="proPrice" name="proPrice" value="${product.proPrice }"
															   placeholder="请输入价格名称">
													</div>
												</div>
												
												<div class="form-group">
													<label for="proNumber" class="col-sm-2 control-label">产品数量：</label>
													<div class="col-sm-4">
														<input type="number" class="form-control" id="proNumber" name="proNumber" value="${product.proNumber }"
															   placeholder="请输入数量">
													</div>
												</div>
												
												
												<div class="form-group">
													<label for="proMessage" class="col-sm-2 control-label">产品介绍：</label>
													<div class="col-sm-4">
														<input type="textarea" class="form-control" id="proMessage" name="proMessage" value="${product.proMessage }"
															placeholder="产品介绍"   >
													</div>
												</div>
												
												<div class="form-group">
													<label for="proStatic" class="col-sm-2 control-label">产品状态：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="proStatic" name="proStatic" value="${product.proStatic }"
															   placeholder="产品状态">
													</div>
												</div>
												
												
												
												<div class="form-group">
													<label for="proGroundDate" class="col-sm-2 control-label">生产日期：</label>
													<div class="col-sm-4">
														<input class="inline laydate-icon "  name="proGroundDate" value="${product.proGroundDate}" id="start" type="text"  style=" margin-right:10px; height:auto; float:left; width:150px;" />
													</div>
												</div>
												
												
												<div class="form-group">
													<label for="proSalesNumber" class="col-sm-2 control-label">产品销量：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="proSalesNumber" name="proSalesNumber" value="${product.proSalesNumber }"
															   readonly>
													</div>
												</div>
												
												<div class="form-group">
													<label for="proImg" class="col-sm-2 control-label">产品图片：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="proImg" name="proImg" value="${product.proImg }"
															   placeholder="上传图片">
													</div>
												</div>
												<div class="form-group">
													<label for="proBrand" class="col-sm-2 control-label">品牌：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id="proBrand" name="proBrand" value="${product.proBrand }"
															   placeholder="请输入品牌名称">
													</div>
												</div>
												
												
												
												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-4">
														<button type="submit" class="btn btn-success">修改</button>
														<button type="reset" class="btn btn-warning">取消</button>
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
