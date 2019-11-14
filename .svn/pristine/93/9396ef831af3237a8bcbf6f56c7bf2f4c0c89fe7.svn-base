<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/mycss.css" />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script><!-- fixed nav js -->
<script>
    $(document).ready(function() {

        // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

        $('.header-two').scrollToFixed();  
        // previous summary up the page.

        var summaries = $('.summary');
        summaries.each(function(i) {
            var summary = $(summaries[i]);
            var next = summaries[i + 1];

            summary.scrollToFixed({
                marginTop: $('.header-two').outerHeight(true) + 10, 
                zIndex: 999
            });
        });
    });
</script>
<!-- //js --> 
<!-- web-fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Offside' rel='stylesheet' type='text/css'> 
<!-- web-fonts -->  
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!-- //end-smooth-scrolling -->
<style>
#boooo{

margin-left:302px;
}
#bbbb{
margin-left:5px;
}
</style>


<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
		
		 $(function(){
	    		$.get("typeServlet",{"op":"queryall"},function(data){
	    			//下面为正确
	    			
	    			 $("#typenav").empty();
	    			var objNav='<a href="#0" class="cd-close">Close</a><ul class="cd-dropdown-content">';
	    			$.each(data, function(index,rankone) {
	    				objNav+='<li name="firsttype" class="has-children">';
	    				objNav+='<a href="#">'+rankone.typeName+'</a>';
	    				objNav+='<ul class="cd-secondary-dropdown is-hidden" style="height:230px">';
	    			$.each(rankone.nextRankIdList, function(index,ranktwo) {
	    				objNav+='<li class="has-children">';
	    				objNav+='<a href="#">'+ranktwo.typeName+'</a>';
	    				objNav+='<ul class="is-hidden">';
	    			$.each(ranktwo.nextRankIdList, function(index3,rankthird) {
	    				objNav+='<li> <a href="products.jsp?typeid='+rankthird.typeId+'">'+rankthird.typeName+'</a></li>';
	    			});	
	    				objNav+='</ul>';
	    				objNav+='</li>';	
	    			});	
	    			objNav+='</ul></li>';
	    			});
	    			objNav+='</ul>';
	    			$("#typenav").append(objNav); 
	    			
	    		})
	   
	    }) 
	    
	     $(function(){
	    	$(document).on("mouseenter","[name='firsttype']",function(){
	    		$(this).children("a").attr("class","is-active")
	    		$(this).children("ul").attr("class","cd-secondary-dropdown is-hidden is-active");
	    	})
	    	$(document).on("mouseleave","[name='firsttype']",function(){
	    		$(this).children("a").attr("class","")
	    		$(this).children("ul").attr("class","cd-secondary-dropdown is-hidden");
	    	})	
	    	
	    })
	</script>
	<!-- //smooth-scrolling-of-move-up -->
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="w3ls-header"><!--header-one--> 
			<div class="w3ls-header-left">
				<p><a href="#">轻乐购购物中心 </a></p>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i><c:if test="${user!=null}">${user.userName}</c:if><c:if test="${user==null}">游客</c:if>  <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:if test="${user==null}">
							<li><a href="login.jsp">登录 </a></li> 
							<li><a href="signup.jsp">注册</a></li> 
							</c:if>
							<c:if test="${user!=null}">
							<li><a href="order.jsp">我的订单</a></li>  
							<li><a href="mycart.jsp">我的购物车</a></li>
							<li><a href="myHistoryServlet?op=query">浏览历史</a></li>
							<li><a href="chooseAddress2.jsp">我的地址管理</a></li>
							<li><a href="userInfoServlet?r=logout">退出</a></li> 
							</c:if>	 
						</ul> 
					</li> 
					
				</ul>
			</div>
			<div class="clearfix"> </div> 
		</div>
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.jsp"><span>S</span>QLG <i>shopping</i></a></h1>
					<h6>leisure shopping.</h6> 
				</div>		
				<div class="header-search">
					<form action="products.jsp" method="get">
						<input type="search" name="proname" placeholder="要买什么呢..." required="">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="header-cart"> 
					<div class="my-account">
						<a href="contact.html"><i class="fa fa-map-marker" aria-hidden="true"></i> CONTACT US</a>						
					</div>
					<div class="cart"> 
						<form action="#" method="post" class="last"> 
							<input type="hidden" name="cmd" value="_cart" />
							<input type="hidden" name="display" value="1" />
							<button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
						</form>  
					</div>
					<div class="clearfix"> </div> 
				</div> 
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">商品类别表</a>
						<nav id="typenav" class="cd-dropdown"> 
							
						</nav> <!-- .cd-dropdown -->
					</div> <!-- .cd-dropdown-wrapper -->	 
				</div>
				<div class="move-text">
					<div class="marquee"><a href="productServlet?op=looksingle&proId=26"><span> 小米电视机：蓝光全屏</span></a><a href="productServlet?op=looksingle&proId=23"> <span>质优价廉：佳能数码相机 </span></a> <a href="productServlet?op=looksingle&proId=28"> <span> 新九代处理器：联想拯救者</span></a></div>
					<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
					<script>
					  $('.marquee').marquee({ pauseOnHover: true });
					  //@ sourceURL=pen.js
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- //header --> 	
	<!--  about-page -->
	
	<!--  ajax -->
	
	  <script type="text/javascript">
	  
	  $(function(){
		  $.get("receiveAddressServlet",{"op":"query"},function(list,status,xhr){
		    $.each($(list),function(index,element){
		    	$("#tBody").append('<tr><td>'+element.recName+'</td><td>'+element.recAddress+'</td><td>'+element.recPhone+'</td><td><button  type="button" class="btn btn-warning">删除</button></td></tr>');
		    });
		  });
		  
		  
		$("#firstname1").blur(function(){
			$("#impMsg").html("");
			var num=$("#firstname1").val();
			$.get("receiveAddressServlet",{"op":"checkImpAddress","impAddress":num},function(impMsg,status,xhr){
				
				console.log(impMsg);
				$("#impMsg").html(impMsg);
			});
		});
		
		$("#firstname2").blur(function(){
			$("#uMsg").html("");
			var num=$("#firstname2").val();
			$.get("receiveAddressServlet",{"op":"checkuName","uName":num},function(uMsg,status,xhr){
				
				console.log(uMsg);
				$("#uMsg").html(uMsg);
			});
		});
		
		$("#firstname3").blur(function(){
			$("#pMsg").html("");
			var num=$("#firstname3").val();
			$.get("receiveAddressServlet",{"op":"checkPhone","phone":num},function(pMsg,status,xhr){
				
				console.log(pMsg);
				$("#pMsg").html(pMsg);
			});
		});
		
	  });
	  
	  
	  
	  </script>
	
	
	
	
   <!--  ajax -->
	
	
	<div class="about">
		<div class="container">
		<form  action="receiveAddressServlet?op=add" method="post"> 
		
		<span class="addrinfospan">收货地址</span><br /><br />
		
			<label for="firstname" class="col-sm-1 control-label" style="width: 130px;" >详细地址：</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="firstname1" placeholder="请输入详细地址信息" name="impAddress"/>
				
			</div>
			
			<label id="impMsg" name="impMsg"></label>
			
			<br /><br />
			<label for="firstname" class="col-sm-1 control-label" style="width: 130px;">收货人姓名：</label>
			
			
			
			<div class="col-sm-3">
				<input type="text" class="form-control" id="firstname2" placeholder="请输入姓名" name="uName"/>
			</div>
			<label id="uMsg" name="uMsg"></label>
			<br /><br />
			
			<label for="firstname" class="col-sm-1 control-label" style="width: 130px;">手机号码：</label>
			
			<div class="col-sm-5">
				<input type="text" class="form-control" id="firstname3" placeholder="请输入手机号码" name="phone"/>
				
			</div>
			
			<label id="pMsg" name="pMsg"></label>
			<br /><br />
        
        </label>&nbsp;&nbsp;&nbsp;
			<button type="b" class="btn btn-primary" id="boooo">保存</button>
			<button type="reset" class="btn btn-warning" id="bbbb">取消</button>
			</form>		
		<br /><br />
		<span class="addrinfospan">地址记录信息:</span>
		
		<table class="table table-hover">

 
  <thead>
    <tr>
      <th>收货人</th>
      <th>详细地址</th>
      <th>电话/手机</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody id="tBody">
   
  </tbody>
