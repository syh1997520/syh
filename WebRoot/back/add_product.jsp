<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>添加产品</title>
</head>

<body>
<form class="form-horizontal" role="form" action="shopServlet?op=add" method="post">

  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品名称</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="lastname" name="proName" placeholder=""/>
      <label id="pro"><%=request.getAttribute("pro")==null?"":request.getAttribute("pro") %></label>
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品数量</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="lastname" placeholder="" name="proNumber">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品现价</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="lastname" placeholder="" name="proPrice">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品类型</label>
    <div class="col-sm-5">
       <select class="form-control"  name="proType">
      <option value = "23">饮料</option>
      <option value = "24">手机</option>
      <option value = "25">电脑</option>
      <option value = "26">牙刷</option>
      <option value = "27">水乳套装</option>
      <option value = "22">面包</option>
      <option value = "21">口红</option>
      <option value = "20">眼影</option>
      <option value = "18">电饭煲</option>
      <option value = "17">洗衣机</option>
      <option value = "16">电视机</option>
      <option value = "15">裤子</option>
      <option value = "14">上衣</option>
      <option value = "28">牙膏</option>
      
    </select>
    </div>
  </div>
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品销售数量</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="lastname" placeholder="" name="proSalesNumber">
    </div>
  </div>
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品简介</label>
    <div class="col-sm-6">
    <textarea class="form-control" rows="3" name="proMessage"></textarea>
    </div>
  </div>
  
  <div class="form-group">
<label for="proGroundDate" class="col-sm-2 control-label">生产日期：</label>
<div class="col-sm-4">
		<input class="inline laydate-icon "  name="proGroundDate" value="2019-05-14" id="start" type="text"  style=" margin-right:10px; height:auto; float:left; width:150px;" />
					</div>
						</div>
 
   <div class="form-group">
     <label class="label_name col-xs-1"><i>*</i>产品图片：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11" id="Upload">
     <div class="images_Upload clearfix margin-bottom" id="images_Upload">
      <span class="Upload_img"><input name="" type="file" /></span>
      <a href="javascript:ovid()" class="operating delete_Upload" onclick="delete_Upload(this.id)"><i class="fa fa-remove"></i></a>
      <a href="javascript:ovid()" class="operating" title="预览" onclick="preview_img(this.id)"><i class="fa  fa-image"></i></a>
    </div>
    <button type="button" class="add_Upload bg-deep-blue" id="add_Upload" onclick="add_Upload()"><i class="fa  fa-plus"></i></button>
     </div>
     </div>
     
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">品牌</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="lastname" placeholder="" name="proBrand">
    </div>
  </div>
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">产品状态</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="lastname" placeholder="" name="proStatic">
    </div>
  </div>
  
  

 
    <div class="form-group">
													<div class="col-sm-offset-2 col-sm-4">
														<button type="submit" class="btn btn-success">添加</button>
														<button type="reset" class="btn btn-warning">取消</button>
													</div>
													
												</div>
</form>
</body>
</html>
   <!--复文本编辑框-->
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="js/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script>
$(function(){
 var ue = UE.getEditor('editor');
});
$(document).ready(function(){
    var spotMax = 8;
  if($('div.images_Upload').size() >= spotMax) {$(obj).hide();}
  $("#add_Upload").on('click',function(){ 
       var cid =$('.images_Upload').each(function(i){ $(this).attr('id',"Uimages_Upload_"+i)});
       addSpot(this, spotMax, cid);
  });
});
function addSpot(obj, sm ,sid) {
	  $("#Upload").append("<div class='images_Upload clearfix margin-bottom' id='"+sid+"'>"+
	  "<span class='Upload_img'><input name='' type='file' /></span>"+
	  "<a href='javascript:ovid()' class='operating delete_Upload'><i class='fa fa-remove'></i></a>"+
	  "<a href='javascript:ovid()' class='operating' onclick='preview_img(this.id)'><i class='fa  fa-image'></i></a>"+
	  "</div>&nbsp;")  
	.find(".delete_Upload").click(function(){
		if($('div.images_Upload').size()==1){
			layer.msg('请至少保留一张图片!',{icon:0,time:1000});			
			}
			else{
				 $(this).parent().remove();
                 $('#add_Upload').show();
				} 				
				
  });
  if($('.delete_Upload').size() >= sm) {$(obj).hide();layer.msg('当前为最大图片添加量!',{icon:0,time:1000});}}
 /*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Date_selection ').css('display','block');
		}
	else{
		
		 $('.Date_selection').css('display','none');
		}	
	});
function add_category(){
	 $(".add_category_style").toggle();
	
	}
  /******时间设置*******/
  var start = {
    elem: '#start',
    format: 'YYYY/MM/DD hh:mm:ss',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16 23:59:59', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY/MM/DD hh:mm:ss',
    min: laydate.now(),
    max: '2099-06-16 23:59:59',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
/*********滚动事件*********/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
</script>
