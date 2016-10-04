<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="top.jsp"></jsp:include>
<head>
<title>小米官网——小米手机、红米手机、小米电视官方正品专卖网站</title>
<meta name="" content="">
</head>
<style>
	body{
		margin: 0;
		padding: 0;
		<!--overflow-x: hidden;-->
	}
	.kongxi{
		height: 10px;
		width: 1360px;
		float: left;
	}
	#top3_111{
		width: 100%;
		height: 460px;
		margin-left: 40px;
	}
	#top3_0{
		width: 1230px;
		height: 460px;
		margin-top: 80px;
		margin-left: 15px;
		float: left;
		position: absolute;
		z-index: 1;
	}
	#top3_0_0{
		width: 270px;
		height: 546px;
		margin-top: 80px;
		margin-left: 15px;
		position: absolute;
		filter: alpha(opacity:40);
		opacity:0.85;
		z-index: 10;
		float: left;
		background-color: #5F5A52;
	}
	#top3_main_0{
		width: 100%;
		height: 546px;
		padding-left: 0px;
		padding-right: 50px;
	}
	#top3_5{
		padding-top: 670px;
	}
	#top3_5_1{
		width: 305px;
		height: 160px;
		padding-left: 15px;
		padding-top: 10px;
		float: left;
	}
	#top3_5_2{
		width: 305px;
		height: 170px;
		margin-left: -30px;
		padding-top: 10px;
		float: left;
	}
	#top3_5_3{
		width: 305px;
		height: 170px;
		padding-top: 10px;
		padding-left:15px;
		float: left;
	}
	#top3_5_4{
		width: 305px;
		height: 170px;
		padding-left: 15px;
		padding-top: 10px;
		float: left;
	}
	
	.top_0_0_tr{
		width: auto;
		height:25px;
		font-size: 14px;
		color: #FFFFFF;
		font-family: 黑体;
		padding-left: 40px;
		background-color: #5F5A52;
	}
	#dp{
		height: 50px;
		width: 1360px;
		float: left;
		margin-left: 50px;
		margin-top: 20px;
		font-family: 黑体;
		font-size: 23px;
		
	}
	#yj{
		height: 50px;
		width: 1360px;
		float: left;
		margin-left: 50px;
		margin-top: 20px;
		font-family: 黑体;
		font-size: 23px;
	}
	#zb{
		height: 50px;
		width: 1360px;
		float: left;
		margin-left: 50px;
		margin-top: 20px;
		font-family: 黑体;
		font-size: 23px;
	}
	#danping{
		width: 100%;
		height: 260px;
		padding-left: -10px;
		padding-right: 50px;
	
		text-align: center;
	}
	#danping_1{
		float: left;
		padding-left: 50px;
		text-align: center;
		color: #FAFAFA;
	}

	#yingjian_0{
		float: left;
		padding-left: 50px;
	}
	#danping_2{
		padding-left: 106px;
		text-align: center;
		color: #FAFAFA;
		float: left;
	}
	#danping_3{
		color: #FAFAFA;
		padding-left: 106px;
		text-align: center;
		float: left;
	}
	#danping_4{
		padding-left: 106px;
		text-align: center;
		color: #FAFAFA;
		float: left;
	}
	#danping_5{
		padding-left: 106px;
		text-align: center;
		color: #FAFAFA;
		float: left;
	}
	.danpingname{
		font-size: 15px;
		color: #0b0000;
	    font-family: 宋体;
	    text-align: center;
	}
	.danpingmiaoshu{
		font-size: 12px;
		color: #B0B0B0;
		font-family: 黑体;
	}
	.danpingjiage{
		color: FD7D09;
		text-align: center;
	}
	#yingjian_1{
		float: left;
		height: 300px;
		padding-left: 60px;
		padding-top: 60px;
		text-align: center;
		color: #FAFAFA;		
	}
		#yingjian_2{
		float: left;
		height: 300px;
		padding-left: 60px;
		padding-top: 60px;
		text-align: center;
		color: #FAFAFA;		
	}
		#yingjian_3{
		float: left;
		height: 300px;
		padding-left: 60px;
		margin-top: -1px;
		text-align: center;
		color: #FAFAFA;		
	}
		#yingjian_4{
		float: left;
		height: 300px;
		padding-left: 60px;
		padding-top: 60px;
		text-align: center;
		color: #FAFAFA;		
	}
		#yingjian_5{
		float: left;
		padding-left: 60px;
		margin-top: 0px;
		text-align: center;
		color: #FAFAFA;		
	}	#yingjian_6{
		float: left;
		padding-left: 70px;
		text-align: center;
		color: #FAFAFA;		
	}
		#yingjian_7{
		float: left;
		padding-left: 80px;
		text-align: center;
		color: #FAFAFA;		
	}
		#yingjian_8{
		float: left;
		padding-left: 80px;
		text-align: center;
		color: #FAFAFA;		
	}
	#weiyi{
		height: 300px;
		width: 190px;
		padding-left: 50px;
		padding-top: 0px;
		text-align: center;
		color: #FAFAFA;	
		float: left;
	}
	#wanou{
		height: 300px;
		width: 190px;
		padding-top: 310px;
		margin-left: -190px;
		text-align: center;
		float: left;
		color: #FAFAFA;	
	}
	#zhoubian_rm1{
		float: left;
		height: 300px;
		padding-left: 40px;
		padding-top: -30px;
		text-align: center;
		color: #FAFAFA;		
	}
	#zhoubian_rm2{
		float: left;
		height: 300px;
		padding-left: 40px;
		padding-top: -30px;
		text-align: center;
		color: #FAFAFA;		
	}
	#zhoubian_rm3{
		float: left;
		height: 300px;
		padding-left: 40px;
		padding-top: -10px;
		margin-top: -10px;
		text-align: center;
		color: #FAFAFA;		
	}
	#zhoubian_rm4{
		float: left;
		height: 300px;
		padding-left: 30px;
		padding-top: -20px;
		text-align: center;
		color: #FAFAFA;		
	}
	#zhoubian_rm5{
		float: left;
		padding-left: 60px;
		margin-top: 70px;
		text-align: center;
		color: #FAFAFA;		
	}
	#zhoubian_rm6{
		float: left;
		padding-left: 90px;
		margin-top: 70px;
		text-align: center;
		color: #FAFAFA;		
	}
	#zhoubian_rm7{
		float: left;
		padding-left: 100px;
		margin-top: 10px;
		text-align: center;
		color: #FAFAFA;		
	}

