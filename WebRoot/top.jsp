<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
	background-color: #FFFFFF;
}

#top1 {
	background: #333333;
	height: 42px;
	width: 1366px;
}
#top1_1 {
	text-align: center;
	font-size: 13;
	padding-left: 30px;
	margin-left: 20px;
	position: relative;
	bottom: 15px;
}

#top1_2 {
	text-align: center;
	font-size: 15;
	position: relative;
	bottom: 15px;
	left: 415px;
}

#top1_3 {
	position: relative;
	left: 450px;
}

.tubiao {
	position: relative;
}
.a {
	text-decoration: none;
	color: #72718e;
}
.b{
	text-decoration: none;
	color:#333333;
}


#top2 {
	height: 74px;
	width: 1366px;
	background-color: #FFFFFF;
}

#top2_1 {
	padding-left: 40px;
	padding-top: 30px;
	height: 104px;
	background-color: #FFFFFF;
	float: left;
}

#top2_2 {
	left: 120px;
	font-size: 17;
	padding-top: 60px;
	padding-left: 130px;
	background-color: #FFFFFF;
	height: 74px;
	text-align: center;
	float: left;
}

#top2_3 {
	padding-left: 40px;
	padding-top: 40px;	
	background-color: #FFFFFF;
	height: 95px;
	
	float: left;
	text-align: center;
}

#sousuo {
	height: 45px;
	width: 280px;
	float: left;
	margin-left:195px;
	font-size: 15;
	color: #554756;
	border: #FF6700 1px solid;
}

#sousuo_tubiao {
	height: 41px;
	width: 42px;
	background-color: #FFFFFF;
	margin-left:-45px;
	margin-top:1px;
	float:left;
	border: #FF6700 1px solid;
}
#top3{
	width:100%;
	margin-top:80px;
	float: left;
	padding-left:30px;
	background-color: #FFFFFF;
	position: absolute;
	z-index: 20;
}
.top3_main{
	display: none;
	height: 200px;
	
}
.w{
	background-color: #FFFFFF;
}
#first{
	margin-left: -130px;
}
.name{
	text-align: center;
	line-height: 40px;
	padding-left: 40px;
}
.jiage{
	color: #FF6700;
	padding-left: 40px;
}
</style>
<body>
	<div id="top" style="height: 160px;" >
		<div id="top">
		<div id="top1">
			<span id="top1_1"> <a href="index.jsp" class="a">小米网</a> &nbsp;丨<a
				href="#" class="a">MIUI</a> &nbsp;丨<a href="#" class="a">米聊</a>
				&nbsp;丨<a href="#" class="a">游戏</a> &nbsp;丨<a href="#" class="a">多看阅读</a>
				&nbsp;丨<a href="#" class="a">云服务</a> &nbsp;丨<a href="#" class="a">小米移动版</a>
				&nbsp;丨<a href="#" class="a">问题反馈</a> &nbsp;丨<a href="#" class="a">Select
					Region</a>
			</span> <span id="top1_2"> 
				<c:if test="${user!=null}">
						<a href="#" id="first" class="a" style="margin-top: -20px;"><span>欢迎您，${user.username }</span></a>
						<a href="user.do?method=showCollection" id="first2" class="a" style="margin-top: -20px;">丨我的收藏</a>
						<a href="user.do?method=tuichu" id="first3" class="a" style="margin-top: -20px;">丨退出</a>				
				</c:if> 
				<c:if test="${user==null}">
						&nbsp;<a href="login.jsp" class="a" style="margin-top: -20px;"><span>登陆</span></a>
						&nbsp;<a href="register.jsp" class="a" style="margin-top: -20px;">注册</a>
				</c:if>
			</span> <span id="top1_3"> &nbsp;<a href="showCar.jsp" class="tubiao"><img
					src="image/gouwuche.jpg" /></a>
			</span>
			<div id="dian" style="border: 1px solid red;float: left;"></div>
		</div>

<script type="text/javascript">
	function xiala1(){
		document.getElementById("xiala").style.display="block";
	}
	function xiala2(){
		document.getElementById("Xiala").style.display="none";
	}
