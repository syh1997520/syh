<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>产品列表</title>
</head>

<body>
<div class="margin" id="page_style">
<div class="operation clearfix">
<button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>


<div class="search  clearfix">
 <label class="label_name">商品搜索：</label><input name="" type="text"  class="form-control col-xs-6"/><button class="btn button_btn bg-deep-blue " onclick=""  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>

</div>
</div>
<!--列表展示-->
<div class="list_Exhibition margin-sx">
 <table class="table table_list table_striped table-bordered" id="sample-table">
  <thead>
  <tr>
  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
   <th width="100">店铺编号</th>
   <th>店铺名称</th>
   <th >交易次数</th>
   <th >店铺积分</th>
   <th>店铺类别</th>
   <th >店铺电话</th>
   <th >店铺地址</th>
   <th>状态</th>
    <th>操作</th>
 
   </tr>   
  </thead>
  
  <script type="text/javascript">
//页面加载，到servlet中获取数据
	$(function(){
		
		
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
			});
		});
		
		$.get("adminServlet?op=querySto",function(data,status,xhr){
			//AJAX数据处理
			getPageData(data,status,xhr);
			
		});
	
	});
  
	//上一页事件
	$(function(){
		
		$(document).on("click","#aprivPage",function(){
			
			var privPage = parseInt($("#ulpage li.active a").html())-1;
			if(privPage<=0){
				privPage=1;
			}
			
			
			var param ={"currentPage":privPage,"pageSize":$("#pageSize").val()};
			$.get("adminServlet?op=querySto",param,function(data,status,xhr){
				//AJAX数据处理
				getPageData(data,status,xhr);
				
			});
			
			
		});
		
		
	});
	
	
	//下一页事件
	$(function(){
		
		$(document).on("click","#anextPage",function(){
			
			var nextPage = parseInt($("#ulpage li.active a").html())+1;
			if(nextPage>$("#allPage").val()){
				nextPage=$("#allPage").val();
			}
			
			var param ={"currentPage":nextPage,"pageSize":$("#pageSize").val()};
			$.get("adminServlet?op=querySto",param,function(data,status,xhr){
				//AJAX数据处理
				getPageData(data,status,xhr);
				
			});
			
			
		});
		
		
	});
	
	//当前页
	$(function(){
		
		$(document).on("click","#acurrentPage",function(){
			
			var param ={"currentPage":$(this).html(),"pageSize":$("#pageSize").val()};
			
			$.get("adminServlet?op=querySto",param,function(data,status,xhr){
				//AJAX数据处理
				getPageData(data,status,xhr);
				
			});
			
			
		});
		
		
	});
	
	//下拉列表事件
	$(function(){
		
		$("#del").click(function(){
			
			window.location.href="shopServlet?op=del&proId="+$(this);
			
		});
		
		
		$(document).on("change","#pageSize",function(){
			$("#ulPage").empty();
			$("#ulpage li.active a").html(1);
			var param ={"currentPage":$("#ulpage li.active a").html(),"pageSize":$(this).val()};
			console.log("currentPage"+$("#ulpage li.active a").html());
			$.get("adminServlet?op=querySto",param,function(data,status,xhr){
				//AJAX数据处理
				getPageData(data,status,xhr);
				
			});
			
			
		});
		
		
	});
	
  
         //封装函数实现ajax数据回传处理
      function getPageData(data,status,xhr){
    	
    	  var data=JSON.parse(data);
    	 console.log(data);
    	  var proList=data.aList;
    	   //清空tbody中的Tr
    	  $("#sample-table tbody").empty(); 
    
         //添加tbody中的tr
              $.each($(proList),function(index,element){
              	var obj='<tr><td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>';
         obj+='<td>'+element.stoId+'</td>';
         obj+='<td>'+element.stoName+'</td>';
         obj+='<td>'+element.stoTransNumber+'</td>';
         obj+='<td>'+element.stoScore+'</td>';
         obj+='<td>'+element.type.typeName+'</td>';
         obj+='<td>'+element.stoPhone+'</td>';
         obj+='<td>'+element.stoAddress+'</td>';
         obj+='<td><span class="label label-success label-sm">'+element.stoStatic+'</span></td>';
         obj+=' <td><a href="shopproduct.jsp?stoId='+element.stoId+'" onclick="picture_stop(this,"10001")" class="btn bg-green operation_btn">进入店铺</a>';
         
         obj+='</tr>';
              	$("#tBody").append(obj);
              });
         //清空ul下的li
           $("#ulpage").empty();
     //上一页
		    var objLi = '<li><a id="aprivPage" href="#">&laquo;</a></li>';
		
		    for(var i = 1;i<=data.allPage;i++){
			if(i==data.currentPage){					
				objLi+='<li class="active"><a id="acurrentPage" href="#">'+i+'</a></li>';
			}else{
				objLi+='<li><a href="#" id="acurrentPage">'+i+'</a></li>';
				
			}
		}
		 //下一页
		 objLi+='<li><a id="anextPage" href="#">&raquo;</a></li>';
		 
		$("#ulpage").append(objLi);
		
		
		$("#ulpage").append("<input type='hidden' id='allPage' value='"+data.allPage+"'/>");	
   
       }
         
         
    
    	
  
  </script>
  
  
  
  <tbody id="tBody">
  
 
   
  </tbody>
  <tfoot id="tFoot">
  
												<tr>
													<td colspan="13" align="right">
														<!-- 分页 -->

														<ul class="pagination pagination-sm" id="ulpage">
														
														
														</ul>
														
													</td>
												</tr>
												
												
												
	</tfoot>
  

  
  
 </table>
</div>
</div>
<div class="add_Carousel_figure" id="add_Carousel_figure" style=" display:none">
  <table class="table table_list table_striped table-bordered">
   <thead>
    <tr>
      <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
     <th  width="50">排序</th>
     <th width="100">图片</th>
     <th>尺寸</th>
     <th>大小</th>
     <th>上传时间</th>
     <th>操作</th>
    </tr>
   </thead>
   <tbody>
    <tr>
     <td ><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
     <td>1</td>
     <td></td>
     <td>450x470</td>
     <td>234KB</td>
     <td>2016-08-21</td>
      <td>450x470</td>
     <td>234KB</td>
     <td>2016-08-21</td>
     <td>
      <a href="javascript:ovid()">删除</a>
      <a href="javascript:ovid()">修改</a>
     </td>
    </tr>

   </tbody>
  </table>
  <div class="list_carousel" id="Upload">
  <div class="title_name"><i></i>添加轮播图</div>
      <button type="button" class="add_Upload bg-deep-blue" id="add_Upload" onclick="add_Upload()"><i class="fa  fa-plus"></i></button>
    <div class="images_Upload clearfix margin-bottom" id="images_Upload">
      <span class="Upload_img"><input name="" type="file" /></span>
      <a href="javascript:ovid()" class="operating delete_Upload" onclick="delete_Upload(this.id)"><i class="fa fa-remove"></i></a>
      <a href="javascript:ovid()" class="operating" title="预览" onclick="preview_img(this.id)"><i class="fa  fa-image"></i></a>
    </div>
  </div>
</div>
<div id="page" style="float:right; margin-right:50px">
页面容量：
	<select name="pageSize" id="pageSize">
	<option  value="5">5</option>
   <option  value="10">10</option>
	<option  value="15">15</option>
	</select>
											
</div>



</body>
</html>
