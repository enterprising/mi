<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="top.jsp"></jsp:include>

<title>小米-收藏夹</title>

<style>
	body{
		background-color: F5F5F5;
	}
	#top{
	 	background-color: #FFFFFF;
	}
	.d{
		font-family: 黑体;
		font-size: 20;
	}
	.c{
		font-family: 黑体;
		font-size: 15;
		color: #424242;
	}
</style>

<body>
	<br>
	<script type="text/javascript"></script>
	<div style="width: 210px;height: 1000px;border: 1px solid red; float: left; margin-left: -1240px;margin-top: 60px;background: #FFFFFF">
		<div>
			<ul class="d" id="order" onmousemove="hong(1)" onmouseleave="hui(1)">订单中心</ul>
			<ul class="c" id="order1" onmousemove="hong(2)" onmouseleave="hui(2)">我的订单</ul>
			<ul class="c" id="order2" onmousemove="hong(3)" onmouseleave="hui(3)">手机意外保</ul>
			<ul class="c" id="order3" onmousemove="hong(4)" onmouseleave="hui(4)">团购订单</ul>
			<ul class="c" id="order4" onmousemove="hong(5)" onmouseleave="hui(5)">晒单评价</ul>
			<ul class="c" id="order5" onmousemove="hong(6)" onmouseleave="hui(6)">话费充值订单</ul>
			<ul class="c" id="order6" onmousemove="hong(7)" onmouseleave="hui(7)">以旧换新订单</ul>
		</div>
		<div>
			<ul class="d" id="private" onmousemove="hong(8)" onmouseleave="hui(8)">个人中心</ul>
			<ul class="c" id="private1" onmousemove="hong(9)" onmouseleave="hui(9)">我的个人中心</ul>
			<ul class="c" id="private2" onmousemove="hong(10)" onmouseleave="hui(10)">现金账户</ul>
			<ul class="c" id="private3" onmousemove="hong(11)" onmouseleave="hui(11)">小米礼品卡</ul>
			<ul class="c" id="private4" onmousemove="hong(12)" onmouseleave="hui(12)">手机换新劵</ul>
			<ul class="c" id="private5" onmousemove="hong(13)" onmouseleave="hui(13)" onclick="collect()">喜欢的商品</ul>
			<ul class="c" id="private6" onmousemove="hong(14)" onmouseleave="hui(14)">优惠券</ul>
			<ul class="c" id="private7" onmousemove="hong(15)" onmouseleave="hui(15)">收货地址</ul>
		</div>
		<div>
			<ul class="d" id="after" onmousemove="hong(16)" onmouseleave="hui(16)">售后服务</ul>
			<ul class="c" id="after1" onmousemove="hong(17)" onmouseleave="hui(17)">换货单</ul>
			<ul class="c" id="after2" onmousemove="hong(18)" onmouseleave="hui(18)">退货单</ul>
			<ul class="c" id="after3" onmousemove="hong(19)" onmouseleave="hui(19)">维修单</ul>
			<ul class="c" id="after4" onmousemove="hong(20)" onmouseleave="hui(20)">领取快递补偿</ul>
			<ul class="c" id="after5" onmousemove="hong(21)" onmouseleave="hui(21)">预约亲临门店服务</ul>
		</div>
		<div>
			<ul class="d" id="manage" onmousemove="hong(22)" onmouseleave="hui(22)">账户管理</ul>
			<ul class="c" id="manage1" onmousemove="hong(23)" onmouseleave="hui(23)">个人信息</ul>
			<ul class="c" id="manage2" onmousemove="hong(24)" onmouseleave="hui(24)">修改密码</ul>
			<ul class="c" id="manage3" onmousemove="hong(25)" onmouseleave="hui(25)">社区VIP认证</ul>
		</div>
	</div>
	
	<div id="right" style="float: left;width: 1000px;height: 1000px;border: 1px solid red;margin-left: -1000px;margin-top: 60px;">
		<div style="margin-left: 55px;margin-top: 50px;"><span style="font-size: 26;font-family: 黑体; color:#424242;">喜欢的商品</span></div>
		<div id="main">
			<!-- <script>var x=${list3.size() };alert(x);</script> -->
			
			<c:forEach items="${list3 }" var="goods">
				<div style="width:250px;height:330px;border: 1px slolid red;margin-left: 60px;margin-top: 20px;float: left;background-color: #FFFFFF">
					<div style="text-align: center;margin-top: 8px;">${goods.goodsname }</div>
					<div style="margin-left: 10px;margin-top: 10px;"><img src="${pageContext.request.contextPath }/image/${goods.goodspic}" style="width: 210;height: 210px;"></div>
					<div style="margin-left: 10px;margin-top: 10px;text-align: center;">${goods.goodsprice }</div>
					<div><button style="margin-top: 20px; margin-left: 40px;width: 60px;" onclick="removefromcol(${goods.goodsid})">删除</button><button style="margin-top: 20px; margin-left: 20px;width: 90px;" onclick="addcar(${goods.goodsid},${goods.goodsid})">加入购物车</button></div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
