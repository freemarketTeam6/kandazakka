<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods, util.MyFormat"%>


<%
ArrayList<Goods> salesGoodsList = (ArrayList<Goods>)request.getAttribute("salesGoodsList");
double total = 0.0;
MyFormat myformat = new MyFormat();
%>

<html>
<head>
<title>売上一覧</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
<style>

.total{
	margin-top: 50px;
	width: 300px;
	float: right;
	font-size: 50px;
}

.total table th, .total table td{
	font-size: 20px;
}

.total table{
	text-align: center;
}


</style>
</head>

<body>
	<%@include file="/common/adminHeader.jsp"%>
	
	<h1 style="text-align: center;">売上一覧</h1>
	<br>
	<hr size=3px color="black">
	
	<br>

	<div class="searchBox">
		<table style="margin: auto;">
		<form action="<%=request.getContextPath()%>/salesList">
			<td>年：<input type="text" name="year"></td>
			<td>月：<input type="text" name="month"></td>
			<td><input type="submit" value="検索"></td>
		</form>
		<form action="<%=request.getContextPath()%>/salesList">
			<td><input type="submit" value="全件表示"></td>
		</form>
		</table>
	</div>
	<br>

	<table class="listTable"style="margin: auto;  text-align: center;">
		<tr>
			<th style="background-color:#ffffa8; width:200px">購入日</th>
			<th style="background-color:#ffffa8; width:200px">商品画像</th>
			<th style="background-color:#ffffa8; width:200px">商品名</th>
			<th style="background-color:#ffffa8; width:200px">購入者ID</th>
			<th style="background-color:#ffffa8; width:200px">販売者ID</th>
			<th style="background-color:#ffffa8; width:200px">価格</th>
			<th style="background-color:#ffffa8; width:200px">利益</th>
		</tr>
		
		<!-- 	表は左から購入日、商品画像、商品名、購入者、販売者、金額、利益（金額の10％） -->
		
		<% for ( int i = 0; i < salesGoodsList.size(); i++){ 
			double sales = salesGoodsList.get(i).getPrice();		
			total += Math.floor(sales*0.1*10)/10;
		%>
		<tr>
			<td><%= salesGoodsList.get(i).getBuyDate() %></td>
			<td><%= salesGoodsList.get(i).getImgPath() %></td>
			<td><%= salesGoodsList.get(i).getGoodsName() %></td>
			<td><%= salesGoodsList.get(i).getBuyuserId() %></td>
			<td><%= salesGoodsList.get(i).getSelluserId() %></td>
			<td><%= myformat.yenFormat(salesGoodsList.get(i).getPrice()) %></td>
			<td><%= Math.floor(sales*0.1*10)/10 %>円</td>
		</tr>
		
		<% } %>

	</table>
	
		<hr size=1px style="margin-top: 20px;">	
	
	<div class="total">
		<table>
			<tr>
				<th>利益合計：</th>
				<td><%= total %>円</td>
			</tr>
		</table>
	</div>
</body>
<%@include file="/common/adminFooter.jsp"%>
</html>