</style>
<body>
<div id="top">

	<div id="top3_111">
		<div class="kongxi"></div>
		<div id="top3_0_0">
					<br /><br />
					<div class="top_0_0_tr">电话 平板 电话卡</div><br />
					<div class="top_0_0_tr">电视 盒子</div><br />
					<div class="top_0_0_tr">路由器 智能硬件</div><br />
					<div class="top_0_0_tr">移动电源 插线板</div><br />
					<div class="top_0_0_tr">耳机 音响</div><br />
					<div class="top_0_0_tr">电池 存储卡</div><br />
					<div class="top_0_0_tr">保护套 后盖</div><br />
					<div class="top_0_0_tr">贴膜 其他配件</div><br />
					<div class="top_0_0_tr">米兔 服装</div><br />
					<div class="top_0_0_tr">箱包 其他周边</div>
		</div>
		<div id="top3_0">			
			<img id="top3_main_0" src="image/top3_1.jpg"/>						
		</div>
		
		
		<div class="kongxi"></div>
		<div class="kongxi"></div>
		<div id="top3_5">
			<div id="top3_5_1">
				<img id="top3_5_1_" src="image/top3_1_1.jpg"/>
			</div>
			<div id="top3_5_2">
				<img id="top3_5_2_" src="image/top3_5_1.jpg"/>
			</div>
			<div id="top3_5_3">
				<img id="top3_5_3_" src="image/top3_5_2.jpg"/>
			</div>
			<div id="top3_5_4">
				<img id="top3_5_4_" src="image/top3_5_3.jpg"/>
			</div>
		</div>
		<div class="kongxi"></div>
	</div>
	<div class="kongxi"></div>
	<div class="kongxi"></div>
	

</div>

