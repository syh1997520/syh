<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>评价页面</title>
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
    	if(${evamsg!=null}){
    		alert("您已被禁言，无法评论");
    		<%request.setAttribute("evamsg",null);%>
    	}
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
		$(function(){
			$.get("ShoppingCartServlet",{"op":"lookCart"},function(data){
				loadData2(data);
			})
		})
		
		$(function(){
			$(document).on("click","[name='minus']",function(){
				var $objI=$($(this).siblings("input")[0]);
				$($(this).siblings("input")[1]).removeAttr("disabled");
				if($objI.val()==1){
					$(this).prop("disabled","disabled");
					return;
				}
				else{
					$objI.val($objI.val()-0-1);
					if($objI.val()==1){
					$(this).prop("disabled","disabled");
				}
					$.get("ShoppingCartServlet",{"op":"changepronumber","shpifId":$objI.attr("data-shpifid"),"pronumber":$objI.val()},function(data){
						var infoCost=data.split(";")[0];
						var totalCost=data.split(";")[1];
						console.log($objI.parent("td")[0]);
						$objI.parent("td")[0].nextSibling.innerHTML=infoCost;
						$("#sumCount").html(totalCost);
					})
				}
			})
		})
		
		$(function(){
			$(document).on("click","[name='plus']",function(){
				var $objI=$($(this).siblings("input")[1]);
				$($(this).siblings("input")[0]).removeAttr("disabled");
				if($objI.val()-0+1>$($(this).siblings("span")[0]).html()-0){
					$(this).prop("disabled","disabled");
					return;
				}
				else{
					$objI.val($objI.val()-0+1);
					if($objI.val()-0+1>$($(this).siblings("span")[0]).html()-0){
					$(this).prop("disabled","disabled");
				}
					$.get("ShoppingCartServlet",{"op":"changepronumber","shpifId":$objI.attr("data-shpifid"),"pronumber":$objI.val()},function(data){
						var infoCost=data.split(";")[0];
						var totalCost=data.split(";")[1];
						$objI.parent("td")[0].nextSibling.innerHTML=infoCost;
						$("#sumCount").html(totalCost);
					})
				}
			})
		})
		
		function loadData1(data){
			$("#carbody").empty();
			for(var str in data){
				var objTr='<tr class="cartspace"><td colspan="6"></td> </tr>';
				objTr='<tr class="cartop"><td colspan="6"><input type="checkbox" class="checkStore"/><a> <span >'+str+'</span></a> </td></tr>';
				$(data[str]).each(function(index2,carinfo){
					console.log(carinfo)
					objTr+='<tr class="cartinfo">';
					objTr+='<td colspan="2"><input type="checkbox" class="checkGood"/> <img src="'+carinfo.pro.proImg.split(";")[0]+'" width="80px" height="80px" />'+carinfo.pro.proName+'</td>';	
					objTr+='<td class="cartproprice" id="onePrice">'+carinfo.pro.proPrice+'</td><td>';
					objTr+='<input type="button" id="minus" name="minus" value="-" ><input style="width: 40px; text-align: center;" type="text" name="amount" id="amount" value="'+carinfo.proNumber+'"><input type="button" name="plus" id="plus" value="+" ></td>';	
					objTr+='<td class="carprocost" id="sumPrice">'+carinfo.shpifCost+'</td><td><a>移除</a></td></tr>';
				})
				objTr+='<tr class="cartspace"><td colspan="6"></td> </tr>';
				$("#carbody").append(objTr);
			}
			}
		
		
		
			function loadData2(data){
			$("#carbody").empty();
			
			$.each(data,function(index,carinfoList) {
				
				var objTr='<tr class="cartspace"><td colspan="6"></td> </tr>';
				objTr='<tr class="cartop"><td colspan="6"><input type="checkbox" class="checkStore" name="infoid" value="'+carinfo.shpifId+'"/><a> <span >'+index+'</span></a> </td></tr>';
				$.each(carinfoList,function(index2,carinfo){
					objTr+='<tr class="cartinfo">';
					objTr+='<td colspan="2"><input type="checkbox" class="checkGood"/> <img src="'+carinfo.pro.proImg.split(";")[0]+'" width="80px" height="80px" />'+carinfo.pro.proName+'</td>';	
					objTr+='<td class="cartproprice" id="onePrice">'+carinfo.pro.proPrice+'</td>';
					objTr+='<td ><input type="button" name="minus" value="-" ><input data-shpifid="'+carinfo.shpifId+'"  style="width: 40px; text-align: center;" type="text" name="amount"  value="'+carinfo.proNumber+'" readonly><input type="button" name="plus" id="plus" value="+" ><br/>库存:<span style="color:red">'+carinfo.pro.proNumber+'</span></td>';	
					objTr+='<td class="carprocost" id="sumPrice">'+carinfo.shpifCost+'</td><td><a>移除</a></td></tr>';
				})
				objTr+='<tr class="cartspace"><td colspan="6"></td> </tr>';
				$("#carbody").append(objTr);
			});
			}
			/*$(data).each(function(index,carinfoList){
				console.log(data[carinfoList])
				var objTr='<tr class="cartspace"><td colspan="6"></td> </tr>';
				objTr='<tr class="cartop"><td colspan="6"><input type="checkbox" class="checkStore"/><a> <span >'+carinfoList[0].store.stoName+'</span></a> </td></tr>';
				$(carinfoList).each(function(index2,carinfo){
					objTr+='<tr class="cartinfo">';
					objTr+='<td colspan="2"><input type="checkbox" class="checkGood"/> <img src="'+carinfo.product.proImg.split(";")[0]+'" width="80px" height="80px" />'+carinfo.product.proName+'</td>';	
					objTr+='<td class="cartproprice" id="onePrice">'+carinfo.product.proPrice+'</td><td>';
					objTr+='<input type="button" id="minus" name="minus" value="-" ><input style="width: 40px; text-align: center;" type="text" name="amount" id="amount" value="'+carinfo.proNumber+'"><input type="button" name="plus" id="plus" value="+" readonly></td>';	
					objTr+='<td class="carprocost" id="sumPrice">'+carinfo.shpifCost+'</td><td><a>移除</a></td></tr>';
				})
				objTr+='<tr class="cartspace"><td colspan="6"></td> </tr>';
				$("#carbody").append(objTr);
			})*/
		
		
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
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.html"><span>S</span>mart <i>Bazaar</i></a></h1>
					<h6>Your stores. Your place.</h6> 
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
	<script>

   		$(function(){
   			var i=$("#amount").val();
   			var one=$("#onePrice").html();
   			 $("#sumPrice").html(one);
   			     $("#sumCount").html(one);
   			$("#minus").click(function(){
   				if(i>=2){
   					i--;
   					$("#amount").val(i);
   				}else{
   					$("#amount").val(i);
   				}
   				var sum=one*i;
   			    $("#sumPrice").html(sum);
   			     $("#sumCount").html(sum);
   			});
   			$("#plus").click(function(){
   				i++;
   				$("#amount").val(i);
   					var sum=one*i;
   			$("#sumPrice").html(sum);
   			 $("#sumCount").html(sum);
   			
   			});
   		});
   	</script>
	<div class="about" style="height: 800px;">
	<form action="evaluteServlet?op=addevalute" method="post">
		<div style="width: 1000px;height: 600px;padding-bottom:50px;margin: auto;border: 1px solid #000000;" >
		 <div class="col-xs-4" style="width: 500px;padding-top: 20px;">
       <label class="label_name col-xs-4" style="font-size: 20px;"><i></i>商品名:&nbsp;&nbsp;</label> 
        <div class="Add_content col-xs-16">
       <input name="proname" type="text"  class="col-xs-7" value="${odif.product.proName}" readonly/>
       </div>
		 </div>
		  <input type="hidden" value="${odif.odifId }" name="odifid"/>
		  <input type="hidden" value="${odif.proId }" name="proid"/>
		 <div class="col-xs-4" style="width: 500px;padding-top: 20px;">
       <label class="label_name col-xs-4" style="font-size: 20px;"><i></i>产品图片:&nbsp;&nbsp;</label> 
        <div class="Add_content col-xs-16">
       <img src="${fn:split(odif.product.proImg,';')[0] }" style="width:200px;height:200px">
       </div>
		 </div>
		  <div class="col-xs-4" style="width: 500px;padding-top: 20px;">
       <label class="label_name col-xs-4" style="font-size: 20px;"><i></i>商品评分:&nbsp;&nbsp;</label> 
        <div class="Add_content col-xs-16"></div>
      <style type="text/css">
