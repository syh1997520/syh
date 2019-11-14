<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style --> 
<link href="css/ken-burns.css" rel="stylesheet" type="text/css" media="all" /> <!-- banner slider --> 
<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js --> 
<!-- web-fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Offside' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<!-- web-fonts --> 
<script src="js/owl.carousel.js"></script>  
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({ 
	  autoPlay: 3000, //Set AutoPlay to 3 seconds 
	  items :4,
	  itemsDesktop : [640,5],
	  itemsDesktopSmall : [480,2],
	  navigation : true
 
	}); 
}); 
$(document).on("click","[name='addcart']",function(){
	$.get("ShoppingCartServlet",{"proid":$(this).attr("data-proid"),"op":"addcart"},function(data){
		alert(data);
	})
})
</script>
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
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
    	$.get("productServlet",{"op":"indexquery","typeid":"5"},function(){
    		
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
<script src="js/bootstrap.js"></script>	
</head>
<body>
	<!-- <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88"
		aria-hidden="true">
		<div class="modal-dialog">
			 <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><i class="fa fa-map-marker" aria-hidden="true"></i> 所在城市</h4>
				</div>
				<div class="modal-body modal-body-sub"> 
					<h5>选择您的所在地 </h5>  
					<select class="form-control bfh-states" data-country="US" data-state="CA">
						<option value="" disabled="disabled" selected="selected">选择省份</option>
						<option value="厦门">厦门</option><option value="上海">上海</option><option value="江西">江西</option><option value="深圳">深圳</option>
					</select>
					<br />
					<button type="button" class="close2" data-dismiss="modal" aria-hidden="true">确认</button>
				</div>
			</div> 
		</div>
	</div> -->
	<script>
		$('#myModal88').modal('show');
	</script> 
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
					<!-- <li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-percent" aria-hidden="true"></i> Today's Deals<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">Cash Back Offers</a></li> 
							<li><a href="offers.html">Product Discounts</a></li>
							<li><a href="offers.html">Special Offers</a></li> 
						</ul> 
					</li>  -->
					<!-- <li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-gift" aria-hidden="true"></i> Gift Cards<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">Product Gift card</a></li> 
							<li><a href="offers.html">Occasions Register</a></li>
							<li><a href="offers.html">View Balance</a></li> 
						</ul> 
					</li>  -->
					<!-- <li class="dropdown head-dpdn">
						<a href="contact.html" class="dropdown-toggle"><i class="fa fa-map-marker" aria-hidden="true"></i> Store Finder</a>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="card.html" class="dropdown-toggle"><i class="fa fa-credit-card-alt" aria-hidden="true"></i> Credit Card</a>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="help.html" class="dropdown-toggle"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
					</li> -->
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
		</div><!-- //header-two -->
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a id="loadtype" class="cd-dropdown-trigger" href="javascript:void(0)">商品类别表</a>
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
	<!-- banner -->
	<div class="banner">
		<div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
			<!-- Wrapper-for-Slides -->
            <div class="carousel-inner" role="listbox">  
                <div class="item active"><!-- First-Slide -->
                    <img src="images/5.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated flipInX">Flat <span>50%</span> Discount</h3>
                        <h4 data-animation="animated flipInX">Hot Offer Today Only</h4>
                    </div>
                </div>  
                <div class="item"> <!-- Second-Slide -->
                    <img src="images/8.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated fadeInDown">Our Latest Fashion Editorials</h3>
                        <h4 data-animation="animated fadeInUp">cupidatat non proident</h4>
                    </div>
                </div>
 
                <div class="item"><!-- Third-Slide -->
                    <img src="Image/advImage/lankouadv2.jpg" alt="" class="img-responsive"/>
                    <div class="carousel-caption kb_caption kb_caption_center">
                        <h3 data-animation="animated fadeInLeft">End Of Season Sale</h3>
                        <h4 data-animation="animated flipInX">cupidatat non proident</h4>
                    </div>
                </div>

            </div> 
            <!-- Left-Button -->
            <a class="left carousel-control kb_control_left" href="#kb" role="button" data-slide="prev">
				<span class="fa fa-angle-left kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a> 
            <!-- Right-Button -->
            <a class="right carousel-control kb_control_right" href="#kb" role="button" data-slide="next">
                <span class="fa fa-angle-right kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a> 
        </div>
		<script src="js/custom.js"></script>
	</div>
	<!-- //banner -->  
	<div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
	<!-- welcome -->
	<div class="welcome"> 
		<div class="container"> 
			<div class="welcome-info">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class=" nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" >
							<i class="fa fa-mobile" aria-hidden="true"></i> 
							<h5>数码</h5>
						</a></li>
						<li role="presentation"><a href="#carl" role="tab" id="carl-tab" data-toggle="tab"> 
							<i class="fa fa-male" aria-hidden="true" style="color: red;"></i>
							<h5>服装</h5>
						</a></li>
						<li role="presentation"><a href="#james" role="tab" id="james-tab" data-toggle="tab"> 
							<i class="fa fa-cutlery" aria-hidden="true"></i>
							<h5>食品</h5>
						</a></li>
						<li role="presentation"><a href="#decor" role="tab" id="decor-tab" data-toggle="tab"> 
							<i class="fa fa-home" aria-hidden="true"></i>
							<h5>日用</h5>
						</a></li>
						<li role="presentation"><a href="#sports" role="tab" id="sports-tab" data-toggle="tab"> 
							<i class="fa fa-laptop" aria-hidden="true"></i>
							<h5>家电</h5>
						</a></li>
						<li role="presentation"><a href="#maq" role="tab" id="maq-tab" data-toggle="tab"> 
							<i class="fa fa-female" aria-hidden="true"></i>
							<h5>化妆品</h5>
						</a></li> 
					</ul>
					<div class="clearfix"> </div>
					<h3 class="w3ls-title">热门产品</h3>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
							<div class="tabcontent-grids">  
								<div id="owl-demo" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId=3"><img width="180px" height="215px" src="Image/ProductImage/huaweimate21.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=3">HUAWEI mate21</a></h4>
												<p>保证一年不卡顿~你值得拥有</p>
												<h5>$5500</h5> 
												
													<button type="button" class="w3ls-cart" data-proid="3" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												 
											</div>   
										</div>   
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId=4"><img width="180px" height="215px" src="Image/ProductImage/vivox27.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=4">VIVox27</a></h4>
												<p>拍照更清晰！照亮你的美</p> 
												<h5>$3200</h5>
												
													<button type="button" class="w3ls-cart" data-proid="4" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId=14"><img width="180px" height="215px" src="Image/ProductImage/lianxiangzhengjiuzhey9000.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=14">联想拯救者Y9000</a></h4>
												<p>联想游戏本</p>
												<h5>$7000</h5>
												
													<button type="button" class="w3ls-cart" data-proid="14" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId=27"><img width="180px" height="215px" src="Image/ProductImage/huipu.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=27">惠普暗影精灵pro3</a></h4>
												<p>初代经典系列</p>
												<h5>$3005</h5>
												
													<button type="button" class="w3ls-cart" data-proid="27" name="addcart"><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
											
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId=28"><img width="180px" height="215px" src="Image/ProductImage/lianxiany7000.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=28">联想拯救者Y7000</a></h4>
												<p>流畅玩游戏，gtx1070Ti显卡配置</p>
												<h5>$6000</h5> 
												
													<button type="button" class="w3ls-cart" data-proid="28" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												 
											</div>   
										</div>   
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId=64"><img width="180px" height="215px" src="Image/ProductImage/shouji1.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=64">华为 HUAWEI 华为P30Pro</a></h4>
												<p>曲屏手机</p> 
												<h5>$5488</h5>
												
													<button type="button" class="w3ls-cart" data-proid="64" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId=62"><img width="180px" height="215px" src="Image/ProductImage/diannao2.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=62">戴尔(DELL)灵越3670</a></h4>
												<p>英特尔酷睿i5 台式电脑整机(i5-8400 8G 128GSSD 1T 2G独显 WIFI 蓝牙 键鼠)23.6英寸</p>
												<h5>$4699</h5>
												
													<button type="button" class="w3ls-cart" data-proid="62" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId=63"><img width="180px" height="215px" src="Image/ProductImage/diannaob.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=63">联想(Lenovo)扬天M4000s</a></h4>
												<p>高端商用台式机电脑整机(I7-8700 8G 1T 2G独显 键鼠 串口 wifi 四年上门)19.5英寸</p>
												<h5>$5899</h5>
												
													<button type="button" class="w3ls-cart" data-proid="63" name="addcart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
											
											</div>         
										</div>  
									</div>
								</div> 
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="carl" aria-labelledby="carl-tab">
							<div class="tabcontent-grids">
								<script>
									$(document).ready(function() { 
										$("#owl-demo1").owlCarousel({
									 
										  autoPlay: 3000, //Set AutoPlay to 3 seconds
									 
										  items :4,
										  itemsDesktop : [640,5],
										  itemsDesktopSmall : [414,4],
										  navigation : true
									 
										});
										
									}); 
								</script>
								<div id="owl-demo1" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+76+'"><img width="180px" height="215px" src="Image/ProductImage/liweisi1.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId=76">李维斯裤子</a></h4>
												<p>穿出个性</p>
												<h5>$200</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div>    
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+82+'"><img width="180px" height="215px" src="Image/ProductImage/yiminu.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+82+'">依米奴上衣</a></h4>
												<p>显示你不一样的美</p>
												<h5>$500</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+81+'"><img width="180px" height="215px" src="Image/ProductImage/tangshi3.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+81+'">阿德上衣</a></h4>
												<p>好地方好上衣</p>
												<h5>$600</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+80+'"><img width="180px" height="215px" src="Image/ProductImage/tangshi2.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+80+'">维克多上衣</a></h4>
												<p>时尚好看</p>
												<h5>$300</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>      
										</div> 
									</div> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+78+'"><img width="180px" height="215px" src="Image/ProductImage/tangshi1.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+78+'">唐狮上衣</a></h4>
												<p>中国风</p>
												<h5>$200</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div>    
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+77+'"><img width="180px" height="215px" src="Image/ProductImage/liweisi2.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+77+'">鸿星尔克裤子</a></h4>
												<p>秃笔蓝波万</p>
												<h5>$300</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+11+'"><img width="180px" height="215px" src="Image/ProductImage/chenyinv.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+11+'">衬衣</a></h4>
												<p>全棉长衫</p>
												<h5>$115</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+18+'"><img width="180px" height="215px" src="Image/ProductImage/adds.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+18+'">阿迪达斯运动裤</a></h4>
												<p>更舒服，更潮</p>
												<h5>$1000</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>      
										</div> 
									</div>   
								</div>   
							</div>
						</div> 
						<div role="tabpanel" class="tab-pane fade" id="james" aria-labelledby="james-tab">
							<div class="tabcontent-grids">
								<script>
									$(document).ready(function() { 
										$("#owl-demo2").owlCarousel({
									 
										  autoPlay: 3000, //Set AutoPlay to 3 seconds
									 
										  items :4,
										  itemsDesktop : [640,5],
										  itemsDesktopSmall : [414,4],
										  navigation : true
									 
										});
										
									}); 
								</script>
								<div id="owl-demo2" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+1+'"><img width="180px" height="215px" src="Image/ProductImage/zhanma2.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+1+'">战马功能饮料</a></h4>
												<p>更高更快更强</p>
												<h5>$5</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+5+'"><img width="180px" height="215px" src="Image/ProductImage/kekoukele.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+5+'">可口可乐</a></h4>
												<p>快乐水</p>
												<h5>$3</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item"> 
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId='+6+'"><img width="180px" height="215px" src="Image/ProductImage/xuebi.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+6+'">雪碧</a></h4>
												<p>清凉一夏</p>
												<h5>$3</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+7+'"><img width="180px" height="215px" src="Image/ProductImage/longfushanquan.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+7+'">农夫山泉</a></h4>
												<p>我们不生产水，我们只是大自然的搬运工</p>
												<h5>$2</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
											
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+8+'"><img width="180px" height="215px" src="Image/ProductImage/yingyangkuaixian.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+8+'">营养快线</a></h4>
												<p>营养快线，幸福牵线</p>
												<h5>$3</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br> Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+9+'"><img width="180px" height="215px" src="Image/ProductImage/molimicha.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+9+'">茉莉蜜茶</a></h4>
												<p>蜂蜜与茉莉花的香味</p>
												<h5>$3</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item"> 
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId='+10+'"><img width="180px" height="215px" src="Image/ProductImage/lvcha.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+10+'">统一绿茶</a></h4>
												<p>茶香悠长</p>
												<h5>$3</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+29+'"><img width="180px" height="215px" src="Image/ProductImage/panpan.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+29+'">盼盼法式面包</a></h4>
												<p>好吃的不得了</p>
												<h5>$30</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div> 
									</div> 
								</div>    
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="decor" aria-labelledby="decor-tab">
							<div class="tabcontent-grids">
								<script>
									$(document).ready(function() { 
										$("#owl-demo3").owlCarousel({
									 
										  autoPlay: 3000, //Set AutoPlay to 3 seconds
									 
										  items :4,
										  itemsDesktop : [640,5],
										  itemsDesktopSmall : [414,4],
										  navigation : true
									 
										});
										
									}); 
								</script>
								<div id="owl-demo3" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId='+60+'"><img width="180px" height="215px" src="Image/ProductImage/yashua1.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+60+'">黑人牙刷</a></h4>
												<p>炭丝深洁（标准刷头）</p>
												<h5>$15.8</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>10%<br>Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+61+'"><img width="180px" height="215px" src="Image/ProductImage/yashuaa.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+61+'">Vsmile电动牙刷</a></h4>
												<p>高效声波震动，深层清洁</p>
												<h5>$219</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+56+'"><img width="180px" height="215px" src="Image/ProductImage/yagao1.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+56+'">云南白药牙膏</a></h4>
												<p>健齿养龈</p>
												<h5>$88</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+57+'"><img width="180px" height="215px" src="images/h4.png" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+57+'">舒适达药膏</a></h4>
												<p>有效缓解牙敏感，专为敏感牙齿护航</p>
												<h5>$47</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId='+15+'"><img width="180px" height="215px" src="Image/ProductImage/heirenyagao.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+15+'">黑人牙膏</a></h4>
												<p>全新升级，更洁白</p>
												<h5>$12</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>10%<br>Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+25+'"><img width="180px" height="215px" src="Image/ProductImage/giajieshi.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+25+'">佳洁士牙刷</a></h4>
												<p>洗刷刷呜呜</p>
												<h5>$35</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+32+'"><img width="180px" height="215px" src="Image/ProductImage/heirenyas.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+32+'">黑人牙刷</a></h4>
												<p>什么都黑，只剩一口洁白</p>
												<h5>$26</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+33+'"><img width="180px" height="215px" src="Image/ProductImage/gaolujieyashua.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+33+'">高露洁牙刷</a></h4>
												<p>露出你洁白的笑容，更自信</p>
												<h5>$34</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>  
								</div>    
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="sports" aria-labelledby="sports-tab">
							<div class="tabcontent-grids">
								<script>
									$(document).ready(function() { 
										$("#owl-demo4").owlCarousel({
									 
										  autoPlay: 3000, //Set AutoPlay to 3 seconds
									 
										  items :4,
										  itemsDesktop : [640,5],
										  itemsDesktopSmall : [414,4],
										  navigation : true
									 
										}); 
									}); 
								</script>
								<div id="owl-demo4" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+34+'"><img width="180px" height="215px" src="Image/ProductImage/jiuyang.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+34+'">九阳电饭煲</a></h4>
												<p>高效省电</p>
												<h5>$159</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+35+'"><img width="180px" height="215px" src="Image/ProductImage/lingrui.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+35+'">领锐电饭煲</a></h4>
												<p>节能更环保</p>
												<h5>$79</h5>
												
													<button type="button" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br>Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+36+'"><img width="180px" height="215px" src="Image/ProductImage/medii.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+36+'">美的电饭煲</a></h4>
												<p>更快更好用</p>
												<h5>$239</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+16+'"><img width="180px" height="215px" src="Image/ProductImage/haier.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+16+'">海尔变频洗衣机</a></h4>
												<p>一晚只需一度电</p>
												<h5>$2000</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+17+'"><img width="180px" height="215px" src="Image/ProductImage/geli.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+17+'">格力洗衣机</a></h4>
												<p>格力掌握核心科技</p>
												<h5>$1500</h5>
											
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+26+'"><img width="180px" height="215px" src="Image/ProductImage/xiaomi.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+26+'">小米电视机</a></h4>
												<p>蓝光全屏</p>
												<h5>$3000</h5>
											
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>20% <br>Off</h6></div>
											<a href="productServlet?op=looksingle&proId='+12+'"><img width="180px" height="215px" src="Image/ProductImage/dianfanguo.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+12+'">电饭锅</a></h4>
												<p>不粘锅的电饭锅</p>
												<h5>$259</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div> 
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+86+'"><img width="180px" height="215px" src="Image/ProductImage/changhong.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+86+'">长虹电视机</a></h4>
												<p>哩哩啦啦</p>
												<h5>$5555</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div> 
									</div>
								</div>    
							</div>
						</div> 
						
						<div role="tabpanel" class="tab-pane fade" id="maq" aria-labelledby="maq-tab">
							<div class="tabcontent-grids">  
								<div id="owl-demo5" class="owl-carousel"> 
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+13+'"><img width="180px" height="215px" src="Image/ProductImage/olaiya.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+13+'">欧莱雅口红</a></h4>
												<p>让你更美丽</p>
												<h5>$566</h5> 
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												 
											</div>   
										</div>   
									</div>
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
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId='+19+'"><img width="180px" height="215px" src="Image/ProductImage/jifanxi.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+19+'">纪梵希口红</a></h4>
												<p>爱上你的唇</p> 
												<h5>$1000</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+21+'"><img width="180px" height="215px" src="Image/ProductImage/yashilandai.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+21+'">雅诗兰黛水乳</a></h4>
												<p>保湿洁乳</p>
												<h5>$2000</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+24+'"><img width="180px" height="215px" src="Image/ProductImage/meibaolian.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+24+'">美宝莲眼影</a></h4>
												<p>防水防旱防晒</p>
												<h5>$800</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
											
											</div>         
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+46+'"><img width="180px" height="215px" src="Image/ProductImage/shengluolan.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+46+'">圣罗兰口红</a></h4>
												<p>从唇间滑过</p>
												<h5>$6000</h5> 
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												 
											</div>   
										</div>   
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag"><h6>Sale</h6></div>
											<a href="productServlet?op=looksingle&proId='+47+'"><img width="180px" height="215px" src="Image/ProductImage/meike.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+47+'">魅可口红</a></h4>
												<p>经典口红</p> 
												<h5>$156</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>       
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<div class="new-tag"><h6>New</h6></div>
											<a href="productServlet?op=looksingle&proId='+48+'"><img width="180px" height="215px" src="Image/ProductImage/diao.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+48+'">迪奥口红</a></h4>
												<p>猎艳记</p>
												<h5>$190</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
												
											</div>        
										</div>  
									</div>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="productServlet?op=looksingle&proId='+50+'"><img width="180px" height="215px" src="Image/ProductImage/oshiman.jpg" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="productServlet?op=looksingle&proId='+50+'">欧诗曼水乳</a></h4>
												<p>捍卫你的面容</p>
												<h5>$240</h5>
												
													<button type="button" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车</button>
											
											</div>         
										</div>  
									</div>
								</div> 
							</div>
						</div>
						
						
						
					</div>   
				</div>  
			</div>  	
		</div>  	
	</div> 
	<!-- //welcome -->
	<!-- add-products -->
	<div class="add-products"> 
		<div class="container">  
			<div class="add-products-row">
				<div class="w3ls-add-grids" style="background-image:url(images/img6.jpg)">
					<a href="products1.html"> 
						
					</a>
				</div>
				<div class="w3ls-add-grids w3ls-add-grids-mdl" style="background-image:url(images/img7.jpg)">
					<a href="products1.html"> 
						
					</a>
				</div>
				<div class="w3ls-add-grids w3ls-add-grids-mdl1" style="background-image:url(images/111.jpg)">
					<a href="products.html"> 
						
					</a>
				</div>
				<div class="clerfix"> </div>
			</div>  	
		</div>  	
	</div>
	<!-- //add-products -->
	<!-- coming soon -->
	
	<!-- //coming soon -->
	<!-- deals -->
	<div class="deals"> 
		<div class="container"> 
			<h3 class="w3ls-title">今日好货 </h3>
			<div class="deals-row">
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=24" class="wthree-btn"> 
						<div class="focus-image"><i class="fa fa-mobile"></i></div>
						<h4 class="clrchg">手机</h4> 
					</a>
				</div>
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=25" class="wthree-btn wthree1"> 
						<div class="focus-image"><i class="fa fa-laptop"></i></div>
						<h4 class="clrchg"> 电脑</h4> 
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=22" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-wheelchair"></i></div>
						<h4 class="clrchg">面包</h4>
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=16" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-home"></i></div>
						<h4 class="clrchg">电视机</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products.jsp?typeid=28" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-book"></i></div>
						<h4 class="clrchg">牙膏</h4> 
					</a>
				</div>
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products.jsp?typeid=21" class="wthree-btn wthree4"> 
						<div class="focus-image"><i class="fa fa-asterisk"></i></div>
						<h4 class="clrchg">口红</h4>
					</a>
				</div>
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products.jsp?typeid=26" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-gamepad"></i></div>
						<h4 class="clrchg">牙刷</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products.jsp?typeid=23" class="wthree-btn wthree"> 
						<div class="focus-image"><i class="fa fa-shopping-basket"></i></div>
						<h4 class="clrchg">饮料</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products.jsp?typeid=27" class="wthree-btn wthree5"> 
						<div class="focus-image"><i class="fa fa-medkit"></i></div>
						<h4 class="clrchg">水乳套装</h4> 
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products.jsp?typeid=20" class="wthree-btn wthree1"> 
						<div class="focus-image"><i class="fa fa-car"></i></div>
						<h4 class="clrchg">眼影</h4> 
					</a>
				</div>
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=18" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-cutlery"></i></div>
						<h4 class="clrchg">电饭煲</h4> 
					</a>
				</div>
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=17" class="wthree-btn wthree5"> 
						<div class="focus-image"><i class="fa fa-futbol-o"></i></div>
						<h4 class="clrchg">洗衣机</h4> 
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=16" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-gamepad"></i></div>
						<h4 class="clrchg">电视机</h4> 
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products.jsp?typeid=14" class="wthree-btn "> 
						<div class="focus-image"><i class="fa fa-gift"></i></div>
						<h4 class="clrchg">上衣</h4> 
					</a>
				</div> 
				<div class="clearfix"> </div>
			</div>  	
		</div>  	
	</div> 
	<!-- //deals --> 
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
	<!-- countdown.js -->	
	<script src="js/jquery.knob.js"></script>
	<script src="js/jquery.throttle.js"></script>
	<script src="js/jquery.classycountdown.js"></script>
		<script>
			$(document).ready(function() {
				$('#countdown1').ClassyCountdown({
					end: '1388268325',
					now: '1387999995',
					labels: true,
					style: {
						element: "",
						textResponsive: .5,
						days: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#1abc9c",
								lineCap: 'round'
							},
							textCSS: 'font-weight:300; color:#fff;'
						},
						hours: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#05BEF6",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						},
						minutes: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#8e44ad",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						},
						seconds: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#f39c12",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						}

					},
					onEndCallback: function() {
						console.log("Time out!");
					}
				});
			});
		</script>
	<!-- //countdown.js -->
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster --> 
</body>
</html>