<div id="middle">
	<div id="dp">小米明星单品</div>	
	<div id="danping">
		<div id="danping_1">
			<img src="image/danping_1.jpg"/><br /><br />
			<span class="danpingname">小米路由器mini</span>
			<br />
			<span class="danpingmiaoshu">主流双频AC智能路由器</span>
			<br /><br />
			<span class="danpingjiage">100元</span>
		</div>
		<div id="danping_2">
			<img src="image/danping_2.jpg"/><br /><br />
			<span class="danpingname">小米手环</span>
			<br />
			<span class="danpingmiaoshu">美国AID传感器</span>
			<br /><br />
			<span class="danpingjiage">100元</span>
		</div>
		<div id="danping_3">
			<img src="image/danping_3.jpg"/><br />
			<span class="danpingname">小米头戴式耳机</span>
			<br />
			<span class="danpingmiaoshu">媲美主流千元级头戴耳机</span>
			<br /><br />
			<span class="danpingjiage">100元</span>
		</div>
		<div id="danping_4">
			<img src="image/danping_4.jpg"/><br /><br />
			<span class="danpingname">小米电视主机</span>
			<br />
			<span class="danpingmiaoshu">次世代智能电视主机，内置独立音响</span>
			<br /><br />
			<span class="danpingjiage">100元</span>
		</div>
		<div id="danping_5">
			<img src="image/danping_5.jpg"/><br /><br />
			<span class="danpingname">小米移动电源10000mAh</span>
			<br />
			<span class="danpingmiaoshu">高密度进口电芯，仅名片大小</span>
			<br /><br />
			<span class="danpingjiage">100元</span>
		</div>
	</div>
	<div class="kongxi"></div>
	<div class="kongxi"></div>
	<div id="yj">智能硬件</div>	
	<div id="yingjian">
		<div id="yingjian_0">
			<a href="#"><img src="image/yingjian_0.jpg"/></a>
		</div>
		<div id="yingjian_1">
			<a href="#"><img src="image/yingjian_1.jpg"/></a>
			<br />
			<span class="danpingname">LED智能灯泡</span>
			<br />
			<span class="danpingmiaoshu">亮度自由调节 WIFI远程操作</span>
			<br /><br />
			<span class="danpingjiage">59元</span>
		</div>
		<div id="yingjian_2">
			<a href="#"><img src="image/yingjian_2.jpg"/></a>
			<br />
			<span class="danpingname">小米水质TDS检测笔</span>
			<br />
			<span class="danpingmiaoshu">准确检测家中水质纯度</span>
			<br /><br />
			<span class="danpingjiage">35元</span>
		</div>
		<div id="yingjian_3">
			<a href="#"><img src="image/yingjian_3.jpg"/></a>
			<br />
			<span class="danpingname">智能家庭套装</span>
			<br />
			<span class="danpingmiaoshu">30多种智能玩法，3分钟快速安装 </span>
			<br /><br />
			<span class="danpingjiage">1990元</span>
		</div><div id="yingjian_4">
			<a href="#"><img src="image/yingjian_4.jpg"/></a>
			<br />
			<span class="danpingname">小米路由器青春版</span>
			<br />
			<span class="danpingmiaoshu">将高性能路由器 凝聚于掌心大小</span>
			<br /><br />
			<span class="danpingjiage">79元</span>
		</div><div id="yingjian_5">
			<a href="#"><img src="image/yingjian_5.jpg"/></a>
			<br />
			<span class="danpingname">小米体重秤</span>
			<br />
			<span class="danpingmiaoshu">高精度压力传感器 ｜ 手机管理全家健康</span>
			<br /><br />
			<span class="danpingjiage">99元</span>
		</div><div id="yingjian_6">
			<a href="#"><img src="image/yingjian_6.jpg"/></a>
			<br />
			<span class="danpingname">小蚁运动相机</span>
			<br />
			<span class="danpingmiaoshu">边玩边录边拍，手机随时分享</span>
			<br /><br />
			<span class="danpingjiage">399元</span>
		</div><div id="yingjian_7">
			<a href="#"><img src="image/yingjian_7.jpg"/></a>
			<br />
			<span class="danpingname">床头灯</span>
			<br />
			<span class="danpingmiaoshu">触摸式操作，给卧室1600万种颜色</span>
			<br /><br />
			<span class="danpingjiage">229元</span>
		</div><div id="yingjian_8">
			<a href="#"><img src="image/yingjian_8.jpg"/></a>
			<br />
			<span class="danpingname">小蚁智能摄像机</span>
			<br />
			<span class="danpingmiaoshu">能看能听能说，手机远程观看</span>
			<br /><br />
			<span class="danpingjiage">149元</span>
		</div>
	</div>
	<div class="kongxi"></div>
	<div class="kongxi"></div>
	<div id="zb">周边</div>
	<div id="zhoubian">
		<div id="weiyi">
			<a href="#"><img src="image/weiyi.jpg"/></a>
		</div>
		<div id="wanou">
			<a href="#"><img src="image/wanou.jpg"/></a>
		</div>
		<div id="zhoubian_rm1">
			<a href="#"><img src="image/zhoubian_rm1.jpg"/></a>
			<br />
			<span class="danpingname">90分 旅行箱</span>
			<br />
			<span class="danpingmiaoshu">设计精美，贴近生活</span>
			<br /><br />
			<span class="danpingjiage">329元</span>
		</div>
		<div id="zhoubian_rm2">
			<a href="#"><img src="image/zhoubian_rm2.jpg"/></a>
			<br />
			<span class="danpingname">小米商务真皮钱包</span>
			<br />
			<span class="danpingmiaoshu">小米商务真皮钱包</span>
			<br /><br />
			<span class="danpingjiage">109元</span>
		</div>
		<div id="zhoubian_rm3">
			<a href="#"><img src="image/zhoubian_rm3.jpg"/></a>
			<br />
			<span class="danpingname">学院风简约双肩包</span>
			<br />
			<span class="danpingmiaoshu">学院风简约双肩包</span>
			<br /><br />
			<span class="danpingjiage">49元</span>
		</div>
		<div id="zhoubian_rm4">
			<a href="#"><img src="image/zhoubian_rm4.jpg"/></a>
			<br />
			<span class="danpingname">小米简约帆布腰包</span>
			<br />
			<span class="danpingmiaoshu">小米简约帆布腰包</span>
			<br /><br />
			<span class="danpingjiage">49元</span>
		</div>
		<div id="zhoubian_rm5">
			<a href="#"><img src="image/zhoubian_rm5.jpg"/></a>
			<br />
			<span class="danpingname">小米简约卫衣</span>
			<br />
			<span class="danpingmiaoshu">小米简约卫衣</span>
			<br /><br />
			<span class="danpingjiage">89元</span>
		</div>
		<div id="zhoubian_rm6">
			<a href="#"><img src="image/zhoubian_rm6.jpg"/></a>
			<br />
			<span class="danpingname">纯色开衫卫衣</span>
			<br />
			<span class="danpingmiaoshu">纯色开衫卫衣</span>
			<br /><br />
			<span class="danpingjiage">199元</span>
		</div>
		<div id="zhoubian_rm7">
			<a href="#"><img src="image/zhoubian_rm7.jpg"/></a>
			<br />
			<span class="danpingname">小米LED随身灯 加强版</span>
			<br />
			<span class="danpingmiaoshu">小米LED随身灯 加强版</span>
			<br /><br />
			<span class="danpingjiage">19.9元</span>
		</div>
	</div>
</div>"
<div class="kongxi"></div>
<div class="kongxi"></div>
<div class="kongxi"></div>
<div class="kongxi"></div>
<div class="kongxi"></div>
<div class="kongxi"></div>
<div id="bottom">
	<img src="image/bottom.jpg"/>
</div>
</body>
<script>
	var i=0;
	var src1=["image/top3_1.jpg","image/top3_2.jpg","image/top3_3.jpg","image/top3_4.jpg"];
	function sousuo_1(){
		document.getElementById('sousuo').value="";
	}
	function top_qiehuan(){		
		document.getElementById('top3_main_0').src=src1[i++];
		if(i==4)
		i=0;
	}
	setInterval('top_qiehuan()',2000);

	
	
</script>
</html>