.spa {
    color: #999;
}
.spa .sel {
    color: #f00;
}
 
</style>
       
<span class="spa" style="font-size: 20px;">
    <span>★</span>
    <span>★</span>
    <span>★</span>
    <span>★</span>
    <span>★</span>
</span><span id="starscore">0</span>分
<script type="text/javascript">
$(function(){
    $(".spa span").mouseenter(function(event){
        $(this).parent().find("span").addClass("sel");
        $(this).nextAll().removeClass("sel");
        $(this).parent().next().text($(this).index()+1);
        $("#score").val($("#starscore").html());
    });
});
 
</script>
		<input type="hidden" id="score" name="score"/> 
       <div class="col-xs-4" style="width: 900px;padding-top: 20px;">
       <label class="label_name col-xs-4" style="font-size: 20px;width: 130px;"><i></i>评价内容:&nbsp;&nbsp;</label> 
        <div class="Add_content col-xs-16" >
      <!-- <textarea class="form-control" rows="3" maxlength="200"></textarea>-->
       <textarea name="evainner" style="width: 600px;height:150px;" ></textarea>
       </div>
		 </div>
		 <div style="text-align: center;"><input type="submit" class="btn btn-primary btn-lg" value="提交评价" /></div>
		 </div>
		
		</div>
		</form>
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