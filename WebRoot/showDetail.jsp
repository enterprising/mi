<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="top.jsp"></jsp:include>

<style>
    #main{
 		margin-left:50px;
   		margin-top:100px;
    }
	#pic1_1{
   		margin-left:20px;
   		margin-top:20px;
    	height: 70px;
    	width:70px;
    	border: 1px solid #B0B0B0;
    }
    #pic1_2{
   		margin-left:20px;
   		margin-top:20px;
    	height: 70px;
    	width:70px;
    	border: 1px solid #B0B0B0;
    }
    #pic1_3{
   		margin-left:20px;
   		margin-top:20px;
    	height: 70px;
    	width:70px;
    	border: 1px solid #B0B0B0;
    }
    #pic1_4{
   		margin-left:20px;
   		margin-top:20px;
    	height: 70px;
    	width:70px;
    	border: 1px solid #B0B0B0;
    }
   
    #main_1_1{
   		margin-left:350px;
   		margin-top:-335px;
    	height: 380px;
    	width:380px;
    	float:left;
    }
    #main_2{
    	height: 430px;
    	width:420px;
    	margin-left:870px;
    	margin-top:-350px;
    	border: 1px solid red;
    }
    #name{
    	text-align: center;
    }
    #desc{
        text-align: center;
        color: #616161;
    }
    #price{
    	text-align: center;
    	color: #FF6700;
    }
    #addcar{
    	margin-left: 20px;
    	margin-top: 40px;
    }
</style>

<body>
	<div id="head">
	
	</div>
	<div id = "main">
		<div id="pic1"><img id="pic1_1" src="${pageContext.request.contextPath }/image/${goodsPic.goodspic1 }" onclick="change(1)"></div>
		<div id="pic2"><img id="pic1_2" src="${pageContext.request.contextPath }/image/${goodsPic.goodspic2 }" onclick="change(2)"></div>
		<div id="pic3"><img id="pic1_3" src="${pageContext.request.contextPath }/image/${goodsPic.goodspic3 }" onclick="change(3)"></div>
		<div id="pic4"><img id="pic1_4" src="${pageContext.request.contextPath }/image/${goodsPic.goodspic4 }" onclick="change(4)"></div>	
	</div>
	<div id="main_1">
		<img alt="" src="${pageContext.request.contextPath }/image/${goods.goodspic }" id="main_1_1">
	</div>
	
	<div id="main_2">
		<div id="name">
			<br><span style="font-family: 黑体;font-size: 26px;">${goods.goodsname }</span><br><br>
		</div>
		<div id="desc">
			<span style="font-family: 黑体;font-size: 18px;">${goods.goodsdesc }</span><br><br><br><br>
		</div>
		<div id="price">
			<span style="font-family: 黑体;font-size: 38px;">${goods.goodsprice }</span>
			<span style="font-family: 宋体;font-size: 18px;">元</span><br><br><br>
		</div>
		<div id="addcar_sq">
			<input type="button" id="addcar" style="height:50px;width: 200px;background-color: #FF6700;color:white;border: 0;" value="加入购物车" onmouseover="over()" onmouseleave="leave()" onclick="addcar()">
			<input type="button" id="addcar2" style="height:50px;width: 120px;background-color: #8E8D92;color:white;border: 0;margin-left: 20px;" value="收藏" onmouseover="over2()" onmouseleave="leave2()" onclick="addcol()">
		</div>
		<div id="other" style="text-align: center;color:#616161;">
		    <br>
			<span>评价</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>提问</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>满意度</span>
		</div>
	</div>
	
	<br><br><br><br><br><br>
	<hr style="color: #B0B0B0">
	
	<div id="jieshao" style="text-align: center;font-family: 黑体;font-size: 20; color: #B0B0B0">
		<span>详情描述</span>丨
		<span>规格参数</span>丨
		<span>晒单评价</span>丨
		<span>商品提问</span>丨
	</div>
	<br>
	<div id="datu" style="margin-left: 50px;">
		<img alt="" src="${pageContext.request.contextPath }/image/${goodsPicXQ.goodspic1 }"><br>
		<img alt="" src="${pageContext.request.contextPath }/image/${goodsPicXQ.goodspic2 }"><br>
		<img alt="" src="${pageContext.request.contextPath }/image/${goodsPicXQ.goodspic3 }"><br>
		<img alt="" src="${pageContext.request.contextPath }/image/${goodsPicXQ.goodspic4 }"><br>
		<img alt="" src="${pageContext.request.contextPath }/image/${goodsPicXQ.goodspic5 }"><br>
		<img alt="" src="${pageContext.request.contextPath }/image/${goodsPicXQ.goodspic6 }"><br>
	</div>
	<script type="text/javascript">
		function addcol(){
			location="user.do?method=addcol&goodsid=${goods.goodsid}&goodspic=${goods.goodspic}&goodsprice=${goods.goodsprice}&goodsname=${goods.goodsname}";
		}
		
		function addcar(){
		    var num = 1+"";
			location="goods.do?method=addcar&goodsid=${goods.goodsid}&num="+num;
		}
		
		function over(){
			document.getElementById("addcar").style.background="#F25807";
		}
		function leave(){
			document.getElementById("addcar").style.background="#FF6700";
		}
		function over2(){
			document.getElementById("addcar2").style.background="#757575";
		}
		function leave2(){
			document.getElementById("addcar2").style.background="#8E8D92";
		}
	
		function change(x){

			if(x==1)
			{
				document.getElementById("main_1_1").src="${pageContext.request.contextPath }/image/${goodsPic.goodspic1 }";
				document.getElementById("pic1_1").style.border="1px solid #FF6700";
				document.getElementById("pic1_2").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_3").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_4").style.border="1px solid #B0B0B0";
			}
			else if(x==2)
			{
				document.getElementById("main_1_1").src="${pageContext.request.contextPath }/image/${goodsPic.goodspic2 }";
				document.getElementById("pic1_1").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_2").style.border="1px solid #FF6700";
				document.getElementById("pic1_3").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_4").style.border="1px solid #B0B0B0";
			}
			else if(x==3){
				document.getElementById("main_1_1").src="${pageContext.request.contextPath }/image/${goodsPic.goodspic3 }";
				document.getElementById("pic1_1").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_2").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_3").style.border="1px solid #FF6700";
				document.getElementById("pic1_4").style.border="1px solid #B0B0B0";
			}
			else
			{
				document.getElementById("main_1_1").src="${pageContext.request.contextPath }/image/${goodsPic.goodspic4 }";
				document.getElementById("pic1_1").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_2").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_3").style.border="1px solid #B0B0B0";
				document.getElementById("pic1_4").style.border="1px solid #FF6700";
			}
		}
	</script>
	
</body>

