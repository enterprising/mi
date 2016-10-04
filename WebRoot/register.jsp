<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<title>小米账号-注册</title>
</head>
<style>
body{
	background-color: #F5F5F5;
}
#zhuce {
	
	margin-left: 240px;
	margin-top: 140px;
}

#zhuce_2 {
	width:800px;
	height:1000px;
	margin-left: 280px;
	margin-top: 0px;
	background-color: #FFFFFF;
}
#tu{
	padding-left: 100px;
	padding-top: 50px;
}
</style>
<body>
	<div id="zhuce_2">
		<img src="image/zhuce.jpg" id="tu"/><br>
		<input type="text" id="username" style="width: 250px;height: 40px;margin-left: 210px;margin-top: 20px;"
			onblur="checkusername()" value="*请输入账号" onclick="zhanghao()">
			<label id="usernameTip"> </label><br> <br> 
		<input type="password" id="password"
			style="width: 250px;height: 40px;margin-left: 210px;margin-top: 20px;" > 
			<label id="passwordTip">*请输入密码</label><br> <br> 
		<input type="password" id="password2"
			style="width: 250px;height: 40px;margin-left: 210px;margin-top: 20px;" onblur="checkpassword()">
			<label
			id="password2Tip">* 请再次输入密码</label><br> <br> 
		<input type="text" name="code" id="code" style="width: 250px;height: 40px;margin-left: 210px;margin-top: 20px;" value="*请输入验证码：" onclick="yzmgo()">
			<label
			id="code2" style="display: none;margin-left: 240px;margin-top: 20px;color: red;" >验证码输入错误！</label><br>
			<br> <span style="width: 250px;height: 40px;margin-left: 210px;margin-top: 20px;">验证码：</span> <img src="image.do" id="img"
			onclick="change()"><br> <br> 
		<input type="button"
			onclick="zhuce()" value="注册" style="width: 250px;height: 40px;margin-left: 210px;margin-top: 20px;background-color: #EF5B00;border: none;color: #FFFFFF"" >
	</div>
	<script>
		var x=0;
	    var p=0;
		function zhanghao(){
			document.getElementById("username").value="";
		}
		function yzmgo(){
			//alert("ok");
			document.getElementById("code").value="";
		}

		function checkusername() {
			//写ajax 验证所用注册账号是否已经被使用
			//alert("checkusername");
			var username = document.getElementById("username").value;
			if(username==null||username.trim().length==0){
				document.getElementById("usernameTip").style.color="red";
				document.getElementById("usernameTip").innerHTML = "账号不能为空！";
				document.getElementById("username").value="*请输入账号";
				return ;
			}
			//创建ajax核心对象
			var ajax = null;
			try {
				ajax = new XMLHttpRequest();//新版本
			} catch (e) {
				ajax = new ActiveXObject("Microsoft.XMLHttp");//老版本
			}
			//alert("ajax");
			ajax.onreadystatechange = function() {
				//alert("ajaxreadystate");

				if (ajax.status == 200 && ajax.readyState == 4) { //200表示请求成功 ， 4表示响应成功 
					//
					var ret = ajax.responseText; //得到响应后servlet返回的一个文本
					//alert(ret);
					if (ret == "no") {
						document.getElementById("usernameTip").style.color="red";
						document.getElementById("usernameTip").innerHTML = "× 用户名已被注册";
						document.getElementById("username").value="*请输入账号";
						return false;
					} else {
						document.getElementById("usernameTip").style.color="blue";
						document.getElementById("usernameTip").innerHTML = "√ 该用户名可以使用";
						return true;
					}
				}

			}
			//打开ajax通道
			ajax.open("post", "user.do?method=ajax&username=" + username, true);
			ajax.send(null);

		}
		function checkcode() {
			var code = document.getElementById("code").value;
			var ajx = null;
			try {
				ajax = new XMLHttpRequest();//新版本
			} catch (e) {
				ajax = new ActiveXObject("Microsoft.XMLHttp");//老版本
			}
			//打开ajax通道
			ajax.open("get", "user.do?method=ajax2&code="+code , true);
			ajax.send(null);
			ajax.onreadystatechange = function(){
				if(ajax.status==200 && ajax.readyState==4){//200请求成功  4响应成功 
					var ret = ajax.responseText;//得到响应后servlet返回的一个文本
					//alert(ret);
					if(ret=="no"){
						alert("输入验证码错误");
						x=0;
						document.getElementById("code").value="";
						document.getElementById("code2").style.display="block";					
					}else{
						//alert("输入验证码正确");
						x=1;
						document.getElementById("code2").style.display="none";
					}
				}
			}
			//alert("验证码的判断！");
			//alert(x);
			
		}
		
		function checkpassword(){
			var password = document.getElementById("password").value;
			var password2 = document.getElementById("password2").value;
			if(password!=password2){
				p=0
				document.getElementById("password2Tip").style.color="red"
				document.getElementById("password2Tip").innerHTML="× 两次输入的密码不一致！";
				document.getElementById("password2").innerHTML="";
			}else{
				document.getElementById("password2Tip").style.color="blue"
			    document.getElementById("password2Tip").innerHTML="√ 正确！";
				p=1;
			}
		}
		
		function change() {
			document.getElementById("img").src = "image.do?x=" + Math.random(); //Math.random()避免验证码图片由于缓存，导致不能刷新
		}

		function zhuce() {
			//alert("ok");
		    checkcode();	
		    alert(x);
			if(x==1){
				alert("ok");
				var username = document.getElementById("username").value;
				var password = document.getElementById("password").value;
				location = "user.do?method=register&username=" + username
					+ "&password=" + password;
				
			}else{
				//alert("验证码错误！");
				document.getElementById("code").innerHTML="";
			}
		}
	</script>
</body>
