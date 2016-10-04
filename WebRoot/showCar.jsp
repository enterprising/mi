<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>小米-购物车</title>
<style>
	body{
	  margin:0;
	  padding:0;
	  background-color: #F5F5F5;
	}
	.a{
		float: left;
		font-family: 黑体;
		color: #424242;
		margin-left: 50px;
		margin-top: 20px;
	}
</style>

<body>
	<c:if test="${user.username==null }">
		<script>
			if(confirm("请先登录！")){
				location="login.jsp";
			}else{
				location="index.jsp";
			}
		</script>
	</c:if>

	<div id="top" style="  height: 120px;border: 1px solid #B0B0B0;border-bottom-color: #FF6700;border-bottom-width: 2px;background-color: #FFFFFF;">
		<a href="index.jsp"><img alt="" src="image/xiaomi.jpg" style="margin-left: 40px;margin-top: 30px;float:left;"></a>
		<div id="mycar" style="font-size: 30px;font-family: 黑体;margin-left: 60px;margin-top: 55px;float: left">我的购物车</div>
		<div id="mycar" style="font-size: 15px;color:#757575; font-family: 宋体;margin-left: 40px;margin-top: 65px;float: left">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
		<div id="user" style="font-size: 20px;color:#757575; margin-left: 210px;margin-top: 53px;float: left">${user.username }</div>
		<div id="order" style="font-size: 20px;color:#757575; font-family: 黑体;margin-left: 30px;margin-top: 56px;float: left">我的订单</div>
	</div>
	
	<div id="middle_1" style="margin-left:30px;margin-top:40px;background-color: #FFFFFF;">
		
		<table style="font-family: 宋体;
		color: #424242;">
			<tr style="height: 60px;">
				<th><input type="checkbox" id="quan" onclick="quan()"></th>
				<th>全选</th>
				<th>商品名称</th>
				<th>单价</th>
				<th>数量</th>
				<th>小计</th>
				<th style="text-align: center;">操作</th>
			</tr>
			
			<c:forEach items="${map }" var = "map">

				<tr>
					<td><input type="checkbox" name="box" id="${map.key.goodsstatus}" onload="zongjiage(${map.key.goodsprice})" onclick="go(${map.key.goodsprice},${map.key.goodsstatus})"></td>
					<td><img style="border: none; width: 100px ; height: 100px ;" title="查看详情"
			   src="${pageContext.request.contextPath }/image/${map.key.goodspic }"></td>
			   		<td><div style="margin-left: 20px;width: 390px;font-family: 黑体;font-size: 23px;text-align: center;">${map.key.goodsname}</div></td>
			   		<td><div style="margin-left: 20px;width:100px;text-align: center;" id="${map.key.goodscount}" >${map.key.goodsprice}</div></td>
			   		<td><div style="padding-left: 100px;width: 200px;">
			   			<input type="button" value="-" onclick="change('-' , ${map.key.goodsid },${map.key.goodsprice },${map.key.goodscount},${map.key.goodsstatus})"><input type="text" style="width: 50px;" value="${map.value }" id="${map.key.goodsid }"><input type="button" value="+" onclick="change('+' ,${map.key.goodsid },${map.key.goodsprice },${map.key.goodscount},${map.key.goodsstatus})"></div></td>
			   		<td><div id="${map.key.goodsprice}">${map.key.goodsprice*map.value }</div></td>
			   		<td><a id="del" style="padding-left:20px; margin-left: 20px;width: 90px;text-decoration:none;font-size: 19px;font-size: 黑体" onmouseover="hong()" onmouseleave="hui()" href="goods.do?method=removefromcar&goodsid=${map.key.goodsid }">×</a></td>
				</tr>
				
			</c:forEach>
		</table>
		
	</div>
	<div style="border: 1px solid red;width: 1250px;height: 50px;margin-left: 50px;margin-top: 60px;">
		<span style="margin-left: 800px;line-height: 50px;">总计：</span><span id="zong"></span>
		<div style="border: 1px solid red; float: right;font-size: 25px;text-align:center;line-height:50px; font-family: 黑体;width: 190px;height: 50px;background-color: #FF6700; color:#FFFFFF;" onclick="jiesuan()">去结算</div>
	</div>