</script>
		<div id="top2">
			<div id="top2_1">
				<img src="image/xiaomi.jpg" />
			</div>
			<div id="top2_2" onmouseleave="xiaoshi()">
				<a href="goods.do?method=fenye&text=小米" class="b" onmouseover="xianshi(1)">小米手机</a> &nbsp; 
				<a href="goods.do?method=fenye&text=红米" class="b" onmouseover="xianshi(2)">红米手机</a> &nbsp; 
				<a href="goods.do?method=fenye&text=平板" class="b" onmouseover="xianshi(3)">小米平板</a> &nbsp; 
				<a href="goods.do?method=fenye&text=电视" class="b" onmouseover="xianshi(4)">电视·盒子</a>&nbsp; 
				<a href="goods.do?method=fenye&text=路由" class="b" onmouseover="xianshi(5)">路由器</a> &nbsp; 
				<a href="#" class="b">智能硬件</a>&nbsp; 
				<a href="#" class="b">服务</a> &nbsp;

			</div>
			<div id="top2_3">
				<c:if test="${goodsname!=null }">
				<input type="text" id="sousuo" value="${goodsname}"
					onmousedown="sousuo_1()" /> 
				</c:if>
				<c:if test="${goodsname==null }">
				<input type="text" id="sousuo" value="请输入想要搜索的商品名称"
					onmousedown="sousuo_1()" /> 
				</c:if>
				<input type="image"
					src="image/sousuo.jpg" id="sousuo_tubiao" onclick="insearch()" />
				<div style="height:60px;width: 69px;margin-left: 473px;"> </div>
			</div>
		</div>
		<div id=top3 onmouseleave="xiaoshi()">
			<div id="xiaomisj" class="top3_main" style="display: none;" onmouseover="xianshi(1)" >
			<br>
				<div id="shouji_1" style="float: left;"><img src="image/sj_1.jpg"><br><span class="name">红米4</span><br><span class="jiage">1299元起</span></div>
				<div id="shouji_2" style="float: left;"><img src="image/sj_2.jpg"><br><span class="name">小米note顶配版</span><br><span class="jiage">2499元起</span></div>
				<div id="shouji_3" style="float: left;"><img src="image/sj_3.jpg"><br><span class="name">小米note</span><br><span class="jiage">1799元起</span></div>
				<div id="shouji_4" style="float: left;"><img src="image/sj_4.jpg"><br><span class="name">小米4c</span><br><span class="jiage">1299元起</span></div>
			</div>
			<div id="hongmisj" class="top3_main" style="display: none;" onmouseover="xianshi(2)">
				<div id="hongmiji_1" style="float: left;"><img src="image/hongmi_1.jpg"><br><span class="name">红米2A高配版</span><br><span class="jiage">特价 499</span></div>
				<div id="hongmisj_2" style="float: left;"><img src="image/hongmi_2.jpg"><br><span class="name">红米2</span><br><span class="jiage">599</span></div>
				<div id="hongmisj_3" style="float: left;"><img src="image/hongmi_3.jpg"><br><span class="name">红米3</span><br><span class="jiage">699</span></div>
				<div id="hongmisj_4" style="float: left;"><img src="image/hongmi_4.jpg"><br><span class="name">红米note</span><br><span class="jiage">699</span></div>
			</div>
			<div id="xiaomipb" class="top3_main" style="display: none;" onmouseover="xianshi(3)">
				<div id="xiaomipb_1" style="float: left;"><img src="image/pingban_1.jpg"><br><span class="name">小米平板2  16GB</span><br><span class="jiage">999</span></div>
				<div id="xiaomipb_2" style="float: left;"><img src="image/pingban_2.jpg"><br><span class="name">小米平板2  64GB</span><br><span class="jiage">1299</span></div>
				<div id="xiaomipb_3" style="float: left;"><img src="image/pingban_3.jpg"><br><span class="name">小米平板2  windows版</span><br><span class="jiage">1299</span></div>
			</div>
			<div id="xiaomids" class="top3_main" style="display: none;" onmouseover="xianshi(4)">
				<div id="xiaomids_1" style="float: left;"><img src="image/dianshi_1.jpg"><br><span class="name">小米电视2 40英寸</span><br><span class="jiage">1799元起</span></div>
				<div id="xiaomids_2" style="float: left;"><img src="image/dianshi_2.jpg"><br><span class="name">小米电视2S 48英寸</span><br><span class="jiage">2799元起</span></div>
				<div id="xiaomids_3" style="float: left;"><img src="image/dianshi_3.jpg"><br><span class="name">小米电视3 55英寸</span><br><span class="jiage">3999元起</span></div>
				<div id="xiaomids_4" style="float: left;"><img src="image/dianshi_4.jpg"><br><span class="name">小米电视3 60英寸</span><br><span class="jiage">4999元起</span></div>
			</div>
			<div id="xiaomily" class="top3_main" style="display: none;" onmouseover="xianshi(5)">
				<div id="luyou_1" style="float: left;"><img src="image/luyou_1.jpg"><br><span class="name">全新小米路由</span><br><span class="jiage">699</span></div>
				<div id="luyou_2" style="float: left;"><img src="image/luyou_2.jpg"><br><span class="name">小米路由器mini</span><br><span class="jiage">129</span></div>
				<div id="luyou_3" style="float: left;"><img src="image/luyou_3.jpg"><br><span class="name">小米路由器青春版</span><br><span class="jiage">79</span></div>
				<div id="luyou_4" style="float: left;"><img src="image/luyou_4.jpg"><br><span class="name">小米WiFi放大器</span><br><span class="jiage">39</span></div>
			</div>
			<div id="xiaomiyj" class="top3_main" style="display: none;" onmouseover="xianshi(6)">
				<div id="yj_1" style="float: left;"><img src="image/yj_1.jpg"><br>&nbsp;小米硬件</div>
				<div id="yj_2" style="float: left;"><img src="image/yj_2.jpg"></div>
				<div id="yj_3" style="float: left;"><img src="image/yj_3.jpg"></div>
				<div id="yj_4" style="float: left;"><img src="image/yj_4.jpg"></div>
			</div>
		</div>
	</div>
