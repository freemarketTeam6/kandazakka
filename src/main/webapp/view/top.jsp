<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods, bean.User, util.MyFormat"%>


<%
ArrayList<Goods> goodsList = (ArrayList<Goods>)request.getAttribute("goodsList");
%>

<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>トップ画面</title>
  <style>
    body {
      margin: 0;
      font-family: sans-serif;
    }

    .search-box {
      display: flex;
      align-items: center;
    }

    .search-box input[type="text"] {
      padding: 5px;
    }

    .search-box button {
      margin-left: 5px;
      padding: 5px 10px;
    }

    .login-btn input {
      padding: 5px 10px;
    }
    
    table{
    	text-align: center;
    	width:100%;
    }
    .item{
    	margin:auto;
    	width:80%;
    	border-spacing: 10px;
    }
    .item td{
    	text-align:center;
    }
    
    .imgBox{
       	border-radius: 2px;
    }
    
    .img{
    	display: inline-block;
    	position: relative;

    }
    
    .priceOnImg{
    	position:  absolute;
    	bottom: 0;
    	right: 0;
    	padding-right: 5px;
    	padding-left: 5px;
    	background-color: black;
    	opacity: 0.5;
    	color: white;
    }
  </style>
</head>
<body>

	<%@include file="../common/userHeader.jsp"%>
	
	<div class="imgBox" style="display:flex">
	<% 
	 if (goodsList != null && !goodsList.isEmpty()) {
		 for ( int i = 0; i < goodsList.size(); i++){ %>
		
		<!-- 画像のパスは今後変更予定 -->
		<form action="<%=request.getContextPath()%>/goodsDetail">
			<div  class="img">
				<input type="image" src="<%=request.getContextPath() %>/file/images/<%= goodsList.get(i).getImgPath() %>" alt="写真" width="200" height="200">
				<strong class="priceOnImg"><%=  goodsList.get(i).getPrice()%>円</strong>
				<input type="hidden" name="cmd" value="detail">
				<input type="hidden" name="goods_id" value="<%=  goodsList.get(i).getGoodsId()%>">
			</div>		
		</form>

	<% if ( i % 5 == 0 ){%>
			<br>
		<% } %>
		<% } %>
		<% } %>
	</div>
	
	<%@include file="../common/userFooter.jsp"%>
</body>
</html>