<script type="text/javascript">
	function removefromcol(x){
		location="user.do?method=removefromcol&goodsid="+x;
	}
	function addcar(id,x){
	    var num = 1+"";
		location="goods.do?method=addcar&goodsid="+id+"&num="+num;
	}

	function collect(){
		
	}
	
	function hong(x){
        if(x==1){
		document.getElementById("order").style.color="red";
		}
		else if(x==2){
		document.getElementById("order1").style.color="red";
		}
		else if(x==3){
		document.getElementById("order2").style.color="red";
		}
		else if(x==4){
		document.getElementById("order3").style.color="red";
		}
		else if(x==5){
		document.getElementById("order4").style.color="red";
		}
		else if(x==6){
		document.getElementById("order5").style.color="red";
		}
		else if(x==7){
		document.getElementById("order6").style.color="red";
		}
		else if(x==8){
		document.getElementById("private").style.color="red";
		}
		else if(x==9){
		document.getElementById("private1").style.color="red";
		}
		else if(x==10){
		document.getElementById("private2").style.color="red";
		}
		else if(x==11){
		document.getElementById("private3").style.color="red";
		}
		else if(x==12){
		document.getElementById("private4").style.color="red";
		}
		else if(x==13){
		document.getElementById("private5").style.color="red";
		}
		else if(x==14){
		document.getElementById("private6").style.color="red";
		}
		else if(x==15){
		document.getElementById("private7").style.color="red";
		}
		else if(x==16){
		document.getElementById("after").style.color="red";
		}
		else if(x==17){
		document.getElementById("after1").style.color="red";
		}
		else if(x==18){
		document.getElementById("after2").style.color="red";
		}
		else if(x==19){
		document.getElementById("after3").style.color="red";
		}
		else if(x==20){
		document.getElementById("after4").style.color="red";
		}
		else if(x==21){
		document.getElementById("after5").style.color="red";
		}
		else if(x==22){
		document.getElementById("manage").style.color="red";
		}
		else if(x==23){
		document.getElementById("manage1").style.color="red";
		}
		else if(x==24){
		document.getElementById("manage2").style.color="red";
		}
		else if(x==25){
		document.getElementById("manage3").style.color="red";
		}
		
	}
	function hui(x){
		if(x==1){
		document.getElementById("order").style.color="#424242";
		}
		else if(x==2){
		document.getElementById("order1").style.color="#424242";
		}
		else if(x==3){
		document.getElementById("order2").style.color="#424242";
		}
		else if(x==4){
		document.getElementById("order3").style.color="#424242";
		}
		else if(x==5){
		document.getElementById("order4").style.color="#424242";
		}
		else if(x==6){
		document.getElementById("order5").style.color="#424242";
		}
		else if(x==7){
		document.getElementById("order6").style.color="#424242";
		}
		else if(x==8){
		document.getElementById("private").style.color="#424242";
		}
		else if(x==9){
		document.getElementById("private1").style.color="#424242";
		}
		else if(x==10){
		document.getElementById("private2").style.color="#424242";
		}
		else if(x==11){
		document.getElementById("private3").style.color="#424242";
		}
		else if(x==12){
		document.getElementById("private4").style.color="#424242";
		}
		else if(x==13){
		document.getElementById("private5").style.color="#424242";
		}
		else if(x==14){
		document.getElementById("private6").style.color="#424242";
		}
		else if(x==15){
		document.getElementById("private7").style.color="#424242";
		}
		else if(x==16){
		document.getElementById("after").style.color="#424242";
		}
		else if(x==17){
		document.getElementById("after1").style.color="#424242";
		}
		else if(x==18){
		document.getElementById("after2").style.color="#424242";
		}
		else if(x==19){
		document.getElementById("after3").style.color="#424242";
		}
		else if(x==20){
		document.getElementById("after4").style.color="#424242";
		}
		else if(x==21){
		document.getElementById("after5").style.color="#424242";
		}
		else if(x==22){
		document.getElementById("manage").style.color="#424242";
		}
		else if(x==23){
		document.getElementById("manage1").style.color="#424242";
		}
		else if(x==24){
		document.getElementById("manage2").style.color="#424242";
		}
		else if(x==25){
		document.getElementById("manage3").style.color="#424242";
		}
	}
</script>
	
</body>



