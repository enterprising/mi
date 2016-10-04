<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="top.jsp"></jsp:include>

<style>
	body{
		background-color: #F5F5F5;
	}
	#fenlei{
		width:300px;
		height:30px;
		margin-left: 50px;
		margin-top: 120px;
	}
	#main{
		margin-left: 30px;
		margin-top: 30px;
		border: #FF6700 1px solid;
	}	
	.fenlei_{
		text-decoration: none;
	}
</style>

<div id="fenlei">
	<br>
	<a href="#" class="fenlei_"><span style="color: #FF6700">推荐</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丨 
	<a href="#" class="fenlei_"><span>新品</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丨
	<a href="#" class="fenlei_" onclick="jiage2()"><span id="jiage_">价格↑</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丨 
	<a href="#" class="fenlei_" onclick="jiage()"><span id="jiage_">价格↓</span></a>&nbsp; 
</div>
<script>
	function jiage(){
		var text2 = document.getElementById("jiage_").textContent;
			var page = document.getElementById("page").value;
			location = "goods.do?method=paixu&currentPage=" + page
				+ "&size=${map.pageSize}" + "&text=${map.text}";	
	}
	function jiage2(){
		var text2 = document.getElementById("jiage_").textContent;
			var page = document.getElementById("page").value;
			location = "goods.do?method=paixu2&currentPage=" + page
				+ "&size=${map.pageSize}" + "&text=${map.text}";
	}
</script>
<div id="main">
	<c:forEach items="${map.list}" var="goods" varStatus="sta">

		<c:if test="${sta.index%4==0}">
			<div
				style="width: 1255px ;height: 360px; margin-top: 10px; ">
		</c:if>

		<div
			style="width: 285px ; height: 320px ;background-color:#FFFFFF;float: left;margin-left: 20px; margin-top: 10px;text-align: center;">
			<br>
			<a href="goods.do?method=getdetailbyid&id=${goods.goodsid }" style="text-decoration:none;">
			<img
			   style="border: none; width: 220px ; height: 220px ;" title="查看详情"
			   src="${pageContext.request.contextPath }/image/${goods.goodspic }">
			   <br>${goods.goodsname }
			   <br>${goods.goodsprice } 
			</a>

		</div>


		<c:if test="${sta.index%4==3 || sta.index+1==fn:length(map.list)}">
</div>
</c:if>


</c:forEach>

<div id = "bottom" style="text-align: center;">
	共${map.currentPage }/${map.pageCount }页
<a
	href="goods.do?method=fenye&page=1&size=${map.pageSize }&text=${map.text}">首页</a>
<a
	href="goods.do?method=fenye&page=${map.currentPage-1 }&text=${map.text}&size=${map.pageSize }">上一页</a>
<a
	href="goods.do?method=fenye&page=${map.currentPage+1 }&text=${map.text}&size=${map.pageSize }">下一页</a>
<a
	href="goods.do?method=fenye&page=${map.pageCount}&text=${map.text}&size=${map.count }">尾页</a>
<input style="width: 30px;" type="text" id="page" value="${map.currentPage }">
<input type="button" value="跳转" onclick="go()">
</div>
<br><br><br>
<div id="bottom">
	<img src="image/bottom.jpg"/>
</div>
<script>
	function go() {
		//先找到文本框中要跳转的页码
		var page = document.getElementById("page").value;
		if(page>${map.pageCount}){
			alert("该页面不存在，请重新输入！");
			document.getElementById("page").value="";
		}
		location = "goods.do?method=fenye&currentPage=" + page
				+ "&size=${map.pageSize}" + "&text=${map.text}";

	}
</script>

</div>

