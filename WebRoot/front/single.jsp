<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>轻乐购商城</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" /><!-- animation -->
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->   
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<link rel="stylesheet" href="css/mycss.css" />	
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<script src="js/owl.carousel.js"></script>
<script src="js/bootstrap.js"></script>
<!--flex slider-->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
	  $('.flexslider').flexslider({
		animation: "slide",
		controlNav: "thumbnails"
	  });
	});
</script>
<!--flex slider-->
<script src="js/imagezoom.js"></script>
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
	$(function(){
		$.get("myHistoryServlet",{"op":"addhistory","proid":${product.proId}},function(data){
			
		});
	})
	
	$(function(){
		$.get("storeServlet",{"op":"addrom","stoid":$("#storeid").val()},function(store){
			$("#owl-demo5").empty();
			var objitems="";
			$.each(store.productList,function(index,product){
				if(product.proStatic=="下架")
					{
					return true;
					}
				objitems+='<div class="item" style="width:257px;height:271px;display:inline-block">';
				objitems+='<div class="glry-w3agile-grids agileits" >';
				objitems+='<a href="productServlet?op=looksingle&proId='+product.proId+'"><img style="width:180px;height:251px"  src="'+product.proImg.split(";")[0]+'" alt="img"></a>';
				objitems+='<div class="view-caption agileits-w3layouts" > ';
				objitems+='<h4><a href="productServlet?op=looksingle&proId='+product.proId+'">'+product.proName+'</a></h4>';
				objitems+='<p>'+product.proMessage+'</p>';
				objitems+='<h5>￥'+product.proPrice+'</h5>';
				objitems+='<button type="button" data-proid="'+product.proId+'" class="w3ls-cart" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 加入购物车</button>';
				objitems+='</div></div></div>';
			})
			$("#owl-demo5").append(objitems);
		})
	})
	
	
	
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
    $(function(){
    	$(document).on("click","#addtocart",function(){
    		$.get("ShoppingCartServlet",{"proid":${product.proId},"op":"addcart"},function(data){
    			alert(data);
    		})
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
	
	window.onload=function(){
		$(document).on("click","[class='givegoods']",function(){
			var $objA=$(this);
			$.get("evaLikeServlet",{"op":"givegood","evaid":$(this).attr("data-id")},function(data){
				if(data=="success"){
					$objA.find("span").html(parseInt($objA.find("span").html())+1);
					return;
				}
				else{
					alert(data);
				}
			})
			
		})
	}
		
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
				<p><a href="index.jsp">轻乐购商城</a></p>
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
				<c:if test="${user!=null}">
				<div class="header-cart"> 
					<div class="cart" style="border:0px"> 				 
							<a href="mycart.jsp"><button  class="w3view-cart" type="button" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button></a>
					</div>
					<div class="clearfix"> </div> 
				</div> 
				</c:if>
					<div class="clearfix"> </div> 
				</div> 
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">Store Categories</a>
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
	<!-- breadcrumbs --> 
	<div class="container"> 
		<ol class="breadcrumb breadcrumb1">
			<li><a href="index.jsp">首页</a></li>
			<li class="active">${product.proName}</li>
		</ol> 
		<div class="clearfix"> </div>
	</div>
	<!-- //breadcrumbs -->
	<!-- products -->
	<div class="products">	 
		<div class="container">  
			<div class="single-page">
				<div class="single-page-row" id="detail-21">
					<div class="col-md-6 single-top-left">	
						<div class="flexslider">
							<ul class="slides">
								<c:forEach items="${fn:split(product.proImg,';')}" var="i">
								<li data-thumb="${i}">
									<div class="thumb-image detail_images"> <img src="${i}" data-imagezoom="true" class="img-responsive" alt=""> </div>			
								</li>
								</c:forEach>
								<input type="hidden" id="storeid" value="${product.stoId}"/>
								
							</ul>
						</div>
					</div>
					<div class="col-md-6 single-top-right">
						<h3 class="item_name">${product.proName}  </h3>
						<p>产品销量:${product.proSalesNumber}件 </p>
						<c:set var="totalsc" value="${0}" />
						<c:forEach items="${product.evaluteList}" var="eva" varStatus="i">
						<c:set var="totalsc" value="${totalsc+eva.evaScore}"/>
						<c:if test="${(fn:length(product.evaluteList))==i.count}">
						<c:set var="totalsc" value="${totalsc/(fn:length(product.evaluteList))}"/>
						</c:if>
						</c:forEach>
						<div class="single-rating">
							<ul>
								<c:if test="${totalsc>=1}">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc==0}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc>=2}">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc<2}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc>=3}">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc<3}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc>=4}">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc<4}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc>=5}">
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${totalsc<5}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<!-- <li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li> -->
								<li class="rating">${fn:length(product.evaluteList)}条评论</li>
								
							</ul> 
						</div>
						<div class="single-price">
							<ul>
								<li style="color:black">￥${product.proPrice}</li>  
								<li>上架时间：${product.proGroundDate}</li>
								<li><a href="#"><i class="fa fa-gift" aria-hidden="true"></i> 库存:${product.proNumber}件</a></li>
							</ul>	
						</div> 
						<p class="single-price-text">温馨提示·支持7天无理由退货(拆封后不支持)</p>
						<c:if test="${product.proStatic=='在售' }">
							<button id="addtocart"  class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 加入购物车</button>
						
						<button class="w3ls-cart w3ls-cart-like" data-toggle="modal" data-target="#myModal"><i class="fa fa-heart-o" aria-hidden="true" ></i> 立即购买</button>
						</c:if>
						<c:if test="${product.proStatic=='下架' }"><h3 style="color:blue">(商品已下架)</h3> </c:if>
					</div>
					
				<script>
					$(function(){
						$("#prominus").on("click",function(){
						$("#proadd").removeAttr("disabled");
						$("#showmsg").html("");
						if($("#buynumber").val()==1){
							$("#prominus").attr("disabled",true);
							$("#showmsg").html("(商品数量不能少于1)");
						}
						else{
							$("#buynumber").val($("#buynumber").val()-0-1)
						}
					});
					$("#proadd").on("click",function(){
						$("#prominus").removeAttr("disabled");
						$("#showmsg").html("");
						if($("#buynumber").val()==$("#leftnumber").html()){
							$("#proadd").attr("disabled",true);
							$("#showmsg").html("(商品数量不能大于库存)");
						}
						else{
							$("#buynumber").val($("#buynumber").val()-0+1)
						}
					})
					$("#buynumber").on("input",function(){
						if(isNaN($(this).val())){
							$(this).val(1);
						}
						else if($(this).val()>$("#leftnumber").html()-0)
						{
							$(this).val($("#leftnumber").html());
						}
					})
					})
					
					function subform(){
						if(${user==null}){
							alert("您未登录，请登录后购买");
							return false;
						}
						return true;
					}
				</script>	
					
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form action="orderTableServlet?op=buydirect" method="post" onsubmit="return subform()" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					请选择商品数量
				</h4>
			</div>
			<div class="modal-body" style="text-align:center">
				<div class="input-group" style="width:100px;margin-left:230px"><div class="input-group-btn"><button type="button" class="btn btn-default car-decrease" id="prominus">-</button></div><input type="text" id="buynumber" name="pronumber" class="form-control goods-count" value="1" style="width:40px"><div class="input-group-btn"><button type="button" class="btn btn-default car-add" id="proadd">+</button></div></div>
				库存:<span style="color:red" id="leftnumber">${product.proNumber}</span>件<span id="showmsg"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<input type="hidden" name="proId" value="${product.proId}"/>
				<button type="submit" class="btn btn-primary">
					提交
				</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
					
					
					
					
				   <div class="clearfix"> </div>  
				</div>
				<div class="single-page-icons social-icons"> 
					<ul>
						<li><h4>分享到:</h4></li>
						<div class="bshare-custom icon-medium-plus"><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/button.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><a class="bshareDiv" onclick="javascript:return false;"></a><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
					</ul>
				</div>
			</div> 
			<!-- recommendations -->
			<div class="recommend">
				<h3 class="w3ls-title">店长推荐： </h3> 
				<script>
					$(document).ready(function() { 
						$("#owl-demo5").owlCarousel({
					 
						  autoPlay: 3000, //Set AutoPlay to 3 seconds
					 
						  items :4,
						  itemsDesktop : [640,5],
						  itemsDesktopSmall : [414,4],
						  navigation : true
					 
						});
						
					}); 
				</script>
				<div id="owl-demo5" class="owl-carousel">
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>20% <br> Off</h6></div>
							<a href="products1.html"><img src="images/f2.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">Women Sandal</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$20</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Women Sandal" /> 
									<input type="hidden" name="amount" value="20.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<a href="products.html"><img src="images/e4.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products.html">Digital Camera</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$80</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Digital Camera"/> 
									<input type="hidden" name="amount" value="100.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div>  
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>New</h6></div>
							<a href="products4.html"><img src="images/s1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products4.html">Roller Skates</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$180</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Roller Skates"/> 
									<input type="hidden" name="amount" value="180.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<a href="products1.html"><img src="images/f1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">T Shirt</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$10</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="T Shirt" /> 
									<input type="hidden" name="amount" value="10.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div>    
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>New</h6></div>
							<a href="products6.html"><img src="images/p1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products6.html">Coffee Mug</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$14</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Coffee Mug" /> 
									<input type="hidden" name="amount" value="14.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>20% <br> Off</h6></div>
							<a href="products6.html"><img src="images/p2.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products6.html">Teddy bear</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$20</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Teddy bear" /> 
									<input type="hidden" name="amount" value="20.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<a href="products4.html"><img src="images/s2.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products4.html">Football</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$70</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Football"/> 
									<input type="hidden" name="amount" value="70.00"/>
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div> 
					<div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>Sale</h6></div>
							<a href="products3.html"><img src="images/h1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products3.html">Wall Clock</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$80</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" />
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="Wall Clock" /> 
									<input type="hidden" name="amount" value="80.00" /> 
									<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div> 
				</div>    
			</div>
			<!-- //recommendations --> 
			<!-- collapse-tabs -->
			<div class="collpse tabs">
				<h3 class="w3ls-title">关于宝贝：</h3> 
				<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									<i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i> 宝贝描述 <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								${product.proMessage}
							</div>
						</div>
					</div>
					
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i> 宝贝评价 (${fn:length(product.evaluteList)}) <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span> <i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
						<c:forEach items="${product.evaluteList}" var="eva">
								<div class="rewdiv">
									<div class="rewdiv_left"><img src="${eva.userInfo.userimg}" height="50px" width="50px"  /> ${eva.userInfo.userName}: </div>
									<div class="rewdiv_right">
										<div class="rewdiv_right_top">
							<ul>
								<c:if test="${eva.evaScore>=1}">
								<li><i style="color:red" class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore==0}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore>=2}">
								<li><i style="color:red" class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore<2}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore>=3}">
								<li><i style="color:red" class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore<3}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore>=4}">
								<li><i style="color:red" class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore<4}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore>=5}">
								<li><i style="color:red" class="fa fa-star" aria-hidden="true"></i></li>
								</c:if>
								<c:if test="${eva.evaScore<5}">
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:if>
							</ul> 
						</div>
						<div class="rewdiv_right_mid">
							${eva.evaMsg}
						</div>
						<div class="rewdiv_right_bottom">
						<span class="rewdiv_right_bottom_span1">${eva.evaDate}</span><span class="rewdiv_right_bottom_span2"></span>	
						</div>
									</div>
									<div class="evagood"><a data-id="${eva.evaId}" href="javascript:void(0)" class="givegoods"><img src="Image/webImage/dianzan.jpg" width="50px" height="80px" /><br/><span>${eva.likeCount}</span> </a></div>
								</div>
						</c:forEach>
						</div>
						</div>
					</div>
					
				</div>
			</div>
			<!-- //collapse --> 
			<!-- offers-cards --> 
			
			<!-- //offers-cards -->
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
</body>
</html>