</body>
<script>
	var i=0;
	function sousuo_1(){
		document.getElementById('sousuo').value="";
	}
	function insearch()
	{
		var goodsname = document.getElementById("sousuo").value;
		if(goodsname==null||goodsname.trim().length==0){
		alert("输入内容不能为空！");
		location = "index.jsp";
		}
		else
		location = "goods.do?method=fenye&text=" + goodsname;
	}

	function xianshi(x){
		if(x==1){
		document.getElementById("xiaomisj").style.display="block";
		document.getElementById("hongmisj").style.display="none";
		document.getElementById("xiaomipb").style.display="none";	
		document.getElementById("xiaomids").style.display="none";
		document.getElementById("xiaomily").style.display="none";
		document.getElementById("xiaomiyj").style.display="none";
		}else if(x==2){
		document.getElementById("xiaomisj").style.display="none";
		document.getElementById("hongmisj").style.display="block";
		document.getElementById("xiaomipb").style.display="none";	
		document.getElementById("xiaomids").style.display="none";
		document.getElementById("xiaomily").style.display="none";
		document.getElementById("xiaomiyj").style.display="none";
		}else if(x==3){
		document.getElementById("xiaomisj").style.display="none";
		document.getElementById("hongmisj").style.display="none";
		document.getElementById("xiaomipb").style.display="block";	
		document.getElementById("xiaomids").style.display="none";
		document.getElementById("xiaomily").style.display="none";
		document.getElementById("xiaomiyj").style.display="none";
		}else if(x==4){
		document.getElementById("xiaomisj").style.display="none";
		document.getElementById("hongmisj").style.display="none";
		document.getElementById("xiaomipb").style.display="none";	
		document.getElementById("xiaomids").style.display="block";
		document.getElementById("xiaomily").style.display="none";
		document.getElementById("xiaomiyj").style.display="none";
		}else if(x==5){
		document.getElementById("xiaomisj").style.display="none";
		document.getElementById("hongmisj").style.display="none";
		document.getElementById("xiaomipb").style.display="none";	
		document.getElementById("xiaomids").style.display="none";
		document.getElementById("xiaomily").style.display="block";
		document.getElementById("xiaomiyj").style.display="none";
		}else{
		document.getElementById("xiaomisj").style.display="none";
		document.getElementById("hongmisj").style.display="none";
		document.getElementById("xiaomipb").style.display="none";	
		document.getElementById("xiaomids").style.display="none";
		document.getElementById("xiaomily").style.display="none";
		document.getElementById("xiaomiyj").style.display="block";
		}
	}
	function xiaoshi(){
		document.getElementById("xiaomisj").style.display="none";
		document.getElementById("hongmisj").style.display="none";
		document.getElementById("xiaomipb").style.display="none";	
		document.getElementById("xiaomids").style.display="none";
		document.getElementById("xiaomily").style.display="none";
		document.getElementById("xiaomiyj").style.display="none";	
	}
</script>
