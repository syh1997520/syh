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
    $(function(){
    	$("#ordernopay").on("click",function(){
    		var $objA=$(this);
    		$("[name='optionorder']").each(function(index,element){
    			$(element).attr("class","");
    			$objA.parent("li").attr("class","active");
    		})
    		$.get("orderTableServlet",{"op":"unpay"},function(ordertable){
    			$("#orderbody").empty();
    			loadData(ordertable);
    		})
    	});
    });
    $(function(){
    	$("#orderinfonoevalute").on("click",function(){
    		var $objA=$(this);
    		$("[name='optionorder']").each(function(index,element){
    			$(element).attr("class","");
    			$objA.parent("li").attr("class","active");
    		})
    		$.get("orderTableServlet",{"op":"noeva"},function(ordertable){
    			$("#orderbody").empty();
    			loadData(ordertable);
    		})
    	});
    });
    $(function(){
    	$("#allorder").on("click",function(){
    		var $objA=$(this);
    		$("[name='optionorder']").each(function(index,element){
    			$(element).attr("class","");
    			$objA.parent("li").attr("class","active");
    		})
    		$.get("orderTableServlet",{"op":"allorder"},function(ordertable){
    			$("#orderbody").empty();
    			loadData(ordertable);
    		})
    	});
    });
    $(function(){
    	$.get("orderTableServlet",{"op":"allorder"},function(ordertable){
    		console.log(ordertable);
    			if(ordertable=="none"){
    				$("#orderinner").empty()
    	    		$("#orderinner").append("<img src='Image/webImage/nocart.png'/> <h3>您还没有买过东西呢，赶快购物吧！</h3>");
    				return;
    			}
    			$("#orderbody").empty();
    			loadData(ordertable);
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
    
    function loadData(ordertable){
    	$("#orderbody").empty();
    	$(ordertable).each(function(index,odtab){
    		var objIner='<tr class="infosace" ><td colspan="6" style="border:0px"></td> </tr>';
    		objIner+='<tr class="infotp"><td ><span class="rewdiv_right_bottom_span1">时间：'+odtab.ordTime+'</span> <span class="rewdiv_right_bottom_span2">订单号：'+odtab.ordId+'</span> </td>';
    		objIner+='<td colspan="5">店铺名:'+odtab.store.stoName+'</td></tr>';
    		var objFlag=true;
    		$(odtab.odifList).each(function(odifindex,odif){
    			if(odif.product.proStatic=="下架"){
    				objFlag=false;
    				return false;
    			}
    		})
    		$(odtab.odifList).each(function(odifindex,odif){
    			objIner+='<tr class="infotr">';
    			if(odif.product.proStatic=="在售"){
    				objIner+='<td><img src="'+odif.product.proImg.split(";")[0]+'" width="80px" height="80px" /><a href="productServlet?op=looksingle&proId='+odif.product.proId+'">'+odif.product.proName+'</a></td>';
    			}
    			else{
    				objIner+='<td><img src="'+odif.product.proImg.split(";")[0]+'" width="80px" height="80px" /><a href="productServlet?op=looksingle&proId='+odif.product.proId+'">'+odif.product.proName+'</a>(已下架)</td>';
    			}
    			objIner+='<td>￥'+odif.product.proPrice+'</td>';
    			objIner+='<td>'+odif.proNumber+'</td>';
    			objIner+='<td>￥'+odif.odifPrice+'</td>';
    			if(odifindex==0){
    				objIner+='<td rowspan="'+odtab.odifList.length+'">'+odtab.ordStatic+'</td>';
    			}
    			if(odtab.ordStatic=="未付款"&&odifindex==0){
    				if(objFlag)
    				objIner+='<td rowspan="'+odtab.odifList.length+'"><a href="orderTableServlet?op=loadorderbyid&orderid='+odtab.ordId+'">去付款</a></td></tr>';
    				else
    					objIner+='<td rowspan="'+odtab.odifList.length+'"><a >订单失效</a></td></tr>';	
    			}
    			else if(odif.odifEvaluate==0&&odtab.ordStatic=="已付款"){
    				objIner+='<td><a href="orderTableServlet?op=gotoevalute&odifid='+odif.odifId+'">去评价</a></td></tr>';
    			}else if(odif.odifEvaluate==1){
    				objIner+='<td><a href="productServlet?op=looksingle&proId='+odif.proId+'">查看评论</a></td></tr>';
    			}
    			
    		})
    		objIner+='<tr class="infosace" ><td colspan="6" style="border:0px"></td> </tr>';
    		$("#orderbody").append(objIner);
    	})
    }
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
	<div class="about">
		<div class="container" id="orderinner"> 
			<ul class="nav nav-tabs nav-justified">
  <li class="active" name="optionorder"><a  id="allorder" href="javascript:void(0)">所有订单</a></li>
  <li name="optionorder"><a  id="ordernopay" href="javascript:void(0)">待付款</a></li>
  <li name="optionorder"><a  id="orderinfonoevalute" href="javascript:void(0)">待评价</a></li>
</ul>
<table id="orderTab" class="table table-condensed" border="0px">
  <thead>
    <tr>
      <th width="407px">宝贝</th>
      <th width="107px">单价</th>
      <th width="107px">数量</th>
      <th width="107px">实付款</th>
      <th width="107px">交易状态</th>
      <th width="107px">操作</th>
    </tr>
  </thead>
  <tbody id="orderbody">
  	<!--<tr class="infosace"><td colspan="6"></td> </tr>
  	<c:forEach items="${orderMap}" var="map">
  	 <tr class="infotp"><td ><span class="rewdiv_right_bottom_span1">时间：${map.key.ordTime}</span> <span class="rewdiv_right_bottom_span2">订单号：${map.key.ordId}</span> </td>
   	<td colspan="5">${map.key.store.stoName}</td>
   </tr>
   <c:forEach items="${map.value}" var="odif" >
   <tr class="infotr">
   	<td><img src="${fn:split(odif.product.proImg,';')[0]}" width="80px" height="80px" />${odif.product.proName} </td>
   	<td>￥${odif.product.proPrice}</td>
   	<td>${odif.proNumber}</td>
   	<td>￥${odif.odifPrice}</td>
   	<td >${map.key.ordStatic}</td>
   	<td><a>去评价</a></td>
   </tr>
   </c:forEach>
   <tr class="infosace"><td colspan="6"></td> </tr>
	</c:forEach>-->
  
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