</table>
		
		</div>
		
	</div>
	<!-- //about-page --> 
	<!-- footer-top -->

	<!-- //footer-top -->  
	<!-- subscribe -->
	
	<!-- //subscribe --> 
	<!-- footer -->
	
	<!-- //footer -->		
	<div class="copy-right"> 
		 <div class="footer" style="color: white;">
        <div class="footer-right" style="background-color:#222;width:1200px">
            <div class="footer-nav">
                <a href="#">轻乐集团</a>|
                <a href="#">轻乐国际站</a>|
                <a href="#">轻乐中国站</a>|
                <a href="#">全球速卖通</a>|
                <a href="#">轻乐网</a>|
                <a href="#">天猫</a>|
                <a href="#">聚划算</a>|
                <a href="#">一乐</a>|
                <a href="#">轻乐妈妈</a>|
                <a href="#">轻乐云计算</a>|
                <a href="#">云OS</a>|
                <a href="#">万网</a>|
                <a href="#">支付宝</a>|
                <a href="#">来往</a>
            </div>
            <div class="about-tao">
                <a href="#">关于轻乐</a>
                <a href="#">合作伙伴</a>
                <a href="#">营销中心</a>
                <a href="#">廉正举报</a>
                <a href="#">联系客服</a>
                <a href="#">开放平台</a>
                <a href="#">诚征英才</a>
                <a href="#">联系我们</a>
                <a href="#">网站地图</a>
                <a href="#">法律声明</a>
                <span class="gary-text">&copy; 2014 Qingle.com 版权所有</span>
            </div>
            <p class="gary-text" style="color: white;"><span>网络文化经营许可证：文网文[2010]040号</span>|<span>增值电信业务经营许可证：浙B2-20080224-1</span>|<span>信息网络传播视听节目许可证：1109364号</span></p>
            <div class="some-info">
                <img src="images/some.png" /><img src="images/some2.png" style="padding-left: 10px;height: 43px;"/>
            </div>
        </div>
      
    </div>
	</div> 
 	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
        w3ls.render();

        w3ls.cart.on('w3sb_checkout', function (evt) {
        	var items, len, i;

        	if (this.subtotal() > 0) {
        		items = this.items();

        		for (i = 0, len = items.length; i < len; i++) {
        			items[i].set('shipping', 0);
        			items[i].set('shipping2', 0);
        		}
        	}
        });
    </script>  
	<!-- //cart-js --> 
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>