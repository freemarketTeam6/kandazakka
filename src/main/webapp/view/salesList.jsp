<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods"%>


<%
ArrayList<Goods> salesGoodsList = (ArrayList<Goods>)request.getAttribute("salesGoodsList");
%>

<html>
<head>
<title>売上一覧</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>

<body>
	<%@include file="/common/adminHeader.jsp"%>
	
	<br>
	<a href="<%= request.getContextPath() %>/view/adminMenu.jsp">【管理者メニュー画面】</a>
	<h1 style="text-align: center;">売上一覧</h1>
	<br>
	<hr size=3px color="black">
	
	<br>
	<!-- 今後、月別・年別ソート機能追加予定 -->
	<div class="searchBox">
		<table style="margin: auto">
		<form action="#">
			<td>年：<input type="text" name="year"></td>
			<td>月：<input type="text" name="month"></td>
			<td><input type="submit" value="検索"></td>
		</form>
		<form action="#">
			<td><input type="submit" value="全件表示"></td>
		</form>
		</table>
	</div>
	<br>

	<table class="listTable"style="margin: auto">
		<tr>
			<th style="background-color:#ffffa8; width:200px">購入日</th>
			<th style="background-color:#ffffa8; width:200px">商品画像</th>
			<th style="background-color:#ffffa8; width:200px">商品名</th>
			<th style="background-color:#ffffa8; width:200px">購入者</th>
			<th style="background-color:#ffffa8; width:200px">販売者</th>
			<th style="background-color:#ffffa8; width:200px">価格</th>
			<th style="background-color:#ffffa8; width:200px">利益</th>
		</tr>
		
		<!-- 	表は左から購入日、商品画像、商品名、購入者、販売者、金額、利益（金額の10％） -->
		
		<% for ( int i = 0; i < salesGoodsList.size(); i++){ %>
		<tr>
			<td><%= salesGoodsList.get(i).getBuyDate() %></td>
			<td><%= salesGoodsList.get(i).getImgPath() %></td>
			<td><%= salesGoodsList.get(i).getGoodsName() %></td>
			<td><%= salesGoodsList.get(i).getBuyuserId() %></td>
			<td><%= salesGoodsList.get(i).getSelluserId() %></td>
			<td><%= salesGoodsList.get(i).getPrice() %></td>
			<td><%= salesGoodsList.get(i).getPrice() %>*0.1</td>
		</tr>
		
		<% } %>
		
	</table>
</body>
<%@include file="/common/adminFooter.jsp"%>
</html>
