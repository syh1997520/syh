<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Products</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->  
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" />   
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<script src="js/owl.carousel.js"></script>
<!-- //js --> 
<!-- web-fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Offside' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<!-- web-fonts --> 
<!-- scroll to fixed--> 
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
<script>
$(document).on("click","[name='addcart']",function(){
	$.get("ShoppingCartServlet",{"proid":$(this).attr("data-proid"),"op":"addcart"},function(data){
		alert(data);
	})
})
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
    function getQueryVariable(variable)
{		
       var query = decodeURIComponent(window.location.search.substring(1));
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}
$(function(){
	$("#orderbysome a").on("click",function(){
		if(getQueryVariable("typeid")!=false){
		$("#showcontext").html($(this).html()+'<span class="caret"></span>');
		if($(this).html()=="价格降序"){
			$.get("productServlet",{"op":"queryid","typeid":getQueryVariable("typeid"),"orderby":"pricelow"},function(data){
    			loadData(data);
    	});
		}
		if($(this).html()=="价格升序"){
			$.get("productServlet",{"op":"queryid","typeid":getQueryVariable("typeid"),"orderby":"pricehigh"},function(data){
    			loadData(data);
    	});
		}
		if($(this).html()=="最新上架"){
			$.get("productServlet",{"op":"queryid","typeid":getQueryVariable("typeid"),"orderby":"latest"},function(data){
    			loadData(data);
    	});
		}
		if($(this).html()=="销量降序"){
			$.get("productServlet",{"op":"queryid","typeid":getQueryVariable("typeid"),"orderby":"saleslow"},function(data){
    			loadData(data);
    	});
		}
		}
		if(getQueryVariable("proname")!=false){
			$("#showcontext").html($(this).html()+'<span class="caret"></span>');
		if($(this).html()=="价格降序"){
			$.get("productServlet",{"op":"queryname","proname":getQueryVariable("proname"),"orderby":"pricelow"},function(data){
    			loadData(data);
    	});
		}
		if($(this).html()=="价格升序"){
			$.get("productServlet",{"op":"queryname","proname":getQueryVariable("proname"),"orderby":"pricehigh"},function(data){
    			loadData(data);
    	});
		}
		if($(this).html()=="最新上架"){
			$.get("productServlet",{"op":"queryname","proname":getQueryVariable("proname"),"orderby":"latest"},function(data){
    			loadData(data);
    	});
		}
		if($(this).html()=="销量降序"){
			$.get("productServlet",{"op":"queryname","proname":getQueryVariable("proname"),"orderby":"saleslow"},function(data){
    			loadData(data);
    	});
		}
		}
	})
})
function loadData(data){
		$("#itemnumber").html($(data).length);
    	$("#proContainer").empty();
    	$(data).each(function(index,element){
    		var objDiv='<div class="col-md-3 product-grids"> <div class="agile-products">';
    		objDiv+='<a href="productServlet?op=looksingle&proId='+element.proId+'"><img src="'+element.proImg.split(";")[0]+'" class="img-responsive" alt="img" style="width: 140px;height: 168px;"></a>';
    		objDiv+='<div class="agile-product-text"> ';
    		objDiv+='<h5><a href="single.html">'+element.proName+'</a></h5>';
    		objDiv+='<h6>￥'+element.proPrice+'</h6>';
    		objDiv+='<h6>销售量：'+element.proSalesNumber+'笔</h6>';
    		objDiv+='<h6>上架时间：'+element.proGroundDate+'</h6>';
    		/* objDiv+='<form action="#" method="post"><input type="hidden" name="cmd" value="_cart" /><input type="hidden" name="add" value="1" /> '
    		objDiv+='<input type="hidden" name="w3ls_item" value="'+element.proName+'" />';
    		objDiv+='<input type="hidden" name="amount" value="'+element.proPrice+'" /> '; */
    		objDiv+='<button data-proid="'+element.proId+'" name="addcart" type="button" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button></div></div> </div>';
    		$("#proContainer").append(objDiv);
    	});
    	$("#proContainer").append('<div class="clearfix"> </div>');
    }
    $(function(){
    	if(getQueryVariable("typeid")!=false){
    	$.get("productServlet",{"op":"queryid","typeid":getQueryVariable("typeid")},function(data){
    			loadData(data);
    	});
    	}
    	if(getQueryVariable("proname")!=false){
    		console.log(getQueryVariable("proname"));
    		$.get("productServlet",{"op":"queryname","proname":getQueryVariable("proname")},function(data){
    			loadData(data);
    	});
    	}
    });
    
    $(function(){
    	$.get("productServlet",{"op":"getpopular"},function(data){
    		$("#popularpro").empty();
    		var objul="";
    		$.each(data, function(index,element) {
    			objul+='<li><a href="productServlet?op=looksingle&proId='+element.proId+'">'+element.proName+' </a></li>';
    		});
    		$("#popularpro").append(objul);
    	})
    })
   
   $(function(){
   	$("#changepopular").on("click",function(){
   		$.get("productServlet",{"op":"getpopular"},function(data){
   		$("#popularpro").empty();
    		var objul="";
    		$.each(data, function(index,element) {
    			objul+='<li><a href="productServlet?op=looksingle&proId='+element.proId+'">'+element.proName+' </a></li>';
    		});
    		$("#popularpro").append(objul);
   	})
   		})
   })
   
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
<!-- //scroll to fixed--> 
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
</script>
<!-- //smooth-scrolling-of-move-up -->  
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
	$(function()
	{
		$('.scroll-pane').jScrollPane();
	});
