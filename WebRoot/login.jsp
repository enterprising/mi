<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<title>小米账号-登陆</title>
</head>
<style>
body{
	background-color: #F5F5F5;
}
#login_mi {
	left: 200px; 
	width:800px;
	height:800px;
	margin-left : 260px;
	margin-top: 0px;
	background-color: #FFFFFF;
}


</style>
<body>
	<div id="login_mi">
		<div id="tubiao" style="width:140px;text-align:center;padding-left:270px;padding-top: 90px;">
			<img src="image/xiaomi.jpg"> <br><br> <span  id="login_desc" style="text-align: center;font-size: 21px;">小米账号登陆</span>
		</div>
		<br><br> 
		<form action="user.do?method=login" method="post">
		<input type="text" name="username" style="margin-left: 200px;height: 45px;width: 280px;"> <br><br> 
		<input type="password" name="password" style="margin-left: 200px;height: 45px;width: 280px;"> <br><br>
		<input type="submit" value="登录" style="margin-left: 200px;margin-top:20px; height: 45px;width: 280px;background-color: #EF5B00;border: none;color: #FFFFFF">
		</form>
	</div>


</body>