<script>
	
	window.onload=function zongjiage(id){
	var sum = 0;
	<c:forEach items="${map }" var = "map">
		sum=sum+${map.key.goodsprice*1*map.value};	
	</c:forEach>
	document.getElementById("zong").textContent=sum;
	document.getElementById("quan").checked = "true";
	var x = document.getElementById("quan");
	var boxs = document.getElementsByName("box");
	//var sum = 0;
	for(var i=0;i<boxs.length;i++){
		boxs[i].checked=x.checked;
		//sum = sum + document.getElementById(id).value;
		//alert(sum);
	}
	}

function go(id,boxid){
	//alert(boxid);
	if(document.getElementById(boxid).checked==true){
		//alert("beixuanzhong");
		var xiaoji = document.getElementById(id).textContent;
		document.getElementById("zong").textContent = document.getElementById("zong").textContent*1 + xiaoji*1;
		//alert(xiaoji);
	}else{
		//alert("beixuanzhong1");
		var xiaoji = document.getElementById(id).textContent;
		document.getElementById("zong").textContent = document.getElementById("zong").textContent*1 - xiaoji*1;
		//alert(xiaoji);
	}
}

function quan(){
	var x = document.getElementById("quan");
	var boxs = document.getElementsByName("box");
	var sum = 0;
	for(var i=0;i<boxs.length;i++){
		boxs[i].checked=x.checked;
		//sum = sum + document.getElementById("${map.key.goodscount}").value;
		//alert(sum);
	}
	//sum.innerHTML="12222";
}
function jiesuan(){
	var x = document.getElementById("zong").textContent;
	//alert(x);
	location="order.do?method=jiesuan&price="+x;;
}
function hong(){
	document.getElementById("del").style.color="red";
}
function hui(){
	document.getElementById("del").style.color="#B0B0B0";
}

function change(op , id,id2,dj,box){
		//alert(id2);
		var num = document.getElementById(id).value;
		var price = document.getElementById(dj).textContent;
		//alert(price);
		//alert(price);
		if(op=="+"){
			document.getElementById(id).value = num*1 + 1;
			//怎么去后台加？   ajax  异步的脚本和标记语言
			if(document.getElementById(box).checked==true){
			 	 document.getElementById("zong").textContent = document.getElementById("zong").textContent*1 + (price*1);
				 document.getElementById(id2).innerHTML=(num*1+1)*(price*1);
			 }else{
			 	 document.getElementById(id2).innerHTML=(num*1+1)*(price*1);
			 }
			//1.创建ajax核心对象
			var request = new XMLHttpRequest();
					 
			//2.打开并且发送
			request.open("get" ,"goods.do?method=changenum&op=a&goodsid="+id+"&x="+Math.random(),false);
			request.send(null);		
		
		}
		
		if(op=="-"){
			//alert(id+"a");
			 if(num==1){
			 	if(confirm("真的要删除吗？")){
			 		location="goods.do?method=removefromcar&goodsid="+id;
			 	}
			 	return;
			 }
			 document.getElementById(id).value = num*1 - 1;
			 if(document.getElementById(box).checked==true){
			 	 document.getElementById("zong").textContent = document.getElementById("zong").textContent*1 - (price*1);
				 document.getElementById(id2).innerHTML=(num*1-1)*(price*1);
			 }else{
			 	 document.getElementById(id2).innerHTML=(num*1-1)*(price*1);
			 }
			 //去后台减， ajax 异步的脚本和标记语言
			 //1.创建ajax对象
			 var request = new XMLHttpRequest();
			 //2.打开并且发送
			 request.open("get", "goods.do?method=changenum&op=b&goodsid="+id+"&x="+Math.random(),false);
			 request.send(null);
		}
		
	}

</script>
</body>