<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign Up</title>
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
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
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
							</c:if>	 
						</ul> 
					</li> 
				</ul>
			</div>
				<div class="clearfix"> </div>
			</div>		
		</div><!-- //header-two -->
		<div class="header-three"><!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">商品列表</a>
						<nav class="cd-dropdown"> 
							<a href="#0" class="cd-close">Close</a>
							<ul class="cd-dropdown-content"> 
								<li><a href="offers.html">Today's Offers</a></li>
								<li class="has-children">
									<a href="#">Electronics</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products.html">All Electronics</a></li>
										<li class="has-children">
											<a href="#">MOBILE PHONES</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Electronics</a></li> 
												<li class="has-children">
													<a href="#0">SmartPhones</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="products.html">Android</a></li>
														<li><a href="products.html">Windows</a></li>
														<li><a href="products.html">Black berry</a></li>
													</ul>
												</li>
												<li> <a href="products.html">IPhones</a> </li>
												<li><a href="products.html">Tablets</a></li>
												<li><a href="products.html">IPad</a></li>
												<li><a href="products.html">Feature Phones</a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">LARGE APPLIANCES</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Electronics </a></li>
												<li><a href="products.html">Refrigerators</a></li> 
												<li><a href="products.html">Washing Machine</a></li>
												<li><a href="products.html">Office Technology</a></li>
												<li><a href="products.html">Air conditioner</a></li>
												<li><a href="products.html">Home Automation</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">ENTERTAINMENT</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Electronics</a></li>
												<li><a href="products.html">Tv & Accessories</a></li>
												<li><a href="products.html">Digital Camera</a></li>
												<li><a href="products.html">Gaming</a></li>
												<li><a href="products.html">Home Audio & Theater</a></li>
												<li class="has-children">
													<a href="#">Computer</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li> 
														<li><a href="products.html">Laptop </a></li>
														<li><a href="products.html">Gaming PC</a></li>
														<li><a href="products.html">Monitors</a></li>
														<li><a href="products.html">Networking</a></li>
														<li><a href="products.html">Printers & Supplies</a></li>
														<li><a href="products.html">Accessories</a></li>
													</ul>
												</li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">HOME APPLIANCES</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#0">All Electronics </a></li>
												<li class="has-children"><a href="#">Kitchen appliances</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0"> </a></li>
														<li><a href="products.html">Rice Cookers</a></li>
														<li><a href="products.html">Mixer Juicer</a></li>
														<li><a href="products.html">Grinder</a></li>
														<li><a href="products.html">Blenders & Choppers</a></li>
														<li><a href="products.html">Microwave Oven</a></li>
														<li><a href="products.html">Food Processors</a></li>
													</ul>
												</li>
												<li><a href="products.html">Purifiers</a></li>
												<li><a href="products.html">Geysers</a></li>
												<li><a href="products.html">Gas Stove</a></li>
												<li><a href="products.html">Vacuum Cleaner</a></li>
												<li><a href="products.html">Sewing Machine</a></li> 
												<li><a href="products.html">Heaters & Fans</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">SMALL DEVICES</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#0">All Electronics </a></li>
												<li><a href="products.html">Wifi Dongle</a></li>
												<li><a href="products.html">Router & Modem</a></li>
												<li class="has-children"><a href="#">Storage Devices</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0"> </a></li>
														<li><a href="products.html">Cloud Storage</a></li>
														<li><a href="products.html">Hard Disk</a></li>
														<li><a href="products.html">SSD</a></li>
														<li><a href="products.html">Pen Drive</a></li>
														<li><a href="products.html">Memory card</a></li> 
														<li><a href="products.html">Security Devices</a></li> 
													</ul>
												</li> 
												<li><a href="products.html">Office Supplies</a></li>
												<li><a href="products.html">Cut the Cable</a></li>
												<li><a href="products.html">Auto Electronics</a></li>  
											</ul>
										</li>
										<li class="has-children">
											<a href="#">PERSONAL CARE</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#0">All Electronics </a></li>
												<li><a href="products.html">Epilator</a></li> 
												<li><a href="products.html">Hair Styler</a></li>
												<li><a href="products.html">Trimmer & Shaver</a></li>
												<li><a href="products.html">Health Care</a></li> 
												<li><a href="products.html">cables</a></li>
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->
								<li class="has-children">
									<a href="#">Fashion Store</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products1.html">All Fashion Stores</a></li>
										<li class="has-children">
											<a href="#">GIRLS' CLOTHING</a> 
											<ul class="is-hidden">  
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Ethnic wear </a></li>
												<li><a href="products1.html">Maternity wear</a></li>
												<li><a href="products1.html">inner & nightwear </a></li>
												<li><a href="products1.html">casual wear </a></li>
												<li><a href="products1.html">formal wear</a></li>
												<li><a href="products1.html">Sports wear</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">BOYS' CLOTHING</a> 
											<ul class="is-hidden">  
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Jeans</a></li>  
												<li><a href="products1.html">Casual wear</a></li> 
												<li><a href="products1.html">Shorts</a></li> 
												<li><a href="products1.html">T-Shirts & Polos</a></li> 
												<li><a href="products1.html">Trousers & Chinos</a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">JACKETS</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Blazers</a></li>
												<li><a href="products1.html">Bomber jackets</a></li>
												<li><a href="products1.html">Denim Jackets</a></li>
												<li><a href="products1.html">Duffle Coats</a></li>
												<li><a href="products1.html">Leather Jackets</a></li>
												<li><a href="products1.html">Parkas</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">ACCESSORIES </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Watches </a></li>
												<li><a href="products1.html">Eyewear </a></li>
												<li><a href="products1.html">Jewellery </a></li>
												<li class="has-children">
													<a href="#">Footwear </a>  
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="products1.html">Ethnic</a></li>  
														<li><a href="products1.html">Casual wear</a></li>
														<li><a href="products1.html">Sports Shoes</a></li>
														<li><a href="products1.html">Boots</a></li>
													</ul> 
												</li> 
												<li><a href="products1.html">Stoles & Scarves</a></li>
												<li><a href="products1.html">Handbags</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">BEAUTY</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Perfumes & Deos</a></li>
												<li><a href="products1.html">Lipsticks & Nail Polish</a></li>
												<li><a href="products1.html">Beauty Gift Hampers</a></li> 
												<li><a href="products1.html">Personal Grooming</a></li>
												<li><a href="products1.html">Travel bags</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="products1.html">PERSONAL CARE</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Face Care</a></li>
												<li><a href="products1.html">Nail Care</a></li>
												<li><a href="products1.html">Hair Care</a></li>
												<li><a href="products1.html">Body Care</a></li>
												<li><a href="products1.html">Bath & Spa</a></li>   
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->
								<li class="has-children">
									<a href="products2.html">Kids Fashion & Toys</a> 
									<ul class="cd-secondary-dropdown is-hidden"> 
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products2.html">All Kids Fashions</a></li>
										<li class="has-children">
											<a href="products2.html">KIDS CLOTHING</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Ethnic wear </a></li> 
												<li><a href="products2.html">inner & Sleepwear </a></li>
												<li><a href="products2.html">Dresses & Frocks </a></li>
												<li><a href="products2.html">Winter wear</a></li>
												<li><a href="products2.html">Diaper & Accessories</a></li>
											</ul>
										</li> 
										<li class="has-children"><a href="#">KIDS FASHION</a>
											<ul class="is-hidden">  
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Footwear</a></li> 
												<li><a href="products2.html">Sunglasses </a></li>
												<li><a href="products2.html">School & Stationery</a></li>
												<li><a href="products2.html">Jewellery</a></li>
												<li><a href="products2.html">Hair bands & Clips</a></li>
											</ul>
										</li>
										<li class="has-children"><a href="#">Baby Care</a>
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Lotions, Oil & Powder </a></li> 
												<li><a href="products2.html">Soaps, Shampoo </a></li>
												<li><a href="products2.html">Bath Towels</a></li> 
												<li class="has-children">
													<a href="#">Feeding</a> 
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li> 
														<li><a href="products2.html">Baby Food </a></li>
														<li><a href="products2.html">Bottle Feeding </a></li>
														<li><a href="products2.html">Breast Feeding</a></li>  
													</ul>
												</li>  
												<li><a href="products2.html">Toddlers' Rooms</a></li> 	
											</ul><!-- .cd-secondary-dropdown --> 
										</li> <!-- .has-children -->								
										<li class="has-children"><a href="#">TOYS & GAMES </a>
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Art & Crafts</a></li> 
												<li><a href="products2.html">Educational Toys </a></li>
												<li><a href="products2.html">Baby Toys</a></li> 
												<li><a href="products2.html">Outdoor Play </a></li> 
												<li><a href="products2.html">Musical Instruments</a></li>
											</ul>
										</li>
										<li> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Toy Tips & Trends</a></li> 
												<li><a href="products2.html">Preschool Toys</a></li>
												<li><a href="products2.html">Musical Instruments</a></li> 
												<li><a href="products2.html">Bikes & Ride-Ons</a></li>
												<li><a href="products2.html">Video Games</a></li>
												<li><a href="products2.html">PC & Digital Gaming</a></li>
											</ul>	
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children --> 
								<li class="has-children">
									<a href="#">Home, Furniture & Patio</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products3.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Kitchen Uses</a> 
											<ul class="is-hidden">  
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Dinner Sets </a></li> 
												<li><a href="products3.html">Cookware & Bakeware </a></li>
												<li><a href="products3.html">Containers & Jars </a></li>
												<li><a href="products3.html">Kitchen Tools </a></li>
												<li><a href="products3.html">Food Storage</a></li>
												<li><a href="products3.html">Casseroles</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Furniture </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Bedroom </a></li> 
												<li><a href="products3.html">Dining Room </a></li>
												<li><a href="products3.html">Kids' Furniture </a></li>
												<li><a href="products3.html">Living Room</a></li>
												<li><a href="products3.html">Office</a></li>
												<li><a href="products3.html">Mattresses</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Home Decor </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Lighting</a></li> 
												<li><a href="products3.html">Painting</a></li>
												<li><a href="products3.html">Curtains & Blinds</a></li>
												<li><a href="products3.html">Patio Furniture</a></li>
												<li><a href="products3.html">Wardrobes & Cabinets</a></li>
												<li><a href="products3.html">Mattresses</a></li>
											</ul>
										</li>  
										<li class="has-children">
											<a href="#">Gardening & Lawn </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"> </a></li>  
												<li><a href="products3.html">Gardening </a></li> 
												<li><a href="products3.html">Landscaping </a></li>
												<li><a href="products3.html">Sheds</a></li>
												<li><a href="products3.html">Outdoor Storage  </a></li>
												<li><a href="products3.html">Garden & Ideas </a></li>
												<li><a href="products3.html">Patio Tips</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Garage Storage</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Baskets & Bins </a></li> 
												<li><a href="products3.html">Garage Door Openers</a></li>
												<li><a href="products3.html">Free Standing Shelves </a></li>
												<li><a href="products3.html">Floor cleaning</a></li>
												<li><a href="products3.html">Tool Kits</a></li>
											</ul>
										</li>  
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								<li class="has-children">
									<a href="#">Sports, Fitness & Outdoor</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products4.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Single Sports </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Bikes </a></li> 
												<li><a href="products4.html">Fishing  </a></li>
												<li><a href="products4.html">Cycling </a></li>
												<li><a href="products4.html">Musical Instruments</a></li>
												<li><a href="products4.html">Archery </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Team Sports</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Cricket </a></li> 
												<li><a href="products4.html">Badminton </a></li>
												<li><a href="products4.html">Swimming Gear </a></li>
												<li><a href="products4.html">Sports Apparel </a></li>
												<li><a href="products4.html">Indoor games</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Fitness </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Fitness Accessories </a></li> 
												<li><a href="products4.html">Exercise Machines </a></li>
												<li><a href="products4.html">Ellipticals </a></li>
												<li><a href="products4.html">Home Gyms</a></li> 
												<li><a href="products4.html">Exercise Bikes</a></li> 
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Camping </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html"> Airbeds</a></li> 
												<li><a href="products4.html">Tents </a></li>
												<li><a href="products4.html">Gazebo's & Shelters</a></li>
												<li><a href="products4.html">Coolers </a></li>
												<li><a href="products4.html">Canopies</a></li>
												<li><a href="products4.html">Sleeping Bags</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Camping Tools</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Shooting </a></li> 
												<li><a href="products4.html">Knives & Tools </a></li>
												<li><a href="products4.html">Optics & Binoculars </a></li>
												<li><a href="products4.html">Lights & Lanterns </a></li>
												<li><a href="products4.html">Hunting Clothing </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Other</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Riding Gears & More </a></li> 
												<li><a href="products4.html">Body Massagers </a></li>
												<li><a href="products4.html">Health Monitors </a></li>
												<li><a href="products4.html">Health Drinks </a></li> 
											</ul>
										</li> 	
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								<li class="has-children">
									<a href="#">Grocery store</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products5.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Veggies & Fruits </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Vegetables </a></li> 
												<li><a href="products5.html">Fruits </a></li>
												<li><a href="products5.html">Dry Fruits</a></li> 
												<li><a href="products5.html">Snacks & Cookies </a></li>
												<li><a href="products5.html">Breakfast & Cereal</a></li> 
											</ul> 
										</li> 
										<li class="has-children">
											<a href="#">Packet Food</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Beverages </a></li> 
												<li><a href="products5.html">Baking </a></li>
												<li><a href="products5.html">Emergency Food </a></li>
												<li><a href="products5.html">Candy & Gum </a></li>
												<li><a href="products5.html">Meals & Pasta </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Shop All Pets </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Dogs </a></li>  
												<li><a href="products5.html">Fish </a></li>												
												<li><a href="products5.html">Cats</a></li>
												<li><a href="products5.html">Birds </a></li>
												<li><a href="products5.html">Pet Food </a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Household Essentials </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Laundry Room </a></li> 
												<li><a href="products5.html">Paper & Plastic</a></li>
												<li><a href="products5.html">Pest Control </a></li>
												<li><a href="products5.html">Batteries </a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Food Shops </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Fresh Food</a></li> 
												<li><a href="products5.html">Food Gifts </a></li>
												<li><a href="products5.html">Frozen Food </a></li>
												<li><a href="products5.html">Organic </a></li>
												<li><a href="products5.html">Gluten Free </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Tips </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Pets Growth</a></li> 
												<li><a href="products5.html">Recipes </a></li>
												<li><a href="products5.html">Snacks</a></li>
												<li><a href="products5.html">Nutrition</a></li> 
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								<li class="has-children">
									<a href="#">Photo, Gifts & Office Supplies</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products6.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Trending Now </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Best Priced</a></li> 
												<li><a href="products6.html">Chocolates </a></li>
												<li><a href="products6.html">Gift Cards </a></li>
												<li><a href="products6.html">Fashion & Accessories </a></li>
												<li><a href="products6.html">Decorative Plants </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Photos </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Shelf animation </a></li> 
												<li><a href="products6.html">3D-rendered </a></li>
												<li><a href="products6.html">gift builder </a></li>
												<li><a href="products6.html">Frames</a></li>
												<li><a href="products6.html">Wall Decor</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Gifts </a> 
											<ul class="is-hidden">	
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Personalized Gifts </a></li> 
												<li><a href="products6.html">Flowers </a></li>
												<li><a href="products6.html">Cards & Toys</a></li>
												<li><a href="products6.html">Show pieces </a></li>
												<li><a href="products6.html">Photo Books</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Favourite Brands </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Archies </a></li> 
												<li><a href="products6.html">Jewel Fuel </a></li>
												<li><a href="products6.html">Ferns N Petals </a></li>
												<li><a href="products6.html">Happily Unmarried</a></li>
												<li><a href="products6.html">Chumbak</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Office</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Calendars</a></li> 
												<li><a href="products6.html">Mousepads</a></li>
												<li><a href="products6.html">Phone Cases</a></li>
												<li><a href="products6.html">Tablet & Laptop Cases</a></li>
												<li><a href="products6.html">Mounted Photos</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Combos </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Chocolates </a></li> 
												<li><a href="products6.html">Dry Fruits</a></li>
												<li><a href="products6.html">Sweets</a></li>
												<li><a href="products6.html">Snacks</a></li>
												<li><a href="products6.html">Cakes</a></li>
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li> 
								<li class="has-children">
									<a href="#">Health, Beauty & Pharmacy</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products7.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Health</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Home Health Care </a></li> 
												<li><a href="products7.html">Sports Nutrition </a></li>
												<li><a href="products7.html">Vision </a></li>
												<li><a href="products7.html">Vitamins </a></li>
												<li><a href="products7.html">Diet & Nutrition </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Health Tips</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Diet</a></li> 
												<li><a href="products7.html">Exercise Tips  </a></li>
												<li><a href="products7.html">Vitamin Balance</a></li>
												<li><a href="products7.html">Health Insurance</a></li>
												<li><a href="products7.html">Funeral</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Beauty </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Massage & Spa </a></li> 
												<li><a href="products7.html">Face Wash</a></li>
												<li><a href="products7.html">Facial Cleanser</a></li>
												<li><a href="products7.html">Makeup </a></li>
												<li><a href="products7.html">Beauty Tips</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Pharmacy </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Home Delivery </a></li> 
												<li><a href="products7.html">History & Reports </a></li>
												<li><a href="products7.html">Transfer Prescriptions </a></li>
												<li><a href="products7.html">Health CheckUp</a></li>
												<li><a href="products7.html">Mobile App</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Pharmacy Center </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Diabetes Shop </a></li> 
												<li><a href="products7.html">Medicine Cabinet </a></li>
												<li><a href="products7.html">Vitamin Selector</a></li>
												<li><a href="products7.html">Pharmacy Help</a></li> 
											</ul>
										</li>  
									</ul><!-- .cd-secondary-dropdown --> 
								</li>
								<li class="has-children">
									<a href="#">Automotive</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products8.html">All Products</a></li>
										<li class="has-children">
											<a href="#">All Motors </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Bikes </a></li> 
												<li><a href="products8.html">Yachts </a></li>
												<li><a href="products8.html">Scooters </a></li>
												<li><a href="products8.html">Autos</a></li>
												<li><a href="products8.html">Bus</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Accessories </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Vehicle Electronics</a></li> 
												<li><a href="products8.html">Stereos & Monitors</a></li>
												<li><a href="products8.html">Bluetooth Devices</a></li>
												<li><a href="products8.html">GPS Navigation</a></li>
												<li><a href="products8.html">Speakers & Tweeters</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Safety & Security </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Anti-Theft Devices </a></li> 
												<li><a href="products8.html">Helmets</a></li>
												<li><a href="products8.html">Sensors</a></li>
												<li><a href="products8.html">Auto Repair Tools </a></li>
												<li><a href="products8.html">Antifreeze & Coolants </a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Car Interiors</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Stereos </a></li> 
												<li><a href="products8.html">Floor Mats </a></li>
												<li><a href="products8.html">Seat Covers</a></li>
												<li><a href="products8.html">Chargers </a></li>
												<li><a href="products8.html">Audio Finder </a></li>
											</ul>
										</li>  
										<li class="has-children">
											<a href="#">Exterior Accessories </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Wheel covers </a></li> 
												<li><a href="products8.html">Car Lighting </a></li>
												<li><a href="products8.html">Polish & Waxes</a></li>
												<li><a href="products8.html">Cargo Management</a></li>
												<li><a href="products8.html">Car Decoration </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Car Care</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Auto Tips & Advice </a></li> 
												<li><a href="products8.html">Car Washes & Cleaners </a></li>
												<li><a href="products8.html">Car Wax & Polish</a></li>
												<li><a href="products8.html">Cleaning Tools</a></li>
												<li><a href="products8.html">Detailing Kits </a></li>
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li>
								<li class="has-children">
									<a href="#">Books, Music & Movies</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products9.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Books</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li class="has-children"><a href="#">Exam books </a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="products9.html">CAT/MAT/XAT</a></li>
														<li><a href="products9.html">Civil Services</a></li>
														<li><a href="products9.html">AFCAT</a></li>
														<li><a href="products9.html">New Releases</a></li>
													</ul>												
												</li>
												<li><a href="products9.html">Academic Text </a></li>
												<li><a href="products9.html">Romance Books </a></li>
												<li><a href="products9.html">Journals </a></li>
												<li><a href="products9.html">Children's & Teen Books </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Music</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">New Releases </a></li> 
												<li><a href="products9.html">Country Music </a></li>
												<li><a href="products9.html">Musical Instruments </a></li>
												<li><a href="products9.html">Collections</a></li>
												<li><a href="products9.html">Boxed Sets </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Music Combo</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">Pop </a></li> 
												<li><a href="products9.html">Preorders </a></li>
												<li><a href="products9.html">Album Songs</a></li>
												<li><a href="products9.html">Top 50 CDs </a></li>
												<li><a href="products9.html">Music DVDs </a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Movies</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">New Releases </a></li> 
												<li><a href="products9.html">Children & Family </a></li>
												<li><a href="products9.html">Action</a></li>
												<li><a href="products9.html">Classic Movies </a></li>
												<li><a href="products9.html">Bollywood Movies </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Movies Combo</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">Hollywood Movies </a></li> 
												<li><a href="products9.html">Digital Movies </a></li>
												<li><a href="products9.html">Boxed Sets</a></li>
												<li><a href="products9.html">Animated</a></li>
												<li><a href="products9.html">Adventure</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">TV Shows</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">Serials</a></li> 
												<li><a href="products9.html">Best Programs</a></li>
												<li><a href="products9.html">Celebrations</a></li>
												<li><a href="products9.html">Top Shows</a></li> 
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li>  
								<li><a href="sitemap.html">Full Site Directory </a></li>  
							</ul> <!-- .cd-dropdown-content -->
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
	<script type="text/javascript">
	$(function(){
		$("#loginname").on("blur",function(){
			$.get("userInfoServlet",{"r":"registerloginname","loginname":$(loginname).val()},function(data){
				if(data=="用户名合法"){
					$("#namemsg").css("color","green");
				}
				else{
					$("#namemsg").css("color","red");
				}
				$("#namemsg").html(data);
			});
		})
		
		$("#password").on("blur",function(){
			console.log($(this).val().length);
			if($(this).val().length<6||$(this).val().length>12){
				$("#passwordmsg").css("color","red");
				$("#passwordmsg").html("密码长度不合法（6-12位）");
				$("#passwordcheckmsg").css("color","red")
				$("#passwordcheckmsg").html("");
				$("#passwordcheck").val("");
			}
			else{
				$("#passwordmsg").css("color","green");
				$("#passwordmsg").html("密码合法");
			}
		})
		
		$("#passwordcheck").on("blur",function(){
			if($("#passwordmsg").css("color")!="rgb(0, 128, 0)"){
				$("#passwordcheckmsg").css("color","red");
				$("#passwordcheckmsg").html("第一次密码未通过验证");
				return;
			}
			if($(this).val()==$("#password").val()){
				$("#passwordcheckmsg").css("color","green");
				$("#passwordcheckmsg").html("两次密码一致");
			}else{
				$("#passwordcheckmsg").css("color","red");
				$("#passwordcheckmsg").html("两次密码不一致");
			}
		})
		
		$("#username").on("blur",function(){
			$.get("userInfoServlet",{"r":"registerusername","username":$(this).val()},function(data){
				if(data=="昵称合法"){
					$("#usernamemsg").css("color","green");
				}
				else{
					$("#usernamemsg").css("color","red");
				}
				$("#usernamemsg").html(data);
			});
		})
		
	})
	function checksubmit(){
		if($("#namemsg").css("color")!="rgb(0, 128, 0)"){
			alert("请填写合法的登录名");
			return false;
		}
		if($("#passwordmsg").css("color")!="rgb(0, 128, 0)"){
			alert("请填写合法的密码");
			return false;
		}
		if($("#passwordcheckmsg").css("color")!="rgb(0, 128, 0)"){
			alert("请进行密码验证");
			return false;
		}
		if($("#usernamemsg").css("color")!="rgb(0, 128, 0)"){
			alert("请填写合法的昵称");
			return false;
		}
		return true;
	}
	</script>
	<!-- sign up-page -->
	<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">创建账号</h3>  
			<div class="login-body">
				<form action="userInfoServlet?r=register" method="post" onsubmit="return checksubmit()">
					<input id="loginname" type="text" class="user" name="loginname" placeholder="输入6-12位的登录名" required=""><span id="namemsg"></span>
					<input id="password" type="password" class="lock" name="password" placeholder="输入6-12位密码" required=""><span id="passwordmsg"></span>
					<input id="passwordcheck" type="password" name="passwordcheck" class="lock" placeholder="确认密码" required=""><span id="passwordcheckmsg"></span>
					<input id="username" type="text" class="user" name="username" placeholder="输入昵称3-10字" required=""><span id="usernamemsg"></span><br/>
					<label class="checkbox-inline"> <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="男" checked style="margin-left: 30px;">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<label class="checkbox-inline"> <input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="女">女</label>
					<input type="submit" value="立即注册 ">
					<div class="forgot-grid">
						
						<div class="clearfix"> </div>
					</div>
				</form>
			</div>  
			<h6>已经注册? <a href="login.html">立即登录 »</a> </h6>  
		</div>
	</div>
	<!-- //sign up-page --> 
	<!-- footer-top -->
	
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