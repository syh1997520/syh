<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<title>后台登录</title>
</head>

<script>
       		function checkchoice(){
       			console.log("执行");
       		if($("#whichone").val()==0){
       			alert("请选择登陆的身份");
       			return false;
       		}
       			return true;
       		}
       		
       	</script>
<body class="login_style login-layout">
 <div class="loginbody">
  <div class="login-container">
   <div class="login_logo"><img src="images/logo.png" /></div>
    <div class="position-relative">
     <div id="login_add" class="login-box widget-box no-border visible">
      <div class="widget-main">
      <h4 class="header blue lighter bigger" id="h4"><i class="fa fa-coffee green"></i>&nbsp;&nbsp;&nbsp;登录</h4>
      <form onsubmit="return checkchoice()" action="businessServlet?op=backlogin" method="post">
      <div class="clearfix">
       <div class="login_icon"><img src="images/login_bg.png" /></div>
       <div class="add_login_cont Reg_log_style ">
       	<input type="hidden" name="choice" id="whichone" value="0"/>
         <ul class="r_f">
          <li class="frame_style form_error"><label class="user_icon"></label><input name="username" data-name="用户名" type="text" id="username" placeholder="用户名"></li>
          <li class="frame_style form_error"><label class="password_icon"></label><input name="userpwd" data-name="密码" type="password" id="userpwd" placeholder="密码"></li>
        <span style="color:red">${loginmsg} </span>
          <!-- <label class="Codes_icon"></label>
         
          	
          		 <div class="code">
                <input type="text" value="" placeholder="请输入验证码（不区分大小写）" class="input-val" style="height: 40px;width: 200px;">
                 <canvas id="canvas" width="70px;" height="38px;"></canvas>
          	 </div> -->
          	 <style>
  .input-val {
  width: 200px;
  height: 32px;
  border: 1px solid #ddd;
  box-sizing: border-box;
  }
  #canvas {
  vertical-align: middle;
  box-sizing: border-box;
  border: 1px solid #ddd;
  cursor: pointer;
  }
  .btn1 {
  display: block;
  margin-top: 20px;
  height: 32px;
  width: 100px;
  font-size: 16px;
  color: #fff;
  background-color: #457adb;
  border: none;
  border-radius: 50px;
  }
 </style>
  <!-- <script>
$(function(){
  var show_num = [];
  draw(show_num);
  $("#canvas").on('click',function(){
   draw(show_num);
  })
  $(".btn1").on('click',function(){
   var val = $(".input-val").val().toLowerCase();
   var num = show_num.join("");
   /*if(val==''){
    alert('请输入验证码！');
   }else if(val == num){
    alert('验证码正确！');
    $(".input-val").val('');
    window.loction.href="storestore.jsp";
    // draw(show_num);
   }else{
    alert('验证码错误！请重新输入！');
    $(".input-val").val('');
    // draw(show_num);
   }*/
  })
 })
 //生成并渲染出验证码图形
 function draw(show_num) {
  var canvas_width=$('#canvas').width();
  var canvas_height=$('#canvas').height();
  var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
  var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
  canvas.width = canvas_width;
  canvas.height = canvas_height;
  var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
  var aCode = sCode.split(",");
  var aLength = aCode.length;//获取到数组的长度
  for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
   var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
   // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
   var deg = Math.random() - 0.5; //产生一个随机弧度
   var txt = aCode[j];//得到随机的一个内容
   show_num[i] = txt.toLowerCase();
   var x = 10 + i * 20;//文字在canvas上的x坐标
   var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
   context.font = "bold 23px 微软雅黑";
   context.translate(x, y);
   context.rotate(deg);
   context.fillStyle = randomColor();
   context.fillText(txt, 0, 0);
   context.rotate(-deg);
   context.translate(-x, -y);
  }
  for (var i = 0; i <= 5; i++) { //验证码上显示线条
   context.strokeStyle = randomColor();
   context.beginPath();
   context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
   context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
   context.stroke();
  }
  for (var i = 0; i <= 30; i++) { //验证码上显示小点
   context.strokeStyle = randomColor();
   context.beginPath();
   var x = Math.random() * canvas_width;
   var y = Math.random() * canvas_height;
   context.moveTo(x, y);
   context.lineTo(x + 1, y + 1);
   context.stroke();
  }
 }
 //得到随机的颜色值
 function randomColor() {
  var r = Math.floor(Math.random() * 256);
  var g = Math.floor(Math.random() * 256);
  var b = Math.floor(Math.random() * 256);
  return "rgb(" + r + "," + g + "," + b + ")";
 }
