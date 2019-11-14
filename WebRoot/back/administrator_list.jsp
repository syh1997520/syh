
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
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<title>管理员列表</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin Competence_style" id="page_style">
    <div class="operation clearfix">

   <div class="search  clearfix">

   <input name="" type="text"  class="form-control col-xs-8"/><button class="btn button_btn bg-deep-blue " onclick=""  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
</div>
</div>
<div class="compete_list">
       <table id="sample_table" class="table table_list table_striped table-bordered dataTable no-footer">
		 <thead>
			<tr>
			  <th class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
			  <th>用户编号</th>
			  <th>用户密码</th>
              <th>用户账号</th>
              <th>性别</th>
			  <th>用户名</th>  
              <th>手机号码</th> 
               <th>用户积分</th>  
                <th>用户头像</th> 
                <th class="hidden-480">评价权限</th>         
			  <th class="hidden-480">操作</th>
             </tr>
		    </thead>
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

<div id="page" style="float:right; margin-right:50px">
页面容量：
	<select name="pageSize" id="pageSize">
	<option  value="5">5</option>
   <option  value="10">10</option>
	
	</select>
											
</div>



</body>
</html>
<script>

    $(function(){
           $.get("../front/userInfoServlet",{"r":"queryUser"},function(data,status,xhr){
           getPageData(data,status,xhr);
           });
    
    });

//上一页时间
    $(function(){
    $(document).on("click","#aprivPage",function(){
    
       var privPage=parseInt($("#ulpage li.active a").html())-1;
       if(privPage<=0){
       privPage=1;
       }
       var param={"r":"queryUser","currentPage":privPage,"pageSize":$("#pageSize").val()};
       $.get("../front/userInfoServlet",param,function(data,status,xhr){
              getPageData(data,status,xhr);
       });
    });
    
    });

//下一页事件
   $(function(){
      $(document).on("click","#anextPage",function(){
      
      var nextPage=parseInt($("#ulpage li.active a").html())+1;   
      
      if(nextPage>$("#allPage").val()){
         nextPage=$("#allPage").val();
      }
         var param={"r":"queryUser","currentPage":nextPage,"pageSize":$("#pageSize").val()};
         $.get("../front/userInfoServlet",param,function(data,status,xhr){
         getPageData(data,status,xhr);
         });
      });
   
   });

//当前页事件

$(function(){

$(document).on("click","#acurrentPage",function(){
       var param={"r":"queryUser","currentPage":$(this).html(),"pageSize":$("#pageSize").val()};
       $.get("../front/userInfoServlet",param,function(data,status,xhr){
       getPageData(data,status,xhr);
       });

});

});


//页面容量改变
	//下拉列表事件
	$(function(){
		
		
		$(document).on("change","#pageSize",function(){
			$("#ulPage").empty();
			$("#ulpage li.active a").html(1);
			console.log("++++"+$(this).val());
			var param ={"currentPage":$("#ulpage li.active a").html(),"pageSize":$(this).val()};
			
			console.log("currentPage"+$("#ulpage li.active a").html());
			
			$.get("../front/userInfoServlet?r=queryUser",param,function(data,status,xhr){
				//AJAX数据处理
				getPageData(data,status,xhr);
				
			});
			
			
		});
		
		
	});





    function getPageData(data,status,xhr){
    var data=JSON.parse(data);
    
    var uList=data.aList;
    $("#sample_table tbody").empty(); 
    $.each($(uList),function(index,element){
    var obj='<tr><td class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>';
     obj+='<td>'+element.userId+'</td>';
    obj+='<td>'+element.userPassword+'</td>';
    obj+='<td>'+element.userLoginName+'</td>';
    obj+='<td>'+element.userGender+'</td>';
    obj+='<td>'+element.userName+'</td>';
    obj+='<td>'+element.userPhoneNumber+'</td>';
    obj+='<td>'+element.userScore+'</td>';
    obj+='<td><img src="../front/'+element.userimg+'" style="width: 40px;height: 40px;"></td>';
     obj+='<td class="td-status"><span class="label label-success label-sm">已启用</span></td>';
     obj+='<td class="td-manage"><a title="停用" onclick="return confirm(\'是否禁言？\')" href="javascript:;" data-id="'+element.userId+'" class="btn button_btn btn-Dark-success" id="speakAble">禁言</a>';
              
        obj+='<a title="删除" onclick="return confirm(\'是否删除？\')" href="adminServlet?op=delUser&userId='+element.userId+'" class="btn button_btn btn-danger">删除</a>';
        
			   
			   $("#tBody").append(obj);
    });
    
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

$(function(){
	$(document).on("click","#speakAble",function(){
	
	window.location.href="adminServlet?op=modSpeakAble&userId="+$(this).attr("data-id");
	
	});
	});







$(function(){
	$("#Competence_sort").click(function(){
		var option=$(this).find("option:selected").text();
		var value=$(this).val();
		if(value==0){
			  
			$("#sample_table tbody tr").show()
			}
			else{
		$("#sample_table tbody tr").hide().filter(":contains('"+(option)+"')").show();	
			}
		}).click();	
	});

/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
/*管理员-停用*/
function Competence_close(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn button_btn btn-gray" onClick="Competence_start(this,id)" href="javascript:;" title="启用">启用</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success label-sm">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function Competence_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn button_btn  btn-Dark-success" onClick="Competence_close(this,id)" href="javascript:;" title="停用">停用</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success label-sm">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/****复选框选中******/
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
</script>
