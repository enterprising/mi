<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp"></jsp:include>
<style>
	#minote{
		margin-left: 80px;
		margin-top: 40px;
	}
	#main{
		width: 800px;
		height: 660px;
		margin-left: 280px;
	}
</style>
<body>
	<div id="minote">
		<img src="image/ninote.jpg">
	</div>
	<div id="main">
		<img src="image/ninote_1.jpg" id="main_ninote">
	</div>
	
	<script>
	  var i = 0;
	  var src1 = ["image/ninote_1.jpg","image/ninote_2.jpg","image/ninote_3.jpg","image/ninote_4.jpg"];
	  function change(){
	  	document.getElementById('main_ninote').src=src1[i++];
		if(i==4)
		i=0;
	  }
	  setInterval('change()',3000);
	</script>
	
</body>