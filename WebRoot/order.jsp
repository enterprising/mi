<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="chinaprovinces_0.2.1.js"></script>
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
	.t{
		width: 280px;
		height: 40px;
		margin-left: 40px;
		margin-top: 30px;
	}
</style>

<body>

	<div id="top" style="  height: 120px;border: 1px solid #B0B0B0;border-bottom-color: #FF6700;border-bottom-width: 2px;background-color: #FFFFFF;">
		<a href="index.jsp"><img alt="" src="image/xiaomi.jpg" style="margin-left: 40px;margin-top: 30px;float:left;"></a>
		<div id="mycar" style="font-size: 30px;font-family: 黑体;margin-left: 60px;margin-top: 55px;float: left">确认订单</div>
		<div id="user" style="font-size: 20px;color:#757575; margin-left: 760px;margin-top: 53px;float: left">${user.username }</div>
		<div id="order" style="font-size: 20px;color:#757575; font-family: 黑体;margin-left: 30px;margin-top: 56px;float: left">我的订单</div>
	</div>

	<input id="demo2_province" name="demo2_province" value="" style="display: none"/> 
	<input id="demo2_city" name="demo2_city" value="" style="display: none"/> 
	<input id="demo2_area" name="demo2_area" value="" style="display: none"/>

	<div id="main" style="margin-left: 40px;margin-top: 40px;width: 1280px;height: 1000px; border: 1px solid red; background-color: #FFFFFF">
		<div style="margin-left: 30px;margin-top: 30px; font-family: 黑体;font-size: 20px;">收货地址</div>
		<c:forEach items="${addressList }" var="address">
			<div style="border: 1px solid red;width: 220px;height: 220px;margin-left: 30px;margin-top: 30px;float: left;background-color: #757575">
				<div style="margin-left: 15px;margin-top: 15px;text-align: left;font-size: 18px;font-family: 黑体 ">收货人：${address.uname }</div>
				<div style="margin-left: 15px;margin-top: 15px;text-align: left;font-size: 17px;">联系方式：${address.utel }</div>
				<div style="margin-left: 15px;margin-top: 15px;text-align: left;font-size: 17px;">收货地址：<br>${address.province } ${address.city } ${address.county }</div>
				<div style="margin-left: 15px;margin-top: 15px;text-align: left;font-size: 17px;">${address.detail }</div>
			</div>
		</c:forEach>
		<div style="width: 220px;height: 220px;margin-left: 30px;margin-top: 30px; border:1px solid red;text-align: center;float: left;background-color: #757575">
		<br><br><br>添加新地址
		<br><br>
		<button onclick="add()">添加</button>
		</div>
		
		<div id="adddz" style="display:none; border: 1px solid red;width: 350px;height: 500px;margin-left: 400px;margin-top: 280px;">
			<input id="uname" type="text" value="姓名" class="t">
			<input id="tel" type="text" value="手机号" class="t">
			<div class="t"><span id="demo2"></span></div>
			<input id="detail" type="text" value="详细地址" class="t">
			<input id="postcode" type="text" value="邮政编码" class="t">
			<input id="addxinxi" type="text" value="地区标签" class="t">
			<button style="margin-left: 50px;margin-top:20px; width: 110px;height: 40px;" onclick="adddz()">保存</button>
			<button id="quxiao" style="margin-left: 20px;margin-top:20px; width: 110px;height: 40px; " onclick="quxiao()">取消</button>
		</div>
		
		<div id="middle_1" style="margin-left:30px;margin-top:40px;background-color: #FFFFFF;">
		
		<table style="font-family: 宋体;
		color: #424242;">
			<tr style="height: 60px;">
				
				<th>全选</th>
				<th>商品名称</th>
				<th>单价</th>
				<th>数量</th>
				<th>小计</th>
				
			</tr>
			
			<c:forEach items="${map }" var = "map">

				<tr>
					
					<td><img style="border: none; width: 100px ; height: 100px ;" title="查看详情"
			   src="${pageContext.request.contextPath }/image/${map.key.goodspic }"></td>
			   		<td><div style="margin-left: 20px;width: 390px;font-family: 黑体;font-size: 23px;text-align: center;">${map.key.goodsname}</div></td>
			   		<td><div style="margin-left: 20px;width:100px;text-align: center;" id="${map.key.goodscount}" >${map.key.goodsprice}</div></td>
			   		<td><div style="padding-left: 100px;width: 200px;">
			   			数量：${map.value }</div></td>
			   		<td><div id="${map.key.goodsprice}">${map.key.goodsprice*map.value }</div></td>
				</tr>
				
			</c:forEach>
		</table>
		
	</div>
	<br><br>
	<div style="margin-left: 820px;margin-top: 30px;height: 60px;width: 260px;font-size: 25px;color: red;float:left;">总计：￥${price }</div>
	<input type="button" value="付款" style="float:left; margin-left: -30px;margin-top: 20px;height: 50px;width: 150px;color: #FFFFFF;background-color: #FF6700;border: none;">
	</div>
<script>


	
		$("#demo2").chinaprovinces({valueType:'name',change:function(province,city,area){
		$("#demo2_province").val(province);
		$("#demo2_city").val(city);
		$("#demo2_area").val(area);
		}});

	function add(){
		document.getElementById("adddz").style.display="block";
	}

	function quxiao(){
		document.getElementById("uname").value="姓名";
		document.getElementById("tel").value="手机号";
		document.getElementById("detail").value="详细地址";
		document.getElementById("postcode").value="邮政编码";
		document.getElementById("addxinxi").value="地区标签";
		document.getElementById("adddz").style.display="none";
	}

	function adddz(){
		var uname = document.getElementById("uname").value;
		var utel = document.getElementById("tel").value;
		var province = document.getElementById("demo2_province").value;
		var city = document.getElementById("demo2_city").value;
		var county = document.getElementById("demo2_area").value;
		var detail = document.getElementById("detail").value;
		var postcode = document.getElementById("postcode").value;
		var addxinxi = document.getElementById("addxinxi").value;
		location="order.do?method=adddz&uname="+uname+"&utel="+utel+"&province="+province+"&city="+city+"&county="+county+"&detail="+detail+"&postcode="+postcode+"&addxinxi="+addxinxi;
	}

	
</script>
	


</body>