</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin --> 
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
						<a class="cd-dropdown-trigger" href="#0">商品列表</a>
						<nav id="typenav" class="cd-dropdown"> 
							
						</nav> <!-- .cd-dropdown -->
					</div> <!-- .cd-dropdown-wrapper -->	 
				</div>
				<div class="move-text">
					<div class="marquee"><a href="productServlet?op=looksingle&proId=26"><span> 小米电视机：蓝光全屏</span></a><a href="productServlet?op=looksingle&proId=23"> <span>质优价廉：佳能数码相机 </span></a> <a href="productServlet?op=looksingle&proId=28"> <span> 新九代处理器：联想拯救者</span></a></div>
					<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
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
	<!-- products -->
	<div class="products">	 
		<div class="container">
			<div class="col-md-9 product-w3ls-right">
				<!-- breadcrumbs --> 
				<ol class="breadcrumb breadcrumb1">
					<li><a href="index.jsp">主页</a></li>
					<li class="active">产品搜索</li>
				</ol> 
				<div class="clearfix"> </div>
				<!-- //breadcrumbs -->
				<div class="product-top">
					<h4>共检索到:<span id="itemnumber"></span>件宝贝</h4>
					<ul> 
						<li class="dropdown head-dpdn">
							<a id="showcontext" href="#" class="dropdown-toggle" data-toggle="dropdown">排序<span class="caret"></span></a>
							<ul id="orderbysome" class="dropdown-menu">
								<li><a href="javascript:void(0)" data-what="pricelow">价格降序</a></li> 
								<li><a href="javascript:void(0)" data-what="pricehigh">价格升序</a></li>
								<li><a href="javascript:void(0)" data-what="latest">最新上架</a></li> 
								<li><a href="javascript:void(0)" data-what="sales">销量降序</a></li> 
							</ul> 
						</li>
						
					</ul> 
					<div class="clearfix"> </div>
				</div>
				<div id="proContainer" class="products-row">
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				</div>
				<!-- add-products --> 
				
				<!-- //add-products -->
			</div>
			<div class="col-md-3 rsidebar">
				
				<div class="related-row">
					<h4>猜你喜欢:</h4>
					<ul id="popularpro">
					</ul>
					<a id="changepopular" href="javascript:void(0)">换一批 </a>
				</div>
				<div class="related-row">
					<h4>明星产品</h4>
					<div id="startpro" class="galry-like">  
						<a href="productServlet?op=looksingle&proId=72"><img src="Image/ProductImage/kouho2.jpg" class="img-responsive" alt="img"></a>             
						<h4><a href="productServlet?op=looksingle&proId=72">迪奥（Dior）烈艳蓝金唇膏</a></h4> 
						<h5>$315</h5>       
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<!-- recommendations -->
			
			<!-- //recommendations -->
		</div>
	</div>
	<!--//products-->  
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