</script> -->


    <!-- <script type="text/javascript">
    	function change(){
    		if(document.getElementById("btn2").checked){
    			window.location.href="storestore.jsp";
    			return;
    		}
    		if(document.getElementById("btn3").checked){
    			window.location.href="storestore.jsp";
    			return;
    		}
    	}
    </script> -->
    
    
    
    
          </li> 
         
         </ul>       
        
       </div>
       
       <div class="login_Click_Actions">          
          <button style="padding-bottom: 10px;height: 50px;margin-top: 00px;"  type="submit" class="btn1" id="denglu" value="" ><i class="fa fa-key"></i>&nbsp;&nbsp;登录</button>
          <!--<div style="padding-top: 9x;text-align: left;"><a href="#" onclick="yzm()">看不清换一张</a></div>-->
          <!-- <div style="padding-top: 9x;text-align: left;"><canvas id="canvas" width="100px;" height="38px;"></canvas></div> -->
       </div>
      </div>
      </form>
      <div style="height: 40px; ">
      	<div style="width: 300px;margin-left: 196px;">
      		<input id="btn2" class="cla" checked="checked" value="管理员登录" onclick="return testchange(1)" type="button" style=" color: gray;height: 40px;font-size: 16px;background-color: white;"/>
      		
      		<input id="btn3" class="cla" checked="checked" value="商家登录" onclick="return testchange(2)" type="button" style=" color: gray;margin-left:75px ;height: 40px;font-size: 16px;background-color: white;"/>
      	</div>
      </div>
      </div>
     </div>
   </div>
   </div>
   </div>
</body>
</html>
<style type="text/css">

</style>
 <script type="text/javascript">
	 
	
	
	

	function testchange(key){
		var h4=document.getElementById("h4");
		var h5=document.getElementById("h4");
		var btn1 = document.getElementById('btn2');
		var btn2=document.getElementById("btn3")
		
		btn1.style.backgroundColor="white";
        btn2.style.backgroundColor="white";
     
       if(key==1){
       	btn1.style.backgroundColor="blue";
       	h4.innerHTML='<i class="fa fa-coffee green"></i>&nbsp;&nbsp;管理员登录';
       	$("#whichone").val("1");
       }else if(key==2){
       	btn2.style.backgroundColor="blue";
       	h5.innerHTML='<i class="fa fa-coffee green"></i>&nbsp;&nbsp;商家登录';
       	$("#whichone").val("2");
       }
        
	};
	
	
/* $('#denglu').on('click', function(){
	     var num=0;
		 var str="";
     $("input[type$='text'],input[type$='password']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("data-name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('登陆成功！',{
               title: '提示框',				
			   icon:1,		
			  });
	          location.href="storestore.jsp";
			   layer.close(index);	
		  }		  		     								
	});
  $(document).ready(function(){
	 $("input[type='text'],input[type='password']").blur(function(){
        var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_error');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_error');
        }
    });
	$("input[type='text'],input[type='password']").focus(function(){		
		var $el = $(this);
        var $parent = $el.parent();
        $parent.attr('class','frame_style').removeClass(' form_errors');
        if($el.val()==''){
            $parent.attr('class','frame_style').addClass(' form_errors');
        } else{
			 $parent.attr('class','frame_style').removeClass(' form_errors');
		}
	});
 }